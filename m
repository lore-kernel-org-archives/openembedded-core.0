Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4250C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 10:36:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.20526.1751452613094145892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 03:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=acWXCUY5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BCE54383A;
	Wed,  2 Jul 2025 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751452611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xo1FZWgCW7Bc0AxeSCpCXcAyoKc1CiS/p/XKipk4kvg=;
	b=acWXCUY55nwRyQAWyOK6mCcyeJ3x29vhNQiZQGbEJypvtTGExktgZ8V7mU5es458hxsqpA
	gTXKpKcuPNYRkPg+havi3XnfEy669ZGsPDrVlBciwHeGinhVPuV8hSL69/ojoEgjDJ3IW7
	QWsgvWvAvWs1YucVr3HX3iuUpmwpVHFlsQf5SoiZxoHTvioAO0rMAY6Q6mfjW8MeMfqNF5
	z38skRw1QlxU8qElvga6Y3NuusSUkXsNsJTuSEhOabAfTY2FpM85s7A3YRETqToWrE6wY+
	h98bWsCUhUTMEsbbktKZtV04b5PzZsELkrO7NujbxsZ8AxPbUUKPUOPcHE5djQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 12:36:50 +0200
Message-Id: <DB1I4TNLB9MM.1N3LT4JJ0KPIL@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 7/7] cmake: upgrade 3.31.6 -> 4.0.3
Cc: <alex.kanavin@gmail.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <Moritz.Haase@bmw.de>, <openembedded-core@lists.openembedded.org>
References: <20250702083148.3035805-1-Moritz.Haase@bmw.de>
 <20250702083148.3035805-8-Moritz.Haase@bmw.de>
In-Reply-To: <20250702083148.3035805-8-Moritz.Haase@bmw.de>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfefggfekueeiheekleeigeegteeuteelffekteegjeekgeetheejfeevfedvjefhnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdptghmrghkvgdrohhrghdpkhhithifrghrvgdrtghomhdpugdqtghmrghkvgdrshhhpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepofhorhhithiirdfjrggrshgvsegsmhifrdguvgdprhgtphhtthhopehophgvnhgvmhgsvgguuggvu
 gdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 10:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219817

On Wed Jul 2, 2025 at 10:31 AM CEST, Moritz Haase via lists.openembedded.or=
g wrote:
> This is the first major release bump for CMake since 3.0 was released in =
2014.
> Compatibility with versions of CMake older than 3.5 has been removed. Ful=
l
> release notes are available at [0].
>
> Obsolete patches have been removed and the few remaining ones have been
> refreshed. We can now build cmake without patches, only cmake-native requ=
ires
> two that are not suitable for upstreaming.
>
> The main license file has been renamed from Copyright.txt to LICENSE.rst =
in [1].
> References to the file have been updated, causing changes to the licensin=
g
> header in 'cmake.h' (see [2]).
>
> Additionally, the '1996 - 2024' copyright statement in (cm)curl's COPYING=
 was
> updated to '1996 - 2025' in [3].
>
> [0]: https://cmake.org/cmake/help/v4.0/release/4.0.html
> [1]: https://gitlab.kitware.com/cmake/cmake/-/commit/2d42a5444f859891b659=
8c76ea5d51510013565e
> [2]: https://gitlab.kitware.com/cmake/cmake/-/commit/de273b2e115974a012a6=
204ffee046dc9ce77586
> [3]: https://gitlab.kitware.com/cmake/cmake/-/commit/48b13baebc7f99442c3b=
872f202efd2fb92d6d7f
>
> License-Update: License file renamed; copyright years updated
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> CC: alex.kanavin@gmail.com
> ---
>
> changes in v3:
> - Fix for test failure seen in SDK tests
>
> changes in v2:
> - Squashed license update into this commit to keep bisectability
> - Fixed patchtest findings
>
> ---
>
>  .../sdkext/files/myapp_cmake/CMakeLists.txt   |   2 +-
>  ...native_3.31.6.bb =3D> cmake-native_4.0.3.bb} |   6 +-
>  meta/recipes-devtools/cmake/cmake.inc         |   8 +-
>  ...mpilerABI-Strip-pipe-from-compile-fl.patch |  63 ------
>  ...xt2fs-ext2_fs.h-by-cmake-s-internal.patch} |   4 +-
>  ...ng-undocumented-type-for-CURLOPT_NET.patch |  30 ---
>  ...trary-characters-in-test-names-of-CT.patch | 202 ------------------
>  ...-CMakeLists.txt-disable-USE_NGHTTP2.patch} |   6 +-
>  .../cmake/{cmake_3.31.6.bb =3D> cmake_4.0.3.bb} |   1 -
>  9 files changed, 12 insertions(+), 310 deletions(-)
>  rename meta/recipes-devtools/cmake/{cmake-native_3.31.6.bb =3D> cmake-na=
tive_4.0.3.bb} (90%)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermine=
CompilerABI-Strip-pipe-from-compile-fl.patch
>  rename meta/recipes-devtools/cmake/cmake/{0005-Disable-use-of-ext2fs-ext=
2_fs.h-by-cmake-s-internal-.patch =3D> 0001-Disable-use-of-ext2fs-ext2_fs.h=
-by-cmake-s-internal.patch} (90%)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-u=
sing-undocumented-type-for-CURLOPT_NET.patch
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-ar=
bitrary-characters-in-test-names-of-CT.patch
>  rename meta/recipes-devtools/cmake/cmake/{0001-CMakeLists.txt-disable-US=
E_NGHTTP2.patch =3D> 0002-CMakeLists.txt-disable-USE_NGHTTP2.patch} (83%)
>  rename meta/recipes-devtools/cmake/{cmake_3.31.6.bb =3D> cmake_4.0.3.bb}=
 (96%)
>
> diff --git a/meta/lib/oeqa/sdkext/files/myapp_cmake/CMakeLists.txt b/meta=
/lib/oeqa/sdkext/files/myapp_cmake/CMakeLists.txt
> index 19d773dd63..b31f1622e2 100644
> --- a/meta/lib/oeqa/sdkext/files/myapp_cmake/CMakeLists.txt
> +++ b/meta/lib/oeqa/sdkext/files/myapp_cmake/CMakeLists.txt
> @@ -1,4 +1,4 @@
> -cmake_minimum_required (VERSION 2.6)
> +cmake_minimum_required (VERSION 3.10)
>  project (myapp)
>  # The version number.
>  set (myapp_VERSION_MAJOR 1)
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb b/meta/re=
cipes-devtools/cmake/cmake-native_4.0.3.bb
> similarity index 90%
> rename from meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
> rename to meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
> index b940abb3fd..7b90bff52f 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
> @@ -5,8 +5,8 @@ DEPENDS +=3D "bzip2-replacement-native xz-native zlib-nat=
ive ncurses-native zstd-n
>
>  SRC_URI +=3D "file://OEToolchainConfig.cmake \
>              file://environment.d-cmake.sh \
> -            file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-inter=
nal-.patch \
> -            file://0001-CMakeLists.txt-disable-USE_NGHTTP2.patch \
> +            file://0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-inter=
nal.patch \
> +            file://0002-CMakeLists.txt-disable-USE_NGHTTP2.patch \
>              "
>
>  LICENSE:append =3D " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM:append =3D " \
>      file://Utilities/cmexpat/COPYING;md5=3D7b3b078238d0901d3b339289117cb=
7fb \
>      file://Utilities/cmlibrhash/COPYING;md5=3Da8c2a557a5c53b1c12cddbee98=
c099af \
>      file://Utilities/cmlibuv/LICENSE;md5=3Dad93ca1fffe931537fcf64f6fcce0=
84d \
> -    file://Utilities/cmcurl/COPYING;md5=3Deed2e5088e1ac619c9a1c747da291d=
75 \
> +    file://Utilities/cmcurl/COPYING;md5=3D72f4e9890e99e68d77b7e40703d789=
b8 \
>  "
>
>  B =3D "${WORKDIR}/build"
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtool=
s/cmake/cmake.inc
> index 9b1898f22f..a15dfd3bb4 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -10,18 +10,16 @@ HOMEPAGE =3D "http://www.cmake.org/"
>  BUGTRACKER =3D "http://public.kitware.com/Bug/my_view_page.php"
>  SECTION =3D "console/utils"
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://Copyright.txt;md5=3D718f05155941b3386272634=
8d3cd46ce \
> -                    file://Source/cmake.h;beginline=3D1;endline=3D2;md5=
=3Da5f70e1fef8614734eae0d62b4f5891b \
> +LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D0cafc0f3b6b28f3d5ecb5d1a6=
8c36471 \
> +                    file://Source/cmake.h;beginline=3D1;endline=3D2;md5=
=3D4ba59ac0e953e1a713eea8c55b1d531b \
>                      "
>
>  CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>
>  SRC_URI =3D "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}=
.tar.gz \
> -           file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile=
-fl.patch \
> -           file://0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_=
NET.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "653427f0f5014750aafff22727fb2aa60c6c732ca91808cf=
b78ce22ddd9e55f0"
> +SRC_URI[sha256sum] =3D "8d3537b7b7732660ea247398f166be892fe6131d63cc2919=
44b45b91279f3ffb"
>
>  UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompile=
rABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0=
001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
> deleted file mode 100644
> index 3895c7e03b..0000000000
> --- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-St=
rip-pipe-from-compile-fl.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From e4061151ac13bc727512d961a80faca3ceb22b5a Mon Sep 17 00:00:00 2001
> -From: Philip Lorenz <philip.lorenz@bmw.de>
> -Date: Mon, 3 Jun 2024 13:19:24 +0200
> -Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile fla=
gs
> -
> -When `-pipe` is enabled, GCC passes data between its different
> -executables using pipes instead of temporary files. This leads to issues
> -when cmake attempts to infer compiler internals via the `-v` parameter
> -as each executable will print to `stderr` in parallel.
> -
> -For example we have observed the following outputs in our builds which
> -sporadically lead to build failures as system include directories were
> -not detected reliably:
> -
> -Parsed CXX implicit include dir info from above output: rv=3Ddone
> -  found start of include info
> -  found start of implicit include info
> -    add: [.../usr/bin/x86_64-poky-linux/../../lib/x86_64-poky-linux/gcc/=
x86_64-poky-linux/11.4.0/include]
> -    add: [.../usr/bin/x86_64-poky-linux/../../lib/x86_64-poky-linux/gcc/=
x86_64-poky-linux/11.4.0/include-fixed]
> -    add: [.../usr/include/c++/11.4.0]
> -    add: [.../usr/include/c++/11.4.0/x86_64-poky-linux]
> -    add: [.../usr/include/c++/11.4.0/backward]
> -    add: [.../usr/lib/x86_64-poky-linux/11.4.0/include]
> -    add: [...GNU assembler version 2.38 (x86_64-poky-linux) using BFD ve=
rsion (GNU Binutils) 2.38.20220708]
> -    add: [/usr/include]
> -  end of search list found
> -
> -Fix this issue by stripping the `-pipe` parameter from the compilation
> -flag when determining the toolchain configuration.
> -
> -Upstream-Status: Backport [3.32.0, 71be059f3f32b6791427893a48ba4815a19e2=
e78]
> -Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
> ----
> - Modules/CMakeDetermineCompilerABI.cmake | 9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> -diff --git a/Modules/CMakeDetermineCompilerABI.cmake b/Modules/CMakeDete=
rmineCompilerABI.cmake
> -index 4a75e25a..806f0b71 100644
> ---- a/Modules/CMakeDetermineCompilerABI.cmake
> -+++ b/Modules/CMakeDetermineCompilerABI.cmake
> -@@ -52,14 +52,21 @@ function(CMAKE_DETERMINE_COMPILER_ABI lang src)
> -
> -     __TestCompiler_setTryCompileTargetType()
> -
> --    # Avoid failing ABI detection on warnings.
> -+    # Avoid failing ABI detection caused by non-functionally relevant
> -+    # compiler arguments
> -     if(CMAKE_TRY_COMPILE_CONFIGURATION)
> -       string(TOUPPER "${CMAKE_TRY_COMPILE_CONFIGURATION}" _tc_config)
> -     else()
> -       set(_tc_config "DEBUG")
> -     endif()
> -     foreach(v CMAKE_${lang}_FLAGS CMAKE_${lang}_FLAGS_${_tc_config})
> -+      # Avoid failing ABI detection on warnings.
> -       string(REGEX REPLACE "(^| )-Werror([=3D ][^-][^ ]*)?( |$)" " " ${=
v} "${${v}}")
> -+      # Avoid passing of "-pipe" when determining the compiler internal=
s. With
> -+      # "-pipe" GCC will use pipes to pass data between the involved
> -+      # executables.  This may lead to issues when their stderr output =
(which
> -+      # contains the relevant compiler internals) becomes interweaved.
> -+      string(REGEX REPLACE "(^| )-pipe( |$)" " " ${v} "${${v}}")
> -     endforeach()
> -
> -     # Save the current LC_ALL, LC_MESSAGES, and LANG environment variab=
les
> diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs=
-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0=
001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
> similarity index 90%
> rename from meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-=
ext2_fs.h-by-cmake-s-internal-.patch
> rename to meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ex=
t2_fs.h-by-cmake-s-internal.patch
> index 7559c52932..f31dce5644 100644
> --- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_f=
s.h-by-cmake-s-internal-.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_f=
s.h-by-cmake-s-internal.patch
> @@ -1,4 +1,4 @@
> -From 8effa783e47e2b574be90733c38b27701e06e929 Mon Sep 17 00:00:00 2001
> +From cf8210696ebbaff14612d845bc98fac447c0e6f5 Mon Sep 17 00:00:00 2001
>  From: Otavio Salvador <otavio@ossystems.com.br>
>  Date: Thu, 5 Jul 2018 10:28:04 -0300
>  Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
> @@ -18,7 +18,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br=
>
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
>  diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarch=
ive/CMakeLists.txt
> -index 4e4b49c1..50e9a733 100644
> +index 04d986b6ea7d8dc0bd7e909d4e7b4e73c9e35437..014fe78063f7d30c9a4970b7=
cf3aeeaeb36bcdbc 100644
>  --- a/Utilities/cmlibarchive/CMakeLists.txt
>  +++ b/Utilities/cmlibarchive/CMakeLists.txt
>  @@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-un=
documented-type-for-CURLOPT_NET.patch b/meta/recipes-devtools/cmake/cmake/0=
001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch
> deleted file mode 100644
> index c719c1fdfb..0000000000
> --- a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumen=
ted-type-for-CURLOPT_NET.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From c608975f4490f67872926f2601e5c37f2e570307 Mon Sep 17 00:00:00 2001
> -From: Wang Mingyu <wangmy@fujitsu.com>
> -Date: Wed, 9 Apr 2025 01:40:46 +0000
> -Subject: [PATCH] cmCurl: Avoid using undocumented type for CURLOPT_NETRC
> - values
> -
> -Fix: nativesdk-cmake/3.31.6/cmake-3.31.6/Source/cmCurl.cxx:178:26: error=
: invalid conversion from 'long int' to 'CURL_NETRC_OPTION' [-fpermissive]
> -Upstream-Status: Backport [https://gitlab.kitware.com/cmake/cmake/-/merg=
e_requests/10449/diffs?commit_id=3D1b0c92a3a1b782ff3e1c4499b6ab8db614d45bcd=
]
> -
> -Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ----
> - Source/cmCurl.cxx | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Source/cmCurl.cxx b/Source/cmCurl.cxx
> -index b9133ed7..0cf8a71a 100644
> ---- a/Source/cmCurl.cxx
> -+++ b/Source/cmCurl.cxx
> -@@ -170,7 +170,7 @@ std::string cmCurlSetNETRCOption(::CURL* curl, const=
 std::string& netrc_level,
> -                                  const std::string& netrc_file)
> - {
> -   std::string e;
> --  CURL_NETRC_OPTION curl_netrc_level =3D CURL_NETRC_LAST;
> -+  long curl_netrc_level =3D CURL_NETRC_LAST;
> -   ::CURLcode res;
> -
> -   if (!netrc_level.empty()) {
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary=
-characters-in-test-names-of-CT.patch b/meta/recipes-devtools/cmake/cmake/0=
001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
> deleted file mode 100644
> index 31f6148cac..0000000000
> --- a/meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-charac=
ters-in-test-names-of-CT.patch
> +++ /dev/null
> @@ -1,202 +0,0 @@
> -From c7e8b03324883760a2d6fab86ae034beb82af651 Mon Sep 17 00:00:00 2001
> -From: John Drouhard <john@drouhard.dev>
> -Date: Thu, 9 Jan 2025 20:34:42 -0600
> -Subject: [PATCH] ctest: Allow arbitrary characters in test names of
> - CTestCostData.txt
> -
> -This changes the way lines in CTestCostData.txt are parsed to allow for
> -spaces in the test name.
> -
> -It does so by looking for space characters from the end; and once two
> -have been found, assumes everything from the beginning up to that
> -second-to-last-space is the test name.
> -
> -Additionally, parsing the file should be much more efficient since there
> -is no string or vector heap allocation per line. The std::string used by
> -the parse function to convert the int and float should be within most
> -standard libraries' small string optimization.
> -
> -Fixes: #26594
> -
> -Upstream-Status: Backport [4.0.0, 040da7d83216ace59710407e8ce35d5fd38e13=
40]
> -Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ----
> - Source/CTest/cmCTestMultiProcessHandler.cxx | 77 +++++++++++++++------
> - Source/CTest/cmCTestMultiProcessHandler.h   |  3 +-
> - Tests/CTestTestScheduler/CMakeLists.txt     |  4 +-
> - 3 files changed, 61 insertions(+), 23 deletions(-)
> -
> -diff --git a/Source/CTest/cmCTestMultiProcessHandler.cxx b/Source/CTest/=
cmCTestMultiProcessHandler.cxx
> -index 84ea32b84d40025ec333a90d30c42eeaf7adc9ef..231e7b5f39b1d8aa75f4e59a=
890a099b53fcdaac 100644
> ---- a/Source/CTest/cmCTestMultiProcessHandler.cxx
> -+++ b/Source/CTest/cmCTestMultiProcessHandler.cxx
> -@@ -20,6 +20,7 @@
> -
> - #include <cm/memory>
> - #include <cm/optional>
> -+#include <cm/string_view>
> - #include <cmext/algorithm>
> -
> - #include <cm3p/json/value.h>
> -@@ -52,6 +53,48 @@ constexpr unsigned long kParallelLevelMinimum =3D 2u;
> - // Under a job server, parallelism is effectively limited
> - // only by available job server tokens.
> - constexpr unsigned long kParallelLevelUnbounded =3D 0x10000u;
> -+
> -+struct CostEntry
> -+{
> -+  cm::string_view name;
> -+  int prevRuns;
> -+  float cost;
> -+};
> -+
> -+cm::optional<CostEntry> splitCostLine(cm::string_view line)
> -+{
> -+  std::string part;
> -+  cm::string_view::size_type pos1 =3D line.size();
> -+  cm::string_view::size_type pos2 =3D line.find_last_of(' ', pos1);
> -+  auto findNext =3D [line, &part, &pos1, &pos2]() -> bool {
> -+    if (pos2 !=3D cm::string_view::npos) {
> -+      cm::string_view sub =3D line.substr(pos2 + 1, pos1 - pos2 - 1);
> -+      part.assign(sub.begin(), sub.end());
> -+      pos1 =3D pos2;
> -+      if (pos1 > 0) {
> -+        pos2 =3D line.find_last_of(' ', pos1 - 1);
> -+      }
> -+      return true;
> -+    }
> -+    return false;
> -+  };
> -+
> -+  // parse the cost
> -+  if (!findNext()) {
> -+    return cm::nullopt;
> -+  }
> -+  float cost =3D static_cast<float>(atof(part.c_str()));
> -+
> -+  // parse the previous runs
> -+  if (!findNext()) {
> -+    return cm::nullopt;
> -+  }
> -+  int prev =3D atoi(part.c_str());
> -+
> -+  // from start to the last found space is the name
> -+  return CostEntry{ line.substr(0, pos1), prev, cost };
> -+}
> -+
> - }
> -
> - namespace cmsys {
> -@@ -797,24 +840,21 @@ void cmCTestMultiProcessHandler::UpdateCostData()
> -       if (line =3D=3D "---") {
> -         break;
> -       }
> --      std::vector<std::string> parts =3D cmSystemTools::SplitString(lin=
e, ' ');
> -       // Format: <name> <previous_runs> <avg_cost>
> --      if (parts.size() < 3) {
> -+      cm::optional<CostEntry> entry =3D splitCostLine(line);
> -+      if (!entry) {
> -         break;
> -       }
> -
> --      std::string name =3D parts[0];
> --      int prev =3D atoi(parts[1].c_str());
> --      float cost =3D static_cast<float>(atof(parts[2].c_str()));
> --
> --      int index =3D this->SearchByName(name);
> -+      int index =3D this->SearchByName(entry->name);
> -       if (index =3D=3D -1) {
> -         // This test is not in memory. We just rewrite the entry
> --        fout << name << " " << prev << " " << cost << "\n";
> -+        fout << entry->name << " " << entry->prevRuns << " " << entry->=
cost
> -+             << "\n";
> -       } else {
> -         // Update with our new average cost
> --        fout << name << " " << this->Properties[index]->PreviousRuns <<=
 " "
> --             << this->Properties[index]->Cost << "\n";
> -+        fout << entry->name << " " << this->Properties[index]->Previous=
Runs
> -+             << " " << this->Properties[index]->Cost << "\n";
> -         temp.erase(index);
> -       }
> -     }
> -@@ -850,28 +890,25 @@ void cmCTestMultiProcessHandler::ReadCostData()
> -         break;
> -       }
> -
> --      std::vector<std::string> parts =3D cmSystemTools::SplitString(lin=
e, ' ');
> -+      // Format: <name> <previous_runs> <avg_cost>
> -+      cm::optional<CostEntry> entry =3D splitCostLine(line);
> -
> -       // Probably an older version of the file, will be fixed next run
> --      if (parts.size() < 3) {
> -+      if (!entry) {
> -         fin.close();
> -         return;
> -       }
> -
> --      std::string name =3D parts[0];
> --      int prev =3D atoi(parts[1].c_str());
> --      float cost =3D static_cast<float>(atof(parts[2].c_str()));
> --
> --      int index =3D this->SearchByName(name);
> -+      int index =3D this->SearchByName(entry->name);
> -       if (index =3D=3D -1) {
> -         continue;
> -       }
> -
> --      this->Properties[index]->PreviousRuns =3D prev;
> -+      this->Properties[index]->PreviousRuns =3D entry->prevRuns;
> -       // When not running in parallel mode, don't use cost data
> -       if (this->GetParallelLevel() > 1 && this->Properties[index] &&
> -           this->Properties[index]->Cost =3D=3D 0) {
> --        this->Properties[index]->Cost =3D cost;
> -+        this->Properties[index]->Cost =3D entry->cost;
> -       }
> -     }
> -     // Next part of the file is the failed tests
> -@@ -884,7 +921,7 @@ void cmCTestMultiProcessHandler::ReadCostData()
> -   }
> - }
> -
> --int cmCTestMultiProcessHandler::SearchByName(std::string const& name)
> -+int cmCTestMultiProcessHandler::SearchByName(cm::string_view name)
> - {
> -   int index =3D -1;
> -
> -diff --git a/Source/CTest/cmCTestMultiProcessHandler.h b/Source/CTest/cm=
CTestMultiProcessHandler.h
> -index fd6c17f2fac06949c20f3792dd3eae442b15850b..811be613c3387240c0181f83=
72b24cf09219621f 100644
> ---- a/Source/CTest/cmCTestMultiProcessHandler.h
> -+++ b/Source/CTest/cmCTestMultiProcessHandler.h
> -@@ -13,6 +13,7 @@
> - #include <vector>
> -
> - #include <cm/optional>
> -+#include <cm/string_view>
> -
> - #include "cmCTest.h"
> - #include "cmCTestResourceAllocator.h"
> -@@ -110,7 +111,7 @@ protected:
> -   void UpdateCostData();
> -   void ReadCostData();
> -   // Return index of a test based on its name
> --  int SearchByName(std::string const& name);
> -+  int SearchByName(cm::string_view name);
> -
> -   void CreateTestCostList();
> -
> -diff --git a/Tests/CTestTestScheduler/CMakeLists.txt b/Tests/CTestTestSc=
heduler/CMakeLists.txt
> -index 6f8cb4dbc0de35984540e1868788e0a02124e819..daf6ce2b23d8c048334ae104=
7759130b246dccef 100644
> ---- a/Tests/CTestTestScheduler/CMakeLists.txt
> -+++ b/Tests/CTestTestScheduler/CMakeLists.txt
> -@@ -1,9 +1,9 @@
> --cmake_minimum_required(VERSION 3.10)
> -+cmake_minimum_required(VERSION 3.19)
> - project (CTestTestScheduler)
> - include (CTest)
> -
> - add_executable (Sleep sleep.c)
> -
> - foreach (time RANGE 1 4)
> --  add_test (TestSleep${time} Sleep ${time})
> -+  add_test ("TestSleep ${time}" Sleep ${time})
> - endforeach ()
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disabl=
e-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt=
-disable-USE_NGHTTP2.patch
> similarity index 83%
> rename from meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable=
-USE_NGHTTP2.patch
> rename to meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-U=
SE_NGHTTP2.patch
> index ab78fa26ba..158eea2c3e 100644
> --- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_N=
GHTTP2.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_N=
GHTTP2.patch
> @@ -1,4 +1,4 @@
> -From 061253f390ada0661b30cf8856fa8d8d40a7355d Mon Sep 17 00:00:00 2001
> +From e0a1996a85dcb43d69d3c7daecab4da74599e5ba Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Wed, 28 Dec 2022 17:51:27 +0800
>  Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
> @@ -22,10 +22,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLis=
ts.txt
> -index ef6c269e..ecaac497 100644
> +index 75b510205984894ffa11461e7aa04d3c479709b4..83463042d82d9c7f17932753=
f47c47b12aeec85b 100644
>  --- a/Utilities/cmcurl/CMakeLists.txt
>  +++ b/Utilities/cmcurl/CMakeLists.txt
> -@@ -99,7 +99,7 @@ set(USE_ECH OFF)
> +@@ -105,7 +105,7 @@ set(USE_ECH OFF)
>   set(USE_HTTPSRR OFF)
>   set(USE_LIBIDN2 ON)
>   set(USE_LIBRTMP OFF)
> diff --git a/meta/recipes-devtools/cmake/cmake_3.31.6.bb b/meta/recipes-d=
evtools/cmake/cmake_4.0.3.bb
> similarity index 96%
> rename from meta/recipes-devtools/cmake/cmake_3.31.6.bb
> rename to meta/recipes-devtools/cmake/cmake_4.0.3.bb
> index 2d343d6f52..7d8b8cac65 100644
> --- a/meta/recipes-devtools/cmake/cmake_3.31.6.bb
> +++ b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> @@ -5,7 +5,6 @@ inherit cmake bash-completion
>  DEPENDS +=3D "curl expat zlib libarchive xz ncurses bzip2"
>
>  SRC_URI:append:class-nativesdk =3D " \
> -    file://0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.pat=
ch \
>      file://OEToolchainConfig.cmake \
>      file://SDKToolchainConfig.cmake.template \
>      file://cmake-setup.py \

This last patch does not apply on master, maybe needs a rebase?

Applying: libcomps: Backport patch to support builds with CMake 4+
Applying: createrepo-c: Backport patches to support builds with CMake 4+
Applying: apt: Backport patch to support builds with CMake 4+
Applying: libubootenv: Backport patch to support builds with CMake 4+
Applying: musl-locales: Add patch to support builds with CMake 4+
Applying: libwpe: Add patch to support builds with CMake 4+
Applying: cmake: upgrade 3.31.6 -> 4.0.3
Using index info to reconstruct a base tree...
Patch failed at 0007 cmake: upgrade 3.31.6 -> 4.0.3
error: patch failed: meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineC=
ompilerABI-Strip-pipe-from-compile-fl.patch:1
error: meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Str=
ip-pipe-from-compile-fl.patch: patch does not apply
error: patch failed: meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-us=
ing-undocumented-type-for-CURLOPT_NET.patch:1
error: meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocument=
ed-type-for-CURLOPT_NET.patch: patch does not apply
error: patch failed: meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arb=
itrary-characters-in-test-names-of-CT.patch:1
error: meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-charact=
ers-in-test-names-of-CT.patch: patch does not apply
error: Did you hand edit your patch?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


