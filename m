Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA299108E1C7
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:16:15 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7763.1773915373026195567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MnnowWYc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915372; x=1805451372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B6dnDPDiLFAUArE3C3Vji2CcbRZcPe4EuuQDXmmY6Z0=;
  b=MnnowWYcM7XSKyYJ9JvLECToNiDZy/DOwm7Dc0yc8rehqXpMGX1ot5VZ
   1kbW6OfmGUNFxjWOn/5rxTCgK6bmN2cOYQ7wcRrau4szs0Ch0C3k+KRTT
   LP4H1bVZqL54TG1nt17MfWxbkTSy/f5KKYXPhK/Wkd20nUznbFfz5PjAK
   vm5hMDmaDcGOgVwNwfHPpjteGYnFItfwcGw2GasUOAvSWCYQdhjNmIE5J
   kjWMXThHWI4wSJSc5m8RwBtkORYTroAbriBF8zmK9hkPzkdDSkczhWYU1
   mP3rXwb+TIKgq+D9rHRfaXAuVfJNAL3aF7HFkBgfAjqn2UqzNXV3jgp5D
   g==;
X-CSE-ConnectionGUID: BO7WwO+ZSQi8xIKrzAtZRw==
X-CSE-MsgGUID: RaASFNa4Qku3OKyCZ8ctMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233848608"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233848608"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:35 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 59F731000372
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:36 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0541F1C1729C
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1E70C101E529;
	Thu, 19 Mar 2026 10:15:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/40] squashfs-tools: upgrade 4.7.4 -> 4.7.5
Date: Thu, 19 Mar 2026 18:13:29 +0800
Message-ID: <20260319101332.2067-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233500

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{squashfs-tools_4.7.4.bb => squashfs-tools_4.7.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.7.4.bb => squashfs-tools_4.7.5.bb} (96%)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
similarity index 96%
rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
index eb3974bcb5..7741039fcf 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "bad1d213ab6df587d6fa0ef7286180fbf7b86167"
+SRCREV = "708c59ae80853b0845017c33b42e56061cc546cd"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.43.0


