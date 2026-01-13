Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DACAD0C838
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56092.1768299945552892038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s7PxQ6Xo;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299946; x=1799835946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YeRyra93kKHgKdUkZDJD1Eyx9G4nHbU2SVOkIC1Vcbk=;
  b=s7PxQ6XoboquEWnlY8nU02yky1ryp089bnBhsA43pLPkCzk7rmyaq/9b
   hS1sYbKB/k8w20bQFVsB4Z/cNwfXDuSfVDGynF4fdMVLMI2zUDv0ikEMc
   GbN2R+apRWXQz18tge336P7EokQlDTtjK75hhEYWP9xrwpAojDRIVnyTT
   HpX3v9Uy+8JKKh5QcKgdMZGemx9G7mNeBCpiSu1ugmCMvBi/NgY+TDAJS
   i+WLUmJqDtKhecWa7aaDiEYd9etEDqIZMMmgYqaRvtdhfQsf4n2d1FV/x
   S6xYCUcmevIo45N2TH3FXw/kJk3K5mXjFjiU0e4NQjNYtlkviRd7yfA1M
   A==;
X-CSE-ConnectionGUID: erZanaatRXuibPva78XVpA==
X-CSE-MsgGUID: wLgoiQSfR3axkoF2ZHR2PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="213060240"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="213060240"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:46 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 2235C42A328
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:46 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id CCBCC18026FA
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 11195826FFA;
	Tue, 13 Jan 2026 10:25:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/18] python3-urllib3: upgrade 2.6.2 -> 2.6.3
Date: Tue, 13 Jan 2026 18:25:04 +0800
Message-ID: <20260113102509.728-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229253

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed a high-severity security issue where decompression-bomb safeguards of
  the streaming API were bypassed when HTTP redirects were followed.
- Started treating Retry-After times greater than 6 hours as 6 hours by
  default.
- Fixed urllib3.connection.VerifiedHTTPSConnection on Emscripten.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-urllib3_2.6.2.bb => python3-urllib3_2.6.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.6.2.bb => python3-urllib3_2.6.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
index 3957818f6f..e63791a8f4 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "016f9c98bb7e98085cb2b4b17b87d2c702975664e4f060c6532e64d1c1a5e797"
+SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


