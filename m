Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF96C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:15:24 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web12.38146.1634570123134950724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mwGbNyTi;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id q13so4453379uaq.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uBnYDzViL+Vk4vN+PtsE7+TtG9mC02nFqEg1oQ7JzvA=;
        b=mwGbNyTiRFKZHfinH3sQh5sPoX8BgrgWqoJEPukzAqZEAAqNMjOeIIADc8t3Pcw4LA
         9t2m6SayTWCMMO+0v8ppISWOyq7E0ipmsj8fE4EPjSPLHAdwZv6Mdkmh5orpn0MhX2EC
         HeSjVy48t44UADshTjO2Wx53JcrwWI3P6R/lyJr2W/xbfKiN6xGFFv5a2qWh62YcqKPa
         01FGHq7w6KKs6mBeMNWKhcc/sWAT/42xr9ChwP2gIRsJbABdI1ZaH2SxX/0kzF3DATwt
         W/vDCM0uvPa4E2D7ftvCfmCtQIP4FsmFpsOkOTvhh7FwXe3vnJd45rTY+4o+DqRu0P83
         N5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uBnYDzViL+Vk4vN+PtsE7+TtG9mC02nFqEg1oQ7JzvA=;
        b=RjEacGOcxzEL8DA1xYc60+A5oNlDEffLOBuzZyuWGI9znVgzWPFz4EseRJDEMaHVwj
         G4d1+OPd+hxHU9Gc2WCHtnjpePPAykiePtgztfLrGEyGuRWUTG4WukXxplF13HfmJ2p5
         tyjNAI5qsG4EQPnrgiNjxDrMKArRBDvkLqA+qeNe8BDNI5MLKYkjlr76k+15qnGps1R/
         nUXKJNfRve3soeabPlDdISPfwQ3tNXeGwENw6Rdeu47VgOAblJwVWp1fovQmo7gj82CC
         F36p8e4RcjL79gRdcBiMXTbgur38PLIdV4kYP0Jfbhs//z9LJhn3LKijuH6msKEDyW+R
         9evA==
X-Gm-Message-State: AOAM533keuycDVdZ6lHh+Ujq5hZY/A0nKjnz/M0dWGTe5J93o+x4RypF
	u4I3/n/2Pjv1UPY75s6Knb/kFbaAj/I6iJoFNwM=
X-Google-Smtp-Source: 
 ABdhPJwPzB4br0m9BCZr+AdLN0HgM1fW3BQWkUyw/Vo6E7/vS+0gsF50Fi3oRpvh228WGtvfEnvpMnxoR8vbyMfBsaA=
X-Received: by 2002:ab0:36e8:: with SMTP id x8mr5838965uau.22.1634570121490;
 Mon, 18 Oct 2021 08:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211018151334.2925395-1-psaavedra@igalia.com>
In-Reply-To: <20211018151334.2925395-1-psaavedra@igalia.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Oct 2021 17:15:10 +0200
Message-ID: 
 <CANNYZj9DEyAL9H2Et9npSjYP_yYo=iETxb7-2xKoaR_41tpYrQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] mesa: upgrade 21.2.1 -> 21.2.4
To: "Pablo Saavedra Rodi?o" <psaavedra@igalia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000073ce6a05cea20398"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 15:15:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157081

--00000000000073ce6a05cea20398
Content-Type: text/plain; charset="UTF-8"

Please also update mesa-gl recipe (a simple file rename will do).

Alex

On Mon, 18 Oct 2021 at 17:14, Pablo Saavedra Rodi?o <psaavedra@igalia.com>
wrote:

> Contains 'Make YUV formats we're going to emulate external-only' [1]
> was applied in 21.2.4. This fixes red label issues on video for VC4,
> Freedreno and others.
>
> Deletes meta/recipes-graphics/mesa/files/without-neon.patch [2]
> already in Mesa since 21.2.
>
> Release notes:
>
> * 21.2.2: https://docs.mesa3d.org/relnotes/21.2.2.html
> * 21.2.3: https://docs.mesa3d.org/relnotes/21.2.3.html
> * 21.2.4: https://docs.mesa3d.org/relnotes/21.2.4.html
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12569
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  .../mesa/files/without-neon.patch             | 53 -------------------
>  meta/recipes-graphics/mesa/mesa.inc           |  3 +-
>  .../mesa/{mesa_21.2.1.bb => mesa_21.2.4.bb}   |  0
>  3 files changed, 1 insertion(+), 55 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/without-neon.patch
>  rename meta/recipes-graphics/mesa/{mesa_21.2.1.bb => mesa_21.2.4.bb}
> (100%)
>
> diff --git a/meta/recipes-graphics/mesa/files/without-neon.patch
> b/meta/recipes-graphics/mesa/files/without-neon.patch
> deleted file mode 100644
> index 56e4aa7769..0000000000
> --- a/meta/recipes-graphics/mesa/files/without-neon.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -Since 80923e8d ("util/format: Add some NEON intrinsics-based
> u_format_unpack.")
> -upstream the build fails on Arm platforms which use the soft-float ABI,
> such as
> -qemuarmv5:
> -
> - arm_neon.h:31:2: error: #error "NEON intrinsics not available with the
> - soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
> -
> -Take a patch from upstream to check the ABI being used before trying to
> -use NEON instructions.
> -
> -Upstream-Status: Backport [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12569]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From 5dcce985a6dd3b7856d65e21db753e2c7a0f5dd5 Mon Sep 17 00:00:00 2001
> -From: Adrian Bunk <bunk@debian.org>
> -Date: Thu, 26 Aug 2021 22:35:49 +0300
> -Subject: [PATCH] util/format: NEON is not available with the soft-float
> ABI
> -
> -Fixes: 80923e8d58cc ("util/format: Add some NEON intrinsics-based
> u_format_unpack.")
> ----
> - src/util/format/u_format.c             | 2 +-
> - src/util/format/u_format_unpack_neon.c | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
> -index c49b3788c82..31f1f240efc 100644
> ---- a/src/util/format/u_format.c
> -+++ b/src/util/format/u_format.c
> -@@ -1138,7 +1138,7 @@ static void
> - util_format_unpack_table_init(void)
> - {
> -    for (enum pipe_format format = PIPE_FORMAT_NONE; format <
> PIPE_FORMAT_COUNT; format++) {
> --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined
> NO_FORMAT_ASM
> -+#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &&
> !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
> -       const struct util_format_unpack_description *unpack =
> util_format_unpack_description_neon(format);
> -       if (unpack) {
> -          util_format_unpack_table[format] = unpack;
> -diff --git a/src/util/format/u_format_unpack_neon.c
> b/src/util/format/u_format_unpack_neon.c
> -index 7456d7aaa88..a4a5cb1f723 100644
> ---- a/src/util/format/u_format_unpack_neon.c
> -+++ b/src/util/format/u_format_unpack_neon.c
> -@@ -23,7 +23,7 @@
> -
> - #include <u_format.h>
> -
> --#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined
> NO_FORMAT_ASM
> -+#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &&
> !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
> -
> - /* armhf builds default to vfp, not neon, and refuses to compile neon
> intrinsics
> -  * unless you tell it "no really".
> ---
> -GitLab
> -
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 4e95911165..f1a1e57062 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,10 +19,9 @@ SRC_URI = "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0002-meson.build-make-TLS-ELF-optional.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
> \
>
> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> -           file://without-neon.patch \
>             "
>
> -SRC_URI[sha256sum] =
> "2c65e6710b419b67456a48beefd0be827b32db416772e0e363d5f7d54dc01787"
> +SRC_URI[sha256sum] =
> "fe6ede82d1ac02339da3c2ec1820a379641902fd351a52cc01153f76eff85b44"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_21.2.1.bb
> b/meta/recipes-graphics/mesa/mesa_21.2.4.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_21.2.1.bb
> rename to meta/recipes-graphics/mesa/mesa_21.2.4.bb
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157080):
> https://lists.openembedded.org/g/openembedded-core/message/157080
> Mute This Topic: https://lists.openembedded.org/mt/86416379/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000073ce6a05cea20398
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please also update mesa-gl recipe (a simple file rena=
me will do).</div><div><br></div><div>Alex<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Oct 2021 at =
17:14, Pablo Saavedra Rodi?o &lt;<a href=3D"mailto:psaavedra@igalia.com">ps=
aavedra@igalia.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Contains &#39;Make YUV formats we&#39;re going to emulate=
 external-only&#39; [1]<br>
was applied in 21.2.4. This fixes red label issues on video for VC4,<br>
Freedreno and others.<br>
<br>
Deletes meta/recipes-graphics/mesa/files/without-neon.patch [2]<br>
already in Mesa since 21.2.<br>
<br>
Release notes:<br>
<br>
* 21.2.2: <a href=3D"https://docs.mesa3d.org/relnotes/21.2.2.html" rel=3D"n=
oreferrer" target=3D"_blank">https://docs.mesa3d.org/relnotes/21.2.2.html</=
a><br>
* 21.2.3: <a href=3D"https://docs.mesa3d.org/relnotes/21.2.3.html" rel=3D"n=
oreferrer" target=3D"_blank">https://docs.mesa3d.org/relnotes/21.2.3.html</=
a><br>
* 21.2.4: <a href=3D"https://docs.mesa3d.org/relnotes/21.2.4.html" rel=3D"n=
oreferrer" target=3D"_blank">https://docs.mesa3d.org/relnotes/21.2.4.html</=
a><br>
<br>
[1] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13=
038" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/me=
sa/mesa/-/merge_requests/13038</a><br>
[2] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12=
569" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/me=
sa/mesa/-/merge_requests/12569</a><br>
<br>
Signed-off-by: Pablo Saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com" t=
arget=3D"_blank">psaavedra@igalia.com</a>&gt;<br>
---<br>
=C2=A0.../mesa/files/without-neon.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 53 -------------------<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 +-<br>
=C2=A0.../mesa/{<a href=3D"http://mesa_21.2.1.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_21.2.1.bb</a> =3D&gt; <a href=3D"http://mesa_21.2.4.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_21.2.4.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
0<br>
=C2=A03 files changed, 1 insertion(+), 55 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/mesa/files/without-neon.patc=
h<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_21.2.1.bb" =
rel=3D"noreferrer" target=3D"_blank">mesa_21.2.1.bb</a> =3D&gt; <a href=3D"=
http://mesa_21.2.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.2.4.bb<=
/a>} (100%)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/files/without-neon.patch b/meta/rec=
ipes-graphics/mesa/files/without-neon.patch<br>
deleted file mode 100644<br>
index 56e4aa7769..0000000000<br>
--- a/meta/recipes-graphics/mesa/files/without-neon.patch<br>
+++ /dev/null<br>
@@ -1,53 +0,0 @@<br>
-Since 80923e8d (&quot;util/format: Add some NEON intrinsics-based u_format=
_unpack.&quot;)<br>
-upstream the build fails on Arm platforms which use the soft-float ABI, su=
ch as<br>
-qemuarmv5:<br>
-<br>
- arm_neon.h:31:2: error: #error &quot;NEON intrinsics not available with t=
he<br>
- soft-float ABI.=C2=A0 Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dha=
rd&quot;<br>
-<br>
-Take a patch from upstream to check the ABI being used before trying to<br=
>
-use NEON instructions.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/mesa/=
mesa/-/merge_requests/12569" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/mesa/mesa/-/merge_requests/12569</a>]<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
-From 5dcce985a6dd3b7856d65e21db753e2c7a0f5dd5 Mon Sep 17 00:00:00 2001<br>
-From: Adrian Bunk &lt;<a href=3D"mailto:bunk@debian.org" target=3D"_blank"=
>bunk@debian.org</a>&gt;<br>
-Date: Thu, 26 Aug 2021 22:35:49 +0300<br>
-Subject: [PATCH] util/format: NEON is not available with the soft-float AB=
I<br>
-<br>
-Fixes: 80923e8d58cc (&quot;util/format: Add some NEON intrinsics-based u_f=
ormat_unpack.&quot;)<br>
----<br>
- src/util/format/u_format.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
- src/util/format/u_format_unpack_neon.c | 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c<br>
-index c49b3788c82..31f1f240efc 100644<br>
---- a/src/util/format/u_format.c<br>
-+++ b/src/util/format/u_format.c<br>
-@@ -1138,7 +1138,7 @@ static void<br>
- util_format_unpack_table_init(void)<br>
- {<br>
-=C2=A0 =C2=A0 for (enum pipe_format format =3D PIPE_FORMAT_NONE; format &l=
t; PIPE_FORMAT_COUNT; format++) {<br>
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &amp;&amp; !de=
fined NO_FORMAT_ASM<br>
-+#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &amp;&amp; !de=
fined(NO_FORMAT_ASM) &amp;&amp; !defined(__SOFTFP__)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct util_format_unpack_description *un=
pack =3D util_format_unpack_description_neon(format);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unpack) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util_format_unpack_table[format] =3D un=
pack;<br>
-diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_fo=
rmat_unpack_neon.c<br>
-index 7456d7aaa88..a4a5cb1f723 100644<br>
---- a/src/util/format/u_format_unpack_neon.c<br>
-+++ b/src/util/format/u_format_unpack_neon.c<br>
-@@ -23,7 +23,7 @@<br>
- <br>
- #include &lt;u_format.h&gt;<br>
- <br>
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &amp;&amp; !de=
fined NO_FORMAT_ASM<br>
-+#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) &amp;&amp; !de=
fined(NO_FORMAT_ASM) &amp;&amp; !defined(__SOFTFP__)<br>
- <br>
- /* armhf builds default to vfp, not neon, and refuses to compile neon int=
rinsics<br>
-=C2=A0 * unless you tell it &quot;no really&quot;.<br>
--- <br>
-GitLab<br>
-<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index 4e95911165..f1a1e57062 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -19,10 +19,9 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.or=
g/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https=
://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-meson.build-make-TLS-=
ELF-optional.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson-misdetects-64bi=
t-atomics-on-mips-clang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-futex.h-Define-__NR_f=
utex-if-it-does-not-exist.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://without-neon.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;2c65e6710b419b67456a48beefd0be827b32db416772e=
0e363d5f7d54dc01787&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fe6ede82d1ac02339da3c2ec1820a379641902fd351a5=
2cc01153f76eff85b44&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.\d+)+)=
&quot;<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.2.1.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_21.2.1.bb</a> b/meta/recipes-graph=
ics/mesa/<a href=3D"http://mesa_21.2.4.bb" rel=3D"noreferrer" target=3D"_bl=
ank">mesa_21.2.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_21.2.1.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa_21.2.4.bb</a><br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157080): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157080" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157080</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86416379/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86416379/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000073ce6a05cea20398--

