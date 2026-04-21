Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23630F89246
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:35 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20468.1776765444440881433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F9lSMot3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765445; x=1808301445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ev7N/M1pjAp+/T39iP6ZloBjVE+326wpC6B7pUponeI=;
  b=F9lSMot3/vbGTk62Z6w8SpH1eRepb6wpNDOFQTCI/IqXYNhXXebjTVhq
   7ALm69Bls1csKIUoXg8FZ/ilWk5JLOfx+smOuBMgntTsfuoAYgooDXrDn
   tfscX1MceQw337HLWqHWGz59ei9bBuKS9LF+4HRjWeajrpEs+UZ9c7Ipl
   cN9rD3s1CzgzMnIlqrbZNbnfJSwDmA/qr+0uoNMLHsIvYr5nQhi9fzZEM
   lzoECoP8UU/oDc6t9rc5A1Jb32vKvVUQX4qjAJo2p3avj7ikhygRJRwYM
   r02FoBt6k9Ko1f5LrJ9637dY4phxiIS23uXxb0syZNnKnivZCdAp2RzSk
   Q==;
X-CSE-ConnectionGUID: W2oD4k6yQoq2dKY+GlxOsw==
X-CSE-MsgGUID: vHhLv8jbRvq0XFuPVf57Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237630105"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237630105"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:24 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EEFC91000348
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:22 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9D406C00230
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1E2C614000E6;
	Tue, 21 Apr 2026 09:57:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 44/49] sqlite3: upgrade 3.51.3 -> 3.53.0
Date: Tue, 21 Apr 2026 17:55:54 +0800
Message-ID: <20260421095559.1856-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235652

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.51.3.bb => sqlite3_3.53.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.51.3.bb => sqlite3_3.53.0.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.53.0.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.51.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.53.0.bb
index ea583e4a42..21295bf437 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.0.bb
@@ -4,6 +4,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e21d77a"
+SRC_URI[sha256sum] = "851e9b38192fe2ceaa65e0baa665e7fa06230c3d9bd1a6a9662d02380d73365a"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-- 
2.43.0


