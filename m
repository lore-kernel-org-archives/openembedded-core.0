Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEECC02185
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.17803.1736936771563090341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TQwdqnjU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=K2mSHihx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010194697fe6db-5c9ce094-7eef-4cbb-b5a0-475303649635-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936777;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JOojYVCA5WtYx9jpPnA39QvviTRtTjkMBtyZR6gE2f4=;
	b=TQwdqnjUCALYrZjUagyoPJWxtPBcD6TnlsOIdL4K33VF1+0eFGM77uITQd8oAJiY
	YV0xIlD5K6WNV5jHCkKOZIxsU4tkPu+jwupAq/VUo1lsytXR/epv/Yp3b9zy87E2CYv
	nllTBTpIMs4JxrpI1ozR17BMb76iR5NGZ11j0aDs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936777;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JOojYVCA5WtYx9jpPnA39QvviTRtTjkMBtyZR6gE2f4=;
	b=K2mSHihxWrahgpiWR/xZbG56Sr8gMKkndu71DMer8rnpitXvrspX9DqhnTeY27Qs
	pukalsn7hcmuagqrjinZJjvhamysgQCzlWL6HBLcBdXOW7bobZsXHsnj+nbkJq4ESC/
	LWrrtq6Hv6GSJdl/uVuzAbjwqJR2dm8gHrPAvpow=
Content-Type: multipart/mixed; boundary="===============0887066489359490412=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2024.4 FAILED
Message-ID: <01010194697fe6db-5c9ce094-7eef-4cbb-b5a0-475303649635-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209872

--===============0887066489359490412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2024.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2024.3-2024.4.patch
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
From 9a4985e7d810d8a5427e6ebd4a7326499614aad6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 09:20:48 +0000
Subject: [PATCH] shaderc: upgrade 2024.3 -> 2024.4

---
 .../0001-cmake-disable-building-external-dependencies.patch   | 2 +-
 ...002-libshaderc_util-fix-glslang-header-file-location.patch | 4 ++--
 .../shaderc/{shaderc_2024.3.bb => shaderc_2024.4.bb}          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.3.bb => shaderc_2024.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 5c49aa7fd5..3b035fb857 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 941f5f5831e7a52c26168f81f25d0470860ca6f1 Mon Sep 17 00:00:00 2001
+From 64d61d4dcc4edbefde73694eb927d380da2e9158 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 39f982b7f3..1fe7306e4e 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From 307b0f9901f7607e12485b9c6863983ebd4d4f1a Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.3.bb b/meta/recipes-graphics/shaderc/shaderc_2024.4.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2024.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2024.4.bb
index 0948ba28d6..0cd408c074 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2024.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "7223dc3d5e34bbcc44f3150546dbfa8a5da58c4c"
+SRCREV = "3cd72062f297df05e6a042f2616c42bc8956c326"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.44.1


--===============0887066489359490412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:13e8dc94df28b72f36e109a237367913184fb3a7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 104 Local 92 Mirrors 0 Missed 12 Current 227 (88% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 849 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_recipe_qa)
NOTE: recipe shaderc-2024.4-r0: task do_recipe_qa: Started
NOTE: recipe shaderc-2024.4-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_recipe_qa unihash changed to f3e9239f3cce7aff2761f6337d7bf4f713f01cdef6fba871e93f9aa5c22d1dde
NOTE: Setscene tasks completed
NOTE: Running task 960 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_fetch)
NOTE: recipe shaderc-2024.4-r0: task do_fetch: Started
NOTE: recipe shaderc-2024.4-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_unpack)
NOTE: Running task 962 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2024.4-r0: task do_unpack: Started
NOTE: recipe shaderc-2024.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2024.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shaderc-2024.4-r0: task do_unpack: Succeeded
NOTE: Running task 963 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_patch)
NOTE: Running task 964 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2024.4-r0: task do_patch: Started
NOTE: recipe shaderc-2024.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2024.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2024.4-r0: task do_patch: Succeeded
NOTE: Running task 965 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 966 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_generate_toolchain_file)
NOTE: Running task 967 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_populate_lic)
NOTE: recipe shaderc-2024.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2024.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2024.4-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2024.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2024.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_deploy_source_date_epoch unihash changed to 908df8813a1e1316553a4a22880dab60afbfe168a7858509d642befc37094ae2
NOTE: recipe shaderc-2024.4-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_populate_lic unihash changed to 2bdb86b2df7addd64199c49660228c8a5919b21323e30b37dd4104d4f4de6b50
NOTE: Setscene tasks completed
NOTE: Running task 968 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_configure)
NOTE: recipe shaderc-2024.4-r0: task do_configure: Started
NOTE: recipe shaderc-2024.4-r0: task do_configure: Succeeded
NOTE: Running task 969 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_compile)
NOTE: recipe shaderc-2024.4-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-
 prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/resources.cc.o -MF 
 libshaderc_util/CMakeFiles/shaderc_util.dir/src/resources.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/resources.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/resources.cc
| [2/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/python3-native/python3 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/utils/update_build_version.py /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build/build-version.inc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git
| [3/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh
 /build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -
 fvisibility=hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/file.cc.o -MF glslc/CMakeFiles/glslc.dir/src/file.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/file.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/glslc/src/file.cc
| [4/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-
 prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/version_profile.cc.
 o -MF libshaderc_util/CMakeFiles/shaderc_util.dir/src/version_profile.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/version_profile.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/version_profile.cc
| [5/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-
 prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/shader_stage.cc.o -
 MF libshaderc_util/CMakeFiles/shaderc_util.dir/src/shader_stage.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/shader_stage.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/shader_stage.cc
| [6/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/cmake/shaderc.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build/shaderc.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DLIBS=-lshaderc_shared -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/cmake/write_pkg_config.cmake
| [7/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh
 /build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -
 fvisibility=hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/shader_stage.cc.o -MF glslc/CMakeFiles/glslc.dir/src/shader_stage.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/shader_stage.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/glslc/src/shader_stage.cc
| [8/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/cmake/shaderc_static.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build/shaderc_static.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DLIBS=-lshaderc\ \ -lshaderc_util -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/cmake/write_pkg_config.cmake
| [9/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/cmake/shaderc_combined.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build/shaderc_combined.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DLIBS=-lshaderc_combined -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/cmake/write_pkg_config.cmake
| [10/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/args.cc.o -MF libs
 haderc_util/CMakeFiles/shaderc_util.dir/src/args.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/args.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/args.cc
| [11/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/file_finder.cc.o -
 MF libshaderc_util/CMakeFiles/shaderc_util.dir/src/file_finder.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/file_finder.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/file_finder.cc
| [12/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/io_shaderc.cc.o -M
 F libshaderc_util/CMakeFiles/shaderc_util.dir/src/io_shaderc.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/io_shaderc.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/io_shaderc.cc
| [13/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/message.cc.o -MF l
 ibshaderc_util/CMakeFiles/shaderc_util.dir/src/message.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/message.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/message.cc
| [14/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrappe
 r.cc.o -MF libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/spirv_tools_wrapper.cc
| FAILED: libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-
 map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -
 MF libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/spirv_tools_wrapper.cc
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/spirv_tools_wrapper.cc: In function 'spv_target_env shaderc_util::{anonymous}::GetSpirvToolsTargetEnv(shaderc_util::Compiler::TargetEnv, shaderc_util::Compiler::TargetEnvVersion)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/spirv_tools_wrapper.cc:44:18: error: 'SPV_ENV_VULKAN_1_4' was not declared in this scope; did you mean 'SPV_ENV_VULKAN_1_3'?
|    44 |           return SPV_ENV_VULKAN_1_4;
|       |                  ^~~~~~~~~~~~~~~~~~
|       |                  SPV_ENV_VULKAN_1_3
| [15/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror 
 -fvisibility=hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/dependency_info.cc.o -MF glslc/CMakeFiles/glslc.dir/src/dependency_info.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/dependency_info.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/glslc/src/dependency_info.cc
| [16/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror 
 -fvisibility=hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/resource_parse.cc.o -MF glslc/CMakeFiles/glslc.dir/src/resource_parse.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/resource_parse.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/glslc/src/resource_parse.cc
| [17/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror 
 -fvisibility=hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/file_includer.cc.o -MF glslc/CMakeFiles/glslc.dir/src/file_includer.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/file_includer.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/glslc/src/file_includer.cc
| [18/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -MF 
 libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/compiler.cc
| FAILED: libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-
 map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -MF libshade
 rc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/compiler.cc
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/compiler.cc: In function 'shaderc_util::GlslangClientInfo shaderc_util::GetGlslangClientInfo(const std::string&, Compiler::TargetEnv, Compiler::TargetEnvVersion, Compiler::SpirvVersion, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/src/compiler.cc:762:42: error: 'EShTargetVulkan_1_4' is not a member of 'glslang'; did you mean 'EShTargetVulkan_1_3'?
|   762 |         result.client_version = glslang::EShTargetVulkan_1_4;
|       |                                          ^~~~~~~~~~~~~~~~~~~
|       |                                          EShTargetVulkan_1_3
| [19/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror 
 -fvisibility=hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/file_compiler.cc.o -MF glslc/CMakeFiles/glslc.dir/src/file_compiler.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/file_compiler.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/glslc/src/file_compiler.cc
| [20/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot -DSHADERC_IMPLEMENTATION -DSHADERC_SHAREDLIB -Dshaderc_shared_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/include -I/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=
 /usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines
 -hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -fPIC -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc/CMakeFiles/shaderc_shared.dir/src/shaderc.cc.o -MF libshaderc/CMakeFiles/shaderc_shared.dir/src/shaderc.cc.o.d -o libshaderc/CMakeFiles/shaderc_shared.dir/src/shaderc.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/src/shaderc.cc
| [21/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/include -I/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wa
 ll -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc/CMakeFiles/shaderc.dir/src/shaderc.cc.o -MF libshaderc/CMakeFiles/shaderc.dir/src/shaderc.cc.o.d -o libshaderc/CMakeFiles/shaderc.dir/src/shaderc.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/src/shaderc.cc
| [22/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build/glslc/.. -I/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cor
 e2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git=/usr/src/debug/shaderc/2024.4  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build=/usr/src/debug/shaderc/2024.4  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/recipe-sysroot
 -native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -std=gnu++17 -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT glslc/CMakeFiles/glslc_exe.dir/src/main.cc.o -MF glslc/CMakeFiles/glslc_exe.dir/src/main.cc.o.d -o glslc/CMakeFiles/glslc_exe.dir/src/main.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/git/glslc/src/main.cc
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/temp/run.do_compile.1828655:159 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/temp/run.do_compile.1828655, line 159
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/temp/run.do_compile.1828655, line 153
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/temp/run.do_compile.1828655, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/temp/run.do_compile.1828655, line 172
NOTE: recipe shaderc-2024.4-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 969 tasks of which 958 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115092032.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115092032.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/temp/log.do_compile.1828655
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shaderc-2024.4-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/temp/run.do_compile.1828655' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2024.4/temp/log.do_compile.1828655
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.4.bb:do_compile) failed with exit code '1'

--===============0887066489359490412==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2024.3-2024.4.patch"

RnJvbSA5YTQ5ODVlN2Q4MTBkOGE1NDI3ZTZlYmQ0YTczMjY0OTk2MTRhYWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDk6MjA6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjQuMyAtPiAyMDI0LjQKCi0tLQogLi4uLzAwMDEtY21ha2UtZGlz
YWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggICB8IDIgKy0KIC4uLjAw
Mi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gg
fCA0ICsrLS0KIC4uLi9zaGFkZXJjL3tzaGFkZXJjXzIwMjQuMy5iYiA9PiBzaGFkZXJjXzIwMjQu
NC5iYn0gICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97c2hh
ZGVyY18yMDI0LjMuYmIgPT4gc2hhZGVyY18yMDI0LjQuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1
aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBl
bmRlbmNpZXMucGF0Y2gKaW5kZXggNWM0OWFhN2ZkNS4uM2IwMzVmYjg1NyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1
aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwt
ZGVwZW5kZW5jaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NDFmNWY1ODMxZTdhNTJj
MjYxNjhmODFmMjVkMDQ3MDg2MGNhNmYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2
NGQ2MWQ0ZGNjNGVkYmVmZGU3MzY5NGViOTI3ZDM4MGRhMmU5MTU4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBE
YXRlOiBTYXQsIDEzIEZlYiAyMDIxIDAwOjQ1OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiBkaXNhYmxlIGJ1aWxkaW5nIGV4dGVybmFsIGRlcGVuZGVuY2llcwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwt
Zml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFk
ZXItZmlsZS1sb2NhdGlvbi5wYXRjaAppbmRleCAzOWY5ODJiN2YzLi4xZmU3MzA2ZTRlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRl
cmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgt
Z2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
ZWMyNDQyOTQwZTFkNTMzODk3MTg2MWJiODE1MzdiYWUzYTZjMTllMiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gMzA3YjBmOTkwMWY3NjA3ZTEyNDg1YjljNjg2Mzk4M2ViZDRkNGYxYSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpv
c2VAZ21haWwuY29tPgogRGF0ZTogU2F0LCAxMyBGZWIgMjAyMSAwMDo0NTo1NiArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBsaWJzaGFkZXJjX3V0aWw6IGZpeCBnbHNsYW5nIGhlYWRlciBmaWxlIGxv
Y2F0aW9uCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPHF1
YXJlc21hLmpvc2VAZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGlic2hhZGVyY191dGlsL3NyYy9jb21waWxl
ci5jYyBiL2xpYnNoYWRlcmNfdXRpbC9zcmMvY29tcGlsZXIuY2MKLWluZGV4IGU1ZjVkMTAuLjVm
ZDZkM2MgMTAwNjQ0CitpbmRleCA5YmY5YTQzLi5kYzBlZmQyIDEwMDY0NAogLS0tIGEvbGlic2hh
ZGVyY191dGlsL3NyYy9jb21waWxlci5jYwogKysrIGIvbGlic2hhZGVyY191dGlsL3NyYy9jb21w
aWxlci5jYwogQEAgLTIwLDcgKzIwLDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNC4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3No
YWRlcmMvc2hhZGVyY18yMDI0LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI0LjMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNC40LmJiCmluZGV4IDA5
NDhiYTI4ZDYuLjBjZDQwOGMwNzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9z
aGFkZXJjL3NoYWRlcmNfMjAyNC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFk
ZXJjL3NoYWRlcmNfMjAyNC40LmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczov
L2dpdGh1Yi5jb20vZ29vZ2xlL3NoYWRlcmMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5
ODY5NjhmNDMyNyIKIAotU1JDUkVWID0gIjcyMjNkYzNkNWUzNGJiY2M0NGYzMTUwNTQ2ZGJmYThh
NWRhNThjNGMiCitTUkNSRVYgPSAiM2NkNzIwNjJmMjk3ZGYwNWU2YTA0MmYyNjE2YzQyYmM4OTU2
YzMyNiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYy5naXQ7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jbWFrZS1k
aXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2Nh
dGlvbi5wYXRjaCBcCi0tIAoyLjQ0LjEKCg==

--===============0887066489359490412==--

