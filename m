Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE13C71137
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11713.1749026733689315424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q8khd96q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026746; x=1780562746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SE7IBd5z6pWO7jTIE0zfHJSqNhwfawFutiu/Sjgl4Tc=;
  b=q8khd96q+l41vFKoo6V6LuIrt8QWXoNW3S4qiGaYmCC9eNHi1aLQobsn
   kd0GudRMBfKivaN0R3L42flsjMKL/zxbPGewwn/Oywih1ln6b3FsPQd/5
   YnCyAPHNelMlFtUNMQB01z5j0AMbvXUprurdH8IhQuCMRJAuBpNBU/u8a
   u6CURklozV1mbCzZR3+FpiPdGK+L69ed0O58gvlAILP6YJNFPVjlGFLhD
   BmPk64pWc9WFkXzFbdQIGMa1w1goh+GTS8RID2TCFL9195kro5DVU/Jtm
   F8t+jkORVYHqa4SHLFOWtHHvLtnU/vKgvYfyIiq0qyIpWMxVxp5xikKFG
   Q==;
X-CSE-ConnectionGUID: i3JffNfQRV6uznjobWuraw==
X-CSE-MsgGUID: TkKA4J56TU6sR7e7Ob/sjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="202109495"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="202109495"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FA82DBBCA
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F48DD4C15
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:43 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B1D641A009A;
	Wed,  4 Jun 2025 16:45:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 41/45] python3-ruamel-yaml: upgrade 0.18.10 -> 0.18.12
Date: Wed,  4 Jun 2025 16:45:19 +0800
Message-ID: <20250604084524.864-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217886

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-ruamel-yaml_0.18.10.bb => python3-ruamel-yaml_0.18.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.10.bb => python3-ruamel-yaml_0.18.12.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.12.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.12.bb
index 02b04e3c0c..3b136b3b58 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.12.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "20c86ab29ac2153f80a428e1254a8adf686d3383df04490514ca3b79a362db58"
+SRC_URI[sha256sum] = "5a38fd5ce39d223bebb9e3a6779e86b9427a03fb0bf9f270060f8b149cffe5e2"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.43.0


