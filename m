Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEE6CCA473
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.4408.1655298222837395500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KqvI7fwt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101018167766781-8cf740eb-9dda-4769-985e-95a0162a3b0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qEwH/RsbqhV4jgPvDNweuTSgoBWCM8hrQZTEaWJgSD8=;
	b=KqvI7fwt5Uhzg8GtEQ25QCouZEvYTVmFxiHqd/LOOmwsCV1sV0gx4pFRi4jbZ8w6
	mX/kJi/I8XRjwZwGT1NNQ4FF8x+yvRleJX2BdgWF/+uDXpzpndfiauIbOPqp+FgDAOF
	t0HO2qg7GzaoIBZfLiMangrV2JtMymYbB3ahT530=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qEwH/RsbqhV4jgPvDNweuTSgoBWCM8hrQZTEaWJgSD8=;
	b=NMnTtQRQ4tlFjJzHKmk24eg974iwtcVWwIBCp1pqu4NGkpbWtn2ap8DxKQmPVcNA
	HH/k0hRTvympqzTlVcY/2kc2hkL/u2XzKdqFBZGyqTwO3nsnTeH5kXOh1WSulS2ThJL
	D5O7o7GOI46+hj6Ff8t5W0quYdIg8/TJDJNMel1A=
Content-Type: multipart/mixed; boundary="===============7517942598298595218=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] x264: upgrading to baee400fa9ced6f5481a728138fed6e867b0ff7f
 SUCCEEDED
Message-ID: 
 <0101018167766781-8cf740eb-9dda-4769-985e-95a0162a3b0d-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166980

--===============7517942598298595218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *x264* to *baee400fa9ced6f5481a728138fed6e867b0ff7f* has Succeeded.

Next steps:
    - apply the patch: git am 0001-x264-upgrade-to-latest-revision.patch
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
--===============7517942598298595218==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-x264-upgrade-to-latest-revision.patch"

From 3862fd001ff86e315a392336edf349d0dc9de558 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 12:47:24 +0000
Subject: [PATCH] x264: upgrade to latest revision

---
 meta/recipes-multimedia/x264/x264_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 51ae9d1179..3df5104f30 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "nasm-native"
 
-SRC_URI = "git://github.com/mirror/x264;branch=stable;protocol=https \
+SRC_URI = "git://github.com/mirror/x264;branch=master;protocol=https \
            file://don-t-default-to-cortex-a9-with-neon.patch \
            file://Fix-X32-build-by-disabling-asm.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "5db6aa6cab1b146e07b60cc1736a01f21da01154"
+SRCREV = "baee400fa9ced6f5481a728138fed6e867b0ff7f"
 
 PV = "r3039+git${SRCPV}"
 
-- 
2.31.1


--===============7517942598298595218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/x264: PKGV changed from r3039+gitAUTOINC+5db6aa6cab [default] to r3039+gitAUTOINC+baee400fa9 [default]
packages/core2-32-poky-linux/x264: SRC_URI changed from "git://github.com/mirror/x264;branch=stable;protocol=https file://don-t-default-to-cortex-a9-with-neon.patch file://Fix-X32-build-by-disabling-asm.patch" to "git://github.com/mirror/x264;branch=master;protocol=https file://don-t-default-to-cortex-a9-with-neon.patch file://Fix-X32-build-by-disabling-asm.patch"
packages/core2-32-poky-linux/x264: PV changed from "r3039+gitAUTOINC+5db6aa6cab" to "r3039+gitAUTOINC+baee400fa9"
Changes to packages/core2-32-poky-linux/x264 (sysroot):
  /usr/lib/libx264.so changed symlink target from libx264.so.163 to libx264.so.164
  /usr/lib/libx264.so.163 moved to /usr/lib/libx264.so.164
packages/core2-32-poky-linux/x264/x264-bin: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-bin: PKGSIZE changed from 1594128 to 1602320 (+1%)
packages/core2-32-poky-linux/x264/x264-bin: PV changed from "r3039+gitAUTOINC+5db6aa6cab" to "r3039+gitAUTOINC+baee400fa9"
packages/core2-32-poky-linux/x264/x264-dbg: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-dbg: FILELIST: removed "/usr/lib/.debug/libx264.so.163", added "/usr/lib/.debug/libx264.so.164"
packages/core2-32-poky-linux/x264/x264-dbg: PKGSIZE changed from 10500480 to 10508188 (+0%)
packages/core2-32-poky-linux/x264/x264-dbg: PV changed from "r3039+gitAUTOINC+5db6aa6cab" to "r3039+gitAUTOINC+baee400fa9"
packages/core2-32-poky-linux/x264/x264-dev: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-dev: PKGSIZE changed from 49167 to 49168 (+0%)
packages/core2-32-poky-linux/x264/x264-dev: PV changed from "r3039+gitAUTOINC+5db6aa6cab" to "r3039+gitAUTOINC+baee400fa9"
packages/core2-32-poky-linux/x264/x264-doc: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-doc: PV changed from "r3039+gitAUTOINC+5db6aa6cab" to "r3039+gitAUTOINC+baee400fa9"
packages/core2-32-poky-linux/x264/x264-locale: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-locale: PV changed from "r3039+gitAUTOINC+5db6aa6cab" to "r3039+gitAUTOINC+baee400fa9"
packages/core2-32-poky-linux/x264/x264-src: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-src: FILELIST: directory renamed /usr/src/debug/x264/r3039+gitAUTOINC+5db6aa6cab-r0/git/common/x86 -> /usr/src/debug/x264/r3039+gitAUTOINC+baee400fa9-r0/git/common/x86, directory renamed /usr/src/debug/x264/r3039+gitAUTOINC+5db6aa6cab-r0/git -> /usr/src/debug/x264/r3039+gitAUTOINC+baee400fa9-r0/git, directory renamed /usr/src/debug/x264/r3039+gitAUTOINC+5db6aa6cab-r0/git/filters/video -> /usr/src/debug/x264/r3039+gitAUTOINC+baee400fa9-r0/git/filters/video, directory renamed /usr/src/debug/x264/r3039+gitAUTOINC+5db6aa6cab-r0/git/input -> /usr/src/debug/x264/r3039+gitAUTOINC+baee400fa9-r0/git/input, directory renamed /usr/src/debug/x264/r3039+gitAUTOINC+5db6aa6cab-r0/git/encoder -> /usr/src/debug/x264/r3039+gitAUTOINC+baee400fa9-r0/git/encoder, directory renamed /usr/src/debug/x264/r3039+gitAUTOINC+5db6aa6cab-r0/git/filters -> /usr/src/debug/x264/r3039+gitAUTOINC+baee400fa9-r0/git/filters, directory renamed /usr/src/debug/x264/r3039+gitAUTOINC+5db
 6aa6cab-r0/git/common -> /usr/src/debug/x264/r3039+gitAUTOINC+baee400fa9-r0/git/common, directory renamed /usr/src/debug/x264/r3039+gitAUTOINC+5db6aa6cab-r0/git/output -> /usr/src/debug/x264/r3039+gitAUTOINC+baee400fa9-r0/git/output, removed "/usr/src/debug/x264/r3039+gitAUTOINC+5db6aa6cab-r0/git/extras/avxsynth_c.h", added "/usr/src/debug/x264/r3039+gitAUTOINC+baee400fa9-r0/git/extras/avisynth_c.h"
packages/core2-32-poky-linux/x264/x264-src: PKGSIZE changed from 1991899 to 2040934 (+2%)
packages/core2-32-poky-linux/x264/x264-src: PV changed from "r3039+gitAUTOINC+5db6aa6cab" to "r3039+gitAUTOINC+baee400fa9"
packages/core2-32-poky-linux/x264/x264-staticdev: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-staticdev: PKGSIZE changed from 5865276 to 5871072 (+0%)
packages/core2-32-poky-linux/x264/x264-staticdev: PV changed from "r3039+gitAUTOINC+5db6aa6cab" to "r3039+gitAUTOINC+baee400fa9"
packages/core2-32-poky-linux/x264/x264: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264: FILELIST: removed "/usr/lib/libx264.so.163", added "/usr/lib/libx264.so.164"
packages/core2-32-poky-linux/x264/x264: PKGSIZE changed from 1451728 to 1455824 (+0%)
packages/core2-32-poky-linux/x264/x264: PKG changed from libx264-163 to libx264-164
packages/core2-32-poky-linux/x264/x264: PV changed from "r3039+gitAUTOINC+5db6aa6cab" to "r3039+gitAUTOINC+baee400fa9"

--===============7517942598298595218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/x264 (sysroot):
  /usr/lib/libx264.so changed symlink target from libx264.so.163 to libx264.so.164
  /usr/lib/libx264.so.163 moved to /usr/lib/libx264.so.164
packages/core2-32-poky-linux/x264/x264-bin: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-dbg: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-dev: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-doc: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-locale: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-src: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264-staticdev: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9
packages/core2-32-poky-linux/x264/x264: FILELIST: removed "/usr/lib/libx264.so.163", added "/usr/lib/libx264.so.164"
packages/core2-32-poky-linux/x264/x264: PKG changed from libx264-163 to libx264-164
packages/core2-32-poky-linux/x264/x264: PKGV changed from r3039+git0+5db6aa6cab to r3039+git0+baee400fa9

--===============7517942598298595218==--

