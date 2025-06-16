Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB080C71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.26275.1750065420316804375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mYw+3ViK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065421; x=1781601421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0asXd8KSkUmTEn0cRdrLRTkF6U5OM5AKDoEzBDZLWao=;
  b=mYw+3ViKerYfmCAT4Fnprt9WzrNkQ5Bv6obZ0O+yw5x284jabqAWwqB8
   HV4f3Eft1DpZlksssLzt3WzgH/hTyJNoPFagtwMWPjWjIiA5Kz36NMvrz
   fn9dwpd52ezhd/qeYKM3cK1YciwmxNyxhcOpr9wXorFcuAVNRjkcOx6DB
   X2l6xhYsUqmKfxnoghCblM+NzdWEQvQz975Gw3THJ4TBNnN8d6iwAaouk
   rX8iCIgVneXEXA0Uk9newCAI5OTBXZIRMCb2mWOpn80TknyRk8LYn1eex
   Lp///pHZRbtX03OjcUhfmmWRdGH1JXqj0hVXzpKW6Lvefikl8JVilkUhw
   g==;
X-CSE-ConnectionGUID: NtU7m063ReOD4gbJFXkRRA==
X-CSE-MsgGUID: Z1ess70sQl2WYFCHDZWFCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202837535"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202837535"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 49531D8E64
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EAD4BD4C0F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:54 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8429E1A000B;
	Mon, 16 Jun 2025 17:16:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/24] python3-pytest-subtests: upgrade 0.14.1 -> 0.14.2
Date: Mon, 16 Jun 2025 17:16:37 +0800
Message-ID: <20250616091643.918-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218795

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Print output "dots" for successful unittest subtests
- Improved reporting in case subtests raise pytest.xfail

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...est-subtests_0.14.1.bb => python3-pytest-subtests_0.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.14.1.bb => python3-pytest-subtests_0.14.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb
index 56cec25b86..58212bfb1c 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "350c00adc36c3aff676a66135c81aed9e2182e15f6c3ec8721366918bbbf7580"
+SRC_URI[sha256sum] = "7154a8665fd528ee70a76d00216a44d139dc3c9c83521a0f779f7b0ad4f800de"
 
 PYPI_PACKAGE = "pytest_subtests"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


