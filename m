Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A0DC433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 20:35:01 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.26098.1644784499629793949
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 12:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kRkFOT/v;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1644784499;
  x=1676320499;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7Zao0rSUZesmHWl5BBvcWYSiyEJ5rAznG7AdLmoh8j4=;
  b=kRkFOT/vJeJHNpTPqR931TDqDb+0WrYZJNM5YXsnobPC7b/JZS7HHN7s
   Ct6Q7vYANSlO9M/NkBc5IVZBrXG0JOTwYOQ3k+ytTm331qKGY8k7BBXFr
   0qHo59XN+V8ag8AhkR4Jes3TXwe783A06y39AVRJgzleb+YE8NmVGhoT2
   Xwp3amfKD/6ask/lr+DJf8qB8L8NYe7aac3DvKnG//ubEZS0zLuZO9WLm
   D3WR2pzmu2XaT5tcO99hoMBfC8sDh2gvYDq1Hdt1i9cRHLVpkV920gFy9
   olQewUw9CumFtM90DDbsgd53F3zBUYMl0pRJ1J7CHRPSg2gE5HOgYSsYt
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bitbake.conf: Add COMMON_LICENSE_DIR to BB_HASHEXCLUDE_COMMON
Date: Sun, 13 Feb 2022 21:34:54 +0100
Message-ID: <20220213203454.28551-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 20:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161691

Differences in COMMON_LICENSE_DIR should not affect the task hashes.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fba99e8f0c..47c8cb39f9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -922,7 +922,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
-    OMP_NUM_THREADS BB_CURRENTTASK"
+    OMP_NUM_THREADS BB_CURRENTTASK COMMON_LICENSE_DIR"
 BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \
     SSTATE_DIR SOURCE_DATE_EPOCH"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \

