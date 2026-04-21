Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CC4F327DB
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:22 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20383.1776765377636059577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=re/21GyL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765377; x=1808301377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b7NrJTxMYTKWvMm0Dq/Zt6buGw3vewSXUkn6vl8ZB2U=;
  b=re/21GyL1CUm1s+M8F8Pqr+JL6q3fhEGBWBkYPMOhMMiusmu/Tx3c9uM
   Ty6Mezd/accQ/1SJubqykoyXBY9bjR2Sg4ISOcsHlUU+4zMBcGz8pB760
   urHOVC2Ad/8QlMoK6z75u5AYFRudIX4pV1F+WGOyPTHmTqNyACnJWclox
   RKz9kiosg08ff+/i8UOjoLUm8Cw+saHqb9PXnNiVFKAAV2alSkdayZgWE
   6nFWHKeKDylkufoFDGppiG4BMq2QWr/tMPAdFdWx25q4KbZWFIwzReyEV
   6kKKnEVDNhZIfkpHUt4CdHm/cDrLgyfodn7ALtwob/6mL/7Kw2Nrhf0E6
   w==;
X-CSE-ConnectionGUID: o7Z+lYb8RH+Fhr0Qv12sRA==
X-CSE-MsgGUID: jtJjvV1QQMOPu1gTanxrJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="225608194"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="225608194"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:16 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 06FA642A335
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:16 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AADD5C00230
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 25B7014002C3;
	Tue, 21 Apr 2026 09:56:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/49] dos2unix: upgrade 7.5.4 -> 7.5.5
Date: Tue, 21 Apr 2026 17:55:16 +0800
Message-ID: <20260421095559.1856-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235614

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * New option --error-binary: Return an error if a
   binary file is skipped.
 * Fix: dos2unix error on empty input.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dos2unix/{dos2unix_7.5.4.bb => dos2unix_7.5.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.4.bb => dos2unix_7.5.5.bb} (95%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.4.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
similarity index 95%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
index 87d51574cc..aa078ed200 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.4.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af1174fd3d1a254eec3a4a1d1da170a9"
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "dd37537e5fe03ac123aca9a9c944ef87fb998dcd"
+SRCREV = "54524999eece4e9ad0dab580c79b02855fc85028"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 
-- 
2.43.0


