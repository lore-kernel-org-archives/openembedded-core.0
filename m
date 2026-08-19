Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3C4C5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 17:42:14 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2023.1787161326132577609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 10:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ft1gzL5O;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1515; q=dns/txt;
  s=iport01; t=1787161326; x=1788370926;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sTXxRZYRV1KeeBVPDp+Y7Tb58H8BT1AjTqzo56W2PIg=;
  b=Ft1gzL5Oc2xpFgeMw7fQTm+rVR48TO6no1WwwEK4m40T8aaVz52yVKKW
   QAAILHdvP4LA23xZFilYvWvCJ+zlQa0STlu+edAYUlmHL1BKMNc+twOxc
   aJK98a16vBWMnD7WyVNHVJpI5eUmIW09fbAOjXXpUgcrEvxXp2Cv0lBv9
   gGuJnvfIU3ZomiYpyJnNb7zVCncSmPa1aCQqbrcZxR9hfcQUOkGG7xgRH
   OlcETHcijDPaBShzmZXKzEpBxdhYXUjxJfd1I9pmIX8FriZBRSaCa4U6H
   apV8135fBQG2WbhYOLMx7uEO5n9k1jLoe/kAN/0OPaOHfOxPk13Fj4Pts
   Q==;
X-CSE-ConnectionGUID: iXSJyNq6QRCkptLuVEd3HQ==
X-CSE-MsgGUID: 5FHlK6lwQ8yEt+J4Y7nNrw==
X-IPAS-Result: =?us-ascii?q?A0BDAgDN6YVq/48QJK1aglmCV3ReQ0mTWQGCBJ8KFIFqD?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXSsLARgBLTBcRIMCAYJ0A8NZN4FZIDOBAYMoAYFU2zABCxQBg?=
 =?us-ascii?q?TiFP4gidQGEfCcbG4FyhH6CYQWBHgaBBoV4BIMcEpNDSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKA?=
 =?us-ascii?q?oJwggYCAUlFDgkMCxgNSBEsNxQZBD5uB45KIIJLgQ4rlieRfKEPCiiDdowhl?=
 =?us-ascii?q?ToaM4VbpRGZCI4KiHwBjVOEaYFoPIFZcBWDIglKGQ+OLhWIc8cmJzICOwIHA?=
 =?us-ascii?q?gcOAwuRaAImeV0BAQ?=
IronPort-Data: A9a23:XVHdrq9XMUWx7WIO7Ss6DrUD8n+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mEcWW2HbPncZmTzL950YIvl8kJSvJPWyNUwHlc6/C5EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjtFs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k3DbY668BuX1h03
 v8ANBQQUD2P3MKPlefTpulE3qzPLeHiOIcZ/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cOHWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZC9aYaNJYLUHpg9ckCw+
 0zm+0enBg4jZM2y1XmnrkPzgMnVgnauMG4VPPjinhJwu3WJx2cTAQcaE0Omu/W4h2a6WtRCO
 0IT5ywipLQz80rtScPyNzW/uHOCsxsWVtZcHuF/4waXx4LQ4h2FHS4DVjNHZdksucM6SDBs0
 UWG9+4FHhRmtLmTDHbY/bCOoHbqZ24eLHQJYmkPSg5tD8TfnbzfRynnFr5LeJNZRPWscd0s6
 1hmdBQDuog=
IronPort-HdrOrdr: A9a23:M978S6zFsecL6j37WeIzKrPwGr1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBHWx6p6yb
 pqdbR4BZnbCFh3itu/3SyDeuxQpOVuNMuT9IHjJ7AHd3AMV51d
X-Talos-CUID: 9a23:UZyQt29FeAewYguG5riVv08kIeI0VGSD9U37IFekLXtXZbHOaWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ATtfm7A8mxsmf4GzT6MaU4feQf5pGw6CNVkQSqMU?=
 =?us-ascii?q?XltXHF3BBZDG7liviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="814076635"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 17:42:05 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 1C1C5180005BE;
	Wed, 19 Aug 2026 17:42:05 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id AA358CCA79B; Wed, 19 Aug 2026 10:42:04 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH] python3-click: upgrade 8.3.1 -> 8.3.3
Date: Wed, 19 Aug 2026 10:41:56 -0700
Message-Id: <20260819174156.833811-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 17:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243780

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upgrade Click to 8.3.3, the first upstream release
containing the fix for CVE-2026-7246. The fix avoids
constructing an editor shell command and passes the editor
and filename as separate argv elements.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 002ede0d89b43cfbe15651ea6c3d504626be24df)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/{python3-click_8.3.1.bb => python3-click_8.3.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.3.1.bb => python3-click_8.3.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.1.bb b/meta/recipes-devtools/python/python3-click_8.3.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.3.1.bb
rename to meta/recipes-devtools/python/python3-click_8.3.3.bb
index 1f42fe1a50..12fd3cbfbd 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
+SRC_URI[sha256sum] = "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.35.6


