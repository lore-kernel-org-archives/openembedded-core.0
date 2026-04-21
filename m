Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5E5F8922D
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:53 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20400.1776765410651722750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OEx3KJhq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765410; x=1808301410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hNLEHvarRrm90w2LPdaUykkuhrqJGA6L2kIflLrs/WY=;
  b=OEx3KJhq+I+r1no4Nac27TmSmrdVIIxBJQP0cP2h/enBAQCFKuppnXmL
   Qxq1Z/1H8bssRf2rAsofsa+gWAVKeyKQsmx6oD0Oe4J2lR3QhksiedD9D
   DSR+aqv1iHKPTJmP09MS7xjqTemKcTmMIrBm0XgUiMLQtG0I+P2nt9Som
   7yvBaq6+N3P4exrHcSG604BQ3R+UiFMVUC9oG4jQ93oH5qYfOaRcBGZJN
   QIFfpk7B86/sNrKIzeg6NGJN7BBQ9EIKjdXJiPdExEAA+iFw6CRYI7jJ2
   jzpKCnUkNLgd3jXMA6RhmVIwgLPtit5xt07z++Iacoe7zRnAm1LkUDAzP
   Q==;
X-CSE-ConnectionGUID: V7PmnnVcR0KAbUoFyea0XA==
X-CSE-MsgGUID: qLM1r0YTSmuLUFl1YY33Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216684696"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216684696"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:49 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 13DCC820C07
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:49 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BBF7A180009F
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 54DC414000E6;
	Tue, 21 Apr 2026 09:56:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/49] python3-build: upgrade 1.4.0 -> 1.4.3
Date: Tue, 21 Apr 2026 17:55:33 +0800
Message-ID: <20260421095559.1856-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235631

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-build_1.4.0.bb => python3-build_1.4.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.4.0.bb => python3-build_1.4.3.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.4.0.bb b/meta/recipes-devtools/python/python3-build_1.4.3.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.4.0.bb
rename to meta/recipes-devtools/python/python3-build_1.4.3.bb
index 910f08374b..1e7794fe3f 100644
--- a/meta/recipes-devtools/python/python3-build_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.4.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "f1b91b925aa322be454f8330c6fb48b465da993d1e7e7e6fa35027ec49f3c936"
+SRC_URI[sha256sum] = "5aa4231ae0e807efdf1fd0623e07366eca2ab215921345a2e38acdd5d0fa0a74"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


