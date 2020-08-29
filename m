Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16615.1598724144911929513
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C16DEE020DB; Sat, 29 Aug 2020 11:02:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.0 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.113] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80D1FE020E7
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:57 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ninja: upgrading to 1.10.1 SUCCEEDED
Message-Id: <20200829180224.C16DEE020DB@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:24 -0700 (PDT)
X-Groupsio-MsgNum: 141957
Content-Type: multipart/mixed; boundary="===============2302790315449189526=="

--===============2302790315449189526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ninja* to *1.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ninja-upgrade-1.10.0-1.10.1.patch
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

--===============2302790315449189526==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ninja-upgrade-1.10.0-1.10.1.patch"

From 854cf16a22ed131a329f81d5d1bf4d565aa898e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 29 Aug 2020 13:14:51 +0000
Subject: [PATCH] ninja: upgrade 1.10.0 -> 1.10.1

---
 .../recipes-devtools/ninja/{ninja_1.10.0.bb => ninja_1.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.10.0.bb => ninja_1.10.1.bb} (92%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.10.0.bb b/meta/recipes-devtools/ninja/ninja_1.10.1.bb
similarity index 92%
rename from meta/recipes-devtools/ninja/ninja_1.10.0.bb
rename to meta/recipes-devtools/ninja/ninja_1.10.1.bb
index bdc6365052..eefac4166a 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "ed7f67040b370189d989adbd60ff8ea29957231f"
+SRCREV = "a1f879b29c9aafe6a2bc0ba885701f8f4f19f772"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.17.1


--===============2302790315449189526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ninja: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/ninja: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/ninja/ninja-dbg: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/ninja/ninja-dbg: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/ninja/ninja-dbg: PKGSIZE changed from 5828932 to 5842388 (+0%)
packages/core2-32-poky-linux/ninja/ninja-dev: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/ninja/ninja-dev: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/ninja/ninja-doc: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/ninja/ninja-doc: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/ninja/ninja-locale: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/ninja/ninja-locale: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/ninja/ninja-src: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/ninja/ninja-src: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/ninja/ninja-src: PKGSIZE changed from 363858 to 366669 (+1%)
packages/core2-32-poky-linux/ninja/ninja-staticdev: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/ninja/ninja-staticdev: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/ninja/ninja: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/ninja/ninja: PKGV changed from 1.10.0 [default] to 1.10.1 [default]

--===============2302790315449189526==--
