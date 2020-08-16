Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.19817.1597558911644482139
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F0FBE02038; Sat, 15 Aug 2020 23:21:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E9D2E02066
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:42 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.2.148.0 SUCCEEDED
Message-Id: <20200816062151.7F0FBE02038@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:21:51 -0700 (PDT)
X-Groupsio-MsgNum: 141501
Content-Type: multipart/mixed; boundary="===============3490801518895905762=="

--===============3490801518895905762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.2.148.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.2.135.0-1.2.148.0.patch
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

--===============3490801518895905762==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.2.135.0-1.2.148.0.patch"

From 7d0649c195341ef18202945a0d2369f29c91e1f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 01:36:20 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.2.135.0 -> 1.2.148.0

---
 ...ulkan-headers_1.2.135.0.bb => vulkan-headers_1.2.148.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.135.0.bb => vulkan-headers_1.2.148.0.bb} (89%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.148.0.bb
similarity index 89%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.148.0.bb
index d21c3d62b9..8bb50ca3bc 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.148.0.bb
@@ -6,9 +6,9 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 # was sdk-1.2.135 branch but it was removed upstream, commit is in master branch though
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.2.148"
 
-SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
+SRCREV = "fc87182aab33a63b43db41d7a424eed27283aebf"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============3490801518895905762==--
