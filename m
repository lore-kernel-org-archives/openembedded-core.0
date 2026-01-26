Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52C3CF65F7
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:56 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19064.1769430952410942243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pp6O9lx4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769430951; x=1800966951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gS08neYo+xwBxCT40n8YS7XBT0/1MMgg7Yep+lIw4Kk=;
  b=pp6O9lx4mRzQZQnbBU5BNDAa0heUwoZRHVwXjDqV7+3ZpoDpOtL7ASyO
   TosjR2gfQn/1a/MRGy/XPF4LbjU+C71FNPfPLoJfGa4WpafOlTgaWznO0
   e/Fe7IRwdIBUhAiPZlpQn7ddP09d80GrPJvOiYzNWd56D6Eyb3/sriLTA
   ve/E8/+plp4dkO3rwIgKygBBV9z+bK1X+JTGRYBzEEiOpziHAvlcrXxS6
   ZwsRMFmP0BUrFc6WH5eTAJDEi6eCloN2WkDFu4RfxJoN0rX0HYJTdbHFp
   8CgBECwJprv1X3xUVmxkZHMDZ0keEd2tlJ9YMuW2c4jfp9dHSMrIvOT/a
   g==;
X-CSE-ConnectionGUID: luUnRTSmQIeTK1LEOZ8z1Q==
X-CSE-MsgGUID: SLO6IYXgRZ2Kvyuw5LmEvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="226528473"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="226528473"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:35:50 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D961542A31F
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:50 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 871FD1C00141
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id DBF5E405ABD;
	Mon, 26 Jan 2026 12:35:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/17] python3-packaging: upgrade 25.0 -> 26.0
Date: Mon, 26 Jan 2026 20:35:07 +0800
Message-ID: <20260126123517.1020-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123517.1020-1-wangmy@fujitsu.com>
References: <20260126123517.1020-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229991

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-packaging_25.0.bb => python3-packaging_26.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_25.0.bb => python3-packaging_26.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-packaging_25.0.bb b/meta/recipes-devtools/python/python3-packaging_26.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-packaging_25.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.0.bb
index 9cb5c68f58..cadf913db8 100644
--- a/meta/recipes-devtools/python/python3-packaging_25.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
+SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.43.0


