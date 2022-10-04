Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD55AC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 13:36:47 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.10533.1664890601266644450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 06:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h05Q2pr1;
 spf=pass (domain: gmail.com, ip: 209.85.167.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id g130so14373333oia.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2B1lkJwQyf+CcWpp+3Key88sbWAu90RS52sg9O31MFU=;
        b=h05Q2pr1exDZk21I3Gf5UFkmZngxW14gxyixjionQzmQ0yAMJbAHUzcnTU5eyhyqA3
         6YBDHshN0EO/aPPd1h5A/K+fsSLB6GPQQxH2Phd1VVFG59bptsQFRdq9gn4MKc2bERwX
         rhbpJMwrE7Q3CfGkoySa3rm28TIL0+Qmb1tlF8Ce7RyO3O1KrRv23geFtZ4irlvv+KJc
         2fybze6HAuI/bXp9Cw+Fd//owrVC6lp/zIxCmIbG8HMeFU2awhDFovkjzLSbHO38rzpQ
         /L14Ww53mgHSkCvzYevK2RxgTDbFovL9VyOcZvudzgrxSvxxhhLl85q7fCu2W87bR7d2
         UoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2B1lkJwQyf+CcWpp+3Key88sbWAu90RS52sg9O31MFU=;
        b=2t7RxwsZGSne/i4Lam9AuzysiQsBBo8h71F8Yr668uOrly0GfZmMww2feOW9J6pXNN
         LdCGRv/RT4LCchDigwhgHJJGIJFT+u/l1/4lgSypYwDCPPrOboIyQw+B3A2vzYgEJaXf
         Gy0YC58tABlOzLs3CadCKsacSZia4Wk9cfCAscKKk77Cx2+17YbaN+15907otIIpx/pa
         el9kOshHxkdd4xCXkrzrpIIdAQWBTNCtR+0XEIFVrUsPQ8rVl6uBXjuVz+DzIGDHsroi
         SVrqKBxXVktlPpmXaijZGIC8+RSUzENUfRy3OF0fVoooWH/gttTL94C8MFqjmC6tLApR
         8Reg==
X-Gm-Message-State: ACrzQf356lV5JTTk1ERhk6mYIMXT2DVWeCHSL3TCV/ZVL49vS7Ht8yL0
	XZvog1EfnMWsqGgtqltIr4hTzmqANZKRY5ov2Jc=
X-Google-Smtp-Source: 
 AMsMyM74CHbjJo7cKqelOBR+hdF3VTi+xofSbE2Y34kT87w6Yuh32kf2AbOx8EPp5CGPDvT89o0N0z9d7acglNZ+BlA=
X-Received: by 2002:a05:6808:30a0:b0:353:e411:8bc8 with SMTP id
 bl32-20020a05680830a000b00353e4118bc8mr815506oib.55.1664890600529; Tue, 04
 Oct 2022 06:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221004105106.1556357-1-ross.burton@arm.com>
 <20221004105106.1556357-4-ross.burton@arm.com>
In-Reply-To: <20221004105106.1556357-4-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Oct 2022 06:36:29 -0700
Message-ID: 
 <CAMKF1sqk1eK0RVhQtj6WjYi4n=WrBfkP5VmgpZUdp=18dHsmgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] piglit: upgrade to latest revision
To: Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d5a6fa05ea358cfc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 13:36:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171394

--000000000000d5a6fa05ea358cfc
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 4, 2022 at 3:51 AM Ross Burton <ross.burton@arm.com> wrote:

> Also disable any attempt at debug splitting/stripping.  Piglit installs
> over 2GB of files which we install stripped, so the action of attempting
> to split/strip takes a long time and achieves nothing.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/piglit/piglit_git.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb
> b/meta/recipes-graphics/piglit/piglit_git.bb
> index f758208c6bc..c9cf5795e99 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -14,7 +14,7 @@ SRC_URI = "git://
> gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
>             "
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -SRCREV = "265896c86f90cb72e8f218ba6a3617fca8b9a1e3"
> +SRCREV = "80465078a0ae8f12411db66850ee14f017962fa7"
>  # (when PV goes above 1.0 remove the trailing r)
>  PV = "1.0+gitr${SRCPV}"
>
> @@ -52,8 +52,10 @@ do_configure:prepend() {
>     fi
>  }
>
> -# Forcibly strip because Piglit is *huge*
> +# Forcibly strip because Piglit is *huge*, and don't bother trying to
> split/strip the result.
>  OECMAKE_TARGET_INSTALL = "install/strip"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"


How does debugging piglet looks like after this change ? I wonder if we can
reduce debug info by
Using something like -g1 maybe a good middle ground


>
>  RDEPENDS:${PN} = "waffle waffle-bin python3 python3-mako python3-json \
>         python3-misc \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171384):
> https://lists.openembedded.org/g/openembedded-core/message/171384
> Mute This Topic: https://lists.openembedded.org/mt/94110619/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d5a6fa05ea358cfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 4, 2022 at 3:51 AM Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">Also disable any attempt at debug splitting/stripping.=C2=A0 P=
iglit installs<br>
over 2GB of files which we install stripped, so the action of attempting<br=
>
to split/strip takes a long time and achieves nothing.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a> | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" =
rel=3D"noreferrer" target=3D"_blank">piglit_git.bb</a> b/meta/recipes-graph=
ics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">piglit_git.bb</a><br>
index f758208c6bc..c9cf5795e99 100644<br>
--- a/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a><br>
+++ b/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a><br>
@@ -14,7 +14,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesk=
top.org/mesa/piglit.git;protocol=3Dhttps;branch=3Dma" rel=3D"noreferrer" ta=
rget=3D"_blank">gitlab.freedesktop.org/mesa/piglit.git;protocol=3Dhttps;bra=
nch=3Dma</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
<br>
-SRCREV =3D &quot;265896c86f90cb72e8f218ba6a3617fca8b9a1e3&quot;<br>
+SRCREV =3D &quot;80465078a0ae8f12411db66850ee14f017962fa7&quot;<br>
=C2=A0# (when PV goes above 1.0 remove the trailing r)<br>
=C2=A0PV =3D &quot;1.0+gitr${SRCPV}&quot;<br>
<br>
@@ -52,8 +52,10 @@ do_configure:prepend() {<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-# Forcibly strip because Piglit is *huge*<br>
+# Forcibly strip because Piglit is *huge*, and don&#39;t bother trying to =
split/strip the result.<br>
=C2=A0OECMAKE_TARGET_INSTALL =3D &quot;install/strip&quot;<br>
+INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;</blockquote><div dir=3D"auto=
"><br></div><div dir=3D"auto">How does debugging piglet looks like after th=
is change ? I wonder if we can reduce debug info by</div><div dir=3D"auto">=
Using something like -g1 maybe a good middle ground=C2=A0</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;waffle waffle-bin python3 python3-mako pytho=
n3-json \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-misc \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171384): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171384" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171384</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94110619/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94110619/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d5a6fa05ea358cfc--

