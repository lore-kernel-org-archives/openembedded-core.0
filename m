Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19871.1597558925655527534
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 837BBE02037; Sat, 15 Aug 2020 23:22:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61927E02074
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:43 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libx11: upgrading to 1.6.11 SUCCEEDED
Message-Id: <20200816062205.837BBE02037@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:05 -0700 (PDT)
X-Groupsio-MsgNum: 141510
Content-Type: multipart/mixed; boundary="===============4978805074829551104=="

--===============4978805074829551104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libx11* to *1.6.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libx11-upgrade-1.6.9-1.6.11.patch
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

--===============4978805074829551104==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libx11-upgrade-1.6.9-1.6.11.patch"

From 0b036f92846dcd3cda9750030b9fdef444b2ba41 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 02:09:54 +0000
Subject: [PATCH] libx11: upgrade 1.6.9 -> 1.6.11

---
 .../xorg-lib/{libx11_1.6.9.bb => libx11_1.6.11.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.9.bb => libx11_1.6.11.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.11.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.6.11.bb
index ff60a4240c..da47a6d9ec 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.11.bb
@@ -14,8 +14,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://disable_tests.patch \
             file://libx11-whitespace.patch"
 
-SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-SRC_URI[sha256sum] = "9cc7e8d000d6193fa5af580d50d689380b8287052270f5bb26a5fb6b58b2bed1"
+SRC_URI[sha256sum] = "b1cc4b802058be7e3fb438ee2490f66fcc52ac3b2a14f47a22cbf77638e33606"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.17.1


--===============4978805074829551104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libx11: PV changed from "1.6.9" to "1.6.11"
packages/core2-32-poky-linux/libx11: PKGV changed from 1.6.9 [default] to 1.6.11 [default]
packages/core2-32-poky-linux/libx11/libx11-dbg: PV changed from "1.6.9" to "1.6.11"
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGV changed from 1.6.9 [default] to 1.6.11 [default]
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGSIZE changed from 11172004 to 11176772 (+0%)
packages/core2-32-poky-linux/libx11/libx11-dev: PV changed from "1.6.9" to "1.6.11"
packages/core2-32-poky-linux/libx11/libx11-dev: PKGV changed from 1.6.9 [default] to 1.6.11 [default]
packages/core2-32-poky-linux/libx11/libx11-dev: PKGSIZE changed from 253665 to 253735 (+0%)
packages/core2-32-poky-linux/libx11/libx11-doc: PV changed from "1.6.9" to "1.6.11"
packages/core2-32-poky-linux/libx11/libx11-doc: PKGV changed from 1.6.9 [default] to 1.6.11 [default]
packages/core2-32-poky-linux/libx11/libx11-doc: PKGSIZE changed from 1997617 to 1998891 (+0%)
packages/core2-32-poky-linux/libx11/libx11-locale: PV changed from "1.6.9" to "1.6.11"
packages/core2-32-poky-linux/libx11/libx11-locale: PKGV changed from 1.6.9 [default] to 1.6.11 [default]
packages/core2-32-poky-linux/libx11/libx11-locale: PKGSIZE changed from 1233129 to 1235627 (+0%)
packages/core2-32-poky-linux/libx11/libx11-src: PV changed from "1.6.9" to "1.6.11"
packages/core2-32-poky-linux/libx11/libx11-src: PKGV changed from 1.6.9 [default] to 1.6.11 [default]
packages/core2-32-poky-linux/libx11/libx11-src: PKGSIZE changed from 5411625 to 5415503 (+0%)
packages/core2-32-poky-linux/libx11/libx11-staticdev: PV changed from "1.6.9" to "1.6.11"
packages/core2-32-poky-linux/libx11/libx11-staticdev: PKGV changed from 1.6.9 [default] to 1.6.11 [default]
packages/core2-32-poky-linux/libx11/libx11-xcb: PV changed from "1.6.9" to "1.6.11"
packages/core2-32-poky-linux/libx11/libx11-xcb: PKGV changed from 1.6.9 [default] to 1.6.11 [default]
packages/core2-32-poky-linux/libx11/libx11: PV changed from "1.6.9" to "1.6.11"
packages/core2-32-poky-linux/libx11/libx11: PKGV changed from 1.6.9 [default] to 1.6.11 [default]
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

--===============4978805074829551104==
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

--===============4978805074829551104==--
