Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDEEF89246
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:58:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20545.1776765506193635712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QKPGVuQz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765506; x=1808301506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HAEdA4z5BuWfRLhnXqMBeZbFOQyU85ttbAT/JfUYbnE=;
  b=QKPGVuQzq7dOH/ZkACTfkFewYByDMP8N0AsZ8dN+gyl+CDl+r4KPQ5a/
   c2RsRNFOFWXhqYy3FoSu+pES/OJ/oEhMWmBU6HUydu42gbmNcSCHuGqYn
   /iIm/PGUgBN2rKPz+iIWxGgDMkCjnV/DwPjI2B5ZoEbBTCDWTHec3BI0c
   gLeVvw7f853Wme8M6uA31hU+6vKA74CBDwbM5edebv9ijwJjZC8S8/r30
   epn3RmLofObFSV7ZkG7vsPbS9cOtRRoRhiLmyx14dON3bYooAz7zFSfNt
   c/w+7vg1o8Q3cPlAedThpCL7MBaOT+Barh23w0AmNevFxiqv1iiqm2dqr
   g==;
X-CSE-ConnectionGUID: LlYsLbZhRMe63X5m/6SdvQ==
X-CSE-MsgGUID: t2k45za0S+OguD4BBB1JIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="226358681"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="226358681"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:58:24 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BEBDA1002BBA
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:58:24 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 77B18140035D
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:58:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1F4A814000E6;
	Tue, 21 Apr 2026 09:58:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 48/49] wayland-protocols: upgrade 1.47 -> 1.48
Date: Tue, 21 Apr 2026 17:55:58 +0800
Message-ID: <20260421095559.1856-48-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235656

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wayland-protocols_1.47.bb => wayland-protocols_1.48.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.47.bb => wayland-protocols_1.48.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.48.bb
index e19045fed0..c6b5da44ba 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5fd4349bcbc9bab9a46f8cf77d1f434296a7a052c87440a094f63fcf62a58e20"
+SRC_URI[sha256sum] = "398036ac0eb6484982ddbde7ff86848d753231f9cdeeae983f06b52946625aa1"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.43.0


