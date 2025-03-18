Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC6FC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.5382.1742278929962763098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sdmKGWDK;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278931; x=1773814931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TGPDzCetFaR4YT17ANFbNy+RRIGIZIG1emzNFReTb84=;
  b=sdmKGWDKkYZbcJ0yloYtHE5WCP119XqfyyKVZQghPGyaH5C4UgphDg0R
   3j1UR27eKID1AitHXIcRwkb13rSc+u6qxB/oFjRUAXfx8OlQB1PTKa5XE
   r8zPAE405OhJYpyomL4eoRtBmgmHjUorEorYNsqV4R4ZBgSjGM8fuR0IV
   aXBYSrzD1mQ22sdiYDAJk+bwmCo4Dd6Fr4K6eHZrkVbF8AsvlHzLYz8TD
   C2kmdMbpxqqY+nONLhiUq3B7LEwSJbOBSyhbC+Py9iQPXyuOvr40s2UKa
   gDf0lUDGqpe+UdvuExlKyFkU9U9C0f/mZ4FoITxGCCE2OMGkW+x34Dwm/
   g==;
X-CSE-ConnectionGUID: FJvKrJM9TAGRR5bjAypnxw==
X-CSE-MsgGUID: BFnWoSJATj6M1vZfMU8/kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="180801797"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="180801797"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:08 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1271BC2264
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CD89CD72A6
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 936F31A0078;
	Tue, 18 Mar 2025 14:22:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/12] python3-pycryptodomex: upgrade 3.21.0 -> 3.22.0
Date: Tue, 18 Mar 2025 14:21:50 +0800
Message-Id: <1742278912-2989-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213176

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pycryptodomex_3.21.0.bb => python3-pycryptodomex_3.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.21.0.bb => python3-pycryptodomex_3.22.0.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.21.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.22.0.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.21.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.22.0.bb
index e5fb000d9b..5cc37d81c2 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.21.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.22.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "222d0bd05381dd25c32dd6065c071ebf084212ab79bab4599ba9e6a3e0009e6c"
+SRC_URI[sha256sum] = "a1da61bacc22f93a91cbe690e3eb2022a03ab4123690ab16c46abb693a9df63d"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.43.0


