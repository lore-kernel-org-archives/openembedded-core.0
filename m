Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19845.1597558831947338821
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CCE1FE02025; Sat, 15 Aug 2020 23:20:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 822DAE02032
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:37 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] build-compare: upgrading to d95eb3576a73164f3e6e7492ac01c00136239d71 SUCCEEDED
Message-Id: <20200816062031.CCE1FE02025@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:20:31 -0700 (PDT)
X-Groupsio-MsgNum: 141478
Content-Type: multipart/mixed; boundary="===============5034547009727982628=="

--===============5034547009727982628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *build-compare* to *d95eb3576a73164f3e6e7492ac01c00136239d71* has Succeeded.

Next steps:
    - apply the patch: git am 0001-build-compare-upgrade-to-latest-revision.patch
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

--===============5034547009727982628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/build-compare/build-compare-dbg: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-dbg: PV changed from "2020.05.29+gitAUTOINC+102d844ce0" to "2020.05.29+gitAUTOINC+d95eb3576a"
packages/core2-32-poky-linux/build-compare/build-compare-dev: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-dev: PV changed from "2020.05.29+gitAUTOINC+102d844ce0" to "2020.05.29+gitAUTOINC+d95eb3576a"
packages/core2-32-poky-linux/build-compare/build-compare-doc: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-doc: PV changed from "2020.05.29+gitAUTOINC+102d844ce0" to "2020.05.29+gitAUTOINC+d95eb3576a"
packages/core2-32-poky-linux/build-compare/build-compare-locale: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-locale: PV changed from "2020.05.29+gitAUTOINC+102d844ce0" to "2020.05.29+gitAUTOINC+d95eb3576a"
packages/core2-32-poky-linux/build-compare/build-compare-src: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-src: PV changed from "2020.05.29+gitAUTOINC+102d844ce0" to "2020.05.29+gitAUTOINC+d95eb3576a"
packages/core2-32-poky-linux/build-compare/build-compare-staticdev: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-staticdev: PV changed from "2020.05.29+gitAUTOINC+102d844ce0" to "2020.05.29+gitAUTOINC+d95eb3576a"
packages/core2-32-poky-linux/build-compare/build-compare: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare: PKGSIZE changed from 56590 to 56913 (+1%)
packages/core2-32-poky-linux/build-compare/build-compare: PV changed from "2020.05.29+gitAUTOINC+102d844ce0" to "2020.05.29+gitAUTOINC+d95eb3576a"
packages/core2-32-poky-linux/build-compare: PKGV changed from 2020.05.29+gitAUTOINC+102d844ce0 [default] to 2020.05.29+gitAUTOINC+d95eb3576a [default]
packages/core2-32-poky-linux/build-compare: PV changed from "2020.05.29+gitAUTOINC+102d844ce0" to "2020.05.29+gitAUTOINC+d95eb3576a"

--===============5034547009727982628==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-build-compare-upgrade-to-latest-revision.patch"

From 4042f8e9644c11d12fa21ca7cebd47926392f7af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 Aug 2020 15:56:20 +0000
Subject: [PATCH] build-compare: upgrade to latest revision

---
 meta/recipes-devtools/build-compare/build-compare_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index 74a954db46..a431ea7b66 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/openSUSE/build-compare.git"
 
 # Date matches entry in build-compare.changes and date of SRCREV.
 #
-SRCREV = "102d844ce052c6dec6c56ee1d471bde72a1b4633"
+SRCREV = "d95eb3576a73164f3e6e7492ac01c00136239d71"
 PE = "1"
 PV = "2020.05.29+git${SRCPV}"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.17.1


--===============5034547009727982628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/build-compare/build-compare-dbg: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-dev: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-doc: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-locale: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-src: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare-staticdev: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a
packages/core2-32-poky-linux/build-compare/build-compare: PKGV changed from 2020.05.29+git0+102d844ce0 to 2020.05.29+git0+d95eb3576a

--===============5034547009727982628==--
