Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ABFC3DA4E
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10249.1720604663550000881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XI6Fakjc;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604663; x=1752140663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=slM3wO3BR7hCl7WiILgVdfF2xf10Yy6Mj5G7RNOYX1g=;
  b=XI6FakjcBNakQ1L6x8gaLjPkhEosd8dsDCEUoKZU+mGsDp7usYVcTkwb
   dqQuauKFZ3B9dTUFYnFjq8dzX/ZJzwQlxwxdo5QprEO1UQM6QADEmDuoA
   n4Ws1kGELcER6aqDl3HkilrvQQXMaFWZY1FEEQ8yzkbUSbkIgXhFF+7XM
   ODG4ncUFoGQIWd6/nepisW8ihBMCS3rxACInV1iY5lgHQBPwH6ADQcQae
   BOzaZN3E4PqwRKiv+atSTeYLT7DcxoT+a10YAACSTADyW/hWfls9xFFtT
   Txl74A4ZkWAfZHq9b2Dz7ofXE9YhQsQtQho6POTvvVlcxPSaPQOVRFirP
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="145576221"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="145576221"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:20 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BE903C68E1
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1439DCFF81
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A377A220028
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 544A41A000C;
	Wed, 10 Jul 2024 17:44:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/30] python3-hatchling: upgrade 1.24.2 -> 1.25.0
Date: Wed, 10 Jul 2024 17:43:47 +0800
Message-Id: <1720604634-23406-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--1.162600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrFlIP4ZuPPcgHeFrth0YLUNgj
	E0ANqbLc0CP47K67Rnla3FfVtlPVgnLYp8r9b7e29DGkDtq4vAwnhzAhgvoq55Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2zRPQ8T4oe5X0tCKdnhB589yM15V5aWpj6C0
	ePs7A07Zbv1Srwoyj1rvL2oADy0BljUk/ucWACkpjNS8mCJeOa5m/rBZA16wqrwfb61xtHYRsAp
	VLJPe+ERfZcjYnTe/+7sNRaq4VCJpa3/qNVPHcY8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201720

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- The macos-max-compat option for the wheel target is now disabled by default
  and will be removed in a future release
- Artifacts for the wheel and sdist targets now have their permission bits
  normalized
- Ignore manylinux/musllinux tags for the wheel target artifact name when
  enabling the infer_tag build data
- The wheel target build data infer_tag when enabled now respects the
  MACOSX_DEPLOYMENT_TARGET environment variable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.24.2.bb => python3-hatchling_1.25.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.24.2.bb => python3-hatchling_1.25.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb b/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
index 0ad545f448..111b447815 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "41ddc27cdb25db9ef7b68bef075f829c84cb349aa1bff8240797d012510547b0"
+SRC_URI[sha256sum] = "7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b72e734df6c74f4262"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.34.1


