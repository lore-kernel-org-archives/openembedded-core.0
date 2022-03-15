Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EF8C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:55 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.10589.1647349734950566480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=H+mB/sG/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017f8db21a43-a8181fc9-eeaa-43e6-9085-8ab3f9b2c876-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sUcZuaK752aVS7VT4XupWevW20Blvc5vXgCKNH/etZ4=;
	b=H+mB/sG/Io6w+1OKpJ7zaA/c39CkPs+mnCDFgPtj6+0OJdNa45skovo1KNw+i2rP
	smN/je0qytcL02GnNjg2djiqy31pTaoCBSro3FSpLks+EyJmFzRBfkZtbSI0gZH8mnm
	nUVQVC8tFc7YjpcOQl3AEwfW/MOuq1waAkIg/kZY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sUcZuaK752aVS7VT4XupWevW20Blvc5vXgCKNH/etZ4=;
	b=H3mFWXnLGklHZfLqPYtlR7+vf2QD9FI51yDWHEw0f2SeeqsqxMttom64+XklsmU5
	IF248L5x1BZs9f6FMTHwZZytQVLKpctio9Ln3Ez5R+XeRpAysV9o8/YMK7wYFIB5WDD
	PyVY+WIbUE7w6Ut8e/BdHG5j7+WoPrDsi2geSIb4=
Content-Type: multipart/mixed; boundary="===============6830923299525649798=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.38 SUCCEEDED
Message-ID: 
 <0101017f8db21a43-a8181fc9-eeaa-43e6-9085-8ab3f9b2c876-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163253

--===============6830923299525649798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtools* to *4.0.38* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.37-4.0.38.patch
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
--===============6830923299525649798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtools: PKGV changed from 4.0.37 [default] to 4.0.38 [default]
packages/core2-32-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.37.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.38.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-32-poky-linux/mtools: PV changed from "4.0.37" to "4.0.38"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.37 [default] to 4.0.38 [default]
packages/core2-32-poky-linux/mtools/mtools-dbg: PV changed from "4.0.37" to "4.0.38"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 727452 to 727496 (+0%)
packages/core2-32-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.37 [default] to 4.0.38 [default]
packages/core2-32-poky-linux/mtools/mtools-dev: PV changed from "4.0.37" to "4.0.38"
packages/core2-32-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.37 [default] to 4.0.38 [default]
packages/core2-32-poky-linux/mtools/mtools-doc: PV changed from "4.0.37" to "4.0.38"
packages/core2-32-poky-linux/mtools/mtools-doc: PKGSIZE changed from 241789 to 241778 (-0%)
packages/core2-32-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.37 [default] to 4.0.38 [default]
packages/core2-32-poky-linux/mtools/mtools-locale: PV changed from "4.0.37" to "4.0.38"
packages/core2-32-poky-linux/mtools/mtools-src: PKGV changed from 4.0.37 [default] to 4.0.38 [default]
packages/core2-32-poky-linux/mtools/mtools-src: PV changed from "4.0.37" to "4.0.38"
packages/core2-32-poky-linux/mtools/mtools-src: PKGSIZE changed from 592250 to 592300 (+0%)
packages/core2-32-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.37 [default] to 4.0.38 [default]
packages/core2-32-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.37" to "4.0.38"
packages/core2-32-poky-linux/mtools/mtools: PKGV changed from 4.0.37 [default] to 4.0.38 [default]
packages/core2-32-poky-linux/mtools/mtools: PV changed from "4.0.37" to "4.0.38"

--===============6830923299525649798==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.37-4.0.38.patch"

From 7fdaccf54ea3e8881f75d834dedaacb8d77d7239 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 07:38:07 +0000
Subject: [PATCH] mtools: upgrade 4.0.37 -> 4.0.38

---
 .../mtools/mtools/disable-hardcoded-configs.patch               | 2 +-
 .../mtools/{mtools_4.0.37.bb => mtools_4.0.38.bb}               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.37.bb => mtools_4.0.38.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 6185f4d19f..25ee2b74b5 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From a5076415ed2c226ca7115d27e0ce51a8a0302090 Mon Sep 17 00:00:00 2001
+From 142f40b80ea908831ef7a4d694cec6a5985a0724 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.37.bb b/meta/recipes-devtools/mtools/mtools_4.0.38.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.37.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.38.bb
index 3e072b0d93..dc2b9f8794 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.37.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.38.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "799b197e23e47b61259628810b27790efb7a1fe36037ef1da8a27b0ae4fa8342"
+SRC_URI[sha256sum] = "7b94485f486e7df08cca68b00a164a13cd38f4c63cb8684d188759ee7bc5e729"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.27.0


--===============6830923299525649798==--

