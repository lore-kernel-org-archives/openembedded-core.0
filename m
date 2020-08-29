Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16633.1598724170328586178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35C10E020D1; Sat, 29 Aug 2020 11:02:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1B07E0210E
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:02:00 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.2.9 SUCCEEDED
Message-Id: <20200829180250.35C10E020D1@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:50 -0700 (PDT)
X-Groupsio-MsgNum: 141974
Content-Type: multipart/mixed; boundary="===============8635663637051312962=="

--===============8635663637051312962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.2.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.2.8-2.2.9.patch
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

--===============8635663637051312962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/enchant2/enchant2-dev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-doc: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-locale: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
Changes to packages/core2-32-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.2.8 to libenchant-2.so.2.2.9
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.2.8 to libenchant-2.so.2.2.9
  /usr/lib/libenchant-2.so.2.2.8 moved to /usr/lib/libenchant-2.so.2.2.9

--===============8635663637051312962==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.2.8-2.2.9.patch"

From d7d812a73aa67af6ea586c14888e91dacd8fd382 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 29 Aug 2020 16:39:09 +0000
Subject: [PATCH] enchant2: upgrade 2.2.8 -> 2.2.9

---
 .../enchant/{enchant2_2.2.8.bb => enchant2_2.2.9.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.8.bb => enchant2_2.2.9.bb} (85%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.8.bb b/meta/recipes-support/enchant/enchant2_2.2.9.bb
similarity index 85%
rename from meta/recipes-support/enchant/enchant2_2.2.8.bb
rename to meta/recipes-support/enchant/enchant2_2.2.9.bb
index 4ddbe55da5..784fd14ee1 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.8.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.9.bb
@@ -9,8 +9,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[md5sum] = "c7b9d6a392ecb8758e499f783e8dc883"
-SRC_URI[sha256sum] = "c7b5e2853f0dd0b1aafea2f9e071941affeec3a76df8e3f6d67a718c89293555"
+SRC_URI[sha256sum] = "b29a3d2273f5edcbdbbb565e94bfd8ea3f9526886fcb6327b4b0f72f0d722f3c"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.17.1


--===============8635663637051312962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.2.8 [default] to 2.2.9 [default]
packages/core2-32-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-dbg: PV changed from "2.2.8" to "2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.2.8 [default] to 2.2.9 [default]
packages/core2-32-poky-linux/enchant2/enchant2-dev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-dev: PV changed from "2.2.8" to "2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.2.8 [default] to 2.2.9 [default]
packages/core2-32-poky-linux/enchant2/enchant2-doc: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-doc: PV changed from "2.2.8" to "2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.2.8 [default] to 2.2.9 [default]
packages/core2-32-poky-linux/enchant2/enchant2-locale: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-locale: PV changed from "2.2.8" to "2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-src: PKGV changed from 2.2.8 [default] to 2.2.9 [default]
packages/core2-32-poky-linux/enchant2/enchant2-src: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-src: PV changed from "2.2.8" to "2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.2.8 [default] to 2.2.9 [default]
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.2.8" to "2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2: PKGV changed from 2.2.8 [default] to 2.2.9 [default]
packages/core2-32-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.8", added "/usr/lib/libenchant-2.so.2.2.9"
packages/core2-32-poky-linux/enchant2/enchant2: PV changed from "2.2.8" to "2.2.9"
packages/core2-32-poky-linux/enchant2: PKGV changed from 2.2.8 [default] to 2.2.9 [default]
packages/core2-32-poky-linux/enchant2: PV changed from "2.2.8" to "2.2.9"
Changes to packages/core2-32-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.2.8 to libenchant-2.so.2.2.9
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.2.8 to libenchant-2.so.2.2.9
  /usr/lib/libenchant-2.so.2.2.8 moved to /usr/lib/libenchant-2.so.2.2.9

--===============8635663637051312962==--
