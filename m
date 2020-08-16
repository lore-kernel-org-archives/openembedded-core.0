Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19858.1597558881158163156
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08CA1E02027; Sat, 15 Aug 2020 23:21:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E61C3E0204C
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:39 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpipeline: upgrading to 1.5.3 SUCCEEDED
Message-Id: <20200816062121.08CA1E02027@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:21:21 -0700 (PDT)
X-Groupsio-MsgNum: 141490
Content-Type: multipart/mixed; boundary="===============2483258783609431661=="

--===============2483258783609431661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpipeline* to *1.5.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpipeline-upgrade-1.5.2-1.5.3.patch
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

--===============2483258783609431661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpipeline: PV changed from "1.5.2" to "1.5.3"
packages/core2-32-poky-linux/libpipeline: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: FILELIST: removed "/usr/lib/.debug/libpipeline.so.1.5.2", added "/usr/lib/.debug/libpipeline.so.1.5.3"
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: PV changed from "1.5.2" to "1.5.3"
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: PKGSIZE changed from 157964 to 158076 (+0%)
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-dev: PV changed from "1.5.2" to "1.5.3"
packages/core2-32-poky-linux/libpipeline/libpipeline-dev: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-doc: PV changed from "1.5.2" to "1.5.3"
packages/core2-32-poky-linux/libpipeline/libpipeline-doc: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-locale: PV changed from "1.5.2" to "1.5.3"
packages/core2-32-poky-linux/libpipeline/libpipeline-locale: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-src: PV changed from "1.5.2" to "1.5.3"
packages/core2-32-poky-linux/libpipeline/libpipeline-src: PKGSIZE changed from 572255 to 572395 (+0%)
packages/core2-32-poky-linux/libpipeline/libpipeline-src: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-staticdev: PV changed from "1.5.2" to "1.5.3"
packages/core2-32-poky-linux/libpipeline/libpipeline-staticdev: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline: FILELIST: removed "/usr/lib/libpipeline.so.1.5.2", added "/usr/lib/libpipeline.so.1.5.3"
packages/core2-32-poky-linux/libpipeline/libpipeline: PV changed from "1.5.2" to "1.5.3"
packages/core2-32-poky-linux/libpipeline/libpipeline: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
Changes to packages/core2-32-poky-linux/libpipeline (sysroot):
  /usr/lib/libpipeline.so.1 changed symlink target from libpipeline.so.1.5.2 to libpipeline.so.1.5.3
  /usr/lib/libpipeline.so changed symlink target from libpipeline.so.1.5.2 to libpipeline.so.1.5.3
  /usr/lib/libpipeline.so.1.5.2 moved to /usr/lib/libpipeline.so.1.5.3

--===============2483258783609431661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpipeline/libpipeline: FILELIST: removed "/usr/lib/libpipeline.so.1.5.2", added "/usr/lib/libpipeline.so.1.5.3"
Changes to packages/core2-32-poky-linux/libpipeline (sysroot):
  /usr/lib/libpipeline.so.1 changed symlink target from libpipeline.so.1.5.2 to libpipeline.so.1.5.3
  /usr/lib/libpipeline.so changed symlink target from libpipeline.so.1.5.2 to libpipeline.so.1.5.3
  /usr/lib/libpipeline.so.1.5.2 moved to /usr/lib/libpipeline.so.1.5.3

--===============2483258783609431661==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libpipeline-upgrade-1.5.2-1.5.3.patch"

From 14a17fb2914f551a285f01c7fec35e791eff9c30 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 Aug 2020 18:20:18 +0000
Subject: [PATCH] libpipeline: upgrade 1.5.2 -> 1.5.3

---
 .../libpipeline/{libpipeline_1.5.2.bb => libpipeline_1.5.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.2.bb => libpipeline_1.5.3.bb} (78%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb
similarity index 78%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb
index a182461607..ee15fd0644 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb
@@ -7,8 +7,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI[md5sum] = "169de4cc1f6f7f7d430a5bed858b2fd3"
-SRC_URI[sha256sum] = "fd59c649c1ae9d67604d1644f116ad4d297eaa66f838e3dfab96b41e85b059fb"
+SRC_URI[sha256sum] = "5dbf08faf50fad853754293e57fd4e6c69bb8e486f176596d682c67e02a0adb0"
 
 inherit pkgconfig autotools
 
-- 
2.17.1


--===============2483258783609431661==--
