Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EC3C3ABD4
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.45926.1747040654706937576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LdNJGUqZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040656; x=1778576656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZxrBFmmm1qh9jo3u8Fs9oIlGiFAH4/M24LS8tB5zn1k=;
  b=LdNJGUqZq/0FsccQoPKf3GoJGwCANi5ZtWmK+v50cPc6e6fFkEeAR4Qb
   8cuQCrRp9eZk4e+5zqS6oYx5+teFswdKuhLxafkAsyf6xYKIENZthqQzl
   CWw6uhDMnvlv5wDvpFCvEF9q0tAwjoMCo0jvDavPnhPs1815ZDvX5/JC9
   RzCgDbrksF+yV+3ma5/YW1nWzMK3MnAXmjJsFA6ADq26WtrgL6aEm4PSh
   S91CXn2yFYS4DjQW5xltQ39rQkEtsAqvjzNx2CqNzmO+jRzlqkhZqPXZT
   Q4sTDZPzGMBR9MYPIVPsGlRNcPg4e95exyOy3S6JFDK4gKOrpg4G35z2q
   A==;
X-CSE-ConnectionGUID: 9mfSCugGT0WQoLLTpA62lQ==
X-CSE-MsgGUID: zPrCQZPiRFKVDJp1jpnSsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199125964"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199125964"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:06 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B9C6CD6F04
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 87776D5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 486041A009A;
	Mon, 12 May 2025 17:04:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 48/56] python3-pycairo: upgrade 1.27.0 -> 1.28.0
Date: Mon, 12 May 2025 17:03:31 +0800
Message-Id: <1747040619-7566-48-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216351

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://pycairo.readthedocs.io/en/latest/changelog.html#v1-28-0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycairo_1.27.0.bb => python3-pycairo_1.28.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.27.0.bb => python3-pycairo_1.28.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.27.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.28.0.bb
index 3dab9e823f..c610f3eae9 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.27.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "5cb21e7a00a2afcafea7f14390235be33497a2cce53a98a19389492a60628430"
+SRC_URI[sha256sum] = "26ec5c6126781eb167089a123919f87baa2740da2cca9098be8b3a6b91cc5fbc"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.43.0


