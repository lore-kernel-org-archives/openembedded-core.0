Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4328C54F3E
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:44 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.6322.1648857550347391921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 16:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=YaOG6aVY;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648857551;
  x=1680393551;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VClYiWzpBdwFwor5U2lqXfQK9VE4VWPWe+y+ZCd4MfM=;
  b=YaOG6aVYHRLdDl+I7zHqlFbmXJy1b8O8bzT1oCmEqrP8By11iYez2cMm
   cGwBMuH+tRyvEncFcLtzTKgRoAbBwN4CaeTytf1LDpca5bnitw/dx72yY
   noWhnzRU8/KnSmVzS3UzhL66IkjeKD2A5X3P0E1LGyiL8EKgIIiFKZP+R
   UpzkJvThYBn58mXYqnWc162MBx8+tgxORpS/XYhsjOXgyYQBTcqAC6hK8
   DfEYAF12s/9wTDm/1bddX4D3jSlK7PWLusooa7MTQDBYwsTusUxm0ijag
   wdofO0pNPQaSVUw++xbYiuYuLVmWX5iXVBkhVkrqOOz9aBsVk9IuKnWgF
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] bitbake.conf: Remove ERROR_QA from BB_HASHEXCLUDE_COMMON
Date: Sat, 2 Apr 2022 01:59:05 +0200
Message-ID: <20220401235906.652-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220401235906.652-1-pkj@axis.com>
References: <20220401235906.652-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163949

If a QA test is added to ERROR_QA, all package_qa tasks should rerun
to make sure any already existing errors are caught.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7705415a4f..3b8760a3f8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -949,7 +949,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
-    WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
+    WARN_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \

