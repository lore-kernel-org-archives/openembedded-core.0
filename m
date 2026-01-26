Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB21C88E4F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:39:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19104.1769431144436046282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OMwFdm5f;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769431145; x=1800967145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0fJrJwefGEBVsZRvFUMwmrCQ5UM6q+DZs7SAspXOb24=;
  b=OMwFdm5fyuNBOD5/jdAxlssdK5eZWbcLUGgfVHSaktnhZKwzIZihGW/5
   n7qh6Y+NsB3hC6I6mPP+xBh4lQhSImyE7tWv7U/+LZveHHlwZpWs7VOH5
   vmahrUNVGQJruTN6KDNCfOoC3LBIAtZhLocNRodIldi7oJDjWj2GJEP6p
   tsjHPbSCY+U/6hRWgg70O87eOXxoiG9XoGJmstvw/YHlfnzCch33jAOR3
   xqB/FdgQqtZ5Ru1rVjwty1QRfHE3n6Bp4ZvxUcl2HyCmBif2WdeYYVIl0
   zPv0kO0QxOiK1EYRm0JIz+H0IerfnyTMRq0oWLBhVwrqK0h/veZvxooIw
   A==;
X-CSE-ConnectionGUID: dyQBfl0US9KQfFLs6v0ICg==
X-CSE-MsgGUID: pHfcXvoyQxCrR55nX6otKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227112322"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="227112322"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:39:04 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 986371020FB0
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:39:02 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5061218000C4
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:39:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id AC9A11019062;
	Mon, 26 Jan 2026 12:38:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/17] python3-wheel: upgrade 0.46.1 -> 0.46.3
Date: Mon, 26 Jan 2026 20:38:43 +0800
Message-ID: <20260126123844.1052-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123844.1052-1-wangmy@fujitsu.com>
References: <20260126123844.1052-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230000

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wheel_0.46.1.bb => python3-wheel_0.46.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.46.1.bb => python3-wheel_0.46.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.46.1.bb b/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-wheel_0.46.1.bb
rename to meta/recipes-devtools/python/python3-wheel_0.46.3.bb
index 058af2f0e7..2545e5496e 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.46.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "fd477efb5da0f7df1d3c76c73c14394002c844451bd63229d8570f376f5e6a38"
+SRC_URI[sha256sum] = "e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a83083519a1803"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.43.0


