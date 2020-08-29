Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.16450.1598724117286430671
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28F5FE020D6; Sat, 29 Aug 2020 11:01:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2930E020D0
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:55 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iw: upgrading to 5.8 SUCCEEDED
Message-Id: <20200829180157.28F5FE020D6@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:01:57 -0700 (PDT)
X-Groupsio-MsgNum: 141944
Content-Type: multipart/mixed; boundary="===============3681722956587452250=="

--===============3681722956587452250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iw* to *5.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iw-upgrade-5.4-5.8.patch
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

--===============3681722956587452250==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-iw-upgrade-5.4-5.8.patch"

From 215428241be800120d963c9287502e0b175e852e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 29 Aug 2020 10:29:27 +0000
Subject: [PATCH] iw: upgrade 5.4 -> 5.8

---
 meta/recipes-connectivity/iw/{iw_5.4.bb => iw_5.8.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_5.4.bb => iw_5.8.bb} (85%)

diff --git a/meta/recipes-connectivity/iw/iw_5.4.bb b/meta/recipes-connectivity/iw/iw_5.8.bb
similarity index 85%
rename from meta/recipes-connectivity/iw/iw_5.4.bb
rename to meta/recipes-connectivity/iw/iw_5.8.bb
index 9f58e49709..6bce21d945 100644
--- a/meta/recipes-connectivity/iw/iw_5.4.bb
+++ b/meta/recipes-connectivity/iw/iw_5.8.bb
@@ -14,8 +14,7 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "08a4f581a39dc62fa85d3af796d844b6"
-SRC_URI[sha256sum] = "943cd2446a6c7242fded3766d054ab2a214a3514b9a8b7e942fed8fb13c1370c"
+SRC_URI[sha256sum] = "cd9125c7e560926d66b09977fe0f75e5365ffd05a15df67d86a421dc76f96a96"
 
 inherit pkgconfig
 
-- 
2.17.1


--===============3681722956587452250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/iw/iw-dbg: PKGSIZE changed from 769960 to 818128 (+6%)
packages/core2-32-poky-linux/iw/iw-dbg: PV changed from "5.4" to "5.8"
packages/core2-32-poky-linux/iw/iw-dbg: PKGV changed from 5.4 [default] to 5.8 [default]
packages/core2-32-poky-linux/iw/iw-dev: PV changed from "5.4" to "5.8"
packages/core2-32-poky-linux/iw/iw-dev: PKGV changed from 5.4 [default] to 5.8 [default]
packages/core2-32-poky-linux/iw/iw-doc: PV changed from "5.4" to "5.8"
packages/core2-32-poky-linux/iw/iw-doc: PKGV changed from 5.4 [default] to 5.8 [default]
packages/core2-32-poky-linux/iw/iw-locale: PV changed from "5.4" to "5.8"
packages/core2-32-poky-linux/iw/iw-locale: PKGV changed from 5.4 [default] to 5.8 [default]
packages/core2-32-poky-linux/iw/iw-src: PKGSIZE changed from 666573 to 709727 (+6%)
packages/core2-32-poky-linux/iw/iw-src: PV changed from "5.4" to "5.8"
packages/core2-32-poky-linux/iw/iw-src: PKGV changed from 5.4 [default] to 5.8 [default]
packages/core2-32-poky-linux/iw/iw-staticdev: PV changed from "5.4" to "5.8"
packages/core2-32-poky-linux/iw/iw-staticdev: PKGV changed from 5.4 [default] to 5.8 [default]
packages/core2-32-poky-linux/iw/iw: PKGSIZE changed from 288088 to 304628 (+6%)
packages/core2-32-poky-linux/iw/iw: PV changed from "5.4" to "5.8"
packages/core2-32-poky-linux/iw/iw: PKGV changed from 5.4 [default] to 5.8 [default]
packages/core2-32-poky-linux/iw: PV changed from "5.4" to "5.8"
packages/core2-32-poky-linux/iw: PKGV changed from 5.4 [default] to 5.8 [default]

--===============3681722956587452250==--
