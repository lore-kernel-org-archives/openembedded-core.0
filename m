Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE94DE95A60
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61244.1767086269478929691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YkpRT3Ir;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086270; x=1798622270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/+9aWQUV3oaGusvNUghppUzPS03IDKwcqromh0v2Brw=;
  b=YkpRT3Iria3iswGjCQ9S3pnnqilljKGGNa+zgrPzRO29gWSi/kQg4Rne
   6qoUWUrbreMHSaC8wO/Y2C08LUATW+f9Ux4SELeOnXZ7/r6cM4fho3ZVr
   UJoP6zmgycrtzBnYfyucfkDAlUPAX1rgSeSgDHx2nb5BKHekh+26AkJUS
   oe3TOSTn/HfQM2Hn1bI3HUzBGWGE3Y7HqxXu4qm9ND7VEzucUQmMkT5i0
   pARuPtes3ecxiIsatB51jCcDxFcsnJf7zFy8qJZUakD/TQOsYPSODwcUK
   yYktRHaj9Mb6+bAvZ8ig9qCj9RKLJvTN/fk6lNN4R4dYWLxErn5FnyE7f
   g==;
X-CSE-ConnectionGUID: 4BJA1vZaQDSgfdwOVZplaw==
X-CSE-MsgGUID: soKwqoE2RJ2lnRGluYdMdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="224296813"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="224296813"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:48 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id DFED18203E5
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:47 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 95830180025A
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E4C3C1800135;
	Tue, 30 Dec 2025 09:17:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/12] repo: upgrade 2.59 -> 2.60.1
Date: Tue, 30 Dec 2025 17:17:11 +0800
Message-ID: <20251230091714.1501-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228652

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.59.bb => repo_2.60.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.59.bb => repo_2.60.1.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.59.bb b/meta/recipes-devtools/repo/repo_2.60.1.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.59.bb
rename to meta/recipes-devtools/repo/repo_2.60.1.bb
index e447fd9492..4a981e5270 100644
--- a/meta/recipes-devtools/repo/repo_2.59.bb
+++ b/meta/recipes-devtools/repo/repo_2.60.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "1afe96a7e997ce7748f066b206a85ac648f7a87c"
+SRCREV = "871e4c7ed153682a77de44e300b5f5461eb08538"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0


