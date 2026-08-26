Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97941C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:14:07 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7704.1787732037809684896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MCW0ka/q;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732038; x=1819268038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SLdBeqlpqKDgBpq4/ZQNXvf1tiLnW0EEmhSQdEmx/a4=;
  b=MCW0ka/qtakbeJ7QDJtcM+x6OV5Mn8jnrqTfbxz8nL+tUPd1iH0Ov/Sl
   Dqpg/Na6BH3qCHYgZXkHzUUtbQKrKKkIl3Nu7Q8eb3tTzBEzJySJXVAGG
   ZoZ8fh+OTpEIN2+/G9xvZdJbvBXPuW0JS39Cr1LFSzYEfpJIAEaxA/Z3x
   Mjh4qKMUjYghFbQA7iXah3K60dEq7SEav2OoNh/XIht8l5aSJGnOMl748
   n8FHA71NdYMfK3K8D+FPjrBcXAGuvvBId8EPT3Q/SSzINXgCc4E/e4PJG
   A5RMwEvcxPIvlCVsNEOThjH2e4Dsd1zO9rPTpoyGLVUgx0bpo0ABsne9V
   Q==;
X-CSE-ConnectionGUID: CFH93WUfTHKSciDAdmxkJg==
X-CSE-MsgGUID: ZhiQN/SsREePLbWwhJRR3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252689523"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252689523"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:13:56 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 226001002BA5
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:56 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CFB3E182632F
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id C81A68212C5;
	Wed, 26 Aug 2026 08:13:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/17] gst-examples: upgrade 1.28.5 -> 1.28.6
Date: Wed, 26 Aug 2026 16:13:33 +0800
Message-ID: <20260826081348.1006-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081348.1006-1-wangmy@fujitsu.com>
References: <20260826081348.1006-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244341

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-examples_1.28.5.bb => gst-examples_1.28.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.5.bb => gst-examples_1.28.6.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.6.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.6.bb
index dcdf7fd433..165fb55544 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "727ceb91886862d200f423baf36cde2bb7ce5b4d"
+SRCREV = "2d3e05cbdad68e47d645f548899b432dc9fb4473"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.43.0


