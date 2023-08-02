Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E25C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 17:43:16 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.2797.1690998188696877613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 10:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WT7mmvGH;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fe463420fbso130429e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 10:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690998186; x=1691602986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+pLCQXgx4NL2rEar5Tu3hDS1HP1McSRJUFI01oxNz4=;
        b=WT7mmvGHEvsENmnfGWmvcuxpR+3D21RVRxXCy3seDeEKp/z9rtxH6C83x0unY5DsRM
         GOPhlajM3PvPK1JGNT3CKZMbqEzRZ3huZWMMaZWVelJwBvFaJqhc7/XtEfma/Zs5PBrc
         gtH2KTjbBgeFhfK/QgficGH0tT9otb7Hgh8zI04uJ8tWtzLC3w5FZJX2iLmtZaLOcRSt
         p7B2HsCh4Te+HJ9queMruHTRebOVn7ToYUKm34jYBZ5XwrEgAWp5L/GzumiTAEvEYh2D
         GoCTJLvm4SBNJDr6DdSTbkm26dubN22LjuxsmQBcGBIEY9Q1vw1LhhHEXzQAnLnBxUdn
         +qSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690998186; x=1691602986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+pLCQXgx4NL2rEar5Tu3hDS1HP1McSRJUFI01oxNz4=;
        b=VFTK8OLQhfR8YWecAD0VuYVmu6VOI3xAnAtF4fdFPz+lnay8CiOCHxoKPN5Wx+20Af
         LQZ58wU653UMzx2oQHmEMUow5YF1P2JXmK1BSt9vP0oGWLXQlL779XjXTFrPuK+nQzvd
         02mHtS5GMkWpn3SBWIwzmWOpX/7V2xnIvpHSu3D/Wir8Y8j+QCEMkYrvCbfxYAEHzhee
         g1Wy4tKLz6pXsJHIrwWx7Uihv/u01csJFSkr98WCjYxxYxmzyEN6QhHeJl5OHCUs7oZQ
         t2WVFDLf75L0XFnjgSq/NFkZoA8sKQaYV0hncCOCsrKffdBwI79JHjFKGC2wPlAmfpUA
         FnKw==
X-Gm-Message-State: ABy/qLb5IdhPW5f1Aqja0V9+CebOC27le1XYdaRqZcTGzS+NZc3nGcst
	DCDCiHCmKhliS3k7op2xLqY880GcK71wPRuZHJg=
X-Google-Smtp-Source: APBJJlFOZSSQIbH72F/ofwC0u0GiD4T7QTv3HBNm4TN4AyCm+FFkrYKjgCCRfCoieYbUUrgDyF+uF+mxrnbB5H6k2sQ=
X-Received: by 2002:a05:6512:239f:b0:4fb:821e:2241 with SMTP id
 c31-20020a056512239f00b004fb821e2241mr5939433lfv.23.1690998186263; Wed, 02
 Aug 2023 10:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230802150801.2607-1-f_l_k@t-online.de>
In-Reply-To: <20230802150801.2607-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Aug 2023 19:42:53 +0200
Message-ID: <CANNYZj8aoo6gh1amU2pOBC+jZj_=psDtYs5YZeaLLHaNT0prFg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/2] webkitgtk: upgrade 2.40.2 -> 2.40.5
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 17:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185422

'Unneeded patches' is not a good phrase to use: it's better to say
explicitly that the patches have been merged into the new release (or
if there is some other reason they are not needed anymore). I had to
go to upstream repo and check that, but I shouldn't have to.

Alex

On Wed, 2 Aug 2023 at 17:08, Markus Volk <f_l_k@t-online.de> wrote:
>
> - Remove unneeded patches
>
>     What=E2=80=99s new in the WebKitGTK 2.40.5 release?
>     - Fix several crashes and rendering issues.
>
>     What=E2=80=99s new in the WebKitGTK 2.40.4 release?
>     - Fix a bug in JavaScript reading variable arguments in a call.
>
>     What=E2=80=99s new in the WebKitGTK 2.40.3 release?
>     - Make memory pressure monitor honor memory.memsw.usage_in_bytes if e=
xists.
>     - Include key modifiers in wheel events.
>     - Apply cookie blocking policy to WebSocket handshakes.
>     - Remove accidental dependency on GLib 2.70.
>     - Fix the build with BUBBLEWRAP_SANDBOX disabled.
>     - Fix several crashes and rendering issues.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 -------------
>  ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 -------------------
>  ...ebkitgtk_2.40.2.bb =3D> webkitgtk_2.40.5.bb} |  5 +--
>  3 files changed, 1 insertion(+), 73 deletions(-)
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaSc=
riptCore-CMakeLists.txt-ensure-reproduc.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a=
6da9b13795c9b0f7894bf4.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.40.2.bb =3D> webkitgtk_2.40=
.5.bb} (96%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCor=
e-CMakeLists.txt-ensure-reproduc.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
> deleted file mode 100644
> index bbe265059d..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMake=
Lists.txt-ensure-reproduc.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Mon, 26 Jun 2023 14:30:02 +0200
> -Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure reproducib=
ility
> - of __TIMESTAMP__
> -
> -__TIMESTAMP__ refers to mtime of the file that contains it, which is uns=
table
> -and breaks binary reproducibility when the file is generated at build ti=
me. To ensure
> -this does not happen, mtime should be set from the original file.
> -
> -Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/15293]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - Source/JavaScriptCore/CMakeLists.txt | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCor=
e/CMakeLists.txt
> -index 43dc22ff..c2e3b1cd 100644
> ---- a/Source/JavaScriptCore/CMakeLists.txt
> -+++ b/Source/JavaScriptCore/CMakeLists.txt
> -@@ -159,6 +159,7 @@ add_custom_command(
> -     OUTPUT ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersio=
n.cpp
> -     MAIN_DEPENDENCY ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersi=
on.cpp.in
> -     COMMAND ${PERL_EXECUTABLE} -pe s/CACHED_TYPES_CKSUM/__TIMESTAMP__/ =
${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in > ${JavaScript=
Core_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> -+    COMMAND touch -r ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVers=
ion.cpp.in ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cp=
p
> -             VERBATIM
> - )
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13=
795c9b0f7894bf4.patch b/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab3525=
8a6da9b13795c9b0f7894bf4.patch
> deleted file mode 100644
> index 79da855ff4..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0=
f7894bf4.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 2001
> -From: Diego Pino Garcia <dpino@igalia.com>
> -Date: Mon, 22 May 2023 19:58:50 -0700
> -Subject: [PATCH] [GLIB] Fix build error after 264196@main
> - https://bugs.webkit.org/show_bug.cgi?id=3D256917
> -
> -Reviewed by Michael Catanzaro.
> -
> -Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is
> -enabled.
> -
> -* Source/WTF/wtf/glib/Sandbox.cpp:
> -(WTF::isInsideUnsupportedContainer):
> -
> -Canonical link: https://commits.webkit.org/264395@main
> -Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/49772=
90ab4ab35258a6da9b13795c9b0f7894bf4]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - Source/WTF/wtf/glib/Sandbox.cpp | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/Source/WTF/wtf/glib/Sandbox.cpp b/Source/WTF/wtf/glib/Sandb=
ox.cpp
> -index 7d84e830ab33e..9b07bb8cb5a9b 100644
> ---- a/Source/WTF/wtf/glib/Sandbox.cpp
> -+++ b/Source/WTF/wtf/glib/Sandbox.cpp
> -@@ -36,6 +36,7 @@ bool isInsideFlatpak()
> -     return returnValue;
> - }
> -
> -+#if ENABLE(BUBBLEWRAP_SANDBOX)
> - bool isInsideUnsupportedContainer()
> - {
> -     static bool inContainer =3D g_file_test("/run/.containerenv", G_FIL=
E_TEST_EXISTS);
> -@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()
> -
> -     return inContainer && !supportedContainer;
> - }
> -+#endif
> -
> - bool isInsideSnap()
> - {
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.40.5.bb
> similarity index 96%
> rename from meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
> index a9391bfc99..7bf32e8610 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
> @@ -13,11 +13,9 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}=
-${PV}.tar.xz \
>             file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
>             file://reproducibility.patch \
>             file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
> -           file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch \
> -           file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-repro=
duc.patch \
>             file://check-GST_GL_HAVE_PLATFORM_GLX.patch \
>             "
> -SRC_URI[sha256sum] =3D "96898870d994da406ee7a632816dcde9a3bb395ee5f344fc=
b3f3b8cc8a77e000"
> +SRC_URI[sha256sum] =3D "7de051a263668621d91a61a5eb1c3771d1a7cec900043d4a=
fef06c326c16037f"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
>
> @@ -162,6 +160,5 @@ src_package_preprocess () {
>              ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
>              ${B}/WebCore/DerivedSources/*.cpp \
>              ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
> -
>  }
>
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185413): https://lists.openembedded.org/g/openembedde=
d-core/message/185413
> Mute This Topic: https://lists.openembedded.org/mt/100507379/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

