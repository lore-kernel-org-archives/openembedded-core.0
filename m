Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C80CC61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:04:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25558.1788167080006345277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QlXK1B9c;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 587144E41464
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D20260231
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C96E211C78B04;
	Mon, 31 Aug 2026 11:04:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788167073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wohBntDq1lUpS4JTIqoOjM0fGnPD09VxX1tNaXtUmv8=;
	b=QlXK1B9cKynZR2lRn4pFSq4zST97xEp1yg7howEPBvwJPiKWKY5EWXHI5vCMbDdi2Gt7no
	28K26ny3YLoEvUK3n0FGXP3rc+tPBj2XZ9THPrpMzpyrQi6hAJCfZMPHluTpe/PSr7Mh8G
	TOMBYopLTVCMCBvsj1MtcISCYKKzHTWLxoFz+8r4NcGsyrQLJWYIIOfGF1pUkOrsGcrw5P
	rYrwpGamzz/1LoVZkShyX5+jsd3n0OGTRN9U4SPEVQXWd2r864V3yPSbNueWQy7qCAPshr
	F07/E45nsUWSz81oYCNYSO+46vaEf4jjM6+an5Fbxh403cZXIzQ6X7FG40v+Xg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 31 Aug 2026 11:03:41 +0200
Subject: [PATCH 9/9] sysstat: upgrade 12.7.9 -> 12.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-mathieu-updates-2026-08-31-v1-9-58b54db72860@bootlin.com>
References: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
In-Reply-To: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788167050; l=4825;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=aCVwBhaC1T4GYkL98Xir/lrVetOs6kjfIbqy9M44NNA=;
 b=zwyNNNR5gHYwUn36Uu4VFwOFug5XBtwfKWGyBmbOSZ2myHM1w/+DO+DTBKntKN4LI9bkJNBhl
 2a9khDlKCTfDnkL5wo9SIoWqJ2oOuuq+D8GEhJa7hcxBLOWgyJhCF0f
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244751

Source: CHANGES

	* [Agenticode]: sadc: Read /proc/stat once per collection cycle.
	* rd_stats.c: Rework functions to read /proc files once.
	* Read all /proc files once per collection cycle.
	* [Sagar Sagar]: Avoid all-zero CPU rows on counter regression.
	* [Lilu]: svg_stats.c: Fix integer overflow in allocate_graph_lines
	  size computation.
	* [Hang Zhao]: sadc: Fix pgscan_direct counter incorrectly including
	  pgscan_direct_throttle.
	* [Andy Lau]: sadc: Fix pgsteal/s double counting by only summing
	  pgsteal_anon and pgsteal_file.
	* [Andy Lau]: sar, mpstat: use write() instead of printf() in signal
	  handler to ensure JSON output is properly closed on SIGTERM.
	* [Andy Lau]: Remove unnecessary unsigned int cast that truncates
	  irq_nr in read_stat_total_irq().
	* [Andy Lau]: Fix typo in sar manual page.
	* [Dean Chen]: sadf, sar: let --fs match mountpoints as well as device
	  names.
	* sar/sadf: Don't test for empty "--fs=" list.
	* [Nathan Scott]: iostat/tapestat/cifsiostat: add -G flag for gibibyte
	  display.
	* [Nathan Scott]: sa1: derive LONG_NAME from SADC_OPTIONS, not just
	  HISTORY.
	* [Nathan Scott]: sa2: honour -D in SADC_OPTIONS for date format.
	* [Nathan Scott]: Slightly reduce scope of install-cron configure script
	  option.
	* [Nathan Scott]: Rename --enable-install-cron to
	  --disable-automated-sar-reporting.
	* [Nathan Scott]: Enable automated sar reporting by default.
	* [Nathan Scott]: sadc: Fix heap buffer overflow in reallocate_buffer().
	* [Nathan Scott]: do_test: Replace bash-ism with POSIX arithmetic.
	* [Nathan Scott]: do_test: Exit with error status on test failure.
	* [Nathan Scott]: tests: Fix PCP archive test portability.
	* [Nathan Scott]: ci: Add GitHub Actions CI workflow.
	* sa1: Remove "iso" option.
	* cifsiostat: Add JSON output for option -G (display in Gigabytes).
	* pidstat: Add fflush() after JSON closing output.
	* sadc: Now only read pgscan_kswapd counter.
	* sa_wrap.c: Also use reallocate_buffer() function for A_PWR_FREQ
	  activity.
	* cifsiostat, iostat, sa1, sadf, sar and tapestat manual pages updated.
	* Non-regression tests updated. New tests added.
	* simtest: Fix issue related to 19th day of the month.
	* Makefile: Fix EXTRALIST variable contents.
	* Fix some tests for out-of-tree build.
	* do_test: Make options available with out-of-tree target.
	* [orbisai0security]: Fix a (theoretical) security vulnerability.
	* [Peter Dave Hello]: Refresh sysstat gettext template file.
	* FAQ file updated.
	* NLS translations updated.
	* Update year in copyright messages.
	* tapestat: Cosmetic change.

2026/08/28: Version 12.8.0 - Sebastien Godard (sysstat <at> orange.fr)
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../sysstat/0001-configure.in-remove-check-for-chkconfig.patch        | 4 ++--
 .../recipes-extended/sysstat/{sysstat_12.7.9.bb => sysstat_12.8.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
index 431a60aee155..3bbf769929ce 100644
--- a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
+++ b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
@@ -1,4 +1,4 @@
-From f41b0253d1583f7e1286fa2f29393c3d3f5183b4 Mon Sep 17 00:00:00 2001
+From 7df414e3a4919d6bc68728ea593d00098ef1fc13 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Tue, 5 Nov 2019 16:16:44 +0800
 Subject: [PATCH] configure.ac: remove check for chkconfig
@@ -13,7 +13,7 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8b5f9b73..910ebd5a 100644
+index 17507ea9..a08d717b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -42,7 +42,8 @@ AC_SUBST(VER_JSON)
diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.9.bb b/meta/recipes-extended/sysstat/sysstat_12.8.0.bb
similarity index 98%
rename from meta/recipes-extended/sysstat/sysstat_12.7.9.bb
rename to meta/recipes-extended/sysstat/sysstat_12.8.0.bb
index ffc7c0ac3736..967e60f2d484 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.9.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.8.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master;tag
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "b8f987807e7c7ba5c1b2ca8b7b1e9d80e61bce6c"
+SRCREV = "ffabe8175aa9a7aa056380c66ed3648e50c1967d"
 
 DEPENDS += "base-passwd xz-native"
 

-- 
2.47.3


