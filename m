Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A61C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:05:32 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9672.1785816316780011266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DGPk9QPm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785816320; x=1817352320;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8U8NqMzHpPU272tkVsQH8IzkXS1FsGi0KLt5MST6vZU=;
  b=DGPk9QPmjynvX750re0sGzXlvas92jZtwNH64J9ZP9eGoSiakSwi2Sgp
   qVN/Oi70MMSSz4/hlrFlJrd9jNlJ0hKpWPUMfyDdS6d5VyDzRFf1uBDGx
   /2y1jB+MGyll8RJH8d6F47/MAz4SAi71ucW03KJw3oVfInfmZQ4EAaUof
   GKharq1aM3hbyn7ZD/IUGV+Dy242QYEw2hBK6b4uzMnj2JXMPUi0pJLUv
   xJwzaRqPzAzWB8fzJNiGQ+Qin0gIyCy+i06SiHm5T5u5s++JZE99Qn/H9
   Qyy54Pw5SoZ0n5GP25+TVS/YmjcmZiPhBC6iWc8pA3xFiQe9f8n4UTcHP
   w==;
X-CSE-ConnectionGUID: Bu8+Q3+4RGatrcjgy6ccGw==
X-CSE-MsgGUID: yhPDLJlZSVi2+ul4M46B8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="253187887"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="253187887"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 13:05:18 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id ED071C01AFF
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:14 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id A45E5C02F13
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id A415F1800B07;
	Tue,  4 Aug 2026 04:05:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/8] gn: upgrade to latest revision
Date: Tue,  4 Aug 2026 12:05:01 +0800
Message-ID: <20260804040509.1454-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242677

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 64217adbcb..eddbbcdf7f 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
 "
-SRCREV = "1d86777e7f2562a86ecea77d1809ac4f82bb5bfe"
+SRCREV = "17b0057970fa2b07a20cbb4289ab78cf93565f35"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.43.0


