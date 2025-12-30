Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EEAE9413A
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61240.1767086258069438526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iPo5MXAI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086259; x=1798622259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8izaXNalhmfcqe95nUZg2DhY4ZYiQxMerx/6xZzek4I=;
  b=iPo5MXAIsmdTTb4bhXdYEZ3ZYS8iTs/ifeh47c3CL7Zq1BA8T/jlvyIv
   DA8IRLcVpKRq/NMrMJtfaENmLkW+jTyqsKsaFpYzp5dqi+yHTTdNYDIcb
   VvMKRjKQeSgpSOF8PpUcjR9lgmSZc3PmNEGZtVsnM0d5YHZrDmRyyJWF1
   STRHKHSVHFgg8OG4eAg8c31SXDg8+BZB0e/Qf40L2OmwspyJRq6r9s0P+
   ywHK4nSsdF+AvUjZfPRHeNtmBxsJlJnIkjbB890AvjelEX+GnlprpiDjE
   BwJKTL9qUcq30jPIYsvRNGTdkLckRzK1SJC8/6K8W+FTy68z4LV1f6gbI
   w==;
X-CSE-ConnectionGUID: CjgZ0awrS7WCMMMzHZEMcw==
X-CSE-MsgGUID: 94JdHUN1QNugMl8sw5y2zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="224272867"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="224272867"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:37 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 213201C1C701
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:36 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C3257C00763
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3703E1800587;
	Tue, 30 Dec 2025 09:17:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/12] cups: upgrade 2.4.15 -> 2.4.16
Date: Tue, 30 Dec 2025 17:17:04 +0800
Message-ID: <20251230091714.1501-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228645

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- 'cupsUTF8ToCharset' didn't validate 2-byte UTF-8 sequences, potentially
  reading past the end of the source string
- The web interface did not support domain usernames fully
- Fixed an infinite loop issue in the GTK+ print dialog
- Fixed stopping scheduler on unknown directive in configuration

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/cups/{cups_2.4.15.bb => cups_2.4.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.15.bb => cups_2.4.16.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.15.bb b/meta/recipes-extended/cups/cups_2.4.16.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.15.bb
rename to meta/recipes-extended/cups/cups_2.4.16.bb
index dc22771db3..6c08e49728 100644
--- a/meta/recipes-extended/cups/cups_2.4.15.bb
+++ b/meta/recipes-extended/cups/cups_2.4.16.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "eff0bbd48ff1abcbb8e46e28e85aefaffa391a1d9c4d8dc92ab3822a13008d7f"
+SRC_URI[sha256sum] = "0339587204b4f9428dd0592eb301dec0bf9ea6ea8dce5d9690d56be585aba92d"
-- 
2.43.0


