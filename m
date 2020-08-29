Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.16464.1598724144569020258
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A7C4E020DC; Sat, 29 Aug 2020 11:02:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DB0FE020E5
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:57 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.12.1 SUCCEEDED
Message-Id: <20200829180224.6A7C4E020DC@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:24 -0700 (PDT)
X-Groupsio-MsgNum: 141955
Content-Type: multipart/mixed; boundary="===============5002637624775620587=="

--===============5002637624775620587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librepo* to *1.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librepo-upgrade-1.12.0-1.12.1.patch
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

--===============5002637624775620587==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.12.0-1.12.1.patch"

From 32325e053ed3ce383ab7cc7fa6b3000c5cb6bac8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 29 Aug 2020 13:07:30 +0000
Subject: [PATCH] librepo: upgrade 1.12.0 -> 1.12.1

---
 .../librepo/{librepo_1.12.0.bb => librepo_1.12.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.12.0.bb => librepo_1.12.1.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.12.0.bb b/meta/recipes-devtools/librepo/librepo_1.12.1.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.12.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.12.1.bb
index 2d9cac830e..0597351052 100644
--- a/meta/recipes-devtools/librepo/librepo_1.12.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.12.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "9c173f1110bb30f4ae842a8e3532b275966c2d83"
+SRCREV = "d4ad350291f2937c0b6a3eea9e1d0c8e1051fc32"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============5002637624775620587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/librepo: PV changed from "1.12.0" to "1.12.1"
packages/core2-32-poky-linux/librepo: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/librepo/librepo-dbg: PKGSIZE changed from 680216 to 681156 (+0%)
packages/core2-32-poky-linux/librepo/librepo-dbg: PV changed from "1.12.0" to "1.12.1"
packages/core2-32-poky-linux/librepo/librepo-dbg: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/librepo/librepo-dev: PV changed from "1.12.0" to "1.12.1"
packages/core2-32-poky-linux/librepo/librepo-dev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/librepo/librepo-doc: PV changed from "1.12.0" to "1.12.1"
packages/core2-32-poky-linux/librepo/librepo-doc: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/librepo/librepo-locale: PV changed from "1.12.0" to "1.12.1"
packages/core2-32-poky-linux/librepo/librepo-locale: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/librepo/librepo-src: PKGSIZE changed from 692497 to 693184 (+0%)
packages/core2-32-poky-linux/librepo/librepo-src: PV changed from "1.12.0" to "1.12.1"
packages/core2-32-poky-linux/librepo/librepo-src: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/librepo/librepo-staticdev: PV changed from "1.12.0" to "1.12.1"
packages/core2-32-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/librepo/librepo: PV changed from "1.12.0" to "1.12.1"
packages/core2-32-poky-linux/librepo/librepo: PKGV changed from 1.12.0 [default] to 1.12.1 [default]

--===============5002637624775620587==--
