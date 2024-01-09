Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE0EC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 17:30:12 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.23104.1704821406928210933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 09:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WNr+BDTT;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cd5c55d6b8so21763981fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 09:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704821405; x=1705426205; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tDwVjnOcU44v8iocFJZN20mgF8yXIpb+B+FcHZsmKXg=;
        b=WNr+BDTTkP4GNhw74+pxgQ7SV+57Ey334fg87gX4EF8rUHY+N0TsrMYTEk9pXmuKIa
         tEnygc7Bz6VFhNX3KeGRVWdZSd2w5p7TaTW7qBW2YwuUSA/k4o8HyFKnGIdMnpQYpZly
         3LtVcpQ3LGS0GsIZw9hQ+UsP3opeBtrX81TZ8gW7lfliyqOtQCfRYTH8PlXME/5nX15z
         7OanW3HE0qbgTNyIP2mXZ00onSkNTmOr7IUWloYd5qzKwMFIoI1hG0Ii7+kFfqG6kePN
         sZJAo/c52c2l5vaOfK3zUzQaoiZexxG+yOFa/bQMFYbCX/YZI9DHPLJuKP2nxgsdkYwg
         01Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704821405; x=1705426205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDwVjnOcU44v8iocFJZN20mgF8yXIpb+B+FcHZsmKXg=;
        b=Qa7FfH2BZ7bB5NTiaZaJ/ZU3B6JLGPOIzVu9DQ+zfe4Y7iCw3P1/o0boX+XlTN7DPX
         qxEynDYPX5QWqSMGrSfXcFq2dRz2tZ4p38u+LEFughxQ31PVoxcre29md5+IXTOAmKbB
         /FGwUpsZGMae9Kb0lbOH7wMXR/Bofko9I7G6x97i8zykHKU5UtJgOnfN5cfEtw2gRaxb
         Qe28OIQLkGRrnvej9mw5kJH5yNxgzwccLpza/VC8P2pBkFWmEIhkh3tCAf3Bf63fb6t0
         XUdwmLb4yzt0fC5Y/zCFMU4imhFSqsQphwSvNcosfK898jjG/1sUS/y46JdaPuqxYt1E
         Wa3Q==
X-Gm-Message-State: AOJu0YzmW+bgZAtlwoBAjc3yz3dyGTyqodBVfAvan4WjkEoXW+Xgbana
	GGhHqZeh00fIefCKBmhQfSAU5WWgIoaXkXofXHY=
X-Google-Smtp-Source: AGHT+IGiqNvR9efLSFr2UCtu+vvcSYeFIchCxTUrCfZdJeVkbNPU8P95255YehjcVPXclds3CqrYbYjOtDqm3loPRlU=
X-Received: by 2002:ac2:4821:0:b0:50e:7d67:c99a with SMTP id
 1-20020ac24821000000b0050e7d67c99amr1521717lft.107.1704821404693; Tue, 09 Jan
 2024 09:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20240109170941.3422308-1-f_l_k@t-online.de>
In-Reply-To: <20240109170941.3422308-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jan 2024 18:29:53 +0100
Message-ID: <CANNYZj-tsx5S-PTikmO43sY-0-QEEiLnqs-1QAmTGpPFRfOabw@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCHv2] webp: switch recipe to cmake buildsystem
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003b7978060e86aa1b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 17:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193473

--0000000000003b7978060e86aa1b
Content-Type: text/plain; charset="UTF-8"

Why is the patch marked inappropriate?

Please send upstream first, and only after upstream has expressed their
approval/disaporoval/request for changes we can take some form of it in
oe-core. Maybe they would simply want to turn these into hard dependencies
instead of adding even more options.

Until then, NAK.

Alex

On Tue 9. Jan 2024 at 18.10, Markus Volk <f_l_k@t-online.de> wrote:

> Besides the improvements that cmake offers compared to autotools,
> the advantage would be that cmake config files get created.
> This is useful so that other projects can find webp using cmake.
>
> Remove EXTRA_OECONF settings because all of them are set like this
> by default.
>
> CMakeLists.txt doesn't provide an option for selecting neon but from
> what I have tested it gets selected properly.
>
> Add a patch that hides more dependencies behind options to avoid
> floating dependencies.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../webp/libwebp/0001-cmake-add-options.patch | 120 ++++++++++++++++++
>  meta/recipes-multimedia/webp/libwebp_1.3.2.bb |  40 ++----
>  2 files changed, 133 insertions(+), 27 deletions(-)
>  create mode 100644
> meta/recipes-multimedia/webp/libwebp/0001-cmake-add-options.patch
>
> diff --git
> a/meta/recipes-multimedia/webp/libwebp/0001-cmake-add-options.patch
> b/meta/recipes-multimedia/webp/libwebp/0001-cmake-add-options.patch
> new file mode 100644
> index 0000000000..0a3e781097
> --- /dev/null
> +++ b/meta/recipes-multimedia/webp/libwebp/0001-cmake-add-options.patch
> @@ -0,0 +1,120 @@
> +From d126cdbe38cda7a4ab512738b2755942da33e43c Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 9 Jan 2024 16:31:08 +0100
> +Subject: [PATCH] cmake: add more options
> +
> +By doing this gif,jpeg,png,tiff,opengl and sdl can be disabled to avoid
> floating dependencies.
> +
> +Upstream-Status: Inappropriate
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + CMakeLists.txt   | 28 ++++++++++++++++++----------
> + cmake/deps.cmake | 24 +++++++++++++++---------
> + 2 files changed, 33 insertions(+), 19 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index ad5e14c3..c3b24f99 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -35,6 +35,12 @@ endif()
> + option(WEBP_ENABLE_SIMD "Enable any SIMD optimization."
> +        ${WEBP_ENABLE_SIMD_DEFAULT})
> + option(WEBP_BUILD_ANIM_UTILS "Build animation utilities." ON)
> ++option(WEBP_BUILD_GIF "Build gif support." OFF)
> ++option(WEBP_BUILD_TIFF "Build tiff support." OFF)
> ++option(WEBP_BUILD_PNG "Build png support." OFF)
> ++option(WEBP_BUILD_JPEG "Build jpeg support." OFF)
> ++option(WEBP_BUILD_OPENGL "Build opengl support." OFF)
> ++option(WEBP_BUILD_SDL "Build sdl support." OFF)
> + option(WEBP_BUILD_CWEBP "Build the cwebp command line tool." ON)
> + option(WEBP_BUILD_DWEBP "Build the dwebp command line tool." ON)
> + option(WEBP_BUILD_GIF2WEBP "Build the gif2webp conversion tool." ON)
> +@@ -562,7 +568,7 @@ if(WEBP_BUILD_IMG2WEBP)
> +   install(TARGETS img2webp RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
> + endif()
> +
> +-if(WEBP_BUILD_VWEBP)
> ++if(WEBP_BUILD_VWEBP AND WEBP_BUILD_OPENGL)
> +   # vwebp
> +   find_package(GLUT)
> +   if(GLUT_FOUND)
> +@@ -638,15 +644,17 @@ if(WEBP_BUILD_EXTRAS)
> +
>  ${CMAKE_CURRENT_BINARY_DIR})
> +
> +   # vwebp_sdl
> +-  find_package(SDL)
> +-  if(WEBP_BUILD_VWEBP AND SDL_FOUND)
> +-    add_executable(vwebp_sdl ${VWEBP_SDL_SRCS})
> +-    target_link_libraries(vwebp_sdl ${SDL_LIBRARY} imageioutil webp)
> +-    target_include_directories(
> +-      vwebp_sdl PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
> ${CMAKE_CURRENT_BINARY_DIR}
> +-                        ${CMAKE_CURRENT_BINARY_DIR}/src
> ${SDL_INCLUDE_DIR})
> +-    set(WEBP_HAVE_SDL 1)
> +-    target_compile_definitions(vwebp_sdl PUBLIC WEBP_HAVE_SDL)
> ++  if(WEBP_BUILD_SDL)
> ++    find_package(SDL)
> ++    if(WEBP_BUILD_VWEBP AND SDL_FOUND)
> ++      add_executable(vwebp_sdl ${VWEBP_SDL_SRCS})
> ++      target_link_libraries(vwebp_sdl ${SDL_LIBRARY} imageioutil webp)
> ++      target_include_directories(
> ++        vwebp_sdl PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
> ${CMAKE_CURRENT_BINARY_DIR}
> ++                          ${CMAKE_CURRENT_BINARY_DIR}/src
> ${SDL_INCLUDE_DIR})
> ++      set(WEBP_HAVE_SDL 1)
> ++      target_compile_definitions(vwebp_sdl PUBLIC WEBP_HAVE_SDL)
> ++    endif()
> +   endif()
> + endif()
> +
> +diff --git a/cmake/deps.cmake b/cmake/deps.cmake
> +index 0760ba92..cc978256 100644
> +--- a/cmake/deps.cmake
> ++++ b/cmake/deps.cmake
> +@@ -52,8 +52,10 @@ endif()
> + set(LT_OBJDIR ".libs/")
> +
> + # Only useful for vwebp, so useless for now.
> +-find_package(OpenGL)
> +-set(WEBP_HAVE_GL ${OPENGL_FOUND})
> ++if(WEBP_BUILD_OPENGL)
> ++  find_package(OpenGL)
> ++  set(WEBP_HAVE_GL ${OPENGL_FOUND})
> ++endif()
> +
> + # Check if we need to link to the C math library. We do not look for it
> as it is
> + # not found when cross-compiling, while it is here.
> +@@ -81,8 +83,10 @@ if(WEBP_FIND_IMG_LIBS)
> +       message(STATUS "TIFF is disabled when statically linking.")
> +       continue()
> +     endif()
> +-    find_package(${I_LIB})
> +-    set(WEBP_HAVE_${I_LIB} ${${I_LIB}_FOUND})
> ++    if(WEBP_BUILD_${I_LIB})
> ++      find_package(${I_LIB})
> ++      set(WEBP_HAVE_${I_LIB} ${${I_LIB}_FOUND})
> ++    endif()
> +     if(${I_LIB}_FOUND)
> +       list(APPEND WEBP_DEP_IMG_LIBRARIES ${${I_LIB}_LIBRARIES})
> +       list(APPEND WEBP_DEP_IMG_INCLUDE_DIRS ${${I_LIB}_INCLUDE_DIR}
> +@@ -94,11 +98,13 @@ if(WEBP_FIND_IMG_LIBS)
> +   endif()
> +
> +   # GIF detection, gifdec isn't part of the imageio lib.
> +-  include(CMakePushCheckState)
> +-  set(WEBP_DEP_GIF_LIBRARIES)
> +-  set(WEBP_DEP_GIF_INCLUDE_DIRS)
> +-  find_package(GIF)
> +-  set(WEBP_HAVE_GIF ${GIF_FOUND})
> ++  if(WEBP_BUILD_GIF)
> ++    include(CMakePushCheckState)
> ++    set(WEBP_DEP_GIF_LIBRARIES)
> ++    set(WEBP_DEP_GIF_INCLUDE_DIRS)
> ++    find_package(GIF)
> ++    set(WEBP_HAVE_GIF ${GIF_FOUND})
> ++  endif()
> +   if(GIF_FOUND)
> +     # GIF find_package only locates the header and library, it doesn't
> fail
> +     # compile tests when detecting the version, but falls back to 3 (as
> of at
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
> b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
> index 63b0fd9a6c..13fe337660 100644
> --- a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
> +++ b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
> @@ -13,45 +13,31 @@ LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
>                      file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
>
> -SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
> +SRC_URI = " \
> +       http://downloads.webmproject.org/releases/webp/${BP}.tar.gz \
> +       file://0001-cmake-add-options.patch \
> +"
>  SRC_URI[sha256sum] =
> "2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562aa09b4"
>
>  UPSTREAM_CHECK_URI = "
> http://downloads.webmproject.org/releases/webp/index.html"
>
> -EXTRA_OECONF = " \
> -    --disable-wic \
> -    --enable-libwebpmux \
> -    --enable-libwebpdemux \
> -    --enable-threading \
> -"
> -
> -# Do not trust configure to determine if neon is available.
> -#
> -EXTRA_OECONF_ARM = " \
> -
> ${@bb.utils.contains("TUNE_FEATURES","neon","--enable-neon","--disable-neon",d)}
> \
> -"
> -EXTRA_OECONF:append:arm = " ${EXTRA_OECONF_ARM}"
> -EXTRA_OECONF:append:armeb = " ${EXTRA_OECONF_ARM}"
> +EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
>
> -inherit autotools lib_package
> -
> -PACKAGECONFIG ??= ""
> -
> -# libwebpdecoder is a subset of libwebp, don't build it unless requested
> -PACKAGECONFIG[decoder] =
> "--enable-libwebpdecoder,--disable-libwebpdecoder"
> +inherit cmake lib_package
>
> +PACKAGECONFIG ?= ""
>  # Apply for examples programs: cwebp and dwebp
> -PACKAGECONFIG[gif] = "--enable-gif,--disable-gif,giflib"
> -PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
> -PACKAGECONFIG[png] = "--enable-png,--disable-png,,libpng"
> -PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
> -
> +PACKAGECONFIG[gif] = "-DWEBP_BUILD_GIF=ON,-DWEBP_BUILD_GIF=OFF,giflib"
> +PACKAGECONFIG[jpeg] = "-DWEBP_BUILD_JPEG=ON,-DWEBP_BUILD_JPEG=OFF,jpeg"
> +PACKAGECONFIG[png] = "-DWEBP_BUILD_PNG=ON,-DWEBP_BUILD_PNG=OFF,libpng"
> +PACKAGECONFIG[tiff] = "-DWEBP_BUILD_TIFF=ON,-DWEBP_BUILD_TIFF=OFF,tiff"
>  # Apply only for example program vwebp
> -PACKAGECONFIG[gl] = "--enable-gl,--disable-gl,mesa-glut"
> +PACKAGECONFIG[opengl] =
> "-DWEBP_BUILD_OPENGL=ON,-DWEBP_BUILD_OPENGL=OFF,mesa-glut"
>
>  PACKAGES =+ "${PN}-gif2webp"
>
>  DESCRIPTION:${PN}-gif2webp = "Simple tool to convert animated GIFs to
> WebP"
>  FILES:${PN}-gif2webp = "${bindir}/gif2webp"
>
> +FILES:${PN} += "${datadir}"
>  BBCLASSEXTEND += "native nativesdk"
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193471):
> https://lists.openembedded.org/g/openembedded-core/message/193471
> Mute This Topic: https://lists.openembedded.org/mt/103623686/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003b7978060e86aa1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Why is the patch marked inappropriate?=C2=A0</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Please send upstream first, and only=
 after upstream has expressed their approval/disaporoval/request for change=
s we can take some form of it in oe-core. Maybe they would simply want to t=
urn these into hard dependencies instead of adding even more options.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Until then, NAK.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 9. Jan 2024 at 18.10=
, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)">Besides the improvements that cmake =
offers compared to autotools,<br>
the advantage would be that cmake config files get created.<br>
This is useful so that other projects can find webp using cmake.<br>
<br>
Remove EXTRA_OECONF settings because all of them are set like this<br>
by default.<br>
<br>
CMakeLists.txt doesn&#39;t provide an option for selecting neon but from<br=
>
what I have tested it gets selected properly.<br>
<br>
Add a patch that hides more dependencies behind options to avoid<br>
floating dependencies.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../webp/libwebp/0001-cmake-add-options.patch | 120 +++++++++++++++++=
+<br>
=C2=A0meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.3.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libwebp_1.3.2.bb</a> |=C2=A0 40 ++----<br=
>
=C2=A02 files changed, 133 insertions(+), 27 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/webp/libwebp/0001-cmake-ad=
d-options.patch<br>
<br>
diff --git a/meta/recipes-multimedia/webp/libwebp/0001-cmake-add-options.pa=
tch b/meta/recipes-multimedia/webp/libwebp/0001-cmake-add-options.patch<br>
new file mode 100644<br>
index 0000000000..0a3e781097<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/webp/libwebp/0001-cmake-add-options.patch<br>
@@ -0,0 +1,120 @@<br>
+From d126cdbe38cda7a4ab512738b2755942da33e43c Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Tue, 9 Jan 2024 16:31:08 +0100<br>
+Subject: [PATCH] cmake: add more options<br>
+<br>
+By doing this gif,jpeg,png,tiff,opengl and sdl can be disabled to avoid fl=
oating dependencies.<br>
+<br>
+Upstream-Status: Inappropriate<br>
+<br>
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
+---<br>
+ CMakeLists.txt=C2=A0 =C2=A0| 28 ++++++++++++++++++----------<br>
+ cmake/deps.cmake | 24 +++++++++++++++---------<br>
+ 2 files changed, 33 insertions(+), 19 deletions(-)<br>
+<br>
+diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
+index ad5e14c3..c3b24f99 100644<br>
+--- a/CMakeLists.txt<br>
++++ b/CMakeLists.txt<br>
+@@ -35,6 +35,12 @@ endif()<br>
+ option(WEBP_ENABLE_SIMD &quot;Enable any SIMD optimization.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${WEBP_ENABLE_SIMD_DEFAULT})<br>
+ option(WEBP_BUILD_ANIM_UTILS &quot;Build animation utilities.&quot; ON)<b=
r>
++option(WEBP_BUILD_GIF &quot;Build gif support.&quot; OFF)<br>
++option(WEBP_BUILD_TIFF &quot;Build tiff support.&quot; OFF)<br>
++option(WEBP_BUILD_PNG &quot;Build png support.&quot; OFF)<br>
++option(WEBP_BUILD_JPEG &quot;Build jpeg support.&quot; OFF)<br>
++option(WEBP_BUILD_OPENGL &quot;Build opengl support.&quot; OFF)<br>
++option(WEBP_BUILD_SDL &quot;Build sdl support.&quot; OFF)<br>
+ option(WEBP_BUILD_CWEBP &quot;Build the cwebp command line tool.&quot; ON=
)<br>
+ option(WEBP_BUILD_DWEBP &quot;Build the dwebp command line tool.&quot; ON=
)<br>
+ option(WEBP_BUILD_GIF2WEBP &quot;Build the gif2webp conversion tool.&quot=
; ON)<br>
+@@ -562,7 +568,7 @@ if(WEBP_BUILD_IMG2WEBP)<br>
+=C2=A0 =C2=A0install(TARGETS img2webp RUNTIME DESTINATION ${CMAKE_INSTALL_=
BINDIR})<br>
+ endif()<br>
+ <br>
+-if(WEBP_BUILD_VWEBP)<br>
++if(WEBP_BUILD_VWEBP AND WEBP_BUILD_OPENGL)<br>
+=C2=A0 =C2=A0# vwebp<br>
+=C2=A0 =C2=A0find_package(GLUT)<br>
+=C2=A0 =C2=A0if(GLUT_FOUND)<br>
+@@ -638,15 +644,17 @@ if(WEBP_BUILD_EXTRAS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${CMAKE_CURRENT_BINARY_DIR})<br>
+ <br>
+=C2=A0 =C2=A0# vwebp_sdl<br>
+-=C2=A0 find_package(SDL)<br>
+-=C2=A0 if(WEBP_BUILD_VWEBP AND SDL_FOUND)<br>
+-=C2=A0 =C2=A0 add_executable(vwebp_sdl ${VWEBP_SDL_SRCS})<br>
+-=C2=A0 =C2=A0 target_link_libraries(vwebp_sdl ${SDL_LIBRARY} imageioutil =
webp)<br>
+-=C2=A0 =C2=A0 target_include_directories(<br>
+-=C2=A0 =C2=A0 =C2=A0 vwebp_sdl PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAK=
E_CURRENT_BINARY_DIR}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${CMAKE_CURRENT_BINARY_DIR}/src ${SDL_INCLUDE_DIR})<br>
+-=C2=A0 =C2=A0 set(WEBP_HAVE_SDL 1)<br>
+-=C2=A0 =C2=A0 target_compile_definitions(vwebp_sdl PUBLIC WEBP_HAVE_SDL)<=
br>
++=C2=A0 if(WEBP_BUILD_SDL)<br>
++=C2=A0 =C2=A0 find_package(SDL)<br>
++=C2=A0 =C2=A0 if(WEBP_BUILD_VWEBP AND SDL_FOUND)<br>
++=C2=A0 =C2=A0 =C2=A0 add_executable(vwebp_sdl ${VWEBP_SDL_SRCS})<br>
++=C2=A0 =C2=A0 =C2=A0 target_link_libraries(vwebp_sdl ${SDL_LIBRARY} image=
ioutil webp)<br>
++=C2=A0 =C2=A0 =C2=A0 target_include_directories(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 vwebp_sdl PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}=
 ${CMAKE_CURRENT_BINARY_DIR}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${CMAKE_CURRENT_BINARY_DIR}/src ${SDL_INCLUDE_DIR})<br>
++=C2=A0 =C2=A0 =C2=A0 set(WEBP_HAVE_SDL 1)<br>
++=C2=A0 =C2=A0 =C2=A0 target_compile_definitions(vwebp_sdl PUBLIC WEBP_HAV=
E_SDL)<br>
++=C2=A0 =C2=A0 endif()<br>
+=C2=A0 =C2=A0endif()<br>
+ endif()<br>
+ <br>
+diff --git a/cmake/deps.cmake b/cmake/deps.cmake<br>
+index 0760ba92..cc978256 100644<br>
+--- a/cmake/deps.cmake<br>
++++ b/cmake/deps.cmake<br>
+@@ -52,8 +52,10 @@ endif()<br>
+ set(LT_OBJDIR &quot;.libs/&quot;)<br>
+ <br>
+ # Only useful for vwebp, so useless for now.<br>
+-find_package(OpenGL)<br>
+-set(WEBP_HAVE_GL ${OPENGL_FOUND})<br>
++if(WEBP_BUILD_OPENGL)<br>
++=C2=A0 find_package(OpenGL)<br>
++=C2=A0 set(WEBP_HAVE_GL ${OPENGL_FOUND})<br>
++endif()<br>
+ <br>
+ # Check if we need to link to the C math library. We do not look for it a=
s it is<br>
+ # not found when cross-compiling, while it is here.<br>
+@@ -81,8 +83,10 @@ if(WEBP_FIND_IMG_LIBS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0message(STATUS &quot;TIFF is disabled when stat=
ically linking.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0continue()<br>
+=C2=A0 =C2=A0 =C2=A0endif()<br>
+-=C2=A0 =C2=A0 find_package(${I_LIB})<br>
+-=C2=A0 =C2=A0 set(WEBP_HAVE_${I_LIB} ${${I_LIB}_FOUND})<br>
++=C2=A0 =C2=A0 if(WEBP_BUILD_${I_LIB})<br>
++=C2=A0 =C2=A0 =C2=A0 find_package(${I_LIB})<br>
++=C2=A0 =C2=A0 =C2=A0 set(WEBP_HAVE_${I_LIB} ${${I_LIB}_FOUND})<br>
++=C2=A0 =C2=A0 endif()<br>
+=C2=A0 =C2=A0 =C2=A0if(${I_LIB}_FOUND)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list(APPEND WEBP_DEP_IMG_LIBRARIES ${${I_LIB}_L=
IBRARIES})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list(APPEND WEBP_DEP_IMG_INCLUDE_DIRS ${${I_LIB=
}_INCLUDE_DIR}<br>
+@@ -94,11 +98,13 @@ if(WEBP_FIND_IMG_LIBS)<br>
+=C2=A0 =C2=A0endif()<br>
+ <br>
+=C2=A0 =C2=A0# GIF detection, gifdec isn&#39;t part of the imageio lib.<br=
>
+-=C2=A0 include(CMakePushCheckState)<br>
+-=C2=A0 set(WEBP_DEP_GIF_LIBRARIES)<br>
+-=C2=A0 set(WEBP_DEP_GIF_INCLUDE_DIRS)<br>
+-=C2=A0 find_package(GIF)<br>
+-=C2=A0 set(WEBP_HAVE_GIF ${GIF_FOUND})<br>
++=C2=A0 if(WEBP_BUILD_GIF)<br>
++=C2=A0 =C2=A0 include(CMakePushCheckState)<br>
++=C2=A0 =C2=A0 set(WEBP_DEP_GIF_LIBRARIES)<br>
++=C2=A0 =C2=A0 set(WEBP_DEP_GIF_INCLUDE_DIRS)<br>
++=C2=A0 =C2=A0 find_package(GIF)<br>
++=C2=A0 =C2=A0 set(WEBP_HAVE_GIF ${GIF_FOUND})<br>
++=C2=A0 endif()<br>
+=C2=A0 =C2=A0if(GIF_FOUND)<br>
+=C2=A0 =C2=A0 =C2=A0# GIF find_package only locates the header and library=
, it doesn&#39;t fail<br>
+=C2=A0 =C2=A0 =C2=A0# compile tests when detecting the version, but falls =
back to 3 (as of at<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.3.2.b=
b" rel=3D"noreferrer" target=3D"_blank">libwebp_1.3.2.bb</a> b/meta/recipes=
-multimedia/webp/<a href=3D"http://libwebp_1.3.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libwebp_1.3.2.bb</a><br>
index 63b0fd9a6c..13fe337660 100644<br>
--- a/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.3.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libwebp_1.3.2.bb</a><br>
+++ b/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.3.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libwebp_1.3.2.bb</a><br>
@@ -13,45 +13,31 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6e8dee932c26f2dab503a=
bf70c96d8bb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://PATENTS;md5=3Dc6926d0cb07d296f886ab6e0cc5a85b7&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://downloads.webmproject.org/releases/web=
p/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://downloads.w=
ebmproject.org/releases/webp/${BP}.tar.gz</a>&quot;<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://downloads.webmproject.org/rel=
eases/webp/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://do=
wnloads.webmproject.org/releases/webp/${BP}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cmake-add-options.patch \<br>
+&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;2a499607df669e40258e53d0ade8035ba4ec0175=
244869d1025d460562aa09b4&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://downloads.webmproject.=
org/releases/webp/index.html" rel=3D"noreferrer" target=3D"_blank">http://d=
ownloads.webmproject.org/releases/webp/index.html</a>&quot;<br>
<br>
-EXTRA_OECONF =3D &quot; \<br>
-=C2=A0 =C2=A0 --disable-wic \<br>
-=C2=A0 =C2=A0 --enable-libwebpmux \<br>
-=C2=A0 =C2=A0 --enable-libwebpdemux \<br>
-=C2=A0 =C2=A0 --enable-threading \<br>
-&quot;<br>
-<br>
-# Do not trust configure to determine if neon is available.<br>
-#<br>
-EXTRA_OECONF_ARM =3D &quot; \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&quot;TUNE_FEATURES&quot;,&quot;neon&qu=
ot;,&quot;--enable-neon&quot;,&quot;--disable-neon&quot;,d)} \<br>
-&quot;<br>
-EXTRA_OECONF:append:arm =3D &quot; ${EXTRA_OECONF_ARM}&quot;<br>
-EXTRA_OECONF:append:armeb =3D &quot; ${EXTRA_OECONF_ARM}&quot;<br>
+EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON&quot;<br>
<br>
-inherit autotools lib_package<br>
-<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
-<br>
-# libwebpdecoder is a subset of libwebp, don&#39;t build it unless request=
ed<br>
-PACKAGECONFIG[decoder] =3D &quot;--enable-libwebpdecoder,--disable-libwebp=
decoder&quot;<br>
+inherit cmake lib_package<br>
<br>
+PACKAGECONFIG ?=3D &quot;&quot;<br>
=C2=A0# Apply for examples programs: cwebp and dwebp<br>
-PACKAGECONFIG[gif] =3D &quot;--enable-gif,--disable-gif,giflib&quot;<br>
-PACKAGECONFIG[jpeg] =3D &quot;--enable-jpeg,--disable-jpeg,jpeg&quot;<br>
-PACKAGECONFIG[png] =3D &quot;--enable-png,--disable-png,,libpng&quot;<br>
-PACKAGECONFIG[tiff] =3D &quot;--enable-tiff,--disable-tiff,tiff&quot;<br>
-<br>
+PACKAGECONFIG[gif] =3D &quot;-DWEBP_BUILD_GIF=3DON,-DWEBP_BUILD_GIF=3DOFF,=
giflib&quot;<br>
+PACKAGECONFIG[jpeg] =3D &quot;-DWEBP_BUILD_JPEG=3DON,-DWEBP_BUILD_JPEG=3DO=
FF,jpeg&quot;<br>
+PACKAGECONFIG[png] =3D &quot;-DWEBP_BUILD_PNG=3DON,-DWEBP_BUILD_PNG=3DOFF,=
libpng&quot;<br>
+PACKAGECONFIG[tiff] =3D &quot;-DWEBP_BUILD_TIFF=3DON,-DWEBP_BUILD_TIFF=3DO=
FF,tiff&quot;<br>
=C2=A0# Apply only for example program vwebp<br>
-PACKAGECONFIG[gl] =3D &quot;--enable-gl,--disable-gl,mesa-glut&quot;<br>
+PACKAGECONFIG[opengl] =3D &quot;-DWEBP_BUILD_OPENGL=3DON,-DWEBP_BUILD_OPEN=
GL=3DOFF,mesa-glut&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-gif2webp&quot;<br>
<br>
=C2=A0DESCRIPTION:${PN}-gif2webp =3D &quot;Simple tool to convert animated =
GIFs to WebP&quot;<br>
=C2=A0FILES:${PN}-gif2webp =3D &quot;${bindir}/gif2webp&quot;<br>
<br>
+FILES:${PN} +=3D &quot;${datadir}&quot;<br>
=C2=A0BBCLASSEXTEND +=3D &quot;native nativesdk&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193471): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193471" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193471</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103623686/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103623686/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003b7978060e86aa1b--

