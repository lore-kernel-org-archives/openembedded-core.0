Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6FECD5840
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:14 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3110.1767781870717047930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gRxzzVKE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781871; x=1799317871;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aA0/jxlQHLwOOAZQwj80f8QZ2EoCHpD4uTvr3azcBS0=;
  b=gRxzzVKE1XB9tJjrGq6blEyGVB6cSEMPqnfRo1QPdYSOcfdKgnUKfy8F
   RaAjMPrWV7ePWQ9FnnZ4wBwOmdm6++yVq3Mg6L044WFNL+PtqwrsoVy0p
   MkbWUXdVFbP+v/shMpB+doVO6k/LwcuAJ31IewdY3PvulRT783kBEN7sV
   o4CgY4eGpfwGiRLBC7Za0k5HsI1BIsT1Mkf6bESMkLvPwLahIioTkxh/l
   NNwsi3a09A9J+X6l6/CdZf2Cd+yGTLx9xqbz0DI/TyzE0aXpLdsNo8bdL
   4MotMOcPurzZNONxIuh6Z77n6N/sJp8pAUOsdvlfZ/ELgYzdBQNOYPBBi
   w==;
X-CSE-ConnectionGUID: f8drIo/KR5qeoMJ+2O1ecg==
X-CSE-MsgGUID: itGNfa79RxS4mpV5NjK9xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="224467846"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="224467846"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:10 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 23F96C006D0
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:09 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D0B81896E2D
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id EC08A101732E;
	Wed,  7 Jan 2026 10:31:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/15] at-spi2-core: upgrade 2.58.2 -> 2.58.3
Date: Wed,  7 Jan 2026 18:30:48 +0800
Message-ID: <20260107103102.458-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228971

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix atk_get_major_version etc not linking on C++.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{at-spi2-core_2.58.2.bb => at-spi2-core_2.58.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.58.2.bb => at-spi2-core_2.58.3.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.58.2.bb b/meta/recipes-support/atk/at-spi2-core_2.58.3.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.58.2.bb
rename to meta/recipes-support/atk/at-spi2-core_2.58.3.bb
index 8d674417bd..022d2ff71e 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.58.2.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.58.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "a2823b962ed16cdd5cb1fc5365029fd218394d852acd4098b321854bd6692f6e"
+SRC_URI[archive.sha256sum] = "b0fabea6c9742eda8c9c675f9b8c1d1babba1da82da03ea1103710233717c1b0"
 
 DEPENDS = " \
 	dbus \
-- 
2.43.0


