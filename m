Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BB3D11704
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:04 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.5577.1729834800084248981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LmJF816P;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834801; x=1761370801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HqkNKBk5JuwMom7DSddoscikr4Eq/mb+3UsKBMFZCuo=;
  b=LmJF816PXvVnI/s+iqRxma++2JT17xwNtVPjXCGk8CTQhuU6xYUDNCl3
   7hoH5zuGYZY2GkQQqAr73kUXyKumWoW3aREQ8O1/vUjXK7zZ94jfzMjOW
   3SJSA2sDKFa9kx6Nuy4HOn2huG34tGidrSPa0v0uKBq0YO2yKmFEOAYjm
   rG5XoY3AGEqT7w2gTOPG10QCjd/SH0IpR3w13FvamriVXpVAZafKBuAW+
   MGvbAhSFNnQV8CEcrzyQ0hikWaXrhmiWEAvAXWRrIlOrvz04kBY8prhUK
   Eq2KJ7tB6gzDE2bBV0fHI+Q6E9lo/gRItX/CTc4u8YXdeHTd7L4pCrSvk
   w==;
X-CSE-ConnectionGUID: ZzipHy/MSZ6qF6ROO5Pwtg==
X-CSE-MsgGUID: YSu8rje2STCmpt+mFXZVhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="177944732"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="177944732"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE7ADC68E1
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 15648D3F0C
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B03C520071A0D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5EE531A01E9;
	Fri, 25 Oct 2024 13:39:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/22] python3-jsonschema-specifications: upgrade 2023.12.1 -> 2024.10.1
Date: Fri, 25 Oct 2024 13:39:22 +0800
Message-Id: <1729834769-4717-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-3.677700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMO031Nfxfj2zMQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXI3wrku5AZaXVS29H2EQ6Xgbc/T0RLXrksEDJ
	IsuTmdhINkaUh0Jf/KXjZrXJU9vR1Fza/fAUwvPxfxWNj2xd/Ter2s5RFggbj+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206324

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Declare support for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3.12.1.bb => python3-jsonschema-specifications_2024.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema-specifications_2023.12.1.bb => python3-jsonschema-specifications_2024.10.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
index 4ee0dd9b12..6ef83e0554 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2024.10.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.org/project/jsonschema-specifications/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "48a76787b3e70f5ed53f1160d2b81f586e4ca6d1548c5de7085d1682674764cc"
+SRC_URI[sha256sum] = "0f38b83639958ce1152d02a7f062902c41c8fd20d558b0c34344292d417ae272"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


