Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9B2EB7EC1
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:32:33 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15012.1772620350591260394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lRHt8DBp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772620349; x=1804156349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SISQ28qRnULzoUPoW2tkczJnb88fFcwXzznmuED14Qs=;
  b=lRHt8DBpQQDQqc/sgPcUno99mpw4qYt85n+QhBiainuF5N164yZjUiVX
   vACAfv4rmIg5riOU1VN8wnnrdO9ivFjSelMV0UwDrZfpKbysS7B9boi0d
   uSsk2ZWctudPhZii7417m9WEWmcyNAZpEsbpyzBz0dG/4uZort9KhiIu1
   BUZTNOcIDPTzlju5Zip8UNa+MM6TiJydWk2FmUgT0nfy+F78EAUn3TGyx
   uaWZw9Luu6N0ExsGRRNlwvn7q97iVIR8Nr5c2ZI55PqFjB4E63ui5uLcm
   dea/FDY6nBdYWh/bbmnCDQ+0r7FCCDegN8CMeOGlYiyV/weDgvCIFsunF
   A==;
X-CSE-ConnectionGUID: dObX1vgPT4u0tIg5UFO0gg==
X-CSE-MsgGUID: +QPwvF6SReW0syscLqngyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="231329477"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="231329477"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1B1B71C000BB
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:29 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id BD17A180414E
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0E2911007196;
	Wed,  4 Mar 2026 10:32:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/10] gstreamer1.0-plugins-bad: upgrade 1.26.9 -> 1.28.0
Date: Wed,  4 Mar 2026 18:31:57 +0800
Message-ID: <20260304103203.1649-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260304103203.1649-1-wangmy@fujitsu.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232363

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...plugins-bad_1.26.9.bb => gstreamer1.0-plugins-bad_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.9.bb => gstreamer1.0-plugins-bad_1.28.0.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb
index 4a9cb37dd8..e75573cc63 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "a96bfb68c53a7c9ab1ae279eac7c101f4204fb5c0e4729683b2be64261707446"
+SRC_URI[sha256sum] = "32d825041e5775fc9bf9e8c38e3a5c46c1441eee67f8112572450a9c23c835f0"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.43.0


