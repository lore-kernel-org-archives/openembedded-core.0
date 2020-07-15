Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.67.1594831413227905812
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19077E01E9D; Wed, 15 Jul 2020 09:43:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00C98E01EA3
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:42:58 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 0.29.21 SUCCEEDED
Message-Id: <20200715164333.19077E01E9D@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:43:33 -0700 (PDT)
X-Groupsio-MsgNum: 140655
Content-Type: multipart/mixed; boundary="===============1447839965461426608=="

--===============1447839965461426608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *0.29.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-0.29.20-0.29.21.patch
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

--===============1447839965461426608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cython: PV changed from "0.29.20" to "0.29.21"
packages/core2-32-poky-linux/python3-cython: PKGV changed from 0.29.20 [default] to 0.29.21 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PV changed from "0.29.20" to "0.29.21"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 0.29.20 [default] to 0.29.21 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 9846580 to 9858588 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PV changed from "0.29.20" to "0.29.21"
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 0.29.20 [default] to 0.29.21 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PV changed from "0.29.20" to "0.29.21"
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 0.29.20 [default] to 0.29.21 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PV changed from "0.29.20" to "0.29.21"
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 0.29.20 [default] to 0.29.21 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PV changed from "0.29.20" to "0.29.21"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGV changed from 0.29.20 [default] to 0.29.21 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 8471794 to 8483229 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "0.29.20" to "0.29.21"
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 0.29.20 [default] to 0.29.21 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython: PV changed from "0.29.20" to "0.29.21"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGV changed from 0.29.20 [default] to 0.29.21 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Cython-0.29.20-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Cython-0.29.21-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/Cython/Compiler/Tests/TestStringEncoding.py /usr/lib/python3.8/site-packages/Cython/Compiler/Tests/__pycache__/TestStringEncoding.cpython-38.pyc"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 8666373 to 8670091 (+0%)
Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.8/site-packages/Cython-0.29.20-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/Cython-0.29.21-py3.8.egg-info
  /usr/lib/python3.8/site-packages/Cython/Compiler/Tests/__pycache__/TestStringEncoding.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/Cython/Compiler/Tests/TestStringEncoding.py was added

--===============1447839965461426608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Cython-0.29.20-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Cython-0.29.21-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/Cython/Compiler/Tests/__pycache__/TestStringEncoding.cpython-38.pyc /usr/lib/python3.8/site-packages/Cython/Compiler/Tests/TestStringEncoding.py"
Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.8/site-packages/Cython-0.29.20-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/Cython-0.29.21-py3.8.egg-info
  /usr/lib/python3.8/site-packages/Cython/Compiler/Tests/__pycache__/TestStringEncoding.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/Cython/Compiler/Tests/TestStringEncoding.py was added

--===============1447839965461426608==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-0.29.20-0.29.21.patch"

From d6a11e4b5466a41d9fa60901df7b51a32be690b8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 06:06:54 +0000
Subject: [PATCH] python3-cython: upgrade 0.29.20 -> 0.29.21

---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.20.bb => python3-cython_0.29.21.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.20.bb => python3-cython_0.29.21.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index a0cd2a5fb4..b1e71f3ccd 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "22d91af5fc2253f717a1b80b8bb45acb655f643611983fd6f782b9423f8171c7"
+SRC_URI[sha256sum] = "e57acb89bd55943c8d8bf813763d20b9099cc7165c0f16b707631a7654be9cad"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.20.bb b/meta/recipes-devtools/python/python3-cython_0.29.21.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.20.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.21.bb
-- 
2.17.1


--===============1447839965461426608==--
