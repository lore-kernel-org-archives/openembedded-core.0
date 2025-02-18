Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986C4C021B3
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.14682.1739864486952199643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q6w4mwjM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864487; x=1771400487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pnrIXr9MJcX4T6+1lgPbMymP11BrGdtOFmAbpwKWexg=;
  b=Q6w4mwjMv/kgcm00tFRmDIycqMniREM+LWori4PH2LhdGMVd4VO5ECEV
   Q8/FK5xbE38eGGmCmZZUzthQ1Rx0vYK5bHdASnAbJ47MqMrQEk2RltgKg
   i5njSGs9tAm50n7fYDxq7tjmWcoLPqmRPMohj8dplInocj5fWYE1ZjCv+
   y1ai7Ke/OxKvNbzN+1t5wXcefLR1q6f+byBr4hL6W5KyhINyaZMnAVdXn
   S6dT8VjvK2a41e2G6MoY8yZL3f3eHLeBsjnEvuw9ChdxKM4B56jH/VWk6
   t0bNmrO2jJe6HAy/hF9025ncRlI1SkFhozIbfhSLpCmvlZJYa6aRKQUyw
   g==;
X-CSE-ConnectionGUID: 4eezhTSkTd2BwsMF9jb1Dw==
X-CSE-MsgGUID: fKbE3usUQYqW98SEuX5JLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="178727900"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="178727900"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C16A9C2260
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A880BDC8A
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F9081A000B;
	Tue, 18 Feb 2025 15:41:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/32] libtest-warnings-perl: upgrade 0.037 -> 0.038
Date: Tue, 18 Feb 2025 15:39:13 +0800
Message-Id: <1739864375-21394-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211573

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- no longer swap out done_testing method if :no_end_test is
  configured

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...st-warnings-perl_0.037.bb => libtest-warnings-perl_0.038.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{libtest-warnings-perl_0.037.bb => libtest-warnings-perl_0.038.bb} (93%)

diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.037.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
similarity index 93%
rename from meta/recipes-devtools/perl/libtest-warnings-perl_0.037.bb
rename to meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
index 1cdc93d776..656b38f2d8 100644
--- a/meta/recipes-devtools/perl/libtest-warnings-perl_0.037.bb
+++ b/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=f98106ac3cc05d9cbebcdb8fbf7b7815"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "682de3e7a3e8ac9265c53d0e314b8b903294c5199c005bd37e808f4484c25df2"
+SRC_URI[sha256sum] = "3da27e003a3c3cafed3c09b42be05cf9bdbff0bee5c8590a731b02853880a273"
 
 S = "${WORKDIR}/Test-Warnings-${PV}"
 
-- 
2.43.0


