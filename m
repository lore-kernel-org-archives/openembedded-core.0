Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16609.1598724128016620263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE24FE020DD; Sat, 29 Aug 2020 11:02:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9561E020DC
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:56 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 246.3 SUCCEEDED
Message-Id: <20200829180207.DE24FE020DD@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:07 -0700 (PDT)
X-Groupsio-MsgNum: 141948
Content-Type: multipart/mixed; boundary="===============5314254746258094344=="

--===============5314254746258094344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *246.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-246.2-246.3.patch
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

--===============5314254746258094344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 779 .bb files complete (0 cached, 779 parsed). 1341 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5314254746258094344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 779 .bb files complete (0 cached, 779 parsed). 1341 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host arm-poky-linux-gnueabi (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5314254746258094344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 779 .bb files complete (0 cached, 779 parsed). 1341 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5314254746258094344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PKGV changed from 246.2 [default] to 246.3 [default]
packages/core2-32-poky-linux/systemd-boot: PV changed from "246.2" to "246.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 246.2 [default] to 246.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "246.2" to "246.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 246.2 [default] to 246.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "246.2" to "246.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 246.2 [default] to 246.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "246.2" to "246.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 246.2 [default] to 246.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "246.2" to "246.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 246.2 [default] to 246.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "246.2" to "246.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 246.2 [default] to 246.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "246.2" to "246.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 246.2 [default] to 246.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "246.2" to "246.3"

--===============5314254746258094344==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-246.2-246.3.patch"

From c6ca2b774da6c6a7ed158ccf6ecdd76f91fedc6b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 29 Aug 2020 12:17:02 +0000
Subject: [PATCH] systemd-boot: upgrade 246.2 -> 246.3

---
 .../systemd/{systemd-boot_246.2.bb => systemd-boot_246.3.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_246.2.bb => systemd-boot_246.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_246.2.bb b/meta/recipes-core/systemd/systemd-boot_246.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_246.2.bb
rename to meta/recipes-core/systemd/systemd-boot_246.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index b0d4fe4033..6b7aa7a73d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "91b37e6f0982e1e64c63017000248d7441a83a2e"
+SRCREV = "b7cef386bd1bc810f5bb12d84c2ec4d6428231e3"
 SRCBRANCH = "v246-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
-- 
2.17.1


--===============5314254746258094344==--
