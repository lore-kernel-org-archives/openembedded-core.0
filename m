Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A35D41D71
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.82720.1731403501519628021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LpjAVueG;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403501; x=1762939501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ncsYqiw6mQgPGpxOC0rHeuqo8yX10A6pbvzqXbsHY18=;
  b=LpjAVueG2GUI6eQhiZ+t9mfhoqfg+7qG69omQqNkTeowdRQ1d15cVaIX
   2rP9V8fEwyPzZtowf5NZNjVOHajJ5bf/JB9f2+nl2tkmK4m30T+5/slC/
   l+urTpVYn74zJPHq1uNz27ZWMhuhI/hxCROIFQqk9EBjegoQLJrg+GF3d
   1H0ySGPf6a2V2+dGig6jitdd6FbCnFpqF+Wpa4SuP91UsvrQdFtVsPaYF
   JOpN21IzzcVAf0yHPcf8fbLGcEWiOfge4iFWfpU1xi0vLjdhgzHV8KDtw
   0wqfmTUtkHS8IOTw0oX2UaT2WUmvF+XXk4rAh8/nvg1Lom3wvLpCLKbFq
   A==;
X-CSE-ConnectionGUID: 9bjozmjpQQytmgzOnEga3w==
X-CSE-MsgGUID: gAetjrSaSM2DbuQccr6fHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="158940822"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="158940822"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:24:58 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 39B72D500F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C8B7DD50E4
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59C9F6B830
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 07AE21A01E9;
	Tue, 12 Nov 2024 17:24:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/47] desktop-file-utils: upgrade 0.27 -> 0.28
Date: Tue, 12 Nov 2024 17:23:58 +0800
Message-Id: <1731403483-21399-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--3.869300-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvMB0kPsl40w2Uz
	B7Xp5yOCq2wa8kVUBo1/KLaJof5FWx/7O97RfsNrBk2IeIQvz596AgcdfYvhjJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprZiQDIJsDspX/rvCkqsgk0E9QH
	umHFggvfqThNGtU2f1yBf0I1kVQj8YB2fOueQzjxRFJJyf5BJeAaUQk5EZOUn6C0ePs7A07UXA0
	ioI+iBt+N7Y8n7Zrm88PYcg1EpRWt8LeJo+unxTUR22TKcAwbaZ9+Qh3pTF2IVTl3Qb88b6fgKG
	E0WY278S1SF/GlUxqgnlaPfuxdVz8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206989

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Increase GLib requirement to 2.26
- Fix install failing on second run
- Fix use of deprecated Meson feature resulting in a warning
- Allow groups with the same name as interfaces in Implements
- Add support for the COSMIC environment

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{desktop-file-utils_0.27.bb => desktop-file-utils_0.28.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils_0.27.bb => desktop-file-utils_0.28.bb} (88%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
similarity index 88%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
index 5285a6c6ea..35537572fe 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a0817df39ce385b6621880407c56f1f298168c040c2032cedf88d5b76affe836"
+SRC_URI[sha256sum] = "4401d4e231d842c2de8242395a74a395ca468cd96f5f610d822df33594898a70"
 
 DEPENDS = "glib-2.0"
 
-- 
2.34.1


