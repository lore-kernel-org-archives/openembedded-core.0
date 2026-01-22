Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90C7C44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 09:05:47 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33182.1769072740261743000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 01:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GBBuLONS;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769072741; x=1800608741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zZmuk8dzGnsnszMt9S9nOc2+IDtGtVMxBinSJK+ozvc=;
  b=GBBuLONSbtAUpj2iNqppResKO0oWW5lVwUm+spMBgTuz6mWB3kOeLyae
   zuupstBO89v3NkF2i6I6uCFSKXfm1c33c6a0sUd2/BtDrv1CKLUOn0cdM
   qFiDOBF0Sg6pymGDrwDRApuwGuUM9nKgFr8WfKfy5IGVoN5PJ0l5qpbKZ
   iJvfGmzDn+qoXRp1gxX46XZ5ohtDSZl6DaFsViw/31ZuZFcp7PDSC2Uls
   TOJZ5Hqd1nvgJ7yn+kw+z2TorRFi2l61oJS+xsUJvtkUpUIMETablKsi4
   Hs3cccaWgstOK7ZaUjB3ZAJ9Rq3o7/lu+vFndAUJezEHfSC93lgiP2Ws1
   g==;
X-CSE-ConnectionGUID: uLwRs/ngSo2kHUAIGrTebw==
X-CSE-MsgGUID: Xcpo9cGbQSGQRcFoOIAiKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="205524489"
X-IronPort-AV: E=Sophos;i="6.21,245,1763391600"; 
   d="scan'208";a="205524489"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:05:39 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 1D2A21C1C70C
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:38 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id CC3F414042D0
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 387DB2000109;
	Thu, 22 Jan 2026 09:05:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 4/5] jquery: upgrade 3.7.1 -> 4.0.0
Date: Thu, 22 Jan 2026 17:05:12 +0800
Message-ID: <20260122090513.888-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260122090513.888-1-wangmy@fujitsu.com>
References: <20260122090513.888-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229837

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Use named exports in src/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jquery/{jquery_3.7.1.bb => jquery_4.0.0.bb}           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/jquery/{jquery_3.7.1.bb => jquery_4.0.0.bb} (80%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.7.1.bb b/meta/recipes-devtools/jquery/jquery_4.0.0.bb
similarity index 80%
rename from meta/recipes-devtools/jquery/jquery_3.7.1.bb
rename to meta/recipes-devtools/jquery/jquery_4.0.0.bb
index 0de92e041e..12480fef05 100644
--- a/meta/recipes-devtools/jquery/jquery_3.7.1.bb
+++ b/meta/recipes-devtools/jquery/jquery_4.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://jquery.com/"
 DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://${S}/${BP}.js;beginline=5;endline=7;md5=9c7c6e9ab275fc1e0d99cb7180ecd14c"
+LIC_FILES_CHKSUM = "file://${S}/${BP}.js;beginline=5;endline=7;md5=cc4cd2ec01b168aa853fb281c97902bb"
 
 # unpack items to ${S} so the archiver can see them
 #
@@ -16,9 +16,9 @@ SRC_URI = "\
 # Explicitly set to 1991-10-18 20:00:00.000000000
 SOURCE_DATE_EPOCH = "687787200"
 
-SRC_URI[js.sha256sum] = "78a85aca2f0b110c29e0d2b137e09f0a1fb7a8e554b499f740d6744dc8962cfe"
-SRC_URI[min.sha256sum] = "fc9a93dd241f6b045cbff0481cf4e1901becd0e12fb45166a8f17f95823f0b1a"
-SRC_URI[map.sha256sum] = "5e7d6d9c28b7f21006535e8875eb47e9667852a14c4624eed301c6cea19ae62b"
+SRC_URI[js.sha256sum] = "f5fb077959ca06faa1dc50761d8bbb836c6c78067932537a2b3fea9e401257c5"
+SRC_URI[min.sha256sum] = "39a546ea9ad97f8bfaf5d3e0e8f8556adb415e470e59007ada9759dce472adaa"
+SRC_URI[map.sha256sum] = "7d4a0882fe3f8ed0709ec7ebef361d67939488de2e0a6ce41b3bba82857895ef"
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
-- 
2.43.0


