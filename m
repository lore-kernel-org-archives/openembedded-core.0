Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDB5C3ABCC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.45926.1747040654706937576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E01VIJrV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040655; x=1778576655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=M/MFBgBwtkDw4tpX9YW1qlCLJQvIuLL7M9iA4M13H1A=;
  b=E01VIJrV6Ibax//7tq6D9H52dNEQW/3jpRI2HCSWrQiJi1WcUdpKIkEk
   ZXivJO20mgnhyh8ZUbQEy/HZREEDau1dv2AQdN8Ykuy58BrcVXspacjcL
   z/F52Ebl5Dlqq1SuU6edfIkE3Z5bmhOkt2s8rZm6oz+TyiMsMg90wGEjm
   7D8DGBcXF/NDAurVgKbtiHbetP9HCSrb4lgtFno+npHOrfTD/C9iOBkkI
   QHqEd8EbhL4yFi5SHteFhpqrlc2aQJhQmxC6ppfOya0Tq3Y/Jyg6YOGQP
   olc38yyv7Gp5ZShZd9EG7HZ0caycUKOqi30MjhQytFr05/G9hIGUn5Vm8
   A==;
X-CSE-ConnectionGUID: ciinutf7Qrq+YhSdu+6c8w==
X-CSE-MsgGUID: O0c962pRRqKRQie17IOoTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199125957"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199125957"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BD94D5057
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 69259CFBA2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 27D221A009A;
	Mon, 12 May 2025 17:04:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 39/56] python3-jsonschema-specifications: upgrade 2024.10.1 -> 2025.4.1
Date: Mon, 12 May 2025 17:03:22 +0800
Message-Id: <1747040619-7566-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216350

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Add SPDX license identifier

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...24.10.1.bb => python3-jsonschema-specifications_2025.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema-specifications_2024.10.1.bb => python3-jsonschema-specifications_2025.4.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb
index c45e5c25c7..53805b0396 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.org/project/jsonschema-specifications/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "0f38b83639958ce1152d02a7f062902c41c8fd20d558b0c34344292d417ae272"
+SRC_URI[sha256sum] = "630159c9f4dbea161a6a2205c3011cc4f18ff381b189fff48bb39b9bf26ae608"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


