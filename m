Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D3CC71131
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.11719.1749026736796839147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QS576Lq6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026750; x=1780562750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QuzZCB3bU1JnKne0y8nT5xN7nlPtBY599UzuW9qieiE=;
  b=QS576Lq6c0Up9yJWYO4gui9wDuqpsmuQmAPpQnr6CPSanHWLXv1sczH3
   kB8Lxb5UbIrNbDWWUO/WxnZRIknvN+WNFGNbN5ydEcuKRGsj1CADWC3LY
   j5oHfu3UFYurGgeAt88fqD6ABiasx8VHHcP9TnOAlDDruRn1e1t8SIM+o
   ka7zoZwfqwSibzS+rrZsMr3/eU8MzBWVCgkZnLYCsktI2bcsU9qXSCKQ2
   fgB2B/sNteeVmj35T97j96nGHKW0P2OPFJRmw32Eoixrg4OTvWOOI4+mX
   ivjomQvPSgcX955nPScPBgxOzYMfNnLdKcOuprE3D2wxLqZbNqmE1K3XJ
   w==;
X-CSE-ConnectionGUID: RbClAd2uTLef7gOI3z8K3A==
X-CSE-MsgGUID: D9lSQjq9QDqIyA71GQ69qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="201658018"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="201658018"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:48 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C8E34DBBCA
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 81E51D4C15
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:44 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2E2A21A009A;
	Wed,  4 Jun 2025 16:45:44 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 45/45] taglib: upgrade 2.0.2 -> 2.1
Date: Wed,  4 Jun 2025 16:45:23 +0800
Message-ID: <20250604084524.864-45-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217890

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/taglib/{taglib_2.0.2.bb => taglib_2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.0.2.bb => taglib_2.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.0.2.bb b/meta/recipes-support/taglib/taglib_2.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.0.2.bb
rename to meta/recipes-support/taglib/taglib_2.1.bb
index 254119268c..a337af74d0 100644
--- a/meta/recipes-support/taglib/taglib_2.0.2.bb
+++ b/meta/recipes-support/taglib/taglib_2.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "0de288d7fe34ba133199fd8512f19cc1100196826eafcb67a33b224ec3a59737"
+SRC_URI[sha256sum] = "95b788b39eaebab41f7e6d1c1d05ceee01a5d1225e4b6d11ed8976e96ba90b0c"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.43.0


