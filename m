Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A42CA0FF2
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 03:51:35 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.31418.1756093891023898404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 20:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gLM6E3hp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756093891; x=1787629891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZWAIDs39nfUpKwc2IdB+WE0BMar5xArw9JvJ0CjR2yo=;
  b=gLM6E3hpDNIG+Fhh8E7dajx1h/F+42/edT/85qLm+/MCWIRu4KAeS7/u
   dlhKa/QH/mwDaUpkPhS9GARbRTT8RFLDmhsDDGdBiLcOavvthM1TvYNQA
   vdvcAqCLjzyme66C/nudMJejSZuN2PPx9w9BQj0XpLtHeV9pQGTAjeNdr
   8FfSS8VLWYgWKlqFdO088cOpbB+zsbsZ8g/TDAa8lE5d5+3WntjzpXBnP
   cuz8mBKwLxNKJAiN7T9zmyGXrfPfM51EM0Ln0DbnddcdiWKYYWX6av6gP
   McqhClF9qctAj726YxelaiIp+f3j0Bm4l50kL5nHdpsP4kVGySVwAxSmu
   g==;
X-CSE-ConnectionGUID: pZlUT/faSLafFHroBNEqSA==
X-CSE-MsgGUID: z1b0pUKnTUWZMR2Ux9rR/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="211016115"
X-IronPort-AV: E=Sophos;i="6.17,312,1747666800"; 
   d="scan'208";a="211016115"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:51:29 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 491AB1C1C700
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:29 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E9BD2C00543
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:28 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id B8214101BB7C
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:26 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A77431A008A;
	Mon, 25 Aug 2025 11:51:23 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 05/10] libxmlb: upgrade 0.3.22 -> 0.3.23
Date: Mon, 25 Aug 2025 11:51:04 +0800
Message-ID: <20250825035109.797-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
References: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222399

Changelog:
- Do not reallocate the final silo blob when compiling to reduce peak RSS by about ~6%

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch     | 2 +-
 .../libxmlb/{libxmlb_0.3.22.bb => libxmlb_0.3.23.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.22.bb => libxmlb_0.3.23.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 7f130284c4..1c46f6fc1e 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From ad8dcd768b637e53b80f9fea37ba945731ffd16b Mon Sep 17 00:00:00 2001
+From 2dbc50d49e2048f7227c406931a69f747e0eb12c Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
index 761426148a..54df81c718 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "addcce32a3bd6a09303f052bd59fb758621d30fb"
+SRCREV = "65bfb3099beeb7a5ffae995db124f55bea70f41e"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.43.0


