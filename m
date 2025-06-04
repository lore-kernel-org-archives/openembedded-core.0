Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727B4C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.11729.1749026746926071789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S2VxbkE2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026747; x=1780562747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kfRjmFrW/5hf6jjMnQUst9w4yttVdmh8tgzD4lTXtmI=;
  b=S2VxbkE2HXUGpbH8/qY2Dv6x9zLxf+2z1PrHxz+kZ1SHXYYN8cLGhgfG
   PsaeY2Vo0b9rFva0duGJtr7MmnFAwL1kUvWsiDQtzZvmATLvkLA7X19aF
   cB2rattH13Wtq0P5MSsPoHavka1ONS5RXHPSwjdUEXPJ7ghg4/cZckjdZ
   QslM+aRMMQh964S3lIP7nEmJlf6UkSJrj8gNuhe00PNI7RNwpUEgDRmKK
   jOLknFhzchgrGLm0YgvccQINkbpE0bERF3QT8OKeVuZHy/oo2+d7SiQje
   ZpcfGfyjrsyVI8H3RQG+MId6Zo/htLPDzsO0DJr1s/6gBY3CCTu9crogP
   w==;
X-CSE-ConnectionGUID: fN8P8OXQQsSglz7PQ1QNUw==
X-CSE-MsgGUID: hkLUzTTiQjq2ppt46Au1bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="189040719"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="189040719"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29D54D4C2B
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D7252BF3C1
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:42 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 564031A0078;
	Wed,  4 Jun 2025 16:45:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 40/45] python3-pycryptodomex: upgrade 3.22.0 -> 3.23.0
Date: Wed,  4 Jun 2025 16:45:18 +0800
Message-ID: <20250604084524.864-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217889

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pycryptodomex_3.22.0.bb => python3-pycryptodomex_3.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.22.0.bb => python3-pycryptodomex_3.23.0.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.22.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.22.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
index 5cc37d81c2..43dba3faa3 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.22.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a1da61bacc22f93a91cbe690e3eb2022a03ab4123690ab16c46abb693a9df63d"
+SRC_URI[sha256sum] = "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.43.0


