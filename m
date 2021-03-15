Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.299.1615826520809447936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 98C7D38C1323
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.2.170.0 SUCCEEDED
Message-ID: <MADEUP.166C91A92C7FED61.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149512
Content-Type: multipart/mixed; boundary="===============0376334716383208684=="

--===============0376334716383208684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.2.170.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.2.162.0-1.2.170.0.patch
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

--===============0376334716383208684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.2.162.0" to "1.2.170.0"
packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.2.162.0 [default] to 1.2.170.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.2.162.0" to "1.2.170.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.2.162.0 [default] to 1.2.170.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.2.162.0" to "1.2.170.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 5230965 to 5378238 (+3%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.2.162.0 [default] to 1.2.170.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.2.162.0" to "1.2.170.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.2.162.0 [default] to 1.2.170.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.2.162.0" to "1.2.170.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.2.162.0 [default] to 1.2.170.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.2.162.0" to "1.2.170.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.2.162.0 [default] to 1.2.170.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.2.162.0" to "1.2.170.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.2.162.0 [default] to 1.2.170.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.2.162.0" to "1.2.170.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 4384952 to 4673787 (+7%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.2.162.0 [default] to 1.2.170.0 [default]

--===============0376334716383208684==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.2.162.0-1.2.170.0.patch"

From 3750245d058a20a8a09b9ee2cf9267548f7bf791 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 12:53:07 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.2.162.0 -> 1.2.170.0

---
 ...{vulkan-headers_1.2.162.0.bb => vulkan-headers_1.2.170.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.162.0.bb => vulkan-headers_1.2.170.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
index 19ae67cdd4..4c9c94f3d2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
-SRCREV = "87aaa16d4c8e1ac70f8f04acdcd46eed4bd77209"
+SRCREV = "1d99b835ec3cd5a7fb2f2a2dd9a615ee2d1f0101"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============0376334716383208684==--
