Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A033108E1CD
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:16:15 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7763.1773915373026195567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o0c5AyBB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915372; x=1805451372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SOzgIi+heSIQlaUMuNwTZgRVdF9uA9rf3EpozyYuzJs=;
  b=o0c5AyBBec1fqaiSrscQ/Eppk3YE/vYYGGPcbNB38q+EfgefeAXO5Cmp
   aB0nC8pgmHsHBvHE2OWYAmzuiVdZoBLObFbYS3+1/CbA53ItXWQKvLKyB
   NyWj8YpHv4ilKFTQKrN06l0qZueb1LgbIMgb9O1kielbGj7GJ0pspS2C9
   LdwnCQr8YlQLjYIxOWQcTO1lOqg2eMirFXyQA+qFhLSkdoZmXPiaQKEx1
   wlPnrIVwV1r7HxdEXOHlWNWr5MTm0vvMBCERIG690flMceMsQM2vR8rLE
   5UayUugfTgT0KFhRHD1CCjsw828ZpeOCINTpsciW4zdbfTxbBaj+XpRZh
   g==;
X-CSE-ConnectionGUID: 4s7ePwgdQ+GtbczmwgDWEA==
X-CSE-MsgGUID: S4ejBvA/QuOJ3ZjgrIo/WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233848605"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233848605"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:33 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3589D1C00180
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:34 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id DC8BC100D101
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id F0C38101E52A;
	Thu, 19 Mar 2026 10:15:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/40] sqlite3: upgrade 3.51.2 -> 3.51.3
Date: Thu, 19 Mar 2026 18:13:28 +0800
Message-ID: <20260319101332.2067-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233499

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.51.2.bb => sqlite3_3.51.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.51.2.bb => sqlite3_3.51.3.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.2.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.51.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 6837293f6a..ea583e4a42 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -4,6 +4,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb"
+SRC_URI[sha256sum] = "81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e21d77a"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-- 
2.43.0


