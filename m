Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1835C3ABD7
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.45926.1747040654706937576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NDF/heaN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040657; x=1778576657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xEv6X3MwPpI+V+8/SbyIazSQSMKYej1gON+TrxVdCT8=;
  b=NDF/heaNkys67suXXmGhkDjzvScaVNgbbfokMKYuNko3Z7vjfgKnqpm/
   mDlm0xUXVDUg3R6sGiTRLXzufmGd4Dt/6mdWlB+LofYfioQiNJ7WYmTNN
   uxLYgpQnf/pHbhqM5VdoR1f/Ogye/Zkz+AqQKuyQmthrUvjipYWt8sn9r
   gDHZR8dwaHS7fX28A2aeATA+qVopEnCIsU4T3g2q8KlDPlEua+ckamDSw
   7MWuNon6CcnhFeTJB6hSjzgtwv+YeDXcPGiC3bGoZcqdtRQwCxWyjHeLY
   UCf+zY/Zo89p4SPQ8aRXPQ0LuqOpdtpLjjWXcEU3ICGK1WFhuU/xMtZOg
   g==;
X-CSE-ConnectionGUID: HvgdhH9vQPWsUZQppERKbw==
X-CSE-MsgGUID: U3b2rX6sTFWo1ZX2I8ONgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199125965"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199125965"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:07 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F8D4D505C
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BD056CFBA2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7D7B01A00A0;
	Mon, 12 May 2025 17:04:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 49/56] python3-typing-extensions: upgrade 4.13.1 -> 4.13.2
Date: Mon, 12 May 2025 17:03:32 +0800
Message-Id: <1747040619-7566-49-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216352

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix TypeError when taking the union of typing_extensions.TypeAliasType and a
  typing.TypeAliasType on Python 3.12 and 3.13.
- Backport from CPython PR #132160 to avoid having user arguments shadowed in
  generated __new__ by @typing_extensions.deprecated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...extensions_4.13.1.bb => python3-typing-extensions_4.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.13.1.bb => python3-typing-extensions_4.13.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb
index c3d3dbc275..9c83ae6c61 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.13.1.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 PYPI_PACKAGE = "typing_extensions"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "98795af00fb9640edec5b8e31fc647597b4691f099ad75f469a2616be1a76dff"
+SRC_URI[sha256sum] = "e6c81219bd689f51865d9e372991c540bda33a0379d5573cddb9a3a23f7caaef"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


