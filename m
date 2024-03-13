Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5A8C54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.10641.1710313764854466666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pP/YzrfA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313767; x=1741849767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/Rov0dYN/ATCYQNztLhcO7UlPsVAld08honeqllLXeo=;
  b=pP/YzrfAKR61dt5UKv3m8MxcXuruK7NcbtZQKEdJHoSIaUTTshuqfETX
   kfIhVfnEfHBdWlnPZoiFdtxx/VnJaYs6rl9Vb2FiFOTl14fGFFYtIyp65
   dUX9bnFi3Bm2KX/yWsuVWu1Yd/ImXwOcqxM6nWf1qCTeUdkUuV36WDUKJ
   KF5g31sBhj8Kphw59Tqq38tNOboYphhyh4xPm+wmqoCDE0SLRviO1lSTo
   tSzYKWyF+fz/A/NxfATtAYncd34Pkia+xo1noExzkVak3w4Ha/th42CC+
   V6BMbgFp6l99a0tDAy4y/ApeBe0AMrMitZ+vfN/O1mi8+qc62GHfp+Mci
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="131486876"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="131486876"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:26 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C7CC3232A6
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B892D5EBC
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C8F021BD41
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 47CFC1A006B;
	Wed, 13 Mar 2024 15:09:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/36] python3-pyopenssl: upgrade 24.0.0 -> 24.1.0
Date: Wed, 13 Mar 2024 15:08:23 +0800
Message-Id: <1710313714-12541-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--1.432900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7+nO6XIc7fLl5sO
	lqYt3njppzrHTBB0si7bCHv011Gy9e1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNe5+4KX96PVE/+Jb4TTbWVoXZxI9jKAnE3ylv5RQbSGDB4Oe4Yl0oBj9b8GprVGuY8USO
	VB/qm73HcOrMaL0MLaOOLs4mYgsKIByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197025

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-Removed the deprecated OpenSSL.crypto.PKCS12 and OpenSSL.crypto.NetscapeSPKI.
 OpenSSL.crypto.PKCS12 may be replaced by the PKCS#12 APIs in the cryptography package.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyopenssl_24.0.0.bb => python3-pyopenssl_24.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_24.0.0.bb => python3-pyopenssl_24.1.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
index 9ea3075482..e714ad838e 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "6aa33039a93fffa4563e655b61d11364d01264be8ccb49906101e02a334530bf"
+SRC_URI[sha256sum] = "cabed4bfaa5df9f1a16c0ef64a0cb65318b5cd077a7eda7d6970131ca2f41a6f"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.34.1


