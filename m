Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075A8C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 08:11:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.34543.1653898305517804981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 01:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eb9ESzVQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so5941377wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6LeOCiUXaegj/dN+5whof8LgSO7X+1CUse+9YWoYtWw=;
        b=eb9ESzVQzF5NEYB0rtDs4OWkoGnq+MNqEL758Jy2fTOlo1rvDwwmJwde2F0216Aq5o
         4X9EW114XAW49J+7/+Dy5Qf/89Lfl4KONvs1VGc5Xxy6nuTzzz+i+7vHYZbtY84NaIkL
         ePjqLmd6mOOVjkV965lSpIh3fchkJQiOd48CVDfgX4BO768N8JpAWfigLO+u+CD2RxkK
         b2K9dfxRXEJFs5jl7b4kVg5RXXTAAwyKydbH2XilvwnvKG0395tuzplsUbowVgwTSw2V
         Vp6sCpgQQIy+KnallxquCCagtdL2VnQjPsvzeRpRAWU46nGyKBKWihR8gkJm8aVSxRSc
         yJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6LeOCiUXaegj/dN+5whof8LgSO7X+1CUse+9YWoYtWw=;
        b=sNXkQn67ZmQFEGi/lLwkP9BUBiQVAXAWGx0IKgyEWd1/cjTZlnNhSi7eHHl9JBj62T
         L8fvBRCYRHyzb5fmj4XCMe1pVvFuCjA9hLQy4F9XgIZIP9LRBTiVWHftuz5cMTo0IIT3
         5TzxNVMl2e6RUzzKzpn5vCbwENRIzv0QWsadOwh4WUjoBj5uLFsMfSf22deGz+d8CmPx
         VNOh0yNXZnQzKv01bw4KgkIQPdZW1jDDBS2BlIcObzEr+sc5s3vqXEm22/hE3xXYbyiF
         s+x/k/4mBtzyj9ovaGv4UekNEU7ITLjxykP3WMHhz8J2WroCHSB/yOQkwLUYWHU7F8cy
         +cDw==
X-Gm-Message-State: AOAM533C5brcGBWaLfxIKD9VcLGBicE+5SXEh1DIiG1vd/J3wltkb3Ji
	cEstJSEgdsoP/NPXJIkSIOzUg2wFw1agDBtwMwk=
X-Google-Smtp-Source: 
 ABdhPJxAs24OcvAToTVDqYZHKzgo6wpbx+ySmvCRwykly5XFmrKbiQtbfXsxDUYd9CeG9NGsC6/xyqxuXsaTlxjRcak=
X-Received: by 2002:a7b:c109:0:b0:397:43ef:b66f with SMTP id
 w9-20020a7bc109000000b0039743efb66fmr17521768wmi.44.1653898303741; Mon, 30
 May 2022 01:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220529095251.11410-1-flowergom@gmail.com>
 <953.1653896858036338969@lists.openembedded.org>
In-Reply-To: <953.1653896858036338969@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 May 2022 10:11:03 +0200
Message-ID: 
 <CA+chaQdF7SGpot+EcJfHF7NYhxQjg_PF9JZ5QjNfe4szCu8uZA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCHv2] libdrm: add
 libdrm-{nouveau,radeon,intel}
 to RPROVIDES
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e3a3fd05e03634c3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 08:11:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166272

--000000000000e3a3fd05e03634c3
Content-Type: text/plain; charset="UTF-8"

I don't think you're hiding something, I just don't understand this
use-case.

libdrm-nouveau rprovides libdrm-nouveau, any package with runtime
dependency dnf should be able to install and pull libdrm-nouveau package
(_not_ libdrm package) to satisfy that dependency.

Why doesn't this work for libdrm in your case? Do you have libdrm-nouveau
package created and nouveau packaged inside?

Cheers,

On Mon, May 30, 2022 at 9:47 AM Minjae Kim <flowergom@gmail.com> wrote:

> @Martin,
> I don't know why you think I'm hiding something.
> I will use this when installing the rpm package using the dnf tool on the
> target image such as qemu or raspberrypi.
>
> For example,
> There is component A.
> It needs libdrm-{nouveau,radeon,intel} packages to work properly.
> When this A component rpm package is installed using dnf tool on the
> actual target image,
> the libdrm-{nouveau,radeon,intel} packages cannot install at once if the
> component A had a libdrm as rdepends.
>
> However, If component A has libdrm-{nouveau,radeon,intel} as rdepends,
> When these A component packages are installed using dnf, these packages
> can also be installed at the same time.
>
> Because libdrm-{nouveau,radeon,intel} is not provided as RPROVIDES, these
> packages cannot be used as rdepends directly.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166271):
> https://lists.openembedded.org/g/openembedded-core/message/166271
> Mute This Topic: https://lists.openembedded.org/mt/91408949/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e3a3fd05e03634c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t think you&#39;re hiding something, I just don&=
#39;t understand this use-case.<div><br></div><div>libdrm-nouveau rprovides=
 libdrm-nouveau, any package with runtime dependency dnf should be able to =
install and pull libdrm-nouveau package (_not_ libdrm package) to satisfy t=
hat dependency.</div><div><br></div><div>Why doesn&#39;t this work for libd=
rm in your case? Do you have libdrm-nouveau package created and nouveau pac=
kaged inside?</div><div><br></div><div>Cheers,</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 30, 2022 at=
 9:47 AM Minjae Kim &lt;<a href=3D"mailto:flowergom@gmail.com">flowergom@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div>@Martin,</div>
<div>I don&#39;t know why you think I&#39;m hiding something.</div>
<div>I will use this when installing the rpm package using the dnf tool on =
the target image such as qemu or raspberrypi.<br><br>For example,</div>
<div>There is component A. <br>It needs libdrm-{nouveau,radeon,intel} packa=
ges to work properly.</div>
<div>When this A component rpm package is installed using dnf tool on the a=
ctual target image,=C2=A0</div>
<div>the libdrm-{nouveau,radeon,intel} packages cannot install at once if t=
he component A had a libdrm as rdepends.</div>
<div>=C2=A0</div>
<div>However, If component A has libdrm-{nouveau,radeon,intel} as rdepends,=
</div>
<div>When these A component packages are installed using dnf, these package=
s can also be installed at the same time.<br><br>Because libdrm-{nouveau,ra=
deon,intel} is not provided as RPROVIDES, these packages cannot be used as =
rdepends directly.</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166271): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166271" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166271</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91408949/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91408949/3617156</a><br>
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

--000000000000e3a3fd05e03634c3--

