Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id D655D7896B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:45:35 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b77-v6so9515772vkb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B+JrK9t1b4vp/mL/kNy9U/89ro0IUDMfA6YEChE1FlQ=;
	b=rRQ2baddvjzucyyNCdcos8Bu8brpOC+CmQxDqs4Y8NTPWEyA6+HtjI1gnp6iG/AfJG
	Pv/55Y/zspPXNYBPdo57AWXO+Cvj+82jIMLxG9do8vOnHOTAHMgohz8ewoJ1wjHgvl2S
	WTpKagskMwFik96c0P54vZ5BhY3rfb3SJgp7Y3exHKriViXIEPFzZ+t7Phj+o4NcN0Wb
	LE5ZP6I9T47wD/8C11j4zdJg1EZUgpjIDBg5igE7AXLxfKhr40z48Acpze1IlKJDPi9/
	JDWHdDNfChruhkPO3dV+woF2lbtBdfqg2/r/C+4TwJm8Gl4cwZnIG3CiZqaQi12NxOsB
	C9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B+JrK9t1b4vp/mL/kNy9U/89ro0IUDMfA6YEChE1FlQ=;
	b=hgzNRnSdEVpEiPyWCvt+o2AVHN9pa684FLHs+jPeSUFahPIK4HWaK4VrImiqtzmu1c
	wBNCqLz2XQkkI9HJ8aORJd8BKBI0NwBanKgmJfaWGhXwttJMLonN0+A2Lo0I7g3475wO
	gdmA75tnR16zAs16rLrMthaqxVd/W3EEpfcCJzAlkbycM07378Ck0Kf97dA6MmisH8Cj
	kkD8CYv+FZIMDhxO3tCj3vTYhQ2wcZB+9IOUGXGEwJr4ybga3EP/ZcaehTXia5A/3xkU
	u1KucR7P7DqeKQu4l4ZrdJF5vjrwIX+4gnlsfysIovCTipmIlO+/Y2K2r3r6J66FUKv6
	rpLQ==
X-Gm-Message-State: APt69E1XbuvSjaTcOOA96Jw+pAG41RMc1Brevs/DrNgDwxwCC9KJLB/l
	2dLgtZ1s9MUklwewEepjmmIaot0lNz7hYqZrigQ=
X-Google-Smtp-Source: AAOMgpclwiyKMCM57zSjsjqTuVrOl0hIEUTZZCfZxXf41zZLC08lnDpmW93C8xZWMslGO1BplEzkdoEnBIFJLNjsa8E=
X-Received: by 2002:a1f:4b86:: with SMTP id
	y128-v6mr14296733vka.146.1530549936403; 
	Mon, 02 Jul 2018 09:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20180702011534.4676-1-kai.kang@windriver.com>
	<CAMKF1sqcV=tq1XMSktRNuvTJeEX4sYd=4yBfP8JhukPtqo1pTA@mail.gmail.com>
	<dba93e8e-abcb-3f83-1749-07a41da95214@windriver.com>
In-Reply-To: <dba93e8e-abcb-3f83-1749-07a41da95214@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jul 2018 09:45:10 -0700
Message-ID: <CAMKF1sqEpc954NLo57fx0QAxNFoYSJo4hq4gDm+xtL61LAh+VQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: 2.20.2 -> 2.20.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2018 16:45:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 2, 2018 at 2:46 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2018=E5=B9=B407=E6=9C=8802=E6=97=A5 14:06, Khem Raj wrote:
> > On Sun, Jul 1, 2018 at 6:49 PM <kai.kang@windriver.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Upgrade webkitgtk from 2.20.2 to 2.20.3.
> >> * update context of 0001-WebKitMacros-Append-to-I-and-not-to-isystem.p=
atch
> >> * remove detect-atomics-during-configure.patch that webkitgtk 2.20.3
> >>    contains the commit of better solution, see
> >>    https://bugs.webkit.org/show_bug.cgi?id=3D161900#c9
> > If you build it with clang on qemux86 then we can verify if the
> > alternative fix is functional
> > for the original intent of this patch that we are dropping here.
> Hi Khem,
>
> I tried with clang and built webkitgtk pass.
>
> 1. clone layer meta-clang https://github.com/kraj/meta-clang.git and add
> to bblayers
> 2. set TOOLCHAIN =3D "clang" for webkitgtk
> 3. bitbake webkitgtk successfully.
>

thanks for confirming.

> Regards,
> Kai
>
> >
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   ...acros-Append-to-I-and-not-to-isystem.patch | 12 +++---
> >>   .../detect-atomics-during-configure.patch     | 43 -----------------=
--
> >>   ...ebkitgtk_2.20.2.bb =3D> webkitgtk_2.20.3.bb} |  5 +--
> >>   3 files changed, 8 insertions(+), 52 deletions(-)
> >>   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/detect-atomics=
-during-configure.patch
> >>   rename meta/recipes-sato/webkit/{webkitgtk_2.20.2.bb =3D> webkitgtk_=
2.20.3.bb} (96%)
> >>
> >> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Appe=
nd-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-=
WebKitMacros-Append-to-I-and-not-to-isystem.patch
> >> index 034219f826..b31026448c 100644
> >> --- a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I=
-and-not-to-isystem.patch
> >> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I=
-and-not-to-isystem.patch
> >> @@ -41,18 +41,18 @@ index b3c7e0b..88446de 100644
> >>    target_link_libraries(jsc ${JSC_LIBRARIES})
> >>
> >>   diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/Platf=
ormGTK.cmake
> >> -index 32c6ccc..fef5e8b 100644
> >> +index f7d8d70a..3c27b8bc 100644
> >>   --- a/Source/WebCore/PlatformGTK.cmake
> >>   +++ b/Source/WebCore/PlatformGTK.cmake
> >> -@@ -159,7 +159,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> >> -         ${GTK2_INCLUDE_DIRS}
> >> -         ${GDK2_INCLUDE_DIRS}
> >> +@@ -157,7 +157,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> >> +     target_include_directories(WebCorePlatformGTK2 PRIVATE
> >> +         ${WebCore_INCLUDE_DIRECTORIES}
> >>        )
> >>   -    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
> >>   +    target_include_directories(WebCorePlatformGTK2 PRIVATE
> >>            ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
> >> -     )
> >> -     target_link_libraries(WebCorePlatformGTK2
> >> +         ${GTK2_INCLUDE_DIRS}
> >> +         ${GDK2_INCLUDE_DIRS}
> >>   @@ -183,7 +183,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
> >>    target_include_directories(WebCorePlatformGTK PRIVATE
> >>        ${WebCore_INCLUDE_DIRECTORIES}
> >> diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-=
configure.patch b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-=
configure.patch
> >> deleted file mode 100644
> >> index bbdb64490a..0000000000
> >> --- a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configu=
re.patch
> >> +++ /dev/null
> >> @@ -1,43 +0,0 @@
> >> -From d907ac649ff5514826af9ad7e97e15dfcf79909c Mon Sep 17 00:00:00 200=
1
> >> -From: Khem Raj <raj.khem@gmail.com>
> >> -Date: Wed, 17 May 2017 22:34:24 -0700
> >> -Subject: [PATCH] webkitgtk: Fix build for armv5
> >> -
> >> -Taken from
> >> -https://bugs.webkit.org/show_bug.cgi?id=3D161900
> >> -
> >> -Upstream-Status: Pending
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> -
> >> ----
> >> - Source/WTF/wtf/CMakeLists.txt | 10 +++++++++-
> >> - 1 file changed, 9 insertions(+), 1 deletion(-)
> >> -
> >> -diff --git a/Source/WTF/wtf/CMakeLists.txt b/Source/WTF/wtf/CMakeList=
s.txt
> >> -index 220bafd..4e1e9f8 100644
> >> ---- a/Source/WTF/wtf/CMakeLists.txt
> >> -+++ b/Source/WTF/wtf/CMakeLists.txt
> >> -@@ -315,7 +315,6 @@ set(WTF_HEADERS
> >> -
> >> - set(WTF_SOURCES
> >> -     Assertions.cpp
> >> --    Atomics.cpp
> >> -     AutomaticThread.cpp
> >> -     BitVector.cpp
> >> -     CPUTime.cpp
> >> -@@ -458,6 +457,15 @@ if (NOT USE_SYSTEM_MALLOC)
> >> -     list(APPEND WTF_LIBRARIES bmalloc)
> >> - endif ()
> >> -
> >> -+file(WRITE ${CMAKE_BINARY_DIR}/test_atomics.cpp
> >> -+     "int main(void)\n"
> >> -+     "{ long long x =3D 1; return (int) __sync_add_and_fetch_8(&x, 1=
); }\n")
> >> -+try_compile(ATOMICS_BUILD_SUCCEEDED ${CMAKE_BINARY_DIR} ${CMAKE_BINA=
RY_DIR}/test_atomics.cpp)
> >> -+if (NOT ATOMICS_BUILD_SUCCEEDED)
> >> -+    list(APPEND WTF_SOURCES Atomics.cpp)
> >> -+endif ()
> >> -+file(REMOVE ${CMAKE_BINARY_DIR}/test_atomics.cpp)
> >> -+
> >> - list(APPEND WTF_SOURCES
> >> -     unicode/CollatorDefault.cpp
> >> -
> >> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb b/meta/recip=
es-sato/webkit/webkitgtk_2.20.3.bb
> >> similarity index 96%
> >> rename from meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
> >> rename to meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> >> index a68a69f43c..9d0f00a6d6 100644
> >> --- a/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
> >> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> >> @@ -17,15 +17,14 @@ SRC_URI =3D "http://www.webkitgtk.org/releases/${B=
PN}-${PV}.tar.xz \
> >>              file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generati=
on-work.patch \
> >>              file://x32_support.patch \
> >>              file://cross-compile.patch \
> >> -           file://detect-atomics-during-configure.patch \
> >>              file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.p=
atch \
> >>              file://0001-Fix-build-with-musl.patch \
> >>              file://detect-gstreamer-gl.patch \
> >>              file://0012-soup-Forward-declare-URL-class.patch \
> >>              "
> >>
> >> -SRC_URI[md5sum] =3D "3fdda40dc10eb2a00d5fba4219b83967"
> >> -SRC_URI[sha256sum] =3D "dffe93a241f03f1c73b369f4e323e4d8f12e39d33d551=
5948cbf454ca4b526e2"
> >> +SRC_URI[md5sum] =3D "efb69a0cc3cc67ef2647efec22e44c69"
> >> +SRC_URI[sha256sum] =3D "579b307d78fa16a73f112790178022166d7ad17d41474=
92ced9b9fba48f20dd8"
> >>
> >>   inherit cmake pkgconfig gobject-introspection perlnative distro_feat=
ures_check upstream-version-is-even gtk-doc
> >>
> >> --
> >> 2.17.1
> >>
>
> --
> Regards,
> Neil | Kai Kang
>

