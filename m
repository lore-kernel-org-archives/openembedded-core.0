Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.16480.1598724169140302000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C257BE020E4; Sat, 29 Aug 2020 11:02:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 058D4E02112
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:02:01 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmpc: upgrading to 1.2.0 SUCCEEDED
Message-Id: <20200829180250.C257BE020E4@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:50 -0700 (PDT)
X-Groupsio-MsgNum: 141976
Content-Type: multipart/mixed; boundary="===============7950228627877822702=="

--===============7950228627877822702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmpc* to *1.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmpc-upgrade-1.1.0-1.2.0.patch
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

--===============7950228627877822702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/libmpc (sysroot):
  /usr/lib/libmpc.so.3 changed symlink target from libmpc.so.3.1.0 to libmpc.so.3.2.0
  /usr/lib/libmpc.so changed symlink target from libmpc.so.3.1.0 to libmpc.so.3.2.0
  /usr/lib/libmpc.so.3.1.0 moved to /usr/lib/libmpc.so.3.2.0

--===============7950228627877822702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/core2-32-poky-linux/libmpc (sysroot):
  /usr/lib/libmpc.so.3 changed symlink target from libmpc.so.3.1.0 to libmpc.so.3.2.0
  /usr/lib/libmpc.so changed symlink target from libmpc.so.3.1.0 to libmpc.so.3.2.0
  /usr/lib/libmpc.so.3.1.0 moved to /usr/lib/libmpc.so.3.2.0

--===============7950228627877822702==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libmpc-upgrade-1.1.0-1.2.0.patch"

From 6763e29e449590aa9746255548aebc7404684bd2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 29 Aug 2020 17:41:00 +0000
Subject: [PATCH] libmpc: upgrade 1.1.0 -> 1.2.0

---
 .../libmpc/{libmpc_1.1.0.bb => libmpc_1.2.0.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libmpc/{libmpc_1.1.0.bb => libmpc_1.2.0.bb} (62%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.1.0.bb b/meta/recipes-support/libmpc/libmpc_1.2.0.bb
similarity index 62%
rename from meta/recipes-support/libmpc/libmpc_1.1.0.bb
rename to meta/recipes-support/libmpc/libmpc_1.2.0.bb
index bbc673ff38..b51ec6ad14 100644
--- a/meta/recipes-support/libmpc/libmpc_1.1.0.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.2.0.bb
@@ -5,8 +5,7 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4125404e41e482ec68282a2e687f6c73"
-SRC_URI[sha256sum] = "6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
+SRC_URI[sha256sum] = "e90f2d99553a9c19911abdb4305bf8217106a957e3994436428572c8dfe8fda6"
 
 S = "${WORKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


--===============7950228627877822702==--
