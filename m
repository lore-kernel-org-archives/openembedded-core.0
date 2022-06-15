Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472E5CCA49D
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.4388.1655298221709382976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kaQZ9hPh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101018167766366-7ec38c1a-70d5-4dc3-a920-6dfd9788c93c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jKAmwToiy3jfPayCYBuc9rUc3iB1z1+DT75cxcy9ixU=;
	b=kaQZ9hPhHzH0o14d290cIT3Qidh8tKH3cMJDzy20uZc3sn2U1KZ11dtG51ATaPdA
	tethk6s+f87Rw5HwG/M8s4iY0Dtiow3D+Z6ake3GvT/uEy+NaswLJI1Y0LiD8cZg8Xs
	OvSxYJc2wlJ9y0EU5+D6W1eFFVi8O/9xlzcWeWH8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jKAmwToiy3jfPayCYBuc9rUc3iB1z1+DT75cxcy9ixU=;
	b=TR/SJRFRstNviBpA6lrW1Wh/tghM38zy1l+skBKSQ1PAxMku8UjW8xEleA1LpS36
	D3R+PgF94hDkDgyduQ+JK75plpKvbwpXCGbrI8IA4jF1q//4WKigag6DwiiP3Vw+S1k
	iCsAZvoUgOji8hsjBa7eZa5fyJsLDsOaJRtANRIE=
Content-Type: multipart/mixed; boundary="===============4826576504178221735=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 5.18 SUCCEEDED
Message-ID: 
 <0101018167766366-7ec38c1a-70d5-4dc3-a920-6dfd9788c93c-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166950

--===============4826576504178221735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *5.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-5.17-5.18.patch
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
--===============4826576504178221735==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-5.17-5.18.patch"

From 9f97a480ec22a7d4481af71e004d8321bec54927 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 09:41:07 +0000
Subject: [PATCH] ethtool: upgrade 5.17 -> 5.18

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.17.bb => ethtool_5.18.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.17.bb => ethtool_5.18.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 52d2a93449..73b659dfe9 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From ef2ad68becea77dfdbd5a344e30b3700cc440c0f Mon Sep 17 00:00:00 2001
+From a2d7a97f225d8e12a77ceca03f4ef8c2da99e30b Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7a9b5b9..dc8ae35 100644
+index c11f2b1..2bd2b83 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.17, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.18, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.17.bb b/meta/recipes-extended/ethtool/ethtool_5.18.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.17.bb
rename to meta/recipes-extended/ethtool/ethtool_5.18.bb
index 61032d4836..b4f74e7f5b 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.17.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.18.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "3e32735d13aa19e2be32d3528ef8a135fc99782950ab3fa602198e72992e9450"
+SRC_URI[sha256sum] = "70091f95448eba851f9f9804059d0e237f1d909064046f9e3c6dc892aa1e8afe"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.31.1


--===============4826576504178221735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "5.17" to "5.18"
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 5.17 [default] to 5.18 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "5.17" to "5.18"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 5.17 [default] to 5.18 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3391984 to 3395008 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "5.17" to "5.18"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 5.17 [default] to 5.18 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "5.17" to "5.18"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 5.17 [default] to 5.18 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 39484 to 39562 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "5.17" to "5.18"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 5.17 [default] to 5.18 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "5.17" to "5.18"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 5.17 [default] to 5.18 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "5.17" to "5.18"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 5.17 [default] to 5.18 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1279795 to 1284335 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "5.17" to "5.18"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 5.17 [default] to 5.18 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "5.17" to "5.18"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 5.17 [default] to 5.18 [default]
packages/core2-32-poky-linux/ethtool: PV changed from "5.17" to "5.18"
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.17.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.18.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/ethtool: PKGV changed from 5.17 [default] to 5.18 [default]

--===============4826576504178221735==--

