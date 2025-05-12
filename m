Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43EEC3ABD5
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.45916.1747040638854317555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J6FDNcSF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040648; x=1778576648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4zCUhqlv1b1R16z8uK/6B3WPNLYk1JPnp80jDWbCmII=;
  b=J6FDNcSFIP5fk1A+VzbluN7gVavfXa/3TNi1ZpM3GJqpdhJzEnvuGBoV
   78/A5YvTFN2TerycI9Im8BmWo88gPlua9XllIkrnrfgch/E4ipfKKclPJ
   aFUCfoFD7Bjl0wtUd7xRWV1ZxTL2/WSg8HFWpf9A/O16Wp30RT4RNsbyA
   3qD0ROsKkVVxO1Yl6DdKPBZIGxM2zq4qHd0DUulDwZIGd/h1FwBEkmBAL
   yfz4jV+2uRv3oO9bP8s/cbkI0QJD4rWnD0zk5+30WqAy5nW7g9B/zN6Ui
   MZnITJalprYT4y1+VnxNn6HdpcjWf2nNatf6dGWckWTPr7FyH69YwVi2B
   g==;
X-CSE-ConnectionGUID: VqVnPfBASNanTEFuH/cNsQ==
X-CSE-MsgGUID: SK/nZm1vRwKvs1F8+BTGXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="202056494"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="202056494"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:07 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F30FDD6EFC
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BFBDBD5047
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F0631A009A;
	Mon, 12 May 2025 17:04:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 53/56] repo: upgrade 2.53 -> 2.54
Date: Mon, 12 May 2025 17:03:36 +0800
Message-Id: <1747040619-7566-53-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216345

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.53.bb => repo_2.54.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.53.bb => repo_2.54.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.53.bb b/meta/recipes-devtools/repo/repo_2.54.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.53.bb
rename to meta/recipes-devtools/repo/repo_2.54.bb
index 77817c25e4..07ee583172 100644
--- a/meta/recipes-devtools/repo/repo_2.53.bb
+++ b/meta/recipes-devtools/repo/repo_2.54.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "4b94e773efd36754f6c8649ad55b90d19a61107f"
+SRCREV = "97dc5c1bd9527c2abe2183b16a4b7ef037dc34a7"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0


