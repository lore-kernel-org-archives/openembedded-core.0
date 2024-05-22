Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CC9C27C4F
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.5652.1716369347554514157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LyZbbqlV;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369349; x=1747905349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0kzaneI/QHHR50oZ0iCu71W+nc4s0AQuKRcgnQOSiIs=;
  b=LyZbbqlVGt0eyIhKyTeJ2auWs3psmRbqDGulrAC7lr3PImCFqYBIxdGn
   iG2i+QUucb8QHrnifen1mfetPGOlTCCJDq/69raw0mz6YgY5t2U8UDDYm
   wjLpZNR4JAjKP6DxLyQdkcpduRmiT8t66ahI9bqJaFEHNCUYiUS3mJyhe
   puEcMS9ExZD2gNsMJ+rJhuSVFfoaHGwDI3y5jd2XcC6bb4okjT8TMMDVb
   ss3gjAuTdkBAdqvQMisnAsXVw6QLC/s8T9exugCpowypqAA8WoB1EOMgi
   n+5tQlzKhaUtq9H6UUrCpj+rd+/hNXeDYb1B8L7J06WPGCQAPTaMzSdyU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="161119274"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="161119274"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:47 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BFC69CC142
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BD7ADD7008
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 43FD920097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DF7B31A000B;
	Wed, 22 May 2024 17:15:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/42] python3-zipp: upgrade 3.18.1 -> 3.18.2
Date: Wed, 22 May 2024 17:14:45 +0800
Message-Id: <1716369289-22526-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKgk1850LtKglaLGweBFypUwt68lisxkm5pMI
	nAFJCQm6QfuBtAM4MazPmHnMwIoCT6/PxdWCcEGQ0Lm+JPb9JNaL5Zcl/WZT3+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199732

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.18.1.bb => python3-zipp_3.18.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.18.1.bb => python3-zipp_3.18.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.18.1.bb b/meta/recipes-devtools/python/python3-zipp_3.18.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-zipp_3.18.1.bb
rename to meta/recipes-devtools/python/python3-zipp_3.18.2.bb
index e43432469d..97aa1fed25 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.18.1.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.18.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "2884ed22e7d8961de1c9a05142eb69a247f120291bc0206a00a7642f09b5b715"
+SRC_URI[sha256sum] = "6278d9ddbcfb1f1089a88fde84481528b07b0e10474e09dcfe53dad4069fa059"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


