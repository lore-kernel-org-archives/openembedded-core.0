Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.4692.1621074784024300314
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id A541838C13F3
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.2.176.0 SUCCEEDED
Message-ID: <MADEUP.167F36EDA079247D.8202@lists.openembedded.org>
X-Groupsio-MsgNum: 151823
Content-Type: multipart/mixed; boundary="===============8240169653489966289=="

--===============8240169653489966289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.2.176.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.2.170.0-1.2.176.0.patch
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

--===============8240169653489966289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vk_video was added
  /usr/include/vk_video/vulkan_video_codec_h264std_decode.h was added
  /usr/include/vk_video/vulkan_video_codec_h264std_encode.h was added
  /usr/include/vk_video/vulkan_video_codec_h264std.h was added
  /usr/include/vk_video/vulkan_video_codec_h265std_decode.h was added
  /usr/include/vk_video/vulkan_video_codec_h265std.h was added
  /usr/include/vk_video/vulkan_video_codecs_common.h was added
  /usr/include/vulkan/vulkan_screen.h was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 5378238 to 6640920 (+23%)

--===============8240169653489966289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.2.170.0-1.2.176.0.patch"

From 03b1ead4dacc7000a2b7541d82f212c68eb607ca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 07:16:35 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.2.170.0 -> 1.2.176.0

---
 ...{vulkan-headers_1.2.170.0.bb => vulkan-headers_1.2.176.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.170.0.bb => vulkan-headers_1.2.176.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.176.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.176.0.bb
index 4c9c94f3d2..cff654a06c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.176.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
-SRCREV = "1d99b835ec3cd5a7fb2f2a2dd9a615ee2d1f0101"
+SRCREV = "074fa3055cfee530992bcbfa0fcb23106a82c1ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============8240169653489966289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.2.170.0" to "1.2.176.0"
packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.2.170.0 [default] to 1.2.176.0 [default]
Changes to packages/core2-32-poky-linux/vulkan-headers (sysroot):
  /usr/include/vk_video was added
  /usr/include/vk_video/vulkan_video_codec_h264std_decode.h was added
  /usr/include/vk_video/vulkan_video_codec_h264std_encode.h was added
  /usr/include/vk_video/vulkan_video_codec_h264std.h was added
  /usr/include/vk_video/vulkan_video_codec_h265std_decode.h was added
  /usr/include/vk_video/vulkan_video_codec_h265std.h was added
  /usr/include/vk_video/vulkan_video_codecs_common.h was added
  /usr/include/vulkan/vulkan_screen.h was added
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.2.170.0" to "1.2.176.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.2.170.0 [default] to 1.2.176.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.2.170.0" to "1.2.176.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.2.170.0 [default] to 1.2.176.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 5378238 to 6640920 (+23%)
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.2.170.0" to "1.2.176.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.2.170.0 [default] to 1.2.176.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.2.170.0" to "1.2.176.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.2.170.0 [default] to 1.2.176.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.2.170.0" to "1.2.176.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.2.170.0 [default] to 1.2.176.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.2.170.0" to "1.2.176.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.2.170.0 [default] to 1.2.176.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.2.170.0" to "1.2.176.0"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.2.170.0 [default] to 1.2.176.0 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 4673787 to 4991933 (+7%)

--===============8240169653489966289==--
