Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCF0108E1C7
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7748.1773915314516443695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=anV5iZGm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915314; x=1805451314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=efSh4Qll7G7N5hNMZeclq669T0u06e4M6qnF/5Fi8mY=;
  b=anV5iZGm/sxipTjrDAbM3dlp2BpLPG7JfZYCNHsSprJ57XOs8LsRiB5Q
   04l+CtmSySW4X2RMfF3opoUuwMUQJNktQQDHjUVULDV8qVgWcF1P3aEvV
   ME4sVrlLsJCgTySi6+2yEyh9cLjclN4/qkXVhTIesvZjultUxRmB2+5xD
   ELG9oS5Dzc3DfOeBN7lXciTkCbEGAtp3sRQaqk4qmAdug4NEkEvydVsnr
   mLoN9Mq7/pVW85xF3IE3s202hIMiKeEDtOGndjkqhdBJPEHyZio3l+SrK
   YhYm7TNLdE1L0fcfOVfpb1r0A/L+uiuIgiiFHab9QKKtLBokzf2HYADP2
   A==;
X-CSE-ConnectionGUID: DY++3O/6Q3quiMimSNC7DA==
X-CSE-MsgGUID: Eh7036PhQ76ELc2ulEDdVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="222539981"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="222539981"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:13 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 132551C166C7
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:13 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id B6B7A1407352
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id CC8D7101E52F;
	Thu, 19 Mar 2026 10:15:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/40] python3-pygobject: upgrade 3.54.5 -> 3.56.1
Date: Thu, 19 Mar 2026 18:13:18 +0800
Message-ID: <20260319101332.2067-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233488

From: Wang Mingyu <wangmy@fujitsu.com>

semicolon.patch
removed since it's included in 3.56.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-pygobject/semicolon.patch  | 31 -------------------
 ..._3.54.5.bb => python3-pygobject_3.56.1.bb} |  4 +--
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pygobject/semicolon.patch
 rename meta/recipes-devtools/python/{python3-pygobject_3.54.5.bb => python3-pygobject_3.56.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pygobject/semicolon.patch b/meta/recipes-devtools/python/python3-pygobject/semicolon.patch
deleted file mode 100644
index 54828d7707..0000000000
--- a/meta/recipes-devtools/python/python3-pygobject/semicolon.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d00ad09688e9dcc42020949e276741d3ae58c10d Mon Sep 17 00:00:00 2001
-From: Dan Yeaw <dan@yeaw.me>
-Date: Mon, 13 Oct 2025 21:45:22 -0400
-Subject: [PATCH] Fix syntax error for missing ;
-
-This fixes a compile error with older GCC, for example GCC 10 on Debian 11:
-
-  gi/pygi-resulttuple.c:337:1: error: label at end of compound statement
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- gi/pygi-resulttuple.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gi/pygi-resulttuple.c b/gi/pygi-resulttuple.c
-index 8b793e4d0..4d892e94d 100644
---- a/gi/pygi-resulttuple.c
-+++ b/gi/pygi-resulttuple.c
-@@ -335,7 +335,7 @@ resulttuple_dealloc (PyObject *self)
-     Py_TYPE (self)->tp_free (self);
- 
- done:
--    CPy_TRASHCAN_END (self)
-+    CPy_TRASHCAN_END (self);
- }
- #endif
- 
--- 
-GitLab
-
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb b/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
index 8eb0f9fa6b..c17df1a9d1 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
@@ -19,9 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI += "file://semicolon.patch"
-
-SRC_URI[archive.sha256sum] = "b6656f6348f5245606cf15ea48c384c7f05156c75ead206c1b246c80a22fb585"
+SRC_URI[archive.sha256sum] = "2ec1cc8c55c7ffeebb97e58a9bba7aa1e74611f1173628084685446804a8881a"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.43.0


