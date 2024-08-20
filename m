Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A5EC5472E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.12772.1724136731139488979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qWb6QeWt;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136731; x=1755672731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5yyxtTTTINDk/Jcvk/ukkxGQuz7hYtYOhukSHD60RpY=;
  b=qWb6QeWtcI4bm3Fpe2jzJxe/y5rm2Nz+jUggeUxHDEvxwigKjpL4q3pT
   flMca9QOjkdQ03pjk9NpoYAXnEVLX8k3uXoTMbz8q3qY2Ikyb8U9a0OGM
   Wkj6ubHoR6lsgeFbbL5m5UszGsKPFRuMyfPCIhUUUvpJ8Um3usdqU3MOT
   IargDxDwuwRa1vK+Nyv4Dx8PBAJL4TGpMjAe8UBE0bmm1hdOuvzARh0iD
   LYGlw51AgIJyuhUT5YRIgx07B3a6kQcODbgR7aC0PKEuTPiGibPDgkBhM
   +d4TQmqHAx83MSwzQ8Pmam7EB80OiU8HiU3bA7Qw1UI7kgG8kz0iH9ptj
   w==;
X-CSE-ConnectionGUID: ZfkW//ONRDSHXyxg/52Egw==
X-CSE-MsgGUID: b/e56HQgRSCk71CxXh/Lyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="150507947"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="150507947"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2D88C944D
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE335D50B9
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B3D020086115
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 02A801A0002;
	Tue, 20 Aug 2024 14:52:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/24] createrepo-c: upgrade 1.1.3 -> 1.1.4
Date: Tue, 20 Aug 2024 14:51:22 +0800
Message-Id: <1724136703-20023-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10--0.267000-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ0nRdgVDNL3Q8rYO92b9NmngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDUum2Z3hsbYcpWOQkDs32z99R6OhMBkULWPI4kUlhNdayFemZaQp10hIXaU/RjDDyjJ5D
	5GQknTfqS1CbfTkgc2NVJV0Uzpq00yLmVkJTlglFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203525

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_1.1.3.bb => createrepo-c_1.1.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.1.3.bb => createrepo-c_1.1.4.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb
index 2e08449812..0a37c76187 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "e93766dfc30f39b16d41f2d0eb130c92c16993ab"
+SRCREV = "a5a8990ff84b7977218976ea14c703330fb52875"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


