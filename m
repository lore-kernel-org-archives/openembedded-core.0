Return-Path: <devendra.tewari@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F61C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 12:25:25 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web09.17367.1661171124301441816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 05:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UHiwjBlt;
 spf=pass (domain: gmail.com, ip: 209.85.217.51,
 mailfrom: devendra.tewari@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id w188so2844381vsb.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 05:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc;
        bh=M+mYEIlIGo6Bhj3GcmgMK/YrXYWUcy7WiTPBLhADuhs=;
        b=UHiwjBltucEd0gRha3gjwdFeQB2DhPd5bAlEm31RArC4NNCsh2RYJrFnHloN72lHsq
         TMBlgF352IbAo0PyK9nVZT5xrwKJaudIPDarnjn5EXSxyTRUbpLvOeRYiHlv2lWuJeYn
         alwTStHboWn9VFA1fJdoZbIY3+mkK905IO9GmvQU/0JqNnBDuAZJRHtelIKMsfmKgLTV
         D8dgpvQHc+9pQXGsvwMjXheEVoHpvi++RWtgcZczGqh4pZelZHhsuuZqqKmITVDgYq2J
         ApVcorhCiZhWgTtp1mfBOdO6AU4K1Kl67iU2d8n11PYhdg0sTcxvs5feXTOG4O1bZrfk
         Sr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-message-state:from:to:cc;
        bh=M+mYEIlIGo6Bhj3GcmgMK/YrXYWUcy7WiTPBLhADuhs=;
        b=DVGwW1gNbusJfJr6rFXsLc/5TBsnVrIE2zLjHPQmSyvMEGyWRsYbCyTTaxV9ejq2Wv
         6FIGYFp1Da05qQS+9WDFpxL6s8RGuJyMVvCUoGDHWBEZaRSTvSjTs2sZ3VQPEqtvVTV3
         GMJ3rQcJAp0AK7KUbt4dWWVeBGJyhv3geuIqBpUSOk3Ql5zYUDAjvglVPCdmC29/7yqh
         TEyVeFOFS9gWqejDTWNfHwvOnqsQrdF+e/kJ7YDP5lQyHMdTrUuanId3kXCqxONihRSb
         he8hDrJi2pPTbqhO9SwOYVwtE53we1lI+VF5algdnwHotrJCHD1V50KyzEClnmuHlwJZ
         qUqA==
X-Gm-Message-State: ACgBeo1tcQicJPRUEV+fLr9qUANB7MnZuBs8G6vx/ILudJWdD+21hWxw
	5VUdugYWk6NtOjKe4vfZ0WmykQIwfZk=
X-Google-Smtp-Source: 
 AA6agR6A5t38S06lPXhdXSzvWa9D9hudHSvqm0mExDUC1FftO8yor52IyOXryy69RCsxw60tZYTfuQ==
X-Received: by 2002:a05:6102:ec7:b0:388:d2a2:41c5 with SMTP id
 m7-20020a0561020ec700b00388d2a241c5mr6680532vst.41.1661171123135;
        Mon, 22 Aug 2022 05:25:23 -0700 (PDT)
Received: from smtpclient.apple ([189.115.172.149])
        by smtp.gmail.com with ESMTPSA id
 k203-20020a1fa1d4000000b00377b6c5f926sm9378541vke.42.2022.08.22.05.25.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Aug 2022 05:25:22 -0700 (PDT)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_457C20F1-5468-4F08-82B6-264F16D98DB6"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.0.8.1.1\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: Devendra Tewari <devendra.tewari@gmail.com>
In-Reply-To: <90B42906-44DE-4D61-8210-669DC25BBD3F@gmail.com>
Date: Mon, 22 Aug 2022 09:25:07 -0300
Cc: Khem Raj <raj.khem@gmail.com>,
 Andre McCurdy <armccurdy@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Message-Id: <AB381ED0-2889-40B0-8629-463159665EDD@gmail.com>
References: 
 <d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
 <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
 <aebbbcf8d29afec37b4a9c459eca8ab24112137f.camel@linuxfoundation.org>
 <4538E61E-9CE7-4346-877F-FA6CEAEB5074@gmail.com>
 <61C98407-3B1A-4C8D-9969-7D3EEAE3B75A@gmail.com>
 <3F33A9E1-ED6B-4728-A0CE-49EAAB2CFAC1@gmail.com>
 <a825b895707921ccfb5a2d20a0def7982963de21.camel@linuxfoundation.org>
 <7C3B49FD-7C8F-4C64-B847-F84BEA35ED94@gmail.com>
 <5CA188E2-24EB-4FE9-8F31-84DD73F92C1E@gmail.com>
 <42E76009-F583-4E55-BA29-1C989B25BD73@gmail.com>
 <162f49616d345a02d2633ae51e2e09b3f08de158.camel@linuxfoundation.org>
 <90B42906-44DE-4D61-8210-669DC25BBD3F@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3731.0.8.1.1)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 12:25:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169671


--Apple-Mail=_457C20F1-5468-4F08-82B6-264F16D98DB6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I was asked about the createrepo_c patch in private. Replying here for =
closure.

I had reported the issue upstream at =
https://github.com/rpm-software-management/createrepo_c/issues/266 and =
it has been fixed. Poky kirkstone and mainline should have the fix.

Kind Regards,
Devendra

> On 28 Apr 2021, at 20:02, Devendra Tewari <devendra.tewari@gmail.com> =
wrote:
>=20
> Understood - carrying patches is a burden for sure. I=E2=80=99ll =
maintain patches for my own narrow use cases at my end, and perhaps =
submit them upstream.
>=20
> Thanks,
> Devendra
>=20
>> On 28 Apr 2021, at 18:42, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>=20
>> On Wed, 2021-04-28 at 07:00 -0300, Devendra Tewari wrote:
>>> The gist of it is that Docker uses the overlay2 storage driver by =
default,=20
>>> previously it used aufs. Both drivers have the same limitation in =
rename,=20
>>> where file rename across layers is handled by moving, but directory =
rename
>>> across layers results in error EXDEV. It is up to user space to =
handle the error.
>>=20
>> I'm still struggling to see how you're going to patch all the various =
pieces of
>> software out there used during a build to handle EXDEV correctly.
>>=20
>> We have handled some cases of this for a long time where we're moving =
files
>> over to different parts of a filesystem, e.g. /tmp/ to WORKDIR or =
vice versa.
>>=20
>> This new docker case triggers for renames even within a directory, =
e.g.=20
>> /some/path/a -> /some/path/b which is not something that would often =
trigger
>> this.
>>=20
>> I need to say clearly now that we are not carrying/taking patches to =
patch
>> every bit of other software to try and avoid this.
>>=20
>> Cheers,
>>=20
>> Richard
>>=20
>>=20
>>=20
>=20
>=20
>=20


--Apple-Mail=_457C20F1-5468-4F08-82B6-264F16D98DB6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">I was asked =
about the createrepo_c patch<span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);">&nbsp;in private. Replying here for =
closure</span>.<div><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);"><br></span></div><div><span style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);">I had reported the issue upstream =
at&nbsp;</span><a =
href=3D"https://github.com/rpm-software-management/createrepo_c/issues/266=
">https://github.com/rpm-software-management/createrepo_c/issues/266</a>&n=
bsp;<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">and =
it has been fixed</span><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);">. Poky kirkstone and mainline should have the =
fix.</span><div><font color=3D"#000000"><span style=3D"caret-color: =
rgb(0, 0, 0);"><br></span></font></div><div><font color=3D"#000000"><span =
style=3D"caret-color: rgb(0, 0, 0);">Kind =
Regards,</span></font></div><div><font color=3D"#000000"><span =
style=3D"caret-color: rgb(0, 0, =
0);">Devendra<br></span></font><div><br><blockquote type=3D"cite"><div>On =
28 Apr 2021, at 20:02, Devendra Tewari &lt;devendra.tewari@gmail.com&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><div>Understood =
- carrying patches is a burden for sure. I=E2=80=99ll maintain patches =
for my own narrow use cases at my end, and perhaps submit them =
upstream.<br><br>Thanks,<br>Devendra<br><br><blockquote type=3D"cite">On =
28 Apr 2021, at 18:42, Richard Purdie =
&lt;richard.purdie@linuxfoundation.org&gt; wrote:<br><br>On Wed, =
2021-04-28 at 07:00 -0300, Devendra Tewari wrote:<br><blockquote =
type=3D"cite">The gist of it is that Docker uses the overlay2 storage =
driver by default, <br>previously it used aufs. Both drivers have the =
same limitation in rename, <br>where file rename across layers is =
handled by moving, but directory rename<br>across layers results in =
error EXDEV. It is up to user space to handle the =
error.<br></blockquote><br>I'm still struggling to see how you're going =
to patch all the various pieces of<br>software out there used during a =
build to handle EXDEV correctly.<br><br>We have handled some cases of =
this for a long time where we're moving files<br>over to different parts =
of a filesystem, e.g. /tmp/ to WORKDIR or vice versa.<br><br>This new =
docker case triggers for renames even within a directory, e.g. =
<br>/some/path/a -&gt; /some/path/b which is not something that would =
often trigger<br>this.<br><br>I need to say clearly now that we are not =
carrying/taking patches to patch<br>every bit of other software to try =
and avoid =
this.<br><br>Cheers,<br><br>Richard<br><br><br><br></blockquote><br><br><b=
r></div></div></blockquote></div><br></div></div></body></html>=

--Apple-Mail=_457C20F1-5468-4F08-82B6-264F16D98DB6--

