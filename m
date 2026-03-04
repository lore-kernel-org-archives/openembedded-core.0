Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E9FEB7EC4
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:32:33 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15012.1772620350591260394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sAtnaQbN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772620350; x=1804156350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Q8cvDVnbE8BRY9Penl66ZKAx0YEuhgt2Hxoxv5ffj0=;
  b=sAtnaQbNkxTSDVUyjes2fjZlvV9WwpmvKNE9xup3GnfUqLJkznj/uw2b
   0Bad+XQbYGe1f2AQdiWH5oEdYJzQbFjPP+GUVYWVHYxLV72jJtCjKIemr
   AdEQzidFWiIZ7dqFnhSYIuavc7rA0HlkwWPM4x0SxFeF+ew4lE4abRn6B
   PJv3P7Miv0taBpysmxjdBO1D4VaBWgyQGXsUTXnU5SwIkNlcGJcq3/SRV
   ynK+wZ/SkEkdsQdyQ1ntPjUFfd0hVUphlxDDmorbUH+sLkLvQhxqsLnbX
   CWjSsUQoi1BMbjlKg5lJKvKS3AEBjKYG93ddiZaSP2/Kebjj6LseTSuuX
   g==;
X-CSE-ConnectionGUID: n+88e3gXTr6iEA9GXUwdwQ==
X-CSE-MsgGUID: 0r62dQ8vRau7Kqq2kbjm0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="231329481"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="231329481"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id DFCBF82071A
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:30 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9643DC00816
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 02574100718E;
	Wed,  4 Mar 2026 10:32:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/10] gstreamer1.0-plugins-base: upgrade 1.26.9 -> 1.28.0
Date: Wed,  4 Mar 2026 18:31:58 +0800
Message-ID: <20260304103203.1649-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260304103203.1649-1-wangmy@fujitsu.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232364

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-base_1.26.9.bb => gstreamer1.0-plugins-base_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.9.bb => gstreamer1.0-plugins-base_1.28.0.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb
index 74b6f2308d..f0a3db578a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "11db4ec9ae5be2194ff8ccf2b5fecdc069252fe4416921b083a921ef71dd000a"
+SRC_URI[sha256sum] = "eace79d63bd2edeb2048777ea9f432d8b6e7336e656cbc20da450f6235758b31"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


