Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EBBC369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.63726.1744073533766508830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jvQuwq+3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073534; x=1775609534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JjU/u77WKvT0cbDywLFz8yh9FiuQ0fjqOurGGNCvam4=;
  b=jvQuwq+3HbFirrdzyuHAg3cF5hRqHwAXAnoS4wK26r2RVBfVVzCsDZlb
   Pu+77DERLqoE3ea26zq8p4DAi9Z/ziQCx+k3HXAL5+Ga4wBEQ298+uQpa
   O114E6kbElMUH9k5tVg/plGkfHDrUNubkNnA0CVEnvYBn1H6y2AQGSx27
   vg4clqrXb6+C5u9vfCH2AlMhlSkqyoybZT6iBqIOHzF28GmH6kXJwiy/I
   pLzhMAAJrchCGQdoTXdRvGwfzcjTO3YTtCdeCWe0puiQ/GjjDN8skgnjw
   GHKcDBMzf4xDm4DdnEQrQLJEHnQ/PgBrfPG7ZydMdBNiBY/uWay+cHrkH
   g==;
X-CSE-ConnectionGUID: cDp5rxrmTXaXur2DVZrR5w==
X-CSE-MsgGUID: K79jT3wtRfaS6NHCuDV+KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="194896339"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="194896339"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:01 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E71CD2AA4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E58B1D4BC1
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 726F11A009B;
	Tue,  8 Apr 2025 08:51:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/15] python3-calver: upgrade 2025.04.01 -> 2025.04.02
Date: Tue,  8 Apr 2025 08:51:37 +0800
Message-Id: <1744073502-27695-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214496

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Update build backend
- Support running tests from source distribution

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-calver_2025.04.01.bb => python3-calver_2025.04.02.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-calver_2025.04.01.bb => python3-calver_2025.04.02.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-calver_2025.04.01.bb b/meta/recipes-devtools/python/python3-calver_2025.04.02.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-calver_2025.04.01.bb
rename to meta/recipes-devtools/python/python3-calver_2025.04.02.bb
index a05e787201..3f169e1f7c 100644
--- a/meta/recipes-devtools/python/python3-calver_2025.04.01.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.04.02.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/di/calver;branch=master;protocol=https;tag=${PV}"
-SRCREV = "5b62e5127f9ad5bb56bd09ccd8c44283a23ddb60"
+SRCREV = "e9c8017caf3e3aff214fbb581ee7f366de55f629"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


