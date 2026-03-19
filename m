Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019BB108E1F0
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:26:17 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8843.1773919574040651293
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=a2l8vpTZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773919574; x=1805455574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3rikbY1EHijShn4pRl2BQVSf5+9HNWoj2wfOa0S3CD0=;
  b=a2l8vpTZq1UXCpjj6DrWRZtfyV1g5mWttt8ZX7T3+RDJBeRzW5tgg4dX
   fO/4xqoNE07GvUs9BCg+9DYoTj+TED5fAy8H56bitrXE3kqcbk8Qlca2r
   ha0lBv8/WH6J8K0MTi0uwrOKbUn0Bfk3EuqwCyVwWaPe+aLgxsvtC2YK3
   nBIJjLnIqBxMVKoch9MIS/7bPITvs/YhwJcynl181tzaTFeTMdcxJOy49
   jXXasfjoaZWiR2Dk+ni7y5G9nVhNjdLzuyVZ92yjs6pyaHS/vrSCR9yWt
   eu8v2xwxgnOtGYzqWrWJMjIMZWyKxRDRbIhNg8tSuo2DmG46UqPH5TG9/
   Q==;
X-CSE-ConnectionGUID: 0/072opqSGKskctFXb3xJQ==
X-CSE-MsgGUID: p2BRb1QLQW2IGrSal2h8VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="212702382"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="212702382"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:28 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 032F11002B81
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:30 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id AC9B21407352
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id AF0D9101E52A;
	Thu, 19 Mar 2026 10:15:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/40] python3-xmltodict: upgrade 1.0.3 -> 1.0.4
Date: Thu, 19 Mar 2026 18:13:26 +0800
Message-ID: <20260319101332.2067-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233519

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
unparse: add bytes_errors policy and handle bytes scalars consistently

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmltodict_1.0.3.bb => python3-xmltodict_1.0.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_1.0.3.bb => python3-xmltodict_1.0.4.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_1.0.3.bb b/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-xmltodict_1.0.3.bb
rename to meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
index 693549b9c8..e622c00dae 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_1.0.3.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "3bf1f49c7836df34cf6d9cc7e690c4351f7dfff2ab0b8a1988bba4a9b9474909"
+SRC_URI[sha256sum] = "6d94c9f834dd9e44514162799d344d815a3a4faec913717a9ecbfa5be1bb8e61"
 
 PYPI_PACKAGE = "xmltodict"
 
-- 
2.43.0


