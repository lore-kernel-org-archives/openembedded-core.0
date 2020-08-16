Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.19683.1597558987888493466
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD3A0E02028; Sat, 15 Aug 2020 23:23:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46922E02092
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:45 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.33.0 SUCCEEDED
Message-Id: <20200816062307.BD3A0E02028@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:23:07 -0700 (PDT)
X-Groupsio-MsgNum: 141526
Content-Type: multipart/mixed; boundary="===============3677690202285790782=="

--===============3677690202285790782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sqlite3* to *3.33.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.32.3-3.33.0.patch
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

--===============3677690202285790782==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.32.3-3.33.0.patch"

From 828ef108cfaae8cdf9a14fb1e12ad3f24f559e34 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 06:19:34 +0000
Subject: [PATCH] sqlite3: upgrade 3.32.3 -> 3.33.0

---
 .../sqlite/{sqlite3_3.32.3.bb => sqlite3_3.33.0.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.32.3.bb => sqlite3_3.33.0.bb} (68%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.32.3.bb b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
similarity index 68%
rename from meta/recipes-support/sqlite/sqlite3_3.32.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.33.0.bb
index 1d4e8d4772..611a1bd923 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.32.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
@@ -4,8 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[md5sum] = "2e3911a3c15e85c2f2d040154bbe5ce3"
-SRC_URI[sha256sum] = "a31507123c1c2e3a210afec19525fd7b5bb1e19a6a34ae5b998fbd7302568b66"
+SRC_URI[sha256sum] = "106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc738b7ca294d6956bbb15"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.17.1


--===============3677690202285790782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sqlite3: PV changed from "3.32.3" to "3.33.0"
packages/core2-32-poky-linux/sqlite3: PKGV changed from 3.32.3 [default] to 3.33.0 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.32.3" to "3.33.0"
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.32.3 [default] to 3.33.0 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PKGSIZE changed from 616740 to 616116 (-0%)
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.32.3" to "3.33.0"
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.32.3 [default] to 3.33.0 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.32.3" to "3.33.0"
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.32.3 [default] to 3.33.0 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3: PV changed from "3.32.3" to "3.33.0"
packages/core2-32-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.32.3 [default] to 3.33.0 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3: PKGSIZE changed from 1362659 to 1370851 (+1%)
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.32.3" to "3.33.0"
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.32.3 [default] to 3.33.0 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 5366048 to 5455016 (+2%)
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PV changed from "3.32.3" to "3.33.0"
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.32.3 [default] to 3.33.0 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 9305155 to 9355305 (+1%)
packages/core2-32-poky-linux/sqlite3/sqlite3: PV changed from "3.32.3" to "3.33.0"
packages/core2-32-poky-linux/sqlite3/sqlite3: PKGV changed from 3.32.3 [default] to 3.33.0 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3: PKGSIZE changed from 239500 to 255884 (+7%)
Changes to packages/x86_64-linux/binutils-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-musl-binutils was added
  /usr/bin/i686-poky-linux-musl was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-addr2line was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ar was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-as was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++filt was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-dwp was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-elfedit was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gprof was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.bfd was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.gold was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-nm was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objcopy was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objdump was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ranlib was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-readelf was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-size was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strings was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strip was added
  /usr/lib/i686-poky-linux-musl was added
  /usr/lib/i686-poky-linux-musl/ldscripts was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xwe was added
  /sysroot-providers/virtual_i686-poky-linux-binutils was removed
  /usr/bin/i686-poky-linux was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-addr2line was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ar was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-as was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-c++filt was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-dwp was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-elfedit was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-gprof was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.bfd was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.gold was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-nm was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objcopy was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objdump was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ranlib was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-readelf was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-size was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strings was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strip was removed
  /usr/lib/i686-poky-linux was removed
  /usr/lib/i686-poky-linux/ldscripts was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xwe was removed

--===============3677690202285790782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/binutils-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-musl-binutils was added
  /usr/bin/i686-poky-linux-musl was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-addr2line was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ar was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-as was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++filt was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-dwp was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-elfedit was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gprof was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.bfd was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.gold was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-nm was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objcopy was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objdump was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ranlib was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-readelf was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-size was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strings was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strip was added
  /usr/lib/i686-poky-linux-musl was added
  /usr/lib/i686-poky-linux-musl/ldscripts was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xwe was added
  /sysroot-providers/virtual_i686-poky-linux-binutils was removed
  /usr/bin/i686-poky-linux was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-addr2line was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ar was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-as was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-c++filt was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-dwp was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-elfedit was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-gprof was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.bfd was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.gold was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-nm was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objcopy was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objdump was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ranlib was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-readelf was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-size was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strings was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strip was removed
  /usr/lib/i686-poky-linux was removed
  /usr/lib/i686-poky-linux/ldscripts was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xwe was removed

--===============3677690202285790782==--
