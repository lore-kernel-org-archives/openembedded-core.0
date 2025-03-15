Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9750C369AD
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.10352.1742048289505815391
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TZieWXGk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XaV/gm07;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101959a2bb8de-cc61080f-1abc-4a04-813d-2283cb395956-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048311;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oQ96f5XHJN1H8kJxAgwxPRB9eBHjCXhQPOYfC+44ze4=;
	b=TZieWXGk/ACQr3CjgUQxAIcVpK2n7QIjsLs4hpAhkng5o07vSh0k1KhNHKAPHzVF
	YReDD8Ellnf5PyoZa3Gt4ssQ08IE0XCKtNTrOG5upnWyU3+aKMGc3Gqyl+vO/9FExkM
	GbbYrJ9xnPSWimKFy4d7+gGVPpJQfd3UzLl4qM7M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048311;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oQ96f5XHJN1H8kJxAgwxPRB9eBHjCXhQPOYfC+44ze4=;
	b=XaV/gm07iKnh1CP2G8Tcw4jDpZorqcPOmPh8mMCny2W11ChJgwoe91er4l75bs2W
	BJvOroGQXiXmRw+1oqUjZ1u4kYwUR9MXy7wjiFLFu/N8LgfVE5Kqb2GSd0ntv5iMVr4
	9VonsSnJZPcjE4lTMrlxIkKDZFdZ6/DQi6IDrXTM=
Content-Type: multipart/mixed; boundary="===============9136655987375961895=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2025.1 FAILED
Message-ID: <010101959a2bb8de-cc61080f-1abc-4a04-813d-2283cb395956-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212951

--===============9136655987375961895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2025.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2024.3-2025.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From aafb6b94eac0102d2fc65e87b4654477e77e3cf8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 12:32:07 +0000
Subject: [PATCH] shaderc: upgrade 2024.3 -> 2025.1

---
 .../0001-cmake-disable-building-external-dependencies.patch   | 4 ++--
 ...002-libshaderc_util-fix-glslang-header-file-location.patch | 4 ++--
 .../shaderc/{shaderc_2024.3.bb => shaderc_2025.1.bb}          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.3.bb => shaderc_2025.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 5c49aa7fd5..7a1d7e17a3 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 941f5f5831e7a52c26168f81f25d0470860ca6f1 Mon Sep 17 00:00:00 2001
+From 5606f0d649104e2d838526c6381f1df9f128f222 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -15,7 +15,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ffcb54b..cce715e 100644
+index bd6b890..f1ddd74 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -62,6 +62,7 @@ else()
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 39f982b7f3..14d8b3e2a5 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From 6e7023f3fe94f634c61efd7be016956f5d101530 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
@@ -11,7 +11,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index e5f5d10..5fd6d3c 100644
+index 9bf9a43..dc0efd2 100644
 --- a/libshaderc_util/src/compiler.cc
 +++ b/libshaderc_util/src/compiler.cc
 @@ -20,7 +20,7 @@
diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.3.bb b/meta/recipes-graphics/shaderc/shaderc_2025.1.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2024.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2025.1.bb
index 0948ba28d6..d245a7f3a0 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "7223dc3d5e34bbcc44f3150546dbfa8a5da58c4c"
+SRCREV = "7f68b1cf6f35f518febf36d425365bb8e6ad224a"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.44.1


--===============9136655987375961895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (922 cached, 1 parsed). 1884 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:40a2df29959e9d5cb3dabb575042a345c8692ae4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 106 Local 95 Mirrors 0 Missed 11 Current 272 (89% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 378 of 378 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe shaderc-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shaderc-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1014 of 1119 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_fetch)
NOTE: recipe shaderc-2025.1-r0: task do_fetch: Started
NOTE: recipe shaderc-2025.1-r0: task do_fetch: Succeeded
NOTE: Running task 1100 of 1119 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_unpack)
NOTE: Running task 1101 of 1119 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2025.1-r0: task do_unpack: Started
NOTE: recipe shaderc-2025.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2025.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shaderc-2025.1-r0: task do_unpack: Succeeded
NOTE: Running task 1102 of 1119 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_patch)
NOTE: Running task 1103 of 1119 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2025.1-r0: task do_patch: Started
NOTE: recipe shaderc-2025.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2025.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2025.1-r0: task do_patch: Succeeded
NOTE: Running task 1104 of 1119 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1105 of 1119 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_generate_toolchain_file)
NOTE: Running task 1106 of 1119 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_populate_lic)
NOTE: recipe shaderc-2025.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2025.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2025.1-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2025.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2025.1-r0: task do_populate_lic: Succeeded
NOTE: recipe shaderc-2025.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_deploy_source_date_epoch unihash changed to 4a88c3aec9bb3fcb79dc81f8c4103dc9540ca991e89b92cfa9a98a60b1da9744
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_populate_lic unihash changed to 49589d43e2140bf68c0074d4be36889cd7fc29af6353e3e0ee3d33cc46026cdf
NOTE: Setscene tasks completed
NOTE: Running task 1107 of 1119 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_configure)
NOTE: recipe shaderc-2025.1-r0: task do_configure: Started
NOTE: recipe shaderc-2025.1-r0: task do_configure: Succeeded
NOTE: Running task 1108 of 1119 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_compile)
NOTE: recipe shaderc-2025.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-
 prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/resources.cc.o -MF libshaderc_ut
 il/CMakeFiles/shaderc_util.dir/src/resources.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/resources.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/resources.cc
| [2/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/python3-native/python3 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/utils/update_build_version.py /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build/build-version.inc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git
| [3/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh
 /build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=h
 idden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/file.cc.o -MF glslc/CMakeFiles/glslc.dir/src/file.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/file.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/file.cc
| [4/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-
 prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/version_profile.cc.o -MF libshad
 erc_util/CMakeFiles/shaderc_util.dir/src/version_profile.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/version_profile.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/version_profile.cc
| [5/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-
 prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/shader_stage.cc.o -MF libshaderc
 _util/CMakeFiles/shaderc_util.dir/src/shader_stage.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/shader_stage.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/shader_stage.cc
| [6/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/shaderc.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build/shaderc.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DLIBS=-lshaderc_shared -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/write_pkg_config.cmake
| [7/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh
 /build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=h
 idden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/shader_stage.cc.o -MF glslc/CMakeFiles/glslc.dir/src/shader_stage.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/shader_stage.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/shader_stage.cc
| [8/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/shaderc_static.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build/shaderc_static.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DLIBS=-lshaderc\ \ -lshaderc_util -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/write_pkg_config.cmake
| [9/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/shaderc_combined.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build/shaderc_combined.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DLIBS=-lshaderc_combined -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/write_pkg_config.cmake
| [10/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/args.cc.o -MF libshaderc_util/C
 MakeFiles/shaderc_util.dir/src/args.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/args.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/args.cc
| [11/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/file_finder.cc.o -MF libshaderc
 _util/CMakeFiles/shaderc_util.dir/src/file_finder.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/file_finder.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/file_finder.cc
| [12/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/io_shaderc.cc.o -MF libshaderc_
 util/CMakeFiles/shaderc_util.dir/src/io_shaderc.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/io_shaderc.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/io_shaderc.cc
| [13/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/message.cc.o -MF libshaderc_uti
 l/CMakeFiles/shaderc_util.dir/src/message.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/message.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/message.cc
| [14/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -MF li
 bshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/spirv_tools_wrapper.cc
| FAILED: libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-
 map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -MF libshaderc
 _util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/spirv_tools_wrapper.cc
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/spirv_tools_wrapper.cc: In function 'spv_target_env shaderc_util::{anonymous}::GetSpirvToolsTargetEnv(shaderc_util::Compiler::TargetEnv, shaderc_util::Compiler::TargetEnvVersion)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/spirv_tools_wrapper.cc:44:18: error: 'SPV_ENV_VULKAN_1_4' was not declared in this scope; did you mean 'SPV_ENV_VULKAN_1_3'?
|    44 |           return SPV_ENV_VULKAN_1_4;
|       |                  ^~~~~~~~~~~~~~~~~~
|       |                  SPV_ENV_VULKAN_1_3
| [15/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=
 hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/dependency_info.cc.o -MF glslc/CMakeFiles/glslc.dir/src/dependency_info.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/dependency_info.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/dependency_info.cc
| [16/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=
 hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/file_includer.cc.o -MF glslc/CMakeFiles/glslc.dir/src/file_includer.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/file_includer.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/file_includer.cc
| [17/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=
 hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/resource_parse.cc.o -MF glslc/CMakeFiles/glslc.dir/src/resource_parse.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/resource_parse.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/resource_parse.cc
| [18/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -MF libshaderc_ut
 il/CMakeFiles/shaderc_util.dir/src/compiler.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/compiler.cc
| FAILED: libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-
 map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -MF libshaderc_util/CMake
 Files/shaderc_util.dir/src/compiler.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/compiler.cc
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/compiler.cc: In function 'shaderc_util::GlslangClientInfo shaderc_util::GetGlslangClientInfo(const std::string&, Compiler::TargetEnv, Compiler::TargetEnvVersion, Compiler::SpirvVersion, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/compiler.cc:762:42: error: 'EShTargetVulkan_1_4' is not a member of 'glslang'; did you mean 'EShTargetVulkan_1_3'?
|   762 |         result.client_version = glslang::EShTargetVulkan_1_4;
|       |                                          ^~~~~~~~~~~~~~~~~~~
|       |                                          EShTargetVulkan_1_3
| [19/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=
 hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/file_compiler.cc.o -MF glslc/CMakeFiles/glslc.dir/src/file_compiler.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/file_compiler.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/file_compiler.cc
| [20/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -I/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -f
 visibility=hidden -fPIC -MD -MT libshaderc/CMakeFiles/shaderc.dir/src/shaderc.cc.o -MF libshaderc/CMakeFiles/shaderc.dir/src/shaderc.cc.o.d -o libshaderc/CMakeFiles/shaderc.dir/src/shaderc.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/src/shaderc.cc
| [21/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DSHADERC_IMPLEMENTATION -DSHADERC_SHAREDLIB -Dshaderc_shared_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -I/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=
 /usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines
 -hidden -Wimplicit-fallthrough -DNDEBUG -fPIC -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc/CMakeFiles/shaderc_shared.dir/src/shaderc.cc.o -MF libshaderc/CMakeFiles/shaderc_shared.dir/src/shaderc.cc.o.d -o libshaderc/CMakeFiles/shaderc_shared.dir/src/shaderc.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/src/shaderc.cc
| [22/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build/glslc/.. -I/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cor
 e2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot
 -native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT glslc/CMakeFiles/glslc_exe.dir/src/main.cc.o -MF glslc/CMakeFiles/glslc_exe.dir/src/main.cc.o.d -o glslc/CMakeFiles/glslc_exe.dir/src/main.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/main.cc
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.734030:159 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.734030, line 159
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.734030, line 153
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.734030, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.734030, line 172
NOTE: recipe shaderc-2025.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1108 tasks of which 1098 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315123151.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315123151.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/log.do_compile.734030
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shaderc-2025.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.734030' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/log.do_compile.734030
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_compile) failed with exit code '1'

--===============9136655987375961895==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2024.3-2025.1.patch"

RnJvbSBhYWZiNmI5NGVhYzAxMDJkMmZjNjVlODdiNDY1NDQ3N2U3N2UzY2Y4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTI6MzI6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjQuMyAtPiAyMDI1LjEKCi0tLQogLi4uLzAwMDEtY21ha2UtZGlz
YWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggICB8IDQgKystLQogLi4u
MDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRj
aCB8IDQgKystLQogLi4uL3NoYWRlcmMve3NoYWRlcmNfMjAyNC4zLmJiID0+IHNoYWRlcmNfMjAy
NS4xLmJifSAgICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3tz
aGFkZXJjXzIwMjQuMy5iYiA9PiBzaGFkZXJjXzIwMjUuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUt
YnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRl
cGVuZGVuY2llcy5wYXRjaAppbmRleCA1YzQ5YWE3ZmQ1Li43YTFkN2UxN2EzIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUt
YnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5h
bC1kZXBlbmRlbmNpZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk0MWY1ZjU4MzFlN2E1
MmMyNjE2OGY4MWYyNWQwNDcwODYwY2E2ZjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDU2MDZmMGQ2NDkxMDRlMmQ4Mzg1MjZjNjM4MWYxZGY5ZjEyOGYyMjIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4K
IERhdGU6IFNhdCwgMTMgRmViIDIwMjEgMDA6NDU6NTYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
Y21ha2U6IGRpc2FibGUgYnVpbGRpbmcgZXh0ZXJuYWwgZGVwZW5kZW5jaWVzCkBAIC0xNSw3ICsx
NSw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwu
Y29tPgogIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCBm
ZmNiNTRiLi5jY2U3MTVlIDEwMDY0NAoraW5kZXggYmQ2Yjg5MC4uZjFkZGQ3NCAxMDA2NDQKIC0t
LSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTYyLDYgKzYyLDcg
QEAgZWxzZSgpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxl
cy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVy
Y191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoCmluZGV4IDM5Zjk4
MmI3ZjMuLjE0ZDhiM2UyYTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFk
ZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxv
Y2F0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAw
MDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlYzI0NDI5NDBlMWQ1MzM4OTcxODYxYmI4MTUzN2JhZTNh
NmMxOWUyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2ZTcwMjNmM2ZlOTRmNjM0YzYx
ZWZkN2JlMDE2OTU2ZjVkMTAxNTMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9z
ZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEzIEZlYiAy
MDIxIDAwOjQ1OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYnNoYWRlcmNfdXRpbDogZml4
IGdsc2xhbmcgaGVhZGVyIGZpbGUgbG9jYXRpb24KQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9m
Zi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9saWJz
aGFkZXJjX3V0aWwvc3JjL2NvbXBpbGVyLmNjIGIvbGlic2hhZGVyY191dGlsL3NyYy9jb21waWxl
ci5jYwotaW5kZXggZTVmNWQxMC4uNWZkNmQzYyAxMDA2NDQKK2luZGV4IDliZjlhNDMuLmRjMGVm
ZDIgMTAwNjQ0CiAtLS0gYS9saWJzaGFkZXJjX3V0aWwvc3JjL2NvbXBpbGVyLmNjCiArKysgYi9s
aWJzaGFkZXJjX3V0aWwvc3JjL2NvbXBpbGVyLmNjCiBAQCAtMjAsNyArMjAsNyBAQApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI0LjMuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjUuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFk
ZXJjXzIwMjQuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hh
ZGVyY18yMDI1LjEuYmIKaW5kZXggMDk0OGJhMjhkNi4uZDI0NWE3ZjNhMCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI0LjMuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI1LjEuYmIKQEAgLTYsNyArNiw3
IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYyIKIExJQ0VO
U0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1TUkNSRVYgPSAiNzIyM2RjM2Q1
ZTM0YmJjYzQ0ZjMxNTA1NDZkYmZhOGE1ZGE1OGM0YyIKK1NSQ1JFViA9ICI3ZjY4YjFjZjZmMzVm
NTE4ZmViZjM2ZDQyNTM2NWJiOGU2YWQyMjRhIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L2dvb2dsZS9zaGFkZXJjLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5j
aWVzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1n
bHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIFwKLS0gCjIuNDQuMQoK

--===============9136655987375961895==--

