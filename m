Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54286C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 21:20:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.11609.1635024037568477567
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0EFB91BF203;
	Sat, 23 Oct 2021 21:20:34 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] libevent,btrfs-tools: fix Upstream-Status tag
Date: Sat, 23 Oct 2021 23:20:30 +0200
Message-Id: <20211023212030.391269-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 21:20:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157317

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 ...1-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch | 2 +-
 ...003-test-mark-util-monotonic_prc_fallback-as-retriable.patch | 2 +-
 ...test-retriable-tests-are-marked-failed-only-when-all-a.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
index d7188881da8d..be942388a504 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
@@ -18,7 +18,7 @@ add an explicit include of const.h to pickup the macro:
 This is safe for older kernel's as well, since the header still
 exists, and is valid to include.
 
-Upstream-status: OE Specific [mips64 + musl + libc-headers]
+Upstream-Status: Inappropriate [mips64 + musl + libc-headers]
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
diff --git a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
index 8a2c78983e1d..ddc19c495f1d 100644
--- a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
+++ b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable
 
 Refs: #1193
 
-Upstream-status: Backported
+Upstream-Status: Backport
 ---
  test/regress_util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
index ae7db0b7aa85..ea17e876ea3f 100644
--- a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
+++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] test: retriable tests are marked failed only when all
 
 Fixes: #1193
 
-Upstream-status: Pending
+Upstream-Status: Accepted
 
 Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
 ---
-- 
2.31.1


