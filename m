Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19850.1597558844449368060
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4F61CE0202E; Sat, 15 Aug 2020 23:20:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6EAC1E0203C
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:38 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.19.1 SUCCEEDED
Message-Id: <20200816062044.4F61CE0202E@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:20:44 -0700 (PDT)
X-Groupsio-MsgNum: 141484
Content-Type: multipart/mixed; boundary="===============4050566141304005475=="

--===============4050566141304005475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.19.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.19.0-1.19.1.patch
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

--===============4050566141304005475==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.19.0-1.19.1.patch"

From 8957a60d7695c2455f27378c1cfbd8173f77adab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 Aug 2020 16:45:28 +0000
Subject: [PATCH] python3-numpy: upgrade 1.19.0 -> 1.19.1

---
 meta/recipes-devtools/python-numpy/python-numpy.inc             | 2 +-
 .../{python3-numpy_1.19.0.bb => python3-numpy_1.19.1.bb}        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.19.0.bb => python3-numpy_1.19.1.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index e37ab399ed..0113f4098d 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -8,7 +8,7 @@ SRCNAME = "numpy"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            "
-SRC_URI[sha256sum] = "153cf8b0176e57a611931981acfe093d2f7fef623b48f91176efa199798a6b90"
+SRC_URI[sha256sum] = "1396e6c3d20cbfc119195303b0272e749610b7042cc498be4134f013e9a3215c"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.0.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.1.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.19.0.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.19.1.bb
-- 
2.17.1


--===============4050566141304005475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.19.0 [default] to 1.19.1 [default]
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.19.0" to "1.19.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 29287516 to 29292756 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.19.0 [default] to 1.19.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.19.0" to "1.19.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.19.0 [default] to 1.19.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.19.0" to "1.19.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.19.0 [default] to 1.19.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.19.0" to "1.19.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.19.0 [default] to 1.19.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.19.0" to "1.19.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 17531356 to 17537242 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.19.0 [default] to 1.19.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.19.0" to "1.19.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 254510 to 254518 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.19.0 [default] to 1.19.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.19.0" to "1.19.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 26811563 to 26827723 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.19.0 [default] to 1.19.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.19.0" to "1.19.1"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.8/site-packages/numpy-1.19.0-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info

--===============4050566141304005475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.8/site-packages/numpy-1.19.0-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info

--===============4050566141304005475==--
