Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5080ECAC58F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.13151.1757495822205357857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q01/whBs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495826; x=1789031826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zomxR++fYU1xPDeURLzQRGsA1bxjYjS2LGj7oOwwkGk=;
  b=Q01/whBsiA7o2LmaZwp4HU7CrQ3uPq08L6EUfuIJF5iJ5tr+1B+H9KxV
   OiJxjTSK0O8qfZspArw1GBPCe+yRiXpNK7mkHYMUfVTM8b2VDl6wPALd7
   Q6Bw26TrDPJCEdC1++dZOlB8qI9jrgnltM2Ua0ESLpjUzZ4qXsZzXpeGE
   aYVe2jvhQ6byqWlWDJVRMAvl9cJf9MWx6eQKUTMuOj2Jdtq0yHqIa0RKO
   TarNA+LaHahLAyz9/FW2kk5XEQXCwo1RF55f5cHKerz6EJLNTXWIu7uKC
   QGnnUWOV9tScqHKEDmM/iJLOmaIyGdLyDugsSHSX3JO41zSWhm3RP2JsY
   A==;
X-CSE-ConnectionGUID: IX0htyOUQq6PCqlJQRWoJQ==
X-CSE-MsgGUID: KGzerYX2Suyrqn9QW/znfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="212404331"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="212404331"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:05 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 4C0241C00189
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:05 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F3AEBC006E6
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 5BB951400BEF
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 826A01A0073;
	Wed, 10 Sep 2025 17:17:00 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/40] libdisplay-info: upgrade 0.2.0 -> 0.3.0
Date: Wed, 10 Sep 2025 17:16:18 +0800
Message-ID: <20250910091646.998-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223163

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libdisplay-info_0.2.0.bb => libdisplay-info_0.3.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libdisplay-info/{libdisplay-info_0.2.0.bb => libdisplay-info_0.3.0.bb} (86%)

diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
similarity index 86%
rename from meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
rename to meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
index 812a30495e..380c12b867 100644
--- a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4426409957080ee0352128354cea2de"
 DEPENDS = "hwdata-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https"
-SRCREV = "66b802d05b374cd8f388dc6ad1e7ae4f08cb3300"
+SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https;tag=${PV}"
+SRCREV = "47a5590e9c4eb35d67651b8c05a55f1a48259329"
 
 inherit meson pkgconfig lib_package
-- 
2.43.0


