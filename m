Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C9AC18E72
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:08 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.13603.1713248040327259582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fiqr5tdN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=f15+BoKQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018ee58a7540-fab0cdb8-d3ac-44a2-9dce-18b8aed353b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WESYw8CeMyGG4D4CKi/ueO65A6HA0C1fZIfZlUGF2os=;
	b=fiqr5tdNAyKvE63CSMIUttfpkHEuaoZI7pMe7QEoqB6pYPyVNWY+lpXsRLICrLOL
	1ktFeDlGI0VojE2gFpRYtPxgf+5klpWQGfREKYb8A/Nv8z3UIVLSZYpGXBspb1VcQMw
	i8/eG5rGPOCs8r+o7VRWvYQzCwGhY+WfI1UG54U0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WESYw8CeMyGG4D4CKi/ueO65A6HA0C1fZIfZlUGF2os=;
	b=f15+BoKQHOBoTlT1MUZwtDiU9CbPHiF0h00TUH4NgX3ATSZJYHsA192RBrO8A/v3
	UtWIL1fKM7HgJKiNAUok1rd5zQFqmgkWTlG/ycNcT9vCV9CGLhwLb07yja6UoFBWkdf
	yCM4CZqiF+68aoxEzUHGS8HFXNYsV3ricaouFvK8=
Content-Type: multipart/mixed; boundary="===============9159167478190636686=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xmlto: upgrading to 0cd33d166e95c7b76a7de6c2bdd052681004bb8a
 SUCCEEDED
Message-ID: <0101018ee58a7540-fab0cdb8-d3ac-44a2-9dce-18b8aed353b4-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198327

--===============9159167478190636686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xmlto* to *0cd33d166e95c7b76a7de6c2bdd052681004bb8a* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xmlto-upgrade-to-latest-revision.patch
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

-- >8 --
From 4514a56f076790ac28fa2f9d2e55cc962315f08f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 21:29:49 +0000
Subject: [PATCH] xmlto: upgrade to latest revision

---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index d5a0e69849..8fdda9c327 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRCREV = "6fa6a0e07644f20abf2596f78a60112713e11cbe"
+SRCREV = "0cd33d166e95c7b76a7de6c2bdd052681004bb8a"
 UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============9159167478190636686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xmlto/xmlto-dbg: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-dev: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-dev: RRECOMMENDS: removed "xmlto (['= 0.0.28+0.0.29+git0+6fa6a0e076-r0'])", added "xmlto (['= 0.0.28+0.0.29+git0+0cd33d166e-r0'])"
packages/core2-64-poky-linux/xmlto/xmlto-doc: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-locale: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-src: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-staticdev: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-staticdev: RDEPENDS: removed "xmlto-dev (['= 0.0.28+0.0.29+git0+6fa6a0e076-r0'])", added "xmlto-dev (['= 0.0.28+0.0.29+git0+0cd33d166e-r0'])"
packages/core2-64-poky-linux/xmlto/xmlto: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
Changes to packages/x86_64-linux/binutils-cross-x86_64 (sysroot):
  /sysroot-providers/virtual_x86_64-poky-linux-binutils was added
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-addr2line was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-as was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++filt was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-dwp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-elfedit was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gprof was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.bfd was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.gold was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objcopy was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-readelf was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-size was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strings was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/libdep.so was added
  /usr/lib/x86_64-poky-linux/ldscripts was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/stamp was added
  /sysroot-providers/virtual_x86_64-poky-linux-musl-binutils was removed
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-addr2line was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-as was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++filt was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-dwp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-elfedit was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gprof was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.gold was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objcopy was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objdump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-readelf was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-size was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strings was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/libdep.so was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/stamp was removed

--===============9159167478190636686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a02ce6052e8ec55bb7f883b63042b6bd3c4f9da2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a02ce6052e8ec55bb7f883b63042b6bd3c4f9da2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 442 Local 434 Mirrors 0 Missed 8 Current 445 (98% match, 99% complete)
Removing 6 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 485 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 486 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 487 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 488 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 494 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: Running setscene task 653 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 685 of 887 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 686 of 887 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_create_spdx_setscene)
NOTE: recipe docbook-xml-dtd4-4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-1.79.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xml-dtd4-4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-1.79.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 756 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xmlto/0.0.28+0.0.29+git/temp/log.do_packagedata_setscene.4071913
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 777 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 840 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 843 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 847 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 854 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 861 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 887 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: Running task 1441 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_fetch: Succeeded
NOTE: Running task 2103 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_unpack)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_unpack: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_unpack: Succeeded
NOTE: Running task 2473 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_packagedata)
NOTE: Running task 2474 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_collect_spdx_deps)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata: Succeeded
NOTE: Running task 2477 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_spdx)
NOTE: Running task 2478 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_ipk)
NOTE: Running task 2479 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_deb)
NOTE: Running task 2480 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_rpm)
NOTE: Running task 2481 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_spdx: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_ipk: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_deb: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_rpm: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_qa: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2482 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_runtime_spdx)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_runtime_spdx: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa unihash changed to 8f471434a9939dcd727ec3773c6c1ca57e4516dcf8da17a0b4f0226b6e927cd4
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_deb: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2483 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_build)
NOTE: Tasks Summary: Attempted 2483 tasks of which 2472 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_packagedata_setscene: QA Issue: Package version for package xmlto-src went backwards which would break package feeds (from 0:0.0.28+0.0.29+git0+6fa6a0e076-r0 to 0:0.0.28+0.0.29+git0+0cd33d166e-r0) [version-going-backwards]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_packagedata_setscene: QA Issue: Package version for package xmlto-dbg went backwards which would break package feeds (from 0:0.0.28+0.0.29+git0+6fa6a0e076-r0 to 0:0.0.28+0.0.29+git0+0cd33d166e-r0) [version-going-backwards]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_packagedata_setscene: QA Issue: Package version for package xmlto-staticdev went backwards which would break package feeds (from 0:0.0.28+0.0.29+git0+6fa6a0e076-r0 to 0:0.0.28+0.0.29+git0+0cd33d166e-r0) [version-going-backwards]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_packagedata_setscene: QA Issue: Package version for package xmlto-dev went backwards which would break package feeds (from 0:0.0.28+0.0.29+git0+6fa6a0e076-r0 to 0:0.0.28+0.0.29+git0+0cd33d166e-r0) [version-going-backwards]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_packagedata_setscene: QA Issue: Package version for package xmlto-doc went backwards which would break package feeds (from 0:0.0.28+0.0.29+git0+6fa6a0e076-r0 to 0:0.0.28+0.0.29+git0+0cd33d166e-r0) [version-going-backwards]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_packagedata_setscene: QA Issue: Package version for package xmlto-locale went backwards which would break package feeds (from 0:0.0.28+0.0.29+git0+6fa6a0e076-r0 to 0:0.0.28+0.0.29+git0+0cd33d166e-r0) [version-going-backwards]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_packagedata_setscene: QA Issue: Package version for package xmlto went backwards which would break package feeds (from 0:0.0.28+0.0.29+git0+6fa6a0e076-r0 to 0:0.0.28+0.0.29+git0+0cd33d166e-r0) [version-going-backwards]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9159167478190636686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xmlto/xmlto-dbg: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-dev: RRECOMMENDS: removed "xmlto (['= 0.0.28+0.0.29+git0+6fa6a0e076-r0'])", added "xmlto (['= 0.0.28+0.0.29+git0+0cd33d166e-r0'])"
packages/core2-64-poky-linux/xmlto/xmlto-dev: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-doc: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-locale: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-src: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto-staticdev: RDEPENDS: removed "xmlto-dev (['= 0.0.28+0.0.29+git0+6fa6a0e076-r0'])", added "xmlto-dev (['= 0.0.28+0.0.29+git0+0cd33d166e-r0'])"
packages/core2-64-poky-linux/xmlto/xmlto-staticdev: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
packages/core2-64-poky-linux/xmlto/xmlto: PKGSIZE changed from 75691 to 75814 (+0%)
packages/core2-64-poky-linux/xmlto/xmlto: PKGV changed from 0.0.28+0.0.29+git0+6fa6a0e076 to 0.0.28+0.0.29+git0+0cd33d166e
Changes to packages/x86_64-linux/binutils-cross-x86_64 (sysroot):
  /sysroot-providers/virtual_x86_64-poky-linux-binutils was added
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-addr2line was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-as was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++filt was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-dwp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-elfedit was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gprof was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.bfd was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.gold was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objcopy was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-readelf was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-size was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strings was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/libdep.so was added
  /usr/lib/x86_64-poky-linux/ldscripts was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/stamp was added
  /sysroot-providers/virtual_x86_64-poky-linux-musl-binutils was removed
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-addr2line was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-as was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++filt was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-dwp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-elfedit was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gprof was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.gold was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objcopy was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objdump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-readelf was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-size was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strings was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/libdep.so was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/stamp was removed

--===============9159167478190636686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 35 recipes from the core2-64 sysroot...done.
Removing 86 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a02ce6052e8ec55bb7f883b63042b6bd3c4f9da2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a02ce6052e8ec55bb7f883b63042b6bd3c4f9da2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 571 Local 557 Mirrors 0 Missed 14 Current 237 (97% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 238 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 239 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 240 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 243 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 244 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 257 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 258 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 259 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 260 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_spdx_setscene)
NOTE: Running setscene task 265 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_lic_setscene)
NOTE: Running setscene task 268 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: recipe docbook-xml-dtd4-4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-1.79.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe btrfs-tools-6.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xml-dtd4-4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 269 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_packagedata_setscene)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 270 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb_setscene)
NOTE: recipe docbook-xsl-stylesheets-1.79.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 271 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_packagedata_setscene)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 272 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_packagedata_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/btrfs-tools/6.7.1/temp/log.do_packagedata_setscene.4074798
NOTE: Running setscene task 276 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 277 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 278 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb:do_package_setscene)
NOTE: recipe docbook-xml-dtd4-4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe iproute2-6.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-1.79.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe docbook-xml-dtd4-4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-1.79.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_setscene)
NOTE: Running setscene task 290 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 303 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_deploy_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 324 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_package_write_deb_setscene)
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 325 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.6.23+git-r0: task do_deploy_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 353 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_package_write_ipk_setscene)
NOTE: recipe btrfs-tools-6.7.1-r0: task do_package_setscene: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 387 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 388 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 466 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 467 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 490 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.4.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 496 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 497 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 511 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 512 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 517 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 532 of 808 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 534 of 808 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 540 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 543 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 544 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 548 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 549 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe btrfs-tools-6.7.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 554 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-6.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 562 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 569 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 588 of 808 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_recipe_qa_setscene)
NOTE: recipe btrfs-tools-6.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 808 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 629 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: Running task 797 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_fetch)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 893 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 943 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 633 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.6.23+git-r0: task do_deploy_setscene: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_fetch: Started
NOTE: Running setscene task 638 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1152 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1153 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1202 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.6.23+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1275 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1286 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1293 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running setscene task 651 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1294 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1295 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_patch)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1296 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1297 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_patch)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 696 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_patch: Succeeded
NOTE: Running task 1347 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 707 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1363 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 718 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.6.23+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-6.6.23+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-yocto-6.6.23+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 793 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 800 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 808 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1809 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1975 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2161 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb:do_packagedata)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.7.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2225 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_configure)
NOTE: recipe btrfs-tools-6.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_configure: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2226 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_configure)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_configure: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_compile)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_compile: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_install)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_install: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_configure: Succeeded
NOTE: Running task 2232 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2233 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_compile)
NOTE: recipe coreutils-9.4-r0: task do_compile: Started
NOTE: recipe coreutils-9.4-r0: task do_compile: Succeeded
NOTE: Running task 2234 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.4-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2235 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_install)
NOTE: recipe coreutils-9.4-r0: task do_install: Started
NOTE: recipe coreutils-9.4-r0: task do_install: Succeeded
NOTE: Running task 2236 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.4-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2240 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package_write_ipk)
NOTE: Running task 2242 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package_write_deb)
NOTE: Running task 2243 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package_write_rpm)
NOTE: Running task 2250 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_ipk)
NOTE: Running task 2251 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_deb)
NOTE: Running task 2252 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_rpm)
NOTE: Running task 2253 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa)
NOTE: Running task 2254 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_runtime_spdx)
NOTE: recipe coreutils-9.4-r0: task do_populate_sysroot: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_ipk: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_deb: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_rpm: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.39.3-r0: task do_package_write_deb: Started
NOTE: recipe util-linux-2.39.3-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.39.3-r0: task do_package_write_ipk: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_runtime_spdx: Started
NOTE: recipe coreutils-9.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2255 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_sysroot)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa unihash changed to 71827422e7bc713ec19af785cbe81e8ac9083ab4c32ad53358bdde37f3767bea
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_deb: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2256 of 2256 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_build)
NOTE: Tasks Summary: Attempted 2256 tasks of which 2218 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.8-r0 to 0:6.7.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.8-r0 to 0:6.7.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.8-r0 to 0:6.7.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.8-r0 to 0:6.7.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.8-r0 to 0:6.7.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.8-r0 to 0:6.7.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.8-r0 to 0:6.7.1-r0) [version-going-backwards]
ERROR: btrfs-tools-6.7.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9159167478190636686==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xmlto-upgrade-to-latest-revision.patch"

RnJvbSA0NTE0YTU2ZjA3Njc5MGFjMjhmYTJmOWQyZTU1Y2M5NjIzMTVmMDhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjE6Mjk6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
bWx0bzogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3htbHRvL3htbHRvXzAuMC4yOC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy94bWx0by94bWx0b18wLjAuMjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMveG1sdG8veG1s
dG9fMC4wLjI4LmJiCmluZGV4IGQ1YTBlNjk4NDkuLjhmZGRhOWMzMjcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy94bWx0by94bWx0b18wLjAuMjguYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3htbHRvL3htbHRvXzAuMC4yOC5iYgpAQCAtNiw3ICs2LDcgQEAgTElDRU5T
RSA9ICJHUEwtMi4wLW9ubHkiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTU5NTMwYmRmMzM2NTliMjllNzNkNGFkYjlmOWY2NTUyIgogCi1TUkNSRVYgPSAiNmZhNmEw
ZTA3NjQ0ZjIwYWJmMjU5NmY3OGE2MDExMjcxM2UxMWNiZSIKK1NSQ1JFViA9ICIwY2QzM2QxNjZl
OTVjN2I3NmE3ZGU2YzJiZGQwNTI2ODEwMDRiYjhhIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9
ICIxIgogU1JDX1VSSSA9ICJnaXQ6Ly9wYWd1cmUuaW8veG1sdG8uZ2l0O3Byb3RvY29sPWh0dHBz
O2JyYW5jaD1tYXN0ZXIiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi40Mi4wCgo=

--===============9159167478190636686==--

