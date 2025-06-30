Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D803CC83036
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.35289.1751274805923456043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XDjNPffD;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274806; x=1782810806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cppAApTMT0mLN36uIv/1f273CuJm7X8rw67ADxqVa58=;
  b=XDjNPffDl+UjbntbTw0691Y2qPJF1oQ8kMaBGJE3lo50vbvPAsNQo3x1
   cySAEtBqyCK39QNNQGhzu6WAbZVNU5obo3NbNLWFu21LZtAaB8xtvA7eO
   HhP4ex3wK6KaLPTxFTGnNzoZ24ZfYk243DQ8g2uRRmAua/SJmPSBZI+3f
   5Srx8rH2XJrkVsXdU9h9Qgbfd0KuyzDadunYSDPF1rzqyEdwxDZW/0Ltx
   A5I0N2c1Rg7GPQPfqkfKs8g+2HqywHVu90+wZ9nPyJGYiBTvi/WdILLTY
   70/HfnnBtLaWZxEBXmAiCiXrLzxKKWyL2ws82GrIKk36Y3tp1It41UJZD
   g==;
X-CSE-ConnectionGUID: iq5L8VbwRnqDVrjTpdYgzA==
X-CSE-MsgGUID: Yhs2klYpTj2/YzEXwNf4mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="191956027"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="191956027"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:24 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6945742A30C
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:24 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id DDEBBC006D6
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:23 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B752BF3CB
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:23 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EAF7F1A000B;
	Mon, 30 Jun 2025 17:13:22 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/37] gst-examples: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:44 +0800
Message-ID: <20250630091315.1897-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219465

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-examples_1.26.2.bb => gst-examples_1.26.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.2.bb => gst-examples_1.26.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
index 33c4119d1a..6478b70c86 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "100c21e1faf68efe7f3830b6e9f856760697ab48"
+SRCREV = "87bc0c6e949e3dcc440658f78ef52aa8088cb62f"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.43.0


