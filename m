Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8C3C83F10
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 13:47:26 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.17526.1693489637473591912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 06:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JA6QNTyo;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9338e4695so14671351fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693489635; x=1694094435; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HGFWs9K23E0q7CR/yYOykqzzJxyknbzSzzPTDt6hlYs=;
        b=JA6QNTyoWsvUTBb9+pXqm4ul1ehaLirQmctOSOTkf8AhrDK6oIs1OGxc7NJ2QE4ni3
         IlIMhiuFrryntuyRYSdEZjLTbLSQI47Gc/MvuDKdHPfso/EoMtmUkj1t1tcrWctJyrqx
         axO4hAz58iZ5feFrYDn3zwXnGxkll9KJIPpouI6pMpnkmp0kOD5udItSVnrCKW8Bb3no
         N9sCDs4PqrCt5GqGopTuAQSiwqGvBdc7obCucd1Z3YAYkz15EwA5Q1S/ZOElTJbgrtVZ
         6+Uwlu2//MCkWWpPwNBE7y2WtAQt8oMn9F0J60rNGIVCZlU+OcwZOmOHLDm6r5oFjygW
         Ac7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693489635; x=1694094435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGFWs9K23E0q7CR/yYOykqzzJxyknbzSzzPTDt6hlYs=;
        b=RPUQrV59Yo7WpJ89hHlaDIMCr4j4zeDPHMski0zKrn6K+d+5feRO2LFtIIp2aLq9kM
         oZluxA0QPFbsHAg1UUQfWMLVY0gyOLhU5q+6SDh0lCMwbRHtyhOuN093K7MRXx+Tcd1w
         frmgiIV4j9SmeSp6Ry4PB1nmCvwctx6d1FppRn3BHppct8sUfG14ssCaC++hmedrbHnM
         9I4VCxg36WvzuDJ1KWCKk11/e+vTO31EZ3An0UULn0ZU7OrqbNQt1PVaqjLr09zLXSAS
         Mcm5QpnlPMPB47c7bOUAZV9q8+4bWC8DGDsFW6muuNrU/WgmRhhwDHJuSDXU6ciabUKU
         oR1g==
X-Gm-Message-State: AOJu0YyrEVDtqXP9Ei5W+/S24DDLIqG+AGVjxBvIMYjMPHZpKq2wq+j7
	l5RulCnCdzKuoPMTArpRPMhuXgDVfyOxRRGg8D0=
X-Google-Smtp-Source: AGHT+IFoC1SpWc5BK8HLkw2AcS+MqyyNqlsMDixmPa2UOXGzWDP/FmHMrzr4NxBkiPKA1q+gQwtmGMNhfBHQXpnRtLk=
X-Received: by 2002:a2e:2c14:0:b0:2ba:18e5:106d with SMTP id
 s20-20020a2e2c14000000b002ba18e5106dmr4377331ljs.1.1693489634766; Thu, 31 Aug
 2023 06:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230831133803.30556-1-reatmon@ti.com>
In-Reply-To: <20230831133803.30556-1-reatmon@ti.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 31 Aug 2023 15:47:03 +0200
Message-ID: <CA+cAkep_j4sfhHUW_GRoO0O+3Qb_TTrULcyznVW2w+ATYTjApQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel.bbclass: Add file exist checks around removes
To: reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001c735f06043848b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 13:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186975

--0000000000001c735f06043848b7
Content-Type: text/plain; charset="UTF-8"

Hello,

On Thu, 31 Aug 2023 at 15:38, Ryan Eatmon via lists.openembedded.org
<reatmon=ti.com@lists.openembedded.org> wrote:

> The latest 6.5 kernels do not appear to create the source file in
> ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
> recipe errors out when trying to remove it.  Simple fix is to add an
> exists check around the call.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index acb43bd4d5..4df052061b 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -454,8 +454,12 @@ kernel_do_install() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>         if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>                 oe_runmake DEPMOD=echo
> MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
> INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
> -               rm
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> -               rm
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
> +               if [ -e
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build" ]; then
> +                       rm
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> +               fi
> +               if [ -e
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source" ]; then
> +                       rm
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
> +               fi
>                 # Remove empty module directories to prevent QA issues
>                 find
> "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d
> -empty -delete
>         else
> --
> 2.17.1
>
>
My 2 cents: the "-f" switch makes rm ignore nonexistent files , and it will
make a shorter patch ;)

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186974):
> https://lists.openembedded.org/g/openembedded-core/message/186974
> Mute This Topic: https://lists.openembedded.org/mt/101073782/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001c735f06043848b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 31 Aug 2023 at 15:38, Ryan Eatmon via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;r=
eatmon=3D<a href=3D"mailto:ti.com@lists.openembedded.org">ti.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">The latest 6.5 kernels do not appear to create the source file =
in<br>
${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the<br>
recipe errors out when trying to remove it.=C2=A0 Simple fix is to add an<b=
r>
exists check around the call.<br>
<br>
Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" target=3D"=
_blank">reatmon@ti.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index acb43bd4d5..4df052061b 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -454,8 +454,12 @@ kernel_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39=
; .config); then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake DEPMOD=
=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTA=
LL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_install<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm &quot;${D}${nona=
rch_base_libdir}/modules/${KERNEL_VERSION}/build&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm &quot;${D}${nona=
rch_base_libdir}/modules/${KERNEL_VERSION}/source&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e &quot;${D}$=
{nonarch_base_libdir}/modules/${KERNEL_VERSION}/build&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rm &quot;${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/bui=
ld&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e &quot;${D}$=
{nonarch_base_libdir}/modules/${KERNEL_VERSION}/source&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rm &quot;${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/sou=
rce&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove empty modu=
le directories to prevent QA issues<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find &quot;${D}${no=
narch_base_libdir}/modules/${KERNEL_VERSION}/kernel&quot; -type d -empty -d=
elete<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-- <br>
2.17.1<br>
<br></blockquote><div><br></div><div>My 2 cents: the &quot;-f&quot; switch =
makes=C2=A0rm=C2=A0ignore=C2=A0nonexistent files , and it will make a short=
er patch ;)</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#186974): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/186974" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/186974</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101073782/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101073782/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001c735f06043848b7--

