Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018BDE9413A
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:30 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61204.1767086242135528477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rQsvCsRY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086241; x=1798622241;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iULqY7sSsZjBvX0oH7Lb+UiBWg9TjRfkv5QpSbe68FU=;
  b=rQsvCsRY/q2j8owdZcwresE+Jr0vzWvUYqmPdA7OWwonU8S4WScFzJk9
   fREL44a677pres+EZXtoTfNz1YyvtZkIiVD3Br8Tu5aQGtw6jBC/mAIdE
   k6DWCohy9unjd7pqNjIYi5v/f/K0VQMLEKmMPHh1UMrHCKcI3/ffGQh1m
   b6ZYvGC/+y4UOIgQ9rTmxEHsviSCWTjXQxino3fuMPlkZHuEZt2vt3C7a
   Q9JZJxcv3I+qtHLVpJoCfErXF61mmKL9E1yvlY5asRLtjDMpQTIdkIhYp
   hOvnCH6FPeL8GRK7R3vgzq1+H/mCY9WKDksYlzlwv7malEhIe49TOYzv0
   g==;
X-CSE-ConnectionGUID: k9Y+vvoXTr6+PPu6c9dGPg==
X-CSE-MsgGUID: B35my+A2Q1Gp5M6pWbCobg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="223706275"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="223706275"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:19 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6D2C142A304
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:20 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 101F91C002D3
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8DEBB1800135;
	Tue, 30 Dec 2025 09:17:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/12] bind: upgrade 9.20.15 -> 9.20.16
Date: Tue, 30 Dec 2025 17:17:02 +0800
Message-ID: <20251230091714.1501-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228643

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.20.15.bb => bind_9.20.16.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.15.bb => bind_9.20.16.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.15.bb b/meta/recipes-connectivity/bind/bind_9.20.16.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.15.bb
rename to meta/recipes-connectivity/bind/bind_9.20.16.bb
index 1195b5bdc3..33068b5b5a 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.15.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.16.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "d62b38fae48ba83fca6181112d0c71018d8b0f2ce285dc79dc6a0367722ccabb"
+SRC_URI[sha256sum] = "03ffcc7a4fcb7c39b82b34be1ba2b59f6c191bc795c5935530d5ebe630a352d6"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


