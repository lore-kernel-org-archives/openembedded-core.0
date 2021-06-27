Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5931.1624805202637788586
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id EA23638C1286
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 11.5.0 SUCCEEDED
Message-ID: <MADEUP.168C77B929BABDAC.8895@lists.openembedded.org>
X-Groupsio-MsgNum: 153305
Content-Type: multipart/mixed; boundary="===============8185068181995307225=="

--===============8185068181995307225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *11.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-11.4.0-11.5.0.patch
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

--===============8185068181995307225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang/glslang-doc: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang/glslang-locale: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang/glslang-staticdev: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so.11 changed symlink target from libglslang.so.11.4.0 to libglslang.so.11.5.0
  /usr/lib/libglslang.so.11.4.0 moved to /usr/lib/libglslang.so.11.5.0
  /usr/include/glslang/Include/SpirvIntrinsics.h was added

--===============8185068181995307225==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-11.4.0-11.5.0.patch"

From 247a29cb62d19bdfb84295976b215cb54d67a326 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 27 Jun 2021 12:45:15 +0000
Subject: [PATCH] glslang: upgrade 11.4.0 -> 11.5.0

---
 .../glslang/{glslang_11.4.0.bb => glslang_11.5.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_11.4.0.bb => glslang_11.5.0.bb} (95%)

diff --git a/meta/recipes-graphics/glslang/glslang_11.4.0.bb b/meta/recipes-graphics/glslang/glslang_11.5.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_11.4.0.bb
rename to meta/recipes-graphics/glslang/glslang_11.5.0.bb
index fd4cf6d538..e3eaa2ac63 100644
--- a/meta/recipes-graphics/glslang/glslang_11.4.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.5.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "18eef33bd7a4bf5ad8c69f99cb72022608cf6e73"
+SRCREV = "ae2a562936cc8504c9ef2757cceaff163147834f"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
            file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
-- 
2.17.1


--===============8185068181995307225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 62234072 to 66806828 (+7%)
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 11.4.0 [default] to 11.5.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "11.4.0" to "11.5.0"
packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 951359 to 965156 (+1%)
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 11.4.0 [default] to 11.5.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "11.4.0" to "11.5.0"
packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 11.4.0 [default] to 11.5.0 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "11.4.0" to "11.5.0"
packages/core2-32-poky-linux/glslang/glslang-doc: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 11.4.0 [default] to 11.5.0 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "11.4.0" to "11.5.0"
packages/core2-32-poky-linux/glslang/glslang-locale: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4452578 to 4513971 (+1%)
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 11.4.0 [default] to 11.5.0 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "11.4.0" to "11.5.0"
packages/core2-32-poky-linux/glslang/glslang-src: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 41754 to 41818 (+0%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 11.4.0 [default] to 11.5.0 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "11.4.0" to "11.5.0"
packages/core2-32-poky-linux/glslang/glslang-staticdev: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 5957424 to 6141744 (+3%)
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 11.4.0 [default] to 11.5.0 [default]
packages/core2-32-poky-linux/glslang/glslang: PV changed from "11.4.0" to "11.5.0"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.11.4.0", added "/usr/lib/libglslang.so.11.5.0"
packages/core2-32-poky-linux/glslang: PKGV changed from 11.4.0 [default] to 11.5.0 [default]
packages/core2-32-poky-linux/glslang: PV changed from "11.4.0" to "11.5.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so.11 changed symlink target from libglslang.so.11.4.0 to libglslang.so.11.5.0
  /usr/lib/libglslang.so.11.4.0 moved to /usr/lib/libglslang.so.11.5.0
  /usr/include/glslang/Include/SpirvIntrinsics.h was added

--===============8185068181995307225==--
