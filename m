Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235E9CA0EF7
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 03:35:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.5630.1755574542002056212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 20:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=koNG1uwg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755574542; x=1787110542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kKaLcb5Xny1Hd6YVYIjBlbAPjQUbs6/xwDOwZLC7bd0=;
  b=koNG1uwga1Q/UE0LJiRFILqEJrsneSGu2op+KyoYYsIHi0Y0+gzHNl6e
   bekZp5dB9dnoRuq/QqOgwWYTUQimZAJo493uasPZwx5qXAAh2z6SrdIiC
   r86wIwFPvq8+ZBMUklevjF/0Yhg3bErNe6QalJfSRMtF7mSFE7rpJAq1C
   227SIrwJu8x2CVNOsKG1iyesjlrvGrPsF3ubIhXh6jrsx5FgFqo2S4JTQ
   jxk0c5+IJfXFqCESoT2E3uKz+bw5wQ1MJNBO06O1CYFdeEVN9Xp8V2Bdo
   gCeWhg4IFw6quK3IbNWR68nm1DkTrP04dPZehZM0lUSHgjSSHRh3NXROm
   w==;
X-CSE-ConnectionGUID: 2HvAUu4eSKSd/WlxWxiPtQ==
X-CSE-MsgGUID: R+y5wQHMRomM7u0l+CG06g==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="197649235"
X-IronPort-AV: E=Sophos;i="6.17,300,1747666800"; 
   d="scan'208";a="197649235"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:35:40 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 23697C000BD
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:40 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CB50F843BFA
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:39 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 9D3771800B17
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:37 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E0B3A1A006C;
	Tue, 19 Aug 2025 11:35:33 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 02/11] gstreamer1.0-libav: upgrade 1.26.3 -> 1.26.5
Date: Tue, 19 Aug 2025 11:34:23 +0800
Message-ID: <20250819033433.390-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
References: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222062

Refer to release note, no changes this time
https://gstreamer.freedesktop.org/releases/1.26/#1.26.5

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...streamer1.0-libav_1.26.3.bb => gstreamer1.0-libav_1.26.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.3.bb => gstreamer1.0-libav_1.26.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
index 4125fdf31f..c3ee529497 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3ada7e50a3b9b8ba3e405b14c4021e25fbb10379f77d2ce490aa16523ed2724d"
+SRC_URI[sha256sum] = "d6de05884ef42376dd8cde89940f7b50ced96f4f6f52888e764cd8233e74f052"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


