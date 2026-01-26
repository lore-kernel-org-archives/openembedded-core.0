Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C89CF65FF
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:38:56 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19096.1769431135017249618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k1wX5d+2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769431133; x=1800967133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P0G5XjNHfGVOmZj8qsKIakVJStF6skVUkcjK70BMsJc=;
  b=k1wX5d+2W2MSRJ/NqpAqD+dEJP/V8SRtCBHD/DEspU+YpBd3qK2+1uzq
   C9T7Cug8kKdJkVRKRDccbGVon6gyxqERUVbi13ioaIHeqxY6qma8I5jTC
   dZcLj4bN3aWT183xo0uus1gIB4PL67XFnPHDVOmjhMyBbnoIi50ADHkTj
   3Fum3xTkYO+zp8/SoddoZLn7UN1qLHREl7At872/T+pnOfjc4SfL7npvH
   YY3S9/doYS+parfxizsRCZU2VqSxHbA245WCTgoJyaR/u86TyyBGvDS/Z
   NIANtzSyn4n6R5qDD0674KfCHTBq09Cn/m6aEBUr4/ql+FFB9DXYYaCJs
   A==;
X-CSE-ConnectionGUID: K0Bpf6L8Q32q7IrUFGPHPQ==
X-CSE-MsgGUID: 6LONadvnRF2IUqjMrkfBPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227762548"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="227762548"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:38:51 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 96EEF42A301
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:38:53 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 49E79C01EDB
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:38:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B9527101905E;
	Mon, 26 Jan 2026 12:38:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/17] python3-pyparsing: upgrade 3.3.1 -> 3.3.2
Date: Mon, 26 Jan 2026 20:38:40 +0800
Message-ID: <20260126123844.1052-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123844.1052-1-wangmy@fujitsu.com>
References: <20260126123844.1052-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229997

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyparsing_3.3.1.bb => python3-pyparsing_3.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.3.1.bb => python3-pyparsing_3.3.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.3.1.bb b/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.3.1.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb
index 37d5b192bc..2565751f28 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.3.2.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c8a9625037eff2407f8456010875183"
 
-SRC_URI[sha256sum] = "47fad0f17ac1e2cad3de3b458570fbc9b03560aa029ed5e16ee5554da9a2251c"
+SRC_URI[sha256sum] = "c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


