Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFB2C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 03:13:33 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.652.1652843606976989420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 20:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bDOGGoLz;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1652843607;
  x=1684379607;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BFNO0elb8OF52PqnhUN7/DOB/fAr+b2xrZDHGOLJcQU=;
  b=bDOGGoLzQDsjtDywj0BCTUOX3Fb5/ICU7o4lIFy5qKOtXfiRwAxaZWXO
   trJ11ecC75y2NB7ARlGr1UWeyrHPxPC+bwRdxGN6tfyQoQyk0J8PbtVj6
   FVrNzDoMFKiTp+LC7TQGbVmcSM5y7haXh+sWXt8Acj8TMEWa6dK/gO0dw
   bJizzjdwn9FOEq8Tb8TFAQMAD98fbAVxKcFOVZBBG2HKf4c2qHYbdgikY
   xn6DLhYHcNTfgLof9/pHJUz6RWKV8SVv+q6KTd/io5xamGKT+fyjNMFmH
   WRNpfmdKdfMqBZBScFa7PL11JH0Z+juo2oleqDrvra+i5uIoU6d2XYZsV
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] base-passwd: Update the status for two patches
Date: Wed, 18 May 2022 05:13:21 +0200
Message-ID: <20220518031321.11024-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 03:13:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165792

The two patches to disable use of debconf and generation of
documentation have been merged upstream.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...0006-Make-it-possible-to-build-without-debconf-support.patch | 2 +-
 ...7-Make-it-possible-to-disable-the-generation-of-the-do.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
index 61ed1641a1..6e236993f5 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Make it possible to build without debconf support
 
 Not all systems have the debconfclient library available.
 
-Upstream-Status: Submitted [https://salsa.debian.org/debian/base-passwd/-/merge_requests/11]
+Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/commit/c72aa5dd25a952da25e307761f4526db2c8c39ec]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 ---
  Makefile.am     |  1 -
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
index 2bec065cdb..5c63599143 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Make it possible to disable the generation of the
 
 Not all systems have docbook and po4a available.
 
-Upstream-Status: Submitted [https://salsa.debian.org/debian/base-passwd/-/merge_requests/11]
+Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/commit/2a6d16e595c93084e279d0dcbef37d960b44fd1a]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 ---
  Makefile.am  | 2 ++

