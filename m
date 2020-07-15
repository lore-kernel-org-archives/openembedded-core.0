Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.72.1594831380915287269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B89D0E01EC0; Wed, 15 Jul 2020 09:43:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC137E01E8A
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:42:57 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 5.7 SUCCEEDED
Message-Id: <20200715164300.B89D0E01EC0@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:43:00 -0700 (PDT)
X-Groupsio-MsgNum: 140644
Content-Type: multipart/mixed; boundary="===============1726277783511672343=="

--===============1726277783511672343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *5.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-5.6.1-5.7.patch
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

--===============1726277783511672343==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-5.6.1-5.7.patch"

From 615c0798c56af5c148f166132e22a333ca7b998c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 03:54:04 +0000
Subject: [PATCH] btrfs-tools: upgrade 5.6.1 -> 5.7

---
 .../btrfs-tools/{btrfs-tools_5.6.1.bb => btrfs-tools_5.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.6.1.bb => btrfs-tools_5.7.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
index 29f14d9077..e61ea9bf89 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "2a74d408f4b65d603e42f6e7b6b905ac81825fc9"
+SRCREV = "11acf45eea6dd81e891564967051e2bb10bd25f7"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.17.1


--===============1726277783511672343==--
