Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.4571.1621074783972108535
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9F5D638C13E9
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2021.0 SUCCEEDED
Message-ID: <MADEUP.167F36EDAD08A085.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151826
Content-Type: multipart/mixed; boundary="===============9051688188092546155=="

--===============9051688188092546155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2021.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2020.5-2021.0.patch
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

--===============9051688188092546155==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2020.5-2021.0.patch"

From 2846e2dd94bc361f6a53bd35ee3c7e6c1464ca95 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 07:06:25 +0000
Subject: [PATCH] shaderc: upgrade 2020.5 -> 2021.0

---
 ...aderc_util-fix-glslang-header-file-location.patch | 12 +++++-------
 .../shaderc/{shaderc_2020.5.bb => shaderc_2021.0.bb} |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2020.5.bb => shaderc_2021.0.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index df670cdded..0e8ad7e4d2 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,17 +1,18 @@
-From 046c3c2da9c4ff66f14db5bd68e9557504a49241 Mon Sep 17 00:00:00 2001
+From d02ad48d5c9b48af70ddea2e6998081347ef82f3 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
-Subject: [PATCH 2/3] libshaderc_util: fix glslang header file location
+Subject: [PATCH] libshaderc_util: fix glslang header file location
 
 Upstream-Status: Pending
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
  libshaderc_util/src/compiler.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index c5ce37e..4703634 100644
+index 051558b..9c4476c 100644
 --- a/libshaderc_util/src/compiler.cc
 +++ b/libshaderc_util/src/compiler.cc
 @@ -20,7 +20,7 @@
@@ -21,8 +22,5 @@ index c5ce37e..4703634 100644
 -#include "SPIRV/GlslangToSpv.h"
 +#include "glslang/SPIRV/GlslangToSpv.h"
  #include "libshaderc_util/format.h"
- #include "libshaderc_util/io.h"
+ #include "libshaderc_util/io_shaderc.h"
  #include "libshaderc_util/message.h"
--- 
-2.30.1
-
diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.5.bb b/meta/recipes-graphics/shaderc/shaderc_2021.0.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2020.5.bb
rename to meta/recipes-graphics/shaderc/shaderc_2021.0.bb
index ce51aab034..3d59e0c38c 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.5.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2021.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "f3e39a7eed682faececb73f0b85717f2f44ee9ba"
+SRCREV = "1a3e2aaab191f44644e899e29ab7bac50bebdeb8"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.27.0


--===============9051688188092546155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PKGV changed from 2020.5 [default] to 2021.0 [default]
packages/core2-32-poky-linux/shaderc: PV changed from "2020.5" to "2021.0"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2020.5 [default] to 2021.0 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 6165908 to 6165924 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2020.5" to "2021.0"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2020.5 [default] to 2021.0 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2020.5" to "2021.0"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2020.5 [default] to 2021.0 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2020.5" to "2021.0"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2020.5 [default] to 2021.0 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2020.5" to "2021.0"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2020.5 [default] to 2021.0 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 314564 to 314608 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2020.5" to "2021.0"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2020.5 [default] to 2021.0 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2441270 to 2441266 (-0%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2020.5" to "2021.0"
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2020.5 [default] to 2021.0 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2020.5" to "2021.0"

--===============9051688188092546155==--
