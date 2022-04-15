Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF452C47088
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.11584.1650052687563374263
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=vLi1cUYz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101802ecde3b4-b9cc3ef7-4e6e-4b0e-943c-e868f21dd9ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yBQuFKLkstEQHqhH0rTbrG/2MBNyh8dZPmWrdsALGYM=;
	b=vLi1cUYzJ2r5w7kwhIESFo8QHxVeqxGHmYorbTTvWCGr0m8iEtUKawranhJLlbqE
	RfoDGf8wZfglXhsY3iGUgL8BfndotHT9r1N0nJzd9A2MPddfXlHfYaPVG0JCZO5BQu/
	KOZoCCnqxh9DsywXjhBn/4+ckchrr1TdN550P+A8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yBQuFKLkstEQHqhH0rTbrG/2MBNyh8dZPmWrdsALGYM=;
	b=c7BPpr+9x5+MbrZXHDXUtLvDYWqGNGB7au6CHcFTmAllHqVk+ppSgbTgTwzS2bVa
	EZa17DhgaVhYbm8v1zBDRlw8gFzp2CFHb4FexZvVQyBn1lYbRw8091tRQVzYB5+gCDm
	VNaVc6nw72srLw/WyfwZwjRSGFwsPGh/yxGG6FD4=
Content-Type: multipart/mixed; boundary="===============0607829245360400288=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.39 SUCCEEDED
Message-ID: 
 <010101802ecde3b4-b9cc3ef7-4e6e-4b0e-943c-e868f21dd9ba-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164458

--===============0607829245360400288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtools* to *4.0.39* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.38-4.0.39.patch
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
--===============0607829245360400288==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.38-4.0.39.patch"

From 50b8d505a861ccc1032689190b532135f146498c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 08:39:36 +0000
Subject: [PATCH] mtools: upgrade 4.0.38 -> 4.0.39

---
 .../mtools/mtools/disable-hardcoded-configs.patch             | 4 ++--
 .../mtools/{mtools_4.0.38.bb => mtools_4.0.39.bb}             | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.38.bb => mtools_4.0.39.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 25ee2b74b5..cb19922580 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 142f40b80ea908831ef7a4d694cec6a5985a0724 Mon Sep 17 00:00:00 2001
+From 3bfa46c875cf1ecb427ef3879f08704b688d227e Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,7 +12,7 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 173eae0..0654cc1 100644
+index 2349552..38f79ca 100644
 --- a/config.c
 +++ b/config.c
 @@ -836,14 +836,6 @@ void read_config(void)
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.38.bb b/meta/recipes-devtools/mtools/mtools_4.0.39.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.38.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.39.bb
index dc2b9f8794..564ef02aee 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.38.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.39.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "7b94485f486e7df08cca68b00a164a13cd38f4c63cb8684d188759ee7bc5e729"
+SRC_URI[sha256sum] = "397f1e2b7b7a2a270eb7970fa363e445f956926ec51e8170c3869da85b0987bd"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.27.0


--===============0607829245360400288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtools: PKGV changed from 4.0.38 [default] to 4.0.39 [default]
packages/core2-32-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.38.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.39.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-32-poky-linux/mtools: PV changed from "4.0.38" to "4.0.39"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 727496 to 727432 (-0%)
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.38 [default] to 4.0.39 [default]
packages/core2-32-poky-linux/mtools/mtools-dbg: PV changed from "4.0.38" to "4.0.39"
packages/core2-32-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.38 [default] to 4.0.39 [default]
packages/core2-32-poky-linux/mtools/mtools-dev: PV changed from "4.0.38" to "4.0.39"
packages/core2-32-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.38 [default] to 4.0.39 [default]
packages/core2-32-poky-linux/mtools/mtools-doc: PV changed from "4.0.38" to "4.0.39"
packages/core2-32-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.38 [default] to 4.0.39 [default]
packages/core2-32-poky-linux/mtools/mtools-locale: PV changed from "4.0.38" to "4.0.39"
packages/core2-32-poky-linux/mtools/mtools-src: PKGSIZE changed from 592300 to 592250 (-0%)
packages/core2-32-poky-linux/mtools/mtools-src: PKGV changed from 4.0.38 [default] to 4.0.39 [default]
packages/core2-32-poky-linux/mtools/mtools-src: PV changed from "4.0.38" to "4.0.39"
packages/core2-32-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.38 [default] to 4.0.39 [default]
packages/core2-32-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.38" to "4.0.39"
packages/core2-32-poky-linux/mtools/mtools: PKGV changed from 4.0.38 [default] to 4.0.39 [default]
packages/core2-32-poky-linux/mtools/mtools: PV changed from "4.0.38" to "4.0.39"

--===============0607829245360400288==--

