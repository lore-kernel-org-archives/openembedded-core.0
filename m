Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7264BCCFA1A
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:01 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2997.1762386472228041755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F60fW+FF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386473; x=1793922473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jn1jwQ/iLbvVauM830txtkjpZbc7aAdJFm2deDSmcj8=;
  b=F60fW+FFzmmHuLHZGsPHVHHPLUWew8fuXyOYVyOIeWD2NlCRB6lratGj
   DqYJQ02+yQFcAu/7F3VSxslcfvK3gcQcCHgSMLmBAk/vZhyJlJj+AGV5L
   Bu/AFsbqRBq7wisIsM0AJieImXL+Z9NjYR6pK7r+CHk/Dh3Mv4cI+dHEJ
   kz/pJJ6I4uGn5/cnVi0GDAv/LkQQtq+S5bXq5/Zb8G+M4/7z+AsgoZP6z
   R2ORDlzE0zo5YmpOb8pTimbluqE89BxHWHVuP9hcMyIm6W+eUi8+iuHxE
   cTuU5CiIp0oIAf6n2QwJDtFSjrGF9z7GaX68UlZQo+747qNg7PmNWjKtH
   g==;
X-CSE-ConnectionGUID: xT8xv6/wR7qzkL7Jz1XyPQ==
X-CSE-MsgGUID: SobuNVyjSr6EMfylofzFuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="217613191"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="217613191"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:52 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 918E3820400
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:52 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4E6B0C011BA
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B2007140008B;
	Wed,  5 Nov 2025 23:47:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/29] gstreamer1.0-plugins-good: upgrade 1.26.5 -> 1.26.7
Date: Thu,  6 Nov 2025 07:47:02 +0800
Message-ID: <20251105234712.446-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225949

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.5.bb => gstreamer1.0-plugins-good_1.26.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
index 4adbc982b7..9ba288a410 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eb0862e93404b073e98ec50350ece7e6685ea2936cab8118c2b8e938e2cbea8b"
+SRC_URI[sha256sum] = "82af18a1f3e4a060db61d2630fbb975269b80b55bb2fdcfddfab5c6440d30781"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


