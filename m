Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.126.1594831457566339416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F084E01E97; Wed, 15 Jul 2020 09:44:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE460E01ECD
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:43:01 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.2.141.0 SUCCEEDED
Message-Id: <20200715164417.6F084E01E97@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:44:17 -0700 (PDT)
X-Groupsio-MsgNum: 140676
Content-Type: multipart/mixed; boundary="===============4328669282405717832=="

--===============4328669282405717832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.2.141.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.2.135.0-1.2.141.0.patch
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

--===============4328669282405717832==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.2.135.0-1.2.141.0.patch"

From 02887dc0b593465d939c5998cc130aa87bb6e9b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 12:09:56 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.2.135.0 -> 1.2.141.0

---
 ...{vulkan-headers_1.2.135.0.bb => vulkan-headers_1.2.141.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.135.0.bb => vulkan-headers_1.2.141.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.141.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.141.0.bb
index d21c3d62b9..256a728646 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.141.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 # was sdk-1.2.135 branch but it was removed upstream, commit is in master branch though
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
-SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
+SRCREV = "09531f27933bf04bffde9074acb302e026e8f181"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============4328669282405717832==--
