Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0541C021B8
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.14683.1739864488156792405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W9u8n7sF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864488; x=1771400488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DlFcBQDPWBDM53TO1HPdBx4LHTHFIA3Ikl3s4E+wXug=;
  b=W9u8n7sFIA2DAG2esxluVAFJ390bRcY5CvMSx1SrVNIMPB6PrR2VWFn0
   aV7IjVwJCsVu2uCaIOj4yL+FBx8Ed73KBOXYSkziQ0i8HOU3P0gWmA0Vd
   Y4YzUD07yvDkQ+ZUtkcrjJtlCWiai7N91+5Koz6MYSwZIbClhaa/a67g5
   TlqPqffAg44RwPobVGzbjhyS39f6G760bRr0B7ZRsfKnnbUjmiP/IHzru
   dWTxJbhQGBzwZiQydbLM1MQ3KU8zWoHQcYkbjwl9HJZyuyoxFrMLyLB25
   0FDlTAb4dnjAue/wUzGNRG/SpUOT/87CT6yhN7o/enCVe7SaajQo3EzxA
   w==;
X-CSE-ConnectionGUID: W3AljJNCQDeQwM/WEYQ78A==
X-CSE-MsgGUID: Lfc4mdldRvKsLRx9jnU9xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190382313"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190382313"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:26 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AB70AD4809
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 69ED9BDC8A
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0E5101A000B;
	Tue, 18 Feb 2025 15:41:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/32] libwpe: upgrade 1.16.1 -> 1.16.2
Date: Tue, 18 Feb 2025 15:39:15 +0800
Message-Id: <1739864375-21394-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211577

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fix ABI break accidentally introduced in the 1.16.2 release.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-sato/webkit/{libwpe_1.16.1.bb => libwpe_1.16.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.16.1.bb => libwpe_1.16.2.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.16.1.bb b/meta/recipes-sato/webkit/libwpe_1.16.2.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.16.1.bb
rename to meta/recipes-sato/webkit/libwpe_1.16.2.bb
index 083e48b2cb..324e2f213c 100644
--- a/meta/recipes-sato/webkit/libwpe_1.16.1.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.16.2.bb
@@ -11,7 +11,7 @@ inherit cmake features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9cca60f2c4393ea0de53c675ebc3cdbe9c5aa249259dd1d6d81a49b052d37481"
+SRC_URI[sha256sum] = "960bdd11c3f2cf5bd91569603ed6d2aa42fd4000ed7cac930a804eac367888d7"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.43.0


