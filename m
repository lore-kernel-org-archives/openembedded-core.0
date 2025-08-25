Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F98CA0FEE
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 03:51:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.31417.1756093890405217278
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 20:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NYO3QkE0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756093893; x=1787629893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t9SBjRwB5udJ17zL+3Js3NFa/q7I3xShbtWFhdJn00s=;
  b=NYO3QkE0WBVQG8xl7d7gEhOaTVKM9sgRuBbDTwRiVGMmFTNIasNvU8Ag
   7tbpyb8j1XB7arxqIZzHnepPtCCoowOYknnyzaCIF66IDcNjiLaHhXFcv
   1qxzPZBg2SxVmx+NNvonLojGyv/YF13q7liz1lxFpTlEclPlgad65FMyP
   NSd5Q7SnBw4ZWhne5OiPoUa+WM6mIYR8fLMteAEulokks0Sn4+K79zELA
   xlQXMbSDOWBt73ssBuv0q187+DwwV16/KguDG/cQs2xdLqKWZHnNf73Ly
   8KFYMEiUDwOqcJW4Q516mGbPVAUGVZi2XxgZaxnFUQ6J1kRRC7G351V+O
   Q==;
X-CSE-ConnectionGUID: 522IKCkqTmu63IXWamy9yA==
X-CSE-MsgGUID: E0LIG2fjTaq8Vd6faLdzKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="210427171"
X-IronPort-AV: E=Sophos;i="6.17,312,1747666800"; 
   d="scan'208";a="210427171"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:51:32 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id CDAFC1C1C700
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:31 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 88E3C1400386
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 867F310000AD
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:29 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8E1341A009B;
	Mon, 25 Aug 2025 11:51:25 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 10/10] python3-jsonschema: upgrade 4.24.0 -> 4.25.0
Date: Mon, 25 Aug 2025 11:51:09 +0800
Message-ID: <20250825035109.797-10-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
References: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222403

Changelog:
=========
- Add support for the iri and iri-reference formats to the format-nongpl

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ython3-jsonschema_4.24.0.bb => python3-jsonschema_4.25.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.24.0.bb => python3-jsonschema_4.25.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb
index 777cc649cc..2f683d5bde 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "0b4e8069eb12aedfa881333004bccaec24ecef5a8a6a4b6df142b2cc9599d196"
+SRC_URI[sha256sum] = "e63acf5c11762c0e6672ffb61482bdf57f0876684d8d249c0fe2d730d48bc55f"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


