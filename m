Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599FBD0C83C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:41 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56089.1768299932867106651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UHgUyol+;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299932; x=1799835932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=luBTLgwJAczK0/Df2OHyECOFHdV7wqkL5sly3fJihCw=;
  b=UHgUyol+dD1iu72bzEjC8+gXgXcSdRWrvOOFekEE27X/XAF7Dg9xudlE
   aoq/oPLZxhnc3J/vyYZ4o4lu14ibpIpSUQdT4IKxJOiHAwHsRL/+3oT6f
   ZFqmpGo/5r0Yo+e6/+Xwgk+bcAq14gC01LZ3oZQJu7LJdPnJArJqUzd+B
   eviWibIzdE/tssJ8nJ1fYseB6NUhPAp4r/Z0VhEDcd8Y9bCrzMRDX4R7X
   Yjri4i7OGpT4vwb3XZptotPY2pJLu5IJytKOeK4EI33xabbNt2mmETmNq
   y9L4COxaecaPMy3Wn1x5v8a9HEl626Jlf6mZM1mKVQDsCJ6JjufvYePt+
   Q==;
X-CSE-ConnectionGUID: /QF4qXrGRz+FB1exUpNr5A==
X-CSE-MsgGUID: C4Om0QtARBi/8DcnYDyfRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="204468571"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="204468571"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:31 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 51E913D6
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:31 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0D9461C00107
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4D33782308B;
	Tue, 13 Jan 2026 10:25:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/18] libarchive: upgrade 3.8.4 -> 3.8.5
Date: Tue, 13 Jan 2026 18:24:57 +0800
Message-ID: <20260113102509.728-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229246

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libarchive/{libarchive_3.8.4.bb => libarchive_3.8.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb => libarchive_3.8.5.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.4.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.5.bb
index e89638f5c6..fcfaf5d231 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "b2c75b132a0ec43274d2867221befcb425034cd038e465afbfad09911abb1abb"
+SRC_URI[sha256sum] = "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.43.0


