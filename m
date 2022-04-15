Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427BEC3A589
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11651.1650052687066460387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Tqc817qF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101802ecde862-beba6182-16cc-4d4e-af04-b8a33333f1b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6soihKZU8sbB9eSVw6sBYPtft1dJsVL7aEYn+RGnOHY=;
	b=Tqc817qFO82ep9IB6u9/MrkrF7JTvoayFkH0e3E3m+TEVtvLbz+eai4bc4jD6Jnq
	k0A80K4/JMKSaLB+RLqF2otWyZlZ46GOkYM5NrwL1UoJfZwuje+6FNQ6BTZwjVWcigv
	iDMEKg/gNfpatLwrqhsGUhB2951LoC3oFkhz1c1k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6soihKZU8sbB9eSVw6sBYPtft1dJsVL7aEYn+RGnOHY=;
	b=JV90NjCeobpCZ57Am6AK9TfbfTsS03Iun+EPVoYGIcTU7rNUBkolhWekyuJREErS
	QRsBQoxAud1bIvveB6aOeBZS+aTxKtPEWghJVLNLjcxHGLtymrFMbVWRDK9jJZa2BPr
	bOgULycnnd0M+BBZvOk+PbEsQu9mebXE+YjwLugA=
Content-Type: multipart/mixed; boundary="===============6255594376841805885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libaio: upgrading to 0.3.113 SUCCEEDED
Message-ID: 
 <010101802ecde862-beba6182-16cc-4d4e-af04-b8a33333f1b8-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:08 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164481

--===============6255594376841805885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libaio* to *0.3.113* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libaio-upgrade-0.3.112-0.3.113.patch
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
--===============6255594376841805885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libaio/libaio: FILELIST: removed "/usr/lib/libaio.so.1.0.1", added "/usr/lib/libaio.so.1.0.2"
Changes to packages/core2-32-poky-linux/libaio (sysroot):
  /usr/lib/libaio.so.1 changed symlink target from libaio.so.1.0.1 to libaio.so.1.0.2
  /usr/lib/libaio.so changed symlink target from libaio.so.1.0.1 to libaio.so.1.0.2
  /usr/lib/libaio.so.1.0.1 moved to /usr/lib/libaio.so.1.0.2

--===============6255594376841805885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libaio: PV changed from "0.3.112" to "0.3.113"
packages/core2-32-poky-linux/libaio: PKGV changed from 0.3.112 [default] to 0.3.113 [default]
packages/core2-32-poky-linux/libaio/libaio-dbg: PV changed from "0.3.112" to "0.3.113"
packages/core2-32-poky-linux/libaio/libaio-dbg: PKGV changed from 0.3.112 [default] to 0.3.113 [default]
packages/core2-32-poky-linux/libaio/libaio-dbg: PKGSIZE changed from 21372 to 21720 (+2%)
packages/core2-32-poky-linux/libaio/libaio-dbg: FILELIST: removed "/usr/lib/.debug/libaio.so.1.0.1", added "/usr/lib/.debug/libaio.so.1.0.2"
packages/core2-32-poky-linux/libaio/libaio-dev: PV changed from "0.3.112" to "0.3.113"
packages/core2-32-poky-linux/libaio/libaio-dev: PKGV changed from 0.3.112 [default] to 0.3.113 [default]
packages/core2-32-poky-linux/libaio/libaio-dev: PKGSIZE changed from 8952 to 9075 (+1%)
packages/core2-32-poky-linux/libaio/libaio-doc: PV changed from "0.3.112" to "0.3.113"
packages/core2-32-poky-linux/libaio/libaio-doc: PKGV changed from 0.3.112 [default] to 0.3.113 [default]
packages/core2-32-poky-linux/libaio/libaio-locale: PV changed from "0.3.112" to "0.3.113"
packages/core2-32-poky-linux/libaio/libaio-locale: PKGV changed from 0.3.112 [default] to 0.3.113 [default]
packages/core2-32-poky-linux/libaio/libaio-src: PV changed from "0.3.112" to "0.3.113"
packages/core2-32-poky-linux/libaio/libaio-src: PKGV changed from 0.3.112 [default] to 0.3.113 [default]
packages/core2-32-poky-linux/libaio/libaio-src: PKGSIZE changed from 23817 to 23934 (+0%)
packages/core2-32-poky-linux/libaio/libaio-staticdev: PV changed from "0.3.112" to "0.3.113"
packages/core2-32-poky-linux/libaio/libaio-staticdev: PKGV changed from 0.3.112 [default] to 0.3.113 [default]
packages/core2-32-poky-linux/libaio/libaio-staticdev: PKGSIZE changed from 46512 to 46800 (+1%)
packages/core2-32-poky-linux/libaio/libaio: PV changed from "0.3.112" to "0.3.113"
packages/core2-32-poky-linux/libaio/libaio: PKGV changed from 0.3.112 [default] to 0.3.113 [default]
packages/core2-32-poky-linux/libaio/libaio: FILELIST: removed "/usr/lib/libaio.so.1.0.1", added "/usr/lib/libaio.so.1.0.2"
Changes to packages/core2-32-poky-linux/libaio (sysroot):
  /usr/lib/libaio.so.1 changed symlink target from libaio.so.1.0.1 to libaio.so.1.0.2
  /usr/lib/libaio.so changed symlink target from libaio.so.1.0.1 to libaio.so.1.0.2
  /usr/lib/libaio.so.1.0.1 moved to /usr/lib/libaio.so.1.0.2

--===============6255594376841805885==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libaio-upgrade-0.3.112-0.3.113.patch"

From 6210de023f17f99b0bcdc9515448ac1b9d0cb68f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 11:58:02 +0000
Subject: [PATCH] libaio: upgrade 0.3.112 -> 0.3.113

---
 meta/recipes-extended/libaio/libaio/00_arches.patch  | 12 ++++++------
 .../libaio/{libaio_0.3.112.bb => libaio_0.3.113.bb}  |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/libaio/{libaio_0.3.112.bb => libaio_0.3.113.bb} (92%)

diff --git a/meta/recipes-extended/libaio/libaio/00_arches.patch b/meta/recipes-extended/libaio/libaio/00_arches.patch
index bec189f87c..d09ae14155 100644
--- a/meta/recipes-extended/libaio/libaio/00_arches.patch
+++ b/meta/recipes-extended/libaio/libaio/00_arches.patch
@@ -1,4 +1,4 @@
-From ceba1e03e5b57cdae0b3b2d2c9afebc085c986d8 Mon Sep 17 00:00:00 2001
+From 64f7d956f439314003f1c9306c2c8536bbe48764 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Fri, 27 Aug 2010 10:15:31 +0800
 Subject: [PATCH] libaio: add new recipe
@@ -8,9 +8,9 @@ Upstream-Status: Inappropriate [embedded specific]
 from openembedded, added by Qing He <qing.he@intel.com>
 
 ---
- src/syscall-m68k.h   |  78 ++++++++++++++++++
- src/syscall-mips.h   | 223 +++++++++++++++++++++++++++++++++++++++++++++++++++
- src/syscall-parisc.h | 146 +++++++++++++++++++++++++++++++++
+ src/syscall-m68k.h   |  78 +++++++++++++++
+ src/syscall-mips.h   | 223 +++++++++++++++++++++++++++++++++++++++++++
+ src/syscall-parisc.h | 146 ++++++++++++++++++++++++++++
  src/syscall.h        |   6 ++
  4 files changed, 453 insertions(+)
  create mode 100644 src/syscall-m68k.h
@@ -483,12 +483,12 @@ index 0000000..ff61746
 +}
 +
 diff --git a/src/syscall.h b/src/syscall.h
-index 9b9e9c1..9ecd3b4 100644
+index d2a117b..8cf8470 100644
 --- a/src/syscall.h
 +++ b/src/syscall.h
 @@ -29,6 +29,12 @@
  #include "syscall-sparc.h"
- #elif defined(__aarch64__) || defined(__riscv)
+ #elif defined(__aarch64__) || defined(__loongarch__) || defined(__riscv)
  #include "syscall-generic.h"
 +#elif defined(__m68k__)
 +#include "syscall-m68k.h"
diff --git a/meta/recipes-extended/libaio/libaio_0.3.112.bb b/meta/recipes-extended/libaio/libaio_0.3.113.bb
similarity index 92%
rename from meta/recipes-extended/libaio/libaio_0.3.112.bb
rename to meta/recipes-extended/libaio/libaio_0.3.113.bb
index 859ba65c9f..87ab22ed17 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.112.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \
            "
-SRCREV = "d025927efa75a0d1b46ca3a5ef331caa2f46ee0e"
+SRCREV = "1b18bfafc6a2f7b9fa2c6be77a95afed8b7be448"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
-- 
2.27.0


--===============6255594376841805885==--

