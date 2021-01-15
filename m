Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.700.1610713822710119607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7C9F938C13DC
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.2.162.1 SUCCEEDED
Message-ID: <MADEUP.165A67B0743F0763.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146790
Content-Type: multipart/mixed; boundary="===============6913780884798264152=="

--===============6913780884798264152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.2.162.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.2.162.0-1.2.162.1.patch
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

--===============6913780884798264152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-tools: PKGV changed from 1.2.162.0 [default] to 1.2.162.1 [default]
packages/core2-32-poky-linux/vulkan-tools: PV changed from "1.2.162.0" to "1.2.162.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dbg: PKGV changed from 1.2.162.0 [default] to 1.2.162.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dbg: PV changed from "1.2.162.0" to "1.2.162.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dev: PKGV changed from 1.2.162.0 [default] to 1.2.162.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dev: PV changed from "1.2.162.0" to "1.2.162.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-doc: PKGV changed from 1.2.162.0 [default] to 1.2.162.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-doc: PV changed from "1.2.162.0" to "1.2.162.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-locale: PKGV changed from 1.2.162.0 [default] to 1.2.162.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-locale: PV changed from "1.2.162.0" to "1.2.162.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-src: PKGV changed from 1.2.162.0 [default] to 1.2.162.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-src: PV changed from "1.2.162.0" to "1.2.162.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-staticdev: PKGV changed from 1.2.162.0 [default] to 1.2.162.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-staticdev: PV changed from "1.2.162.0" to "1.2.162.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools: PKGV changed from 1.2.162.0 [default] to 1.2.162.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools: PV changed from "1.2.162.0" to "1.2.162.1"

--===============6913780884798264152==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.2.162.0-1.2.162.1.patch"

From 6f4c969cbe4fe918b9208ccb02a796c5d5234542 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 09:14:45 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.2.162.0 -> 1.2.162.1

---
 .../{vulkan-tools_1.2.162.0.bb => vulkan-tools_1.2.162.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.162.0.bb => vulkan-tools_1.2.162.1.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
index 972859c934..e571766030 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.162"
-SRCREV = "9e9d7c24ed8b321815f77f31c100bbf9462193b4"
+SRCREV = "8f0c2e40d4134f53f82ce48de72c7be92baa6b3d"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============6913780884798264152==--
