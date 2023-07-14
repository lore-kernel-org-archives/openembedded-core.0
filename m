Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C840EEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 15:48:44 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.2440.1689349716870432330
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 08:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rREKdq1N;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.179, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ca9804dc6e4so2932934276.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689349716; x=1691941716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3zskKChOxjTanQJBliF4ZXbd0LsB6uYNPY1cQn+lGk=;
        b=rREKdq1NAD6RPe++VqXZ5g3HF3NhzRU2ouOLQBzCLucG8GHw90jnGv4FaVmdFxeR/k
         asf5RpZ2315aMHr07tQJH/qy4mB0uaUUdzxlbzKeS4fBKbfvhJradbcOt0SxeHzGX+QQ
         Rw0lBoOwFmslapEVAnQG9UMcSSHwDX+qYD4sXSMDKfCIBQQ9j90R6D7BIdhdRuOaVU1z
         cmcEy/enFsRCpBuuQd0BLyk1GNQV+cUDDhoMGLPbKHY3wH334Nq+OPfV5G/50XCQNAQt
         LeJWP0zF9mXybOb6jRxJerlhdJfVpLZiM/SA+Csi5UJaKGt39VKs3V+Bs7jhjofJ8RzZ
         GaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689349716; x=1691941716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3zskKChOxjTanQJBliF4ZXbd0LsB6uYNPY1cQn+lGk=;
        b=kMIwo9ebX+Sd+9N9iH9N0Hjm9ryZ83bukOTMf56AxF9uy80NMeYyCFDcYtGyvZGOLI
         cfH0YR6gS+qU2iVs7eFARr8BuoiQhoxg6Vdg6e2l6T/Thgr0DEVOlDt3i2SrId4nSI2a
         FLK1aTtSX6YG1NCqQApt2BnuQfy4yqwGQNHvbKXyWB9rPKez95Su/0Gy6ZLn1eXdR7nd
         8pKZxWfYD0fnbj0b1/V9b3h0YcdhF2u8sk5/ouG8R8or1/CkY3oZCLOHsiv4t9oDPJE1
         sY0YDbBQG7HU4QmdEn8V1InHcondxet5f2Ftz8N42dhiDCW3q8spo5eCbsB7c0gXyb9G
         5ToA==
X-Gm-Message-State: ABy/qLYQWl2rPGfbv33/1Abg325oPnfzl11RgQtCnSy1RQB0chZxP5sS
	yZYukvBqGabJevL8DfETYYUOsxbtXrQxmWEi6xMcKGGsY/vE4JJV
X-Google-Smtp-Source: APBJJlEpN02veTv2F4UJh+UfV/6eaFL7yVoDo6gdsmNCJ2GT4iKuQu5T/JXPM3C6pTp1x6/MxL4Q8+XkHrU32Eblwi0=
X-Received: by 2002:a25:83c7:0:b0:cb5:47e2:d6c5 with SMTP id
 v7-20020a2583c7000000b00cb547e2d6c5mr3568260ybm.24.1689349715734; Fri, 14 Jul
 2023 08:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230714071504.2894925-1-kai.kang@windriver.com> <20230714071504.2894925-2-kai.kang@windriver.com>
In-Reply-To: <20230714071504.2894925-2-kai.kang@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 14 Jul 2023 05:48:23 -1000
Message-ID: <CAOSpxdaY2hwjP2tO12hx8Cgx5VOxy2iMnO5OFWvFZY_cBN5Q=Q@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH 1/1] webkitgtk: update 2.38.5 -> 2.40.2
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184271

This is a major version update which adds features and APIs, so I
can't take this.

Steve

On Thu, Jul 13, 2023 at 9:15=E2=80=AFPM Kai Kang <kai.kang@eng.windriver.co=
m> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Drop backports.
>
> Add extra options that require additional dependencies, and fail without =
them.
>
> Disable the recipe on ancient x86 without SSE support; SSE is now
> required.
>
> (From OE-Core rev: fdc50a50d8f2c4975584c04db0c5e0e83cf62f99)
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Cherry pick from master and update context for SRC_URI.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-gnome/epiphany/epiphany_43.1.bb  |  3 ++
>  ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 +++++++++++++
>  ...44e17d258106617b0e6d783d073b188a2548.patch | 42 ++++++++++++-------
>  ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 ++++++++++++++++++
>  ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 -------------
>  ...ebkitgtk_2.38.5.bb =3D> webkitgtk_2.40.2.bb} | 15 +++++--
>  6 files changed, 111 insertions(+), 48 deletions(-)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaSc=
riptCore-CMakeLists.txt-ensure-reproduc.patch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a=
6da9b13795c9b0f7894bf4.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b9045=
3bc4e100dcf967243ecd98.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D> webkitgtk_2.40=
.2.bb} (90%)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_43.1.bb b/meta/recipes-=
gnome/epiphany/epiphany_43.1.bb
> index ea22723a97..c97ede459d 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_43.1.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_43.1.bb
> @@ -38,3 +38,6 @@ PACKAGECONFIG[developer-mode] =3D "-Ddeveloper_mode=3Dt=
rue,-Ddeveloper_mode=3Dfalse"
>
>  FILES:${PN} +=3D "${datadir}/dbus-1 ${datadir}/gnome-shell/search-provid=
ers ${datadir}/metainfo"
>  RDEPENDS:${PN} =3D "iso-codes adwaita-icon-theme gsettings-desktop-schem=
as"
> +
> +# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
> +COMPATIBLE_HOST:x86 =3D "${@bb.utils.contains_any('TUNE_FEATURES', 'core=
2 corei7', '.*', 'null', d)}"
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCor=
e-CMakeLists.txt-ensure-reproduc.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
> new file mode 100644
> index 0000000000..bbe265059d
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMake=
Lists.txt-ensure-reproduc.patch
> @@ -0,0 +1,28 @@
> +From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Mon, 26 Jun 2023 14:30:02 +0200
> +Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure reproducib=
ility
> + of __TIMESTAMP__
> +
> +__TIMESTAMP__ refers to mtime of the file that contains it, which is uns=
table
> +and breaks binary reproducibility when the file is generated at build ti=
me. To ensure
> +this does not happen, mtime should be set from the original file.
> +
> +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/15293]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Source/JavaScriptCore/CMakeLists.txt | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCor=
e/CMakeLists.txt
> +index 43dc22ff..c2e3b1cd 100644
> +--- a/Source/JavaScriptCore/CMakeLists.txt
> ++++ b/Source/JavaScriptCore/CMakeLists.txt
> +@@ -159,6 +159,7 @@ add_custom_command(
> +     OUTPUT ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersio=
n.cpp
> +     MAIN_DEPENDENCY ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersi=
on.cpp.in
> +     COMMAND ${PERL_EXECUTABLE} -pe s/CACHED_TYPES_CKSUM/__TIMESTAMP__/ =
${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in > ${JavaScript=
Core_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> ++    COMMAND touch -r ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVers=
ion.cpp.in ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cp=
p
> +             VERBATIM
> + )
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d7=
83d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106=
617b0e6d783d073b188a2548.patch
> index 32f92f7ff5..34e0ff9af3 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b=
188a2548.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b=
188a2548.patch
> @@ -1,8 +1,8 @@
> -From 0d3344e17d258106617b0e6d783d073b188a2548 Mon Sep 17 00:00:00 2001
> +From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 2001
>  From: Adrian Perez de Castro <aperez@igalia.com>
>  Date: Thu, 2 Jun 2022 11:19:06 +0300
> -Subject: [PATCH] [ARM][NEON] FELightningNEON.cpp fails to build, NEON fa=
st
> - path seems unused https://bugs.webkit.org/show_bug.cgi?id=3D241182
> +Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seem=
s
> + unused https://bugs.webkit.org/show_bug.cgi?id=3D241182
>
>  Reviewed by NOBODY (OOPS!).
>
> @@ -30,19 +30,21 @@ left for a follow-up fix.
>  * Source/WebCore/platform/graphics/filters/PointLightSource.h:
>  * Source/WebCore/platform/graphics/filters/SpotLightSource.h:
>  * Source/WebCore/platform/graphics/filters/software/FELightingSoftwareAp=
plier.h:
> ----
> +
>  Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> +---
>   .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> - .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
> + .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
>   .../graphics/filters/DistantLightSource.h     |  4 ++
>   .../platform/graphics/filters/FELighting.h    |  7 ---
>   .../graphics/filters/PointLightSource.h       |  4 ++
>   .../graphics/filters/SpotLightSource.h        |  4 ++
>   .../software/FELightingSoftwareApplier.h      | 16 ++++++
> - 7 files changed, 57 insertions(+), 36 deletions(-)
> + 7 files changed, 56 insertions(+), 35 deletions(-)
>
> +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELighting=
NEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.=
cpp
> +index f6ff8c20..42a97ffc 100644
>  --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cp=
p
>  +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cp=
p
>  @@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> @@ -63,6 +65,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   {
>       // Calling a powf function from the assembly code would require to =
save
>       // and reload a lot of NEON registers. Since the base is in range [=
0..1]
> +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELighting=
NEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> +index b17c603d..e4629cda 100644
>  --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
>  +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
>  @@ -24,14 +24,15 @@
> @@ -104,7 +108,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>           0,
>           0,
>           0,
> -@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
> +@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const Li=
ghtingData& data, const LightS
>       // Set light source arguments.
>       floatArguments.constOne =3D 1;
>
> @@ -133,7 +137,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>           floatArguments.lightX =3D spotLightSource.position().x();
>           floatArguments.lightY =3D spotLightSource.position().y();
>           floatArguments.lightZ =3D spotLightSource.position().z();
> -@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
> +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const Ligh=
tingData& data, const LightS
>           if (spotLightSource.specularExponent() =3D=3D 1)
>               neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1;
>       } else {
> @@ -142,7 +146,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>           floatArguments.lightX =3D paintingData.initialLightingData.ligh=
tVector.x();
>           floatArguments.lightY =3D paintingData.initialLightingData.ligh=
tVector.y();
>           floatArguments.lightZ =3D paintingData.initialLightingData.ligh=
tVector.z();
> -@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
> +@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const Li=
ghtingData& data, const LightS
>       // Set lighting arguments.
>       floatArguments.surfaceScale =3D data.surfaceScale;
>       floatArguments.minusSurfaceScaleDividedByFour =3D -data.surfaceScal=
e / 4;
> @@ -192,16 +196,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>               }
>               parallelJobs.execute();
>               return;
> -@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
> +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const Ligh=
tingData& data, const LightS
>   } // namespace WebCore
>
>   #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
>  -
>  -#endif // FELightingNEON_h
> +diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource=
.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> +index 70c6512f..b032c82e 100644
>  --- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
>  +++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -@@ -25,6 +25,10 @@
> - #include "LightSource.h"
> +@@ -26,6 +26,10 @@
> + #include <wtf/ArgumentCoder.h>
>   #include <wtf/Ref.h>
>
>  +namespace WTF {
> @@ -211,6 +217,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   namespace WebCore {
>
>   class DistantLightSource : public LightSource {
> +diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Sou=
rce/WebCore/platform/graphics/filters/FELighting.h
> +index 53beb596..e78a9354 100644
>  --- a/Source/WebCore/platform/graphics/filters/FELighting.h
>  +++ b/Source/WebCore/platform/graphics/filters/FELighting.h
>  @@ -35,8 +35,6 @@
> @@ -222,7 +230,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   class FELighting : public FilterEffect {
>   public:
>       const Color& lightingColor() const { return m_lightingColor; }
> -@@ -67,11 +65,6 @@ protected:
> +@@ -64,11 +62,6 @@ protected:
>
>       std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const =
override;
>
> @@ -234,6 +242,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>       Color m_lightingColor;
>       float m_surfaceScale;
>       float m_diffuseConstant;
> +diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h=
 b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> +index 3a5723f0..675d63f5 100644
>  --- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
>  +++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
>  @@ -26,6 +26,10 @@
> @@ -247,6 +257,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   namespace WebCore {
>
>   class PointLightSource : public LightSource {
> +diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h =
b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> +index 684626f7..dea58389 100644
>  --- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
>  +++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
>  @@ -26,6 +26,10 @@
> @@ -260,6 +272,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   namespace WebCore {
>
>   class SpotLightSource : public LightSource {
> +diff --git a/Source/WebCore/platform/graphics/filters/software/FELightin=
gSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELi=
ghtingSoftwareApplier.h
> +index c974d921..e2896660 100644
>  --- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwa=
reApplier.h
>  +++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwa=
reApplier.h
>  @@ -36,6 +36,7 @@
> diff --git a/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13=
795c9b0f7894bf4.patch b/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab3525=
8a6da9b13795c9b0f7894bf4.patch
> new file mode 100644
> index 0000000000..79da855ff4
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0=
f7894bf4.patch
> @@ -0,0 +1,41 @@
> +From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 2001
> +From: Diego Pino Garcia <dpino@igalia.com>
> +Date: Mon, 22 May 2023 19:58:50 -0700
> +Subject: [PATCH] [GLIB] Fix build error after 264196@main
> + https://bugs.webkit.org/show_bug.cgi?id=3D256917
> +
> +Reviewed by Michael Catanzaro.
> +
> +Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is
> +enabled.
> +
> +* Source/WTF/wtf/glib/Sandbox.cpp:
> +(WTF::isInsideUnsupportedContainer):
> +
> +Canonical link: https://commits.webkit.org/264395@main
> +Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/49772=
90ab4ab35258a6da9b13795c9b0f7894bf4]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Source/WTF/wtf/glib/Sandbox.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Source/WTF/wtf/glib/Sandbox.cpp b/Source/WTF/wtf/glib/Sandb=
ox.cpp
> +index 7d84e830ab33e..9b07bb8cb5a9b 100644
> +--- a/Source/WTF/wtf/glib/Sandbox.cpp
> ++++ b/Source/WTF/wtf/glib/Sandbox.cpp
> +@@ -36,6 +36,7 @@ bool isInsideFlatpak()
> +     return returnValue;
> + }
> +
> ++#if ENABLE(BUBBLEWRAP_SANDBOX)
> + bool isInsideUnsupportedContainer()
> + {
> +     static bool inContainer =3D g_file_test("/run/.containerenv", G_FIL=
E_TEST_EXISTS);
> +@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()
> +
> +     return inContainer && !supportedContainer;
> + }
> ++#endif
> +
> + bool isInsideSnap()
> + {
> diff --git a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e10=
0dcf967243ecd98.patch b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90=
453bc4e100dcf967243ecd98.patch
> deleted file mode 100644
> index 1ff9dcea7e..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967=
243ecd98.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From d318bb461f040b90453bc4e100dcf967243ecd98 Mon Sep 17 00:00:00 2001
> -From: Michael Catanzaro <mcatanzaro@redhat.com>
> -Date: Mon, 16 Jan 2023 16:55:26 -0800
> -Subject: [PATCH] WebKitGTK 2.39.4 does not build due to missing #include=
 in
> - ANGLE https://bugs.webkit.org/show_bug.cgi?id=3D250689
> -
> -Unreviewed build fix.
> -
> -* Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h:
> -
> -Canonical link: https://commits.webkit.org/258968@main
> -
> -Upstream-Status: Backport [https://bugs.webkit.org/show_bug.cgi?id=3D250=
689]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h b/Sour=
ce/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
> -index 94cb93e01fc0..ec7bda372f30 100644
> ---- a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
> -+++ b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
> -@@ -12,6 +12,7 @@
> -
> - #include <algorithm>
> - #include <array>
> -+#include <cstdint>
> - #include <string>
> - #include <vector>
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.40.2.bb
> similarity index 90%
> rename from meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
> index 36c6233b33..ac6681a0ce 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
> @@ -13,9 +13,10 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}=
-${PV}.tar.xz \
>             file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
>             file://reproducibility.patch \
>             file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
> -           file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
> +           file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch \
> +           file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-repro=
duc.patch \
>             "
> -SRC_URI[sha256sum] =3D "40c20c43022274df5893f22b1054fa894c3eea057389bb08=
aee08c5b0bb0c1a7"
> +SRC_URI[sha256sum] =3D "96898870d994da406ee7a632816dcde9a3bb395ee5f344fc=
b3f3b8cc8a77e000"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
>
> @@ -27,6 +28,7 @@ CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
>  DEPENDS +=3D " \
>            ruby-native \
>            gperf-native \
> +          unifdef-native \
>            cairo \
>            harfbuzz \
>            jpeg \
> @@ -71,6 +73,8 @@ PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DO=
FF,lcms"
>  PACKAGECONFIG[soup2] =3D "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,libsoup-2.4=
,,,soup3"
>  PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2"
>  PACKAGECONFIG[journald] =3D "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNAL=
D_LOG=3DOFF,systemd"
> +PACKAGECONFIG[avif] =3D "-DUSE_AVIF_LOG=3DON,-DUSE_AVIF=3DOFF,libavif"
> +PACKAGECONFIG[media-recorder] =3D "-DENABLE_MEDIA_RECORDER=3DON,-DENABLE=
_MEDIA_RECORDER=3DOFF,gstreamer1.0-plugins-bad"
>
>  EXTRA_OECMAKE =3D " \
>                 -DPORT=3DGTK \
> @@ -136,6 +140,9 @@ ARM_INSTRUCTION_SET:armv7a =3D "thumb"
>  ARM_INSTRUCTION_SET:armv7r =3D "thumb"
>  ARM_INSTRUCTION_SET:armv7ve =3D "thumb"
>
> +# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
> +COMPATIBLE_HOST:x86 =3D "${@bb.utils.contains_any('TUNE_FEATURES', 'core=
2 corei7', '.*', 'null', d)}"
> +
>  # introspection inside qemu-arm hangs forever on musl/arm builds
>  # therefore disable GI_DATA
>  GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
> @@ -151,8 +158,8 @@ src_package_preprocess () {
>              ${B}/JavaScriptCore/DerivedSources/*.h \
>              ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
>              ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
> -            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \
> -            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
> +            ${B}/WebCore/DerivedSources/*.cpp \
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
>
>  }
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184254): https://lists.openembedded.org/g/openembedde=
d-core/message/184254
> Mute This Topic: https://lists.openembedded.org/mt/100136729/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

