Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA09EB7EC5
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:32:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14904.1772620354493320731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EIirtABk;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772620357; x=1804156357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o3nQP1jRNG0NjcQFVi+K095X6iNCbRrgCl3wD0Zb8Jc=;
  b=EIirtABkiQlebgCOOHsOt5D89nnDBML7P/kKResx7ZDyrdGV+/i8OtZ7
   WKl8VfydSqG0zUWVUIpPnQ3c/B+pL6jm5mKhMlHItwY9VJn8hahV6pEEs
   +lZahKV1QpWn09b6dTXH0d75lm449qDihWp7/u5q7FJuln+FcGkBXCp6N
   tWO3qOmmtMFj6aLM0ee91O+S9jPsQr59hpFAh9ITCaQkWdhkFcrITzvzc
   gkZQC1d0ksL2/2WUf1Pu8fC6dBSt4VMgVlasHW9aee85BBqYvywPFWGv5
   7Ex1ix/w5a2Yh+p6gmKq780pEOstvVeaCAmbxCpmGOerZPMfzL+qdKjyN
   A==;
X-CSE-ConnectionGUID: X+BtF8E6Soegb+NsmDTE4A==
X-CSE-MsgGUID: EisdZBTTQWy1VIvb9CNNBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="232587660"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="232587660"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id B921BC01836
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:36 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 72A0DC041CF
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id D36AE100718B;
	Wed,  4 Mar 2026 10:32:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/10] gstreamer1.0-python: upgrade 1.26.9 -> 1.28.0
Date: Wed,  4 Mar 2026 18:32:01 +0800
Message-ID: <20260304103203.1649-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260304103203.1649-1-wangmy@fujitsu.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232367

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reamer1.0-python_1.26.9.bb => gstreamer1.0-python_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.9.bb => gstreamer1.0-python_1.28.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
index 57ddf0bbba..7169b853c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "21a51d35fd973af1186795d3d9d696f321584aeb09ab4d176b59f26e842b8849"
+SRC_URI[sha256sum] = "9eba882a413cf06bf0575e635f73c0a2d01f3abdf76e18f804a90f3ff6a0aa2d"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.43.0


