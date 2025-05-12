Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D40FC3ABDD
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.45915.1747040638714823342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OUJG6ker;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040639; x=1778576639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OyMogpg8nYDpjmRDOlWpVxTKPlvFp1yVVXTMMG55phA=;
  b=OUJG6kerShsOmNRD1jJZC4VN8wG3bvSiDspgNxvQFwtQHr6OywKHkZ9p
   n36w2OVDLAoDqKtg5WqIxKQ6lZEocelpKckNsQ9ueNE2HxMDLpoPTFREP
   XNHKo+zgy51Z80ow9wRgpmwooDiT9ylv72nN1fuCIIyc4JDBv3xWeacX2
   zjaV7ITxWSwvpJALeX61MICL9lCVJ9qTHCrJKE9wNO4jfP24M5XWHWzoD
   DWsCys19SgiRVU3RxMFwJyyrLqzS44h1d7nbqQDF3CUUUcRO6LXWB4p4K
   l+ZGohNADL8e1xXGuS12zPsSmkEN6wZZa4c3xefCtSYjEwzXgeTE62nH9
   A==;
X-CSE-ConnectionGUID: S9YtHe4SRayPzucftcgjfQ==
X-CSE-MsgGUID: 1cC+vyMTSgG6mUb16+LvBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="187549309"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="187549309"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 72E0EC68A2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 30B47D5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DEB071A009B;
	Mon, 12 May 2025 17:03:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/56] ccache: upgrade 4.11.2 -> 4.11.3
Date: Mon, 12 May 2025 17:02:51 +0800
Message-Id: <1747040619-7566-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216304

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.11.2.bb => ccache_4.11.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.11.2.bb => ccache_4.11.3.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.11.2.bb b/meta/recipes-devtools/ccache/ccache_4.11.3.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.11.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.11.3.bb
index 3a41cb5736..83374fa44c 100644
--- a/meta/recipes-devtools/ccache/ccache_4.11.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.11.3.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "d51b82bb8c3932649323fd4cb8e5a0a9f7fe7f672c71a6d6839bee13b4ded4c5"
+SRC_URI[sha256sum] = "28a407314f03a7bd7a008038dbaffa83448bc670e2fc119609b1d99fb33bb600"
 
 inherit cmake github-releases
 
-- 
2.43.0


