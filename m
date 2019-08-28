Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4905F7ECBE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 14:08:07 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id m2so2454731qki.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8I5hUCvvdZS9Vh6Y6E4+FsezL8S+SY+Yk9FRYfzs7c4=;
	b=hZFFcARMUP76s6whV6SKuLE2BbkFVbSASRVmNYxPBYND6LQ91yZb1+933uhJFDEVAo
	Nd9YV5JM6OO/XP3BqKMprazegsc4WJpnmTHPJxyGPXf9U4inBvG9FVX8iLLlbMmWuz/S
	vF/OQkiRfq4JeUDc5g5rXm2emARySoLPkOkEruc9JF4Sxe3lr2UCEPdnY1pyIz084JFV
	jz9X0UP5GwGC/fEW9qQJT03cSfuKlrowYOKxdk3gG/4Z4hBJq5H2kKeBDLiYhK9il8xr
	V0hrDuT/vaEpdy4KT32ydvRg46ithWL5wIt66UpM+zreMAfxLWgTXH/yhH43INQIDY2r
	Boeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8I5hUCvvdZS9Vh6Y6E4+FsezL8S+SY+Yk9FRYfzs7c4=;
	b=D/t8KkRfIRxC3q5jPwatgSMw+KXAP9owFnR2oIJQX0OGWP5+/TNrog6L1KTcBEllcl
	GDChNkdsesLXIrLuB1NFpN1/c11kZKFe/lcOKv3q0B34l459fX913eJQmAM2ft/aYCqP
	FlvwHACj7+phHyVeDjDw8qSK+VzzfAalF+/weuMmWBzJLI1j7B/SrL/nrzDriWD5PQL4
	uvP4vwR3CpMZQZieVUiD1OuGQEXARgXA1ZafSuGhPAOJ+yulZyJ0LYwN1INzXANCeyRu
	KVB0fbAaYjH4J7r9XYmXyzRT53+dUyAVTj50nJemqokFDdDTrqupnIpr0jQrMree5Tmt
	josA==
X-Gm-Message-State: APjAAAVDUhLz7nWmgDAOFYEc+CibSyEOvtZwkTsHtWs1/wshh4mGj97Q
	hDRdOrRPf0wr+g4EKbg01mRDvfg/yXCtuRl50f8iU3ma/sQ=
X-Google-Smtp-Source: APXvYqyTDbBFYHZHrRr9mWJ2xzgObjK2ZrEMQa0LTwPHBMrTpyeyRJgHIfFJ4yKTyg+Y/D/G8e1TL5CAJKmZoLuD0Zk=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr4090739qke.212.1567001287643; 
	Wed, 28 Aug 2019 07:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190826142628.26288-1-alex.kanavin@gmail.com>
In-Reply-To: <20190826142628.26288-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Aug 2019 07:07:41 -0700
Message-ID: <CAMKF1spXZm42Jm0NPzhaWSJLkthsX1X+E5mVWgwHxS7RS6h28Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: update to 1.71.0
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
X-List-Received-Date: Wed, 28 Aug 2019 14:08:07 -0000
Content-Type: text/plain; charset="UTF-8"

few build regressions

https://errors.yoctoproject.org/Errors/Details/266071/
https://errors.yoctoproject.org/Errors/Details/266060/

On Mon, Aug 26, 2019 at 7:26 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Some notes:
> - bjam bootstrap scripts were changed, and the patch for that had to be
>   adjusted. tools/build/src/engine/build.sh now supports an --debug option
>   which the bjam-native recipe can use to get the debug build of b2.
> - a related patch was added to address a speed regression with the debug
>   version of bjam
> - gcc.jam patch had to be refreshed because boost added more "cpu-flags"
>   lines.
> - since 1.70.0, boost includes new cmake config files which are packaged
>   in ${PN}-dev now so they make it into the SDK. (although 1.71.0 is needed
>   to fix some bugs in them)
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...native_1.69.0.bb => bjam-native_1.71.0.bb} |  7 +--
>  .../{boost-1.69.0.inc => boost-1.71.0.inc}    |  6 +--
>  meta/recipes-support/boost/boost.inc          |  2 +-
>  ...h-instruction-set-flags-we-do-that-o.patch | 15 ++++--
>  .../{boost_1.69.0.bb => boost_1.71.0.bb}      |  0
>  .../0001-Build-debug-version-of-bjam.patch    | 38 ++++++++++++++
>  ....sh-use-DNDEBUG-also-in-debug-builds.patch | 27 ++++++++++
>  .../files/bjam-native-build-bjam.debug.patch  | 50 -------------------
>  8 files changed, 83 insertions(+), 62 deletions(-)
>  rename meta/recipes-support/boost/{bjam-native_1.69.0.bb => bjam-native_1.71.0.bb} (57%)
>  rename meta/recipes-support/boost/{boost-1.69.0.inc => boost-1.71.0.inc} (77%)
>  rename meta/recipes-support/boost/{boost_1.69.0.bb => boost_1.71.0.bb} (100%)
>  create mode 100644 meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch
>  create mode 100644 meta/recipes-support/boost/files/0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch
>  delete mode 100644 meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch
>
> diff --git a/meta/recipes-support/boost/bjam-native_1.69.0.bb b/meta/recipes-support/boost/bjam-native_1.71.0.bb
> similarity index 57%
> rename from meta/recipes-support/boost/bjam-native_1.69.0.bb
> rename to meta/recipes-support/boost/bjam-native_1.71.0.bb
> index 94f96e62d8f..d843eb038cb 100644
> --- a/meta/recipes-support/boost/bjam-native_1.69.0.bb
> +++ b/meta/recipes-support/boost/bjam-native_1.71.0.bb
> @@ -5,8 +5,9 @@ SECTION = "devel"
>
>  inherit native
>
> -SRC_URI += "file://bjam-native-build-bjam.debug.patch \
> -"
> +SRC_URI += "file://0001-Build-debug-version-of-bjam.patch \
> +            file://0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch \
> +           "
>
>  do_compile() {
>      ./bootstrap.sh --with-toolset=gcc
> @@ -15,5 +16,5 @@ do_compile() {
>  do_install() {
>      install -d ${D}${bindir}/
>      # install unstripped version for bjam
> -    install -c -m 755 bjam.debug ${D}${bindir}/bjam
> +    install -c -m 755 b2 ${D}${bindir}/bjam
>  }
> diff --git a/meta/recipes-support/boost/boost-1.69.0.inc b/meta/recipes-support/boost/boost-1.71.0.inc
> similarity index 77%
> rename from meta/recipes-support/boost/boost-1.69.0.inc
> rename to meta/recipes-support/boost/boost-1.71.0.inc
> index 923436b1e0d..7164d0f1c57 100644
> --- a/meta/recipes-support/boost/boost-1.69.0.inc
> +++ b/meta/recipes-support/boost/boost-1.71.0.inc
> @@ -11,9 +11,9 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
>  BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
>  BOOST_P = "boost_${BOOST_VER}"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
> -SRC_URI[md5sum] = "a1332494397bf48332cb152abfefcec2"
> -SRC_URI[sha256sum] = "8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406"
> +SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
> +SRC_URI[md5sum] = "4cdf9b5c2dc01fb2b7b733d5af30e558"
> +SRC_URI[sha256sum] = "d73a8da01e8bf8c7eda40b4c84915071a8c8a0df4a6734537ddde4a8580524ee"
>
>  UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
>  UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index f385541653c..e15dce4e1d3 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -83,7 +83,7 @@ FILES_boost-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
>
>  # -dev last to pick up the remaining stuff
>  PACKAGES += "${PN}-dev ${PN}-staticdev"
> -FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so"
> +FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so ${libdir}/cmake"
>  FILES_${PN}-staticdev = "${libdir}/libboost_*.a"
>
>  # "boost" is a metapackage which pulls in all boost librabries
> diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
> index 8944cb37b4d..68d6e6417fa 100644
> --- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
> +++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
> @@ -1,4 +1,4 @@
> -From 3e4eb02eb5951058bc6f8dffbf049eb189df8291 Mon Sep 17 00:00:00 2001
> +From f4d3fad43d67808d71325ba0df1457555b9a0086 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Tue, 18 Dec 2018 15:42:57 +0100
>  Subject: [PATCH] Don't set up arch/instruction-set flags, we do that ourselves
> @@ -6,15 +6,16 @@ Subject: [PATCH] Don't set up arch/instruction-set flags, we do that ourselves
>  Upstream-Status: Inappropriate
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
> - tools/build/src/tools/gcc.jam | 128 ----------------------------------
> - 1 file changed, 128 deletions(-)
> + tools/build/src/tools/gcc.jam | 132 ----------------------------------
> + 1 file changed, 132 deletions(-)
>
>  diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
> -index c57c773f..28618fb1 100644
> +index b9bb9cf2a..c7e3cf3fe 100644
>  --- a/tools/build/src/tools/gcc.jam
>  +++ b/tools/build/src/tools/gcc.jam
> -@@ -1152,131 +1152,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
> +@@ -1180,135 +1180,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
>           <architecture>$(architecture)/<instruction-set>$(instruction-set)
>           : $(values) ;
>   }
> @@ -144,5 +145,9 @@ index c57c773f..28618fb1 100644
>  -cpu-flags gcc OPTIONS : power : rios2 : -mcpu=rios2 ;
>  -cpu-flags gcc OPTIONS : power : rsc : -mcpu=rsc ;
>  -cpu-flags gcc OPTIONS : power : rs64a : -mcpu=rs64 ;
> +-cpu-flags gcc OPTIONS : s390x : z196 : -march=z196 ;
> +-cpu-flags gcc OPTIONS : s390x : zEC12 : -march=zEC12 ;
> +-cpu-flags gcc OPTIONS : s390x : z13 : -march=z13 ;
> +-cpu-flags gcc OPTIONS : s390x : z14 : -march=z14 ;
>  -# AIX variant of RS/6000 & PowerPC
>  -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
> diff --git a/meta/recipes-support/boost/boost_1.69.0.bb b/meta/recipes-support/boost/boost_1.71.0.bb
> similarity index 100%
> rename from meta/recipes-support/boost/boost_1.69.0.bb
> rename to meta/recipes-support/boost/boost_1.71.0.bb
> diff --git a/meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch b/meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch
> new file mode 100644
> index 00000000000..c6dcee915e5
> --- /dev/null
> +++ b/meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch
> @@ -0,0 +1,38 @@
> +From 19c117c3d1388654da484e26afb3fb6c3e4181a9 Mon Sep 17 00:00:00 2001
> +From: Daniel Klauer <daniel.klauer@gin.de>
> +Date: Tue, 30 Jul 2019 11:39:09 +0200
> +Subject: [PATCH] Build debug version of bjam
> +
> +bjam is stripped by default, this causes QA warning while stripping it
> +from do_populate_sysroot():
> +
> +  WARNING: File '.../tmp/sysroots/x86_64-linux/usr/bin/bjam' \
> +    from bjam-native was already stripped, \
> +    this will prevent future debugging!
> +
> +The JAM scripts allow to build unstripped version with '--debug'. Just
> +build and install the bjam.debug to stop bjam from being stripped in
> +compile step.
> +
> +Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + bootstrap.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/bootstrap.sh b/bootstrap.sh
> +index ca0b08d58..87f38dcf2 100755
> +--- a/bootstrap.sh
> ++++ b/bootstrap.sh
> +@@ -223,7 +223,7 @@ rm -f config.log
> + if test "x$BJAM" = x; then
> +   $ECHO -n "Building Boost.Build engine with toolset $TOOLSET... "
> +   pwd=`pwd`
> +-  (cd "$my_dir/tools/build/src/engine" && ./build.sh "$TOOLSET") > bootstrap.log 2>&1
> ++  (cd "$my_dir/tools/build/src/engine" && ./build.sh "$TOOLSET" --debug) > bootstrap.log 2>&1
> +   if [ $? -ne 0 ]; then
> +       echo
> +       echo "Failed to build Boost.Build build engine"
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-support/boost/files/0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch b/meta/recipes-support/boost/files/0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch
> new file mode 100644
> index 00000000000..4c6ef2ed841
> --- /dev/null
> +++ b/meta/recipes-support/boost/files/0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch
> @@ -0,0 +1,27 @@
> +From 2afd025997a57794ce24e07e914b461dfea6ba5f Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 26 Aug 2019 16:04:16 +0200
> +Subject: [PATCH] build.sh: use -DNDEBUG also in debug builds
> +
> +Without it, there is a significant performance regression
> +when running 'bjam install'.
> +
> +Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + tools/build/src/engine/build.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/build/src/engine/build.sh b/tools/build/src/engine/build.sh
> +index a1e4cd335..64e0a4c80 100755
> +--- a/tools/build/src/engine/build.sh
> ++++ b/tools/build/src/engine/build.sh
> +@@ -436,7 +436,7 @@ case $B2_OS in
> +     ;;
> + esac
> +
> +-if check_debug_build "$@" ; then B2_CXXFLAGS="${B2_CXXFLAGS_DEBUG}"
> ++if check_debug_build "$@" ; then B2_CXXFLAGS="${B2_CXXFLAGS_DEBUG} -DNDEBUG"
> + else B2_CXXFLAGS="${B2_CXXFLAGS_RELEASE} -DNDEBUG"
> + fi
> + echo_run ${B2_CXX} ${CXXFLAGS} ${B2_CXXFLAGS} ${B2_SOURCES} -o b2
> diff --git a/meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch b/meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch
> deleted file mode 100644
> index 9f8b7eac0a4..00000000000
> --- a/meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 619ada314ab26c0c9cbfe5702cd9c0caa8f6415a Mon Sep 17 00:00:00 2001
> -From: Wenzong Fan <wenzong.fan@windriver.com>
> -Date: Mon, 3 Aug 2015 17:12:33 +0800
> -Subject: [PATCH] bjam-native: build bjam.debug
> -
> -bjam is stripped by default, this causes QA warning while stripping it
> -from do_populate_sysroot():
> -
> -  WARNING: File '.../tmp/sysroots/x86_64-linux/usr/bin/bjam' \
> -    from bjam-native was already stripped, \
> -    this will prevent future debugging!
> -
> -The JAM scripts allow to build unstripped version with '--debug'. Just
> -build and install the bjam.debug to stop bjam from being stripped in
> -compile step.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ----
> - bootstrap.sh                    | 1 +
> - tools/build/src/engine/build.sh | 2 +-
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/bootstrap.sh b/bootstrap.sh
> -index 98cf88b..54690aa 100755
> ---- a/bootstrap.sh
> -+++ b/bootstrap.sh
> -@@ -228,6 +228,7 @@ if test "x$BJAM" = x; then
> -   echo "tools/build/src/engine/$arch/b2"
> -   cp "$BJAM" .
> -   cp "$my_dir/tools/build/src/engine/$arch/bjam" .
> -+  cp "$my_dir/tools/build/src/engine/${arch}.debug/bjam" bjam.debug
> -
> - fi
> -
> -diff --git a/tools/build/src/engine/build.sh b/tools/build/src/engine/build.sh
> -index 6dbc706..c69fdc7 100755
> ---- a/tools/build/src/engine/build.sh
> -+++ b/tools/build/src/engine/build.sh
> -@@ -312,5 +312,5 @@ if test -x "./bootstrap/jam0" ; then
> -     if test "${BJAM_UPDATE}" != "update" ; then
> -         echo_run ./bootstrap/jam0 -f build.jam --toolset=$BOOST_JAM_TOOLSET "--toolset-root=$BOOST_JAM_TOOLSET_ROOT" "$@" clean
> -     fi
> --    echo_run ./bootstrap/jam0 -f build.jam --toolset=$BOOST_JAM_TOOLSET "--toolset-root=$BOOST_JAM_TOOLSET_ROOT" "$@"
> -+    echo_run ./bootstrap/jam0 -f build.jam --toolset=$BOOST_JAM_TOOLSET "--toolset-root=$BOOST_JAM_TOOLSET_ROOT" "$@" --debug
> - fi
> ---
> -1.9.1
> -
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

