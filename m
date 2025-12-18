Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3C3D6ACCE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:13 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37611.1766048765161303147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ba17eofx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048765; x=1797584765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KumVp2cm5WD2EpDVpfbQb2V+sEg7yH7XWTGjMTlKAxQ=;
  b=Ba17eofxDUEhS76USgp+HhEW48m3laspcjLIw4KFh9kqe/TFbn9bKGyz
   DNzAqY4CVHsO/daIWBq2082kwX855qu+oG8dpIl0aUhckNrsVWVm0qbEl
   MlRrpVTZHYy9fpKaB0Eu5Di7MlNbN/GOj2itOoG+frcAwAOZn84LWGZKl
   ebj39xoGEHXWup/98dtUZgfQsBU+Rxj/lZotGSynTD/AMzx5CYGIpqxfJ
   9VDcM4Qvz7nZb0XowtBJKzBSP756uxo10yo0x0aNK672Wu/KTr4KkrM9h
   UrgsbJ8zkvLdS478KGfO1mG4JTC+age+SVj0I/BOacIUMRHrMzrxGUGEH
   A==;
X-CSE-ConnectionGUID: IUEscSr+T1O4VOtHfRHQ+g==
X-CSE-MsgGUID: hvrf96bjSZSbvgEaUbYauw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="222479891"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="222479891"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:06:04 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 81C4E10029AB
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:03 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 2B5E2C000BD
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id CCE0F402670;
	Thu, 18 Dec 2025 09:06:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/11] gstreamer1.0-plugins-good: upgrade 1.26.7 -> 1.26.9
Date: Thu, 18 Dec 2025 17:05:42 +0800
Message-ID: <20251218090547.828-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090547.828-1-wangmy@fujitsu.com>
References: <20251218090547.828-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228099

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-good_1.26.7.bb => gstreamer1.0-plugins-good_1.26.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.7.bb => gstreamer1.0-plugins-good_1.26.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
index 9ba288a410..4977415f71 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "82af18a1f3e4a060db61d2630fbb975269b80b55bb2fdcfddfab5c6440d30781"
+SRC_URI[sha256sum] = "f38566fb53ae56b7019a039475311756a28eb978a781154d67813dcb551ff5fe"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


