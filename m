Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.82.1594831436318186226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F928E01E9C; Wed, 15 Jul 2020 09:43:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7533E01EB4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:42:59 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] asciidoc: upgrading to 9.0.1 SUCCEEDED
Message-Id: <20200715164356.2F928E01E9C@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:43:56 -0700 (PDT)
X-Groupsio-MsgNum: 140663
Content-Type: multipart/mixed; boundary="===============2745986775087989640=="

--===============2745986775087989640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *asciidoc* to *9.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-asciidoc-upgrade-9.0.0-9.0.1.patch
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

--===============2745986775087989640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/asciidoc/asciidoc-dbg: PV changed from "9.0.0" to "9.0.1"
packages/core2-32-poky-linux/asciidoc/asciidoc-dbg: PKGV changed from 9.0.0 [default] to 9.0.1 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-dev: PV changed from "9.0.0" to "9.0.1"
packages/core2-32-poky-linux/asciidoc/asciidoc-dev: PKGV changed from 9.0.0 [default] to 9.0.1 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-doc: PV changed from "9.0.0" to "9.0.1"
packages/core2-32-poky-linux/asciidoc/asciidoc-doc: PKGV changed from 9.0.0 [default] to 9.0.1 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-locale: PV changed from "9.0.0" to "9.0.1"
packages/core2-32-poky-linux/asciidoc/asciidoc-locale: PKGV changed from 9.0.0 [default] to 9.0.1 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-src: PV changed from "9.0.0" to "9.0.1"
packages/core2-32-poky-linux/asciidoc/asciidoc-src: PKGV changed from 9.0.0 [default] to 9.0.1 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-staticdev: PV changed from "9.0.0" to "9.0.1"
packages/core2-32-poky-linux/asciidoc/asciidoc-staticdev: PKGV changed from 9.0.0 [default] to 9.0.1 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc: PV changed from "9.0.0" to "9.0.1"
packages/core2-32-poky-linux/asciidoc/asciidoc: PKGV changed from 9.0.0 [default] to 9.0.1 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc: PKGSIZE changed from 799741 to 799877 (+0%)
packages/core2-32-poky-linux/asciidoc: PV changed from "9.0.0" to "9.0.1"
packages/core2-32-poky-linux/asciidoc: PKGV changed from 9.0.0 [default] to 9.0.1 [default]

--===============2745986775087989640==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-asciidoc-upgrade-9.0.0-9.0.1.patch"

From 09ccd0593082bed7288f39f2d5ca56881653db44 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 06:47:12 +0000
Subject: [PATCH] asciidoc: upgrade 9.0.0 -> 9.0.1

---
 .../asciidoc/{asciidoc_9.0.0.bb => asciidoc_9.0.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_9.0.0.bb => asciidoc_9.0.1.bb} (95%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.0.0.bb b/meta/recipes-extended/asciidoc/asciidoc_9.0.1.bb
similarity index 95%
rename from meta/recipes-extended/asciidoc/asciidoc_9.0.0.bb
rename to meta/recipes-extended/asciidoc/asciidoc_9.0.1.bb
index 63e02ce5fc..2f841de065 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.0.0.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.0.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
            file://auto-catalogs.patch"
-SRCREV = "c44cb22b0cb110b69e4909c93c1cc6e2be5470cc"
+SRCREV = "fce6bd87fbdef5e510310464b02a75fb32f72f74"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.17.1


--===============2745986775087989640==--
