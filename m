Return-Path: <nhorman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31D1ECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 12:21:15 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web09.36433.1661516474125703325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 05:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ln57rrsW;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: nhorman@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id j5so1765727oih.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=B4njFZFm/VRXIp/j2GvPCiewKIamaYjt+4yC4HsIZls=;
        b=Ln57rrsWfYL4oZ7rUHEZ8RASGo7XVbJk0T+p1zVfRZ39Zmuf0Kn3zwV3zzXwPxbthm
         cp6zNgQyTv51DKSe7aUpX3kfPEVaHqC1CEKyNRZROq+12Kp8x0tU2p7WZD69/yw9FQ+a
         DPIdjn9FUHJjgSTA3PbUBV+xo5vOMkYnbykIfsKraF7EwH7xChx8a21fVhCOEqMUeI6g
         MyrI8BNBjgCikosJguxPGwjLuJ8BXZeYTAWNySHFvNSKLpGRbhnn4JLwUPgI5HOxi1U8
         yCG3UyAWZ0MbVFoD4Zvvrtot30R1Dt1PH6pDUtopYQzMn77R2dhDMssaMFBiW7yEzQt1
         /6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=B4njFZFm/VRXIp/j2GvPCiewKIamaYjt+4yC4HsIZls=;
        b=Jz0eVRSLMv/Buj/E4pNyuxvUWiPEVHi2N6pB+rod3PmKXtDgKHvjNLB2lkV5mxPRwI
         1+ZmlXubjvhslFf2VIgASAFyH/hGPIlv7b+AotjvwY2PBxtTBDyPqt7YLpM4mh1bZ+bH
         VoEuIKoil8fgnjd8BL8z9kEElzooPFiEKEBnaXj0nDdswQ611Dnr141LL66lQhKDYCTL
         Q0E0T6hBPRjYLwKEWPjSbL+bQt05PVhYS5+PhrjZFJ6Xmy0jlUidSvCWiLYwzE73Tdfr
         SrVoY8Q+zbPG08iAWIuVn+5CSfPzwhR4j4N3oILi7oKWPLOAHrIBQgbKuj8cS/ognAU4
         qbKA==
X-Gm-Message-State: ACgBeo3QVkCwmX5hw2NfTVjeguiGaqDulbkw/F5e4lSlRt0VUsHZj5jI
	QZSwwn3rIWt96aqOCn7IFPstHqE7vNefj1Iclsc=
X-Google-Smtp-Source: 
 AA6agR7bQWEiyae+eqbAZsB2dzbmjKUmisW8hGFBL1I7PZjuIwO8w1rp56L1Rvtda0aCXZRZ8h5vfmgAMc0R9aJmTmQ=
X-Received: by 2002:a05:6808:181e:b0:344:c8a8:c30c with SMTP id
 bh30-20020a056808181e00b00344c8a8c30cmr1514138oib.179.1661516473412; Fri, 26
 Aug 2022 05:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220825204250.3241214-1-nhorman@gmail.com>
 <20220826124358.4118f92b@booty>
 <5DB9D992-9C0F-42F7-9BCD-3CFE9B32C6B0@arm.com>
In-Reply-To: <5DB9D992-9C0F-42F7-9BCD-3CFE9B32C6B0@arm.com>
From: Neil Horman <nhorman@gmail.com>
Date: Fri, 26 Aug 2022 08:21:02 -0400
Message-ID: 
 <CAOBnw5Hs14MuHReq66w5YjX9h1s--ew4VmhHiS_sZpZ+h7fWQw@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] Fix npm to use https rather than http
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000002fb1d905e723f316"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 12:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169916

--0000000000002fb1d905e723f316
Content-Type: text/plain; charset="UTF-8"

Copy that, thanks!

On Fri, Aug 26, 2022, 7:57 AM Ross Burton <Ross.Burton@arm.com> wrote:

>
> > On 26 Aug 2022, at 11:43, Luca Ceresoli via lists.openembedded.org
> <luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
> >
> > Apparently you prepared this patch within the poky git repository. You
> > shouldn't do that, poky is an integration layer and should not be used
> > for bitbake development.
> >
> > Since you want to patch bitbake, you should:
> > - clone the bitbake repository
> > - make your commit there
> > - send it to the bitbake mailing list.
> >
> > Look at the README.md in the poky root directory for more info.
>
> FWIW, git is typically clever enough to handle this case.  Feel free to
> post the patch you have against the poky repository directly to the bitbake
> mailing list.
>
> Thanks,
> Ross

--0000000000002fb1d905e723f316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Copy that, thanks!</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022, 7:57 AM Ross Burt=
on &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; On 26 Aug 2022, at 11:43, Luca Ceresoli via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> &lt;luca.ceresoli=3D<a href=3D"mailto:bootlin.com@lists.ope=
nembedded.org" target=3D"_blank" rel=3D"noreferrer">bootlin.com@lists.opene=
mbedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Apparently you prepared this patch within the poky git repository. You=
<br>
&gt; shouldn&#39;t do that, poky is an integration layer and should not be =
used<br>
&gt; for bitbake development.<br>
&gt; <br>
&gt; Since you want to patch bitbake, you should:<br>
&gt; - clone the bitbake repository<br>
&gt; - make your commit there<br>
&gt; - send it to the bitbake mailing list.<br>
&gt; <br>
&gt; Look at the README.md in the poky root directory for more info.<br>
<br>
FWIW, git is typically clever enough to handle this case.=C2=A0 Feel free t=
o post the patch you have against the poky repository directly to the bitba=
ke mailing list.<br>
<br>
Thanks,<br>
Ross</blockquote></div>

--0000000000002fb1d905e723f316--

