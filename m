Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04895C3ABDB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.45971.1747040639732804618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gno82bUI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040646; x=1778576646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fXlkYs9+DvDce5wCNHutTotXco7U5yL5L3u4qYE06Q8=;
  b=Gno82bUIRcAgyWemLMJrZRQp4zfMTB6uhh9obDbhTqoWEFnfDxR/Yqcf
   DtZbKNqfiFzJ+kM/xU+89EbdXP0yrTt5BW8opTUl7fra+EUTj8SSn8/y2
   hYWHE9nCkhKSwfsZkNok2lPfzm9/mqHUcOaW3rWEaj1ZMgaB5qrK7gWG6
   Nz8M6QSxmMCYGGzcXAeqj6pmdARLL6UT5actnApI84cid3BfP8n7a4/gr
   4Ze1IPoHX6dXk5kYzPD+W/yxzSDy5mtsanUbPxOAlAgUI1IxLSdWNE2l6
   tq5kLvsSaALvKSD2X8nlTXUlJGDyW7w+IWvPcFr82GKjX/mEpMrVcB4lq
   g==;
X-CSE-ConnectionGUID: DpN1aY15Rvup24Yb/OeeZQ==
X-CSE-MsgGUID: dScGOMWtQseGC+0NIYzZkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178629714"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178629714"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 96E81D5010
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 56547CFBA2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 147F71A009A;
	Mon, 12 May 2025 17:04:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 43/56] python3-meson-python: upgrade 0.17.1 -> 0.18.0
Date: Mon, 12 May 2025 17:03:26 +0800
Message-Id: <1747040619-7566-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216338

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-meson-python_0.17.1.bb => python3-meson-python_0.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.17.1.bb => python3-meson-python_0.18.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.17.1.bb b/meta/recipes-devtools/python/python3-meson-python_0.18.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.18.0.bb
index 4dc7177557..742a2580a7 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.18.0.bb
@@ -14,7 +14,7 @@ PYPI_PACKAGE = "meson_python"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "efb91f69f2e19eef7bc9a471ed2a4e730088cc6b39eacaf3e49fc4f930eb5f83"
+SRC_URI[sha256sum] = "c56a99ec9df669a40662fe46960321af6e4b14106c14db228709c1628e23848d"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.43.0


