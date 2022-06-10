Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B93FC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 09:13:58 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.24780.1654852428761615031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 02:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fHFNfpNn;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id c21so2549897wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 02:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fizdnnvf39+hjEillkjIZqysufEXNQXDUTPDlgRagDA=;
        b=fHFNfpNnEKidzBP8Um6qw6fqejDZhUKy4kYA9Gxlr2+TbLBt/ixyJUgWhzWFiDMVf+
         mVCUoty83eIzUASqRv5m6saav0EMj1Dr+MkdhdcrxkkeKtZv3KW/gfQsRPGRrP8j6bPY
         yPfSiUp9dVT3+9v+SdJSN0K/oRbT7WXyjCXQInA05sFwCCA+hZTAMQXGlvzEr/mnENjY
         kD6XNdh062irBFQAs8XT3KhS6CgH1EPc7497kQzYfx2aJvHvW2UQUG/Z/qUO4lG6nkH3
         8gwr6vbqayowIQgOjwqcbWpkVzoqZKkFN4sFsugLLsEpSG4nKM1pblTMi5RCVnIkOwgH
         Nn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fizdnnvf39+hjEillkjIZqysufEXNQXDUTPDlgRagDA=;
        b=eyT899WZF1MgEs3GPOEA6x/VhAkt4yEzHMi7sYPNBil1uX+YWoTY0Du9FB0tM6cvoj
         YebohgExkBg5N0Ll90OvJR8udgakLJAomVIaC22ZyTyE76xlv4vAN/sBkXuyIRDL+6fg
         UUHO4a1Cq8Qxyt5yaRqiSdIlicFovm7WGzZADOyzOYs1kehcjzCu96MEfAXasRnPJSkw
         VKbYSRvrpc/P8PFDEH9TiEgXiwZiETBdh4Bcd7phvUb787XALpfb7cvwbzSyxguL7ojI
         +ljMXv0IPJpXAXyOA3eR6e/L4FFrhO6BbTQkL2hkEx4eTg9PhuQ3A5MPAhZ5/9QTJMGV
         DEbg==
X-Gm-Message-State: AOAM5320M3eRa1bRLEHO/nKDCj95PTqltIU21vyPhIZpZSSmWn11h1uG
	HPZihCxh4/S+F0S1iz8Jt5scfYLUmkxlAcQqIrM=
X-Google-Smtp-Source: 
 ABdhPJw0x3phmge28FTmoA0fVDT7XvYrRMlRy3pYNXXMJLvOn0SKJOZdZ+tsGrlhYj3aowTXWClgRs2n/L/5RKCSuX0=
X-Received: by 2002:a05:6000:1e1b:b0:219:e32d:cbe8 with SMTP id
 bj27-20020a0560001e1b00b00219e32dcbe8mr4199713wrb.129.1654852427156; Fri, 10
 Jun 2022 02:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654188574.git.steve@sakoman.com>
 <11399.1654850358021809382@lists.openembedded.org>
 <CA+chaQevwOdx8w6bGNqwX1=WBN9WnBgHv+EBkUOf8cT7Z=NbjA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQevwOdx8w6bGNqwX1=WBN9WnBgHv+EBkUOf8cT7Z=NbjA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Jun 2022 11:13:31 +0200
Message-ID: 
 <CA+chaQeiwLWRMy514n5t8eiujVjt8vEQKZy=R3_XoEPJWe424Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone 00/26] Patch review
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000138ed005e1145b7f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 09:13:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166792

--000000000000138ed005e1145b7f
Content-Type: text/plain; charset="UTF-8"

And also this PR was already merged, so they are also in regular kirkstone
branch now:
https://cgit.openembedded.org/openembedded-core/log/?h=kirkstone

On Fri, Jun 10, 2022 at 11:12 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> Don't know if it was intentional, but these patches seem to be moved to
> stable/kirkstone-next:
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next
>
> On Fri, Jun 10, 2022 at 10:39 AM Sundeep KOKKONDA <
> sundeep.kokkonda@gmail.com> wrote:
>
>> Hello Steve,
>>
>> I am planning to do a regression test on gcc-11.3 and cloned the repo
>> from given link '*git://git.openembedded.org/openembedded-core-contrib
>> <http://git.openembedded.org/openembedded-core-contrib>
>> stable/kirkstone-nut*' but I did not get these patches included in the
>> cloned repository. I could still see gcc-11.2 cloned. Also, I verified
>> patches in rust-common file, those are also not updated.
>>
>> Can you let me know does this repo is correct or I've do anything else to
>> get these patches?
>>
>>
>> Thanks,
>> Sundeep K.
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#166790):
>> https://lists.openembedded.org/g/openembedded-core/message/166790
>> Mute This Topic: https://lists.openembedded.org/mt/91503792/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> Martin.Jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--000000000000138ed005e1145b7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And also this PR was already merged, so they are also in r=
egular kirkstone branch now:<div><a href=3D"https://cgit.openembedded.org/o=
penembedded-core/log/?h=3Dkirkstone">https://cgit.openembedded.org/openembe=
dded-core/log/?h=3Dkirkstone</a><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 10, 2022 at 11:12 AM =
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr">Don&#39;t know if it was intentional, but these patc=
hes seem to be moved to stable/kirkstone-next:<div><a href=3D"http://cgit.o=
penembedded.org/openembedded-core-contrib/log/?h=3Dstable/kirkstone-next" t=
arget=3D"_blank">http://cgit.openembedded.org/openembedded-core-contrib/log=
/?h=3Dstable/kirkstone-next</a><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 10, 2022 at 10:39 AM S=
undeep KOKKONDA &lt;<a href=3D"mailto:sundeep.kokkonda@gmail.com" target=3D=
"_blank">sundeep.kokkonda@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hello Steve,<br><br>I am planning to do =
a regression test on gcc-11.3 and cloned the repo from given link &#39;<spa=
n style=3D"white-space:pre-wrap"><em>git://<a href=3D"http://git.openembedd=
ed.org/openembedded-core-contrib" target=3D"_blank">git.openembedded.org/op=
enembedded-core-contrib</a> stable/kirkstone-nut</em>&#39; but I did not ge=
t these patches included in the cloned repository. I could still see gcc-11=
.2 cloned. Also, I verified patches in </span><span style=3D"white-space:pr=
e-wrap">rust-common file, those are also not updated.</span><span style=3D"=
white-space:pre-wrap"><br><br>Can you let me know does this repo is correct=
 or I&#39;ve do anything else to get these patches?<br><br><br>Thanks,<br>S=
undeep K.</span>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166790): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166790" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166790</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91503792/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91503792/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000138ed005e1145b7f--

