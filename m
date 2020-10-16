Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12418.1602843682982633104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 527C138C1644
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.2.154.0 SUCCEEDED
Message-ID: <MADEUP.163E71D70DCDC606.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143472
Content-Type: multipart/mixed; boundary="===============8911698467415654489=="

--===============8911698467415654489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.2.154.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.2.135.0-1.2.154.0.patch
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

--===============8911698467415654489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_directfb.h was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 3523651 to 4057261 (+15%)

--===============8911698467415654489==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.2.135.0-1.2.154.0.patch"

From 7b05a23d35fde475182df8f621eab943abf2f0dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 08:59:56 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.2.135.0 -> 1.2.154.0

---
 ...{vulkan-headers_1.2.135.0.bb => vulkan-headers_1.2.154.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.135.0.bb => vulkan-headers_1.2.154.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
index d21c3d62b9..5a252c96bc 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 # was sdk-1.2.135 branch but it was removed upstream, commit is in master branch though
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
-SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
+SRCREV = "7f9879b1b1fab53f719a9ed5e6e29533b10972b2"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.4


--===============8911698467415654489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.2.135.0" to "1.2.154.0"
packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.2.135.0 [default] to 1.2.154.0 [default]
Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_directfb.h was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.2.135.0" to "1.2.154.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.2.135.0 [default] to 1.2.154.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.2.135.0" to "1.2.154.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 4680433 to 5108099 (+9%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.2.135.0 [default] to 1.2.154.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.2.135.0" to "1.2.154.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.2.135.0 [default] to 1.2.154.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.2.135.0" to "1.2.154.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.2.135.0 [default] to 1.2.154.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.2.135.0" to "1.2.154.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.2.135.0 [default] to 1.2.154.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.2.135.0" to "1.2.154.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.2.135.0 [default] to 1.2.154.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.2.135.0" to "1.2.154.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 3523651 to 4057261 (+15%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.2.135.0 [default] to 1.2.154.0 [default]

--===============8911698467415654489==--
