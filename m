Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98EDE7719A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:45 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.16518.1736240494761386787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YbZxOqNS;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240495; x=1767776495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=d62lzDNjLdzDUVmU8XSGlHZM+WCIHvcRcyP49EM2DzA=;
  b=YbZxOqNSh6xiJlMtxTe/JSxpXM5l1if2PENp1nqXsgKXUU7SYpsymV5/
   zlZk4Lgyhp8aS/7oTS1Nhfk+alQRhHZwI1FmzzpukUbNQm6RbdkoR3Ci7
   0YHfgcFNJPtfDCPwSJRRW1fC4LVQ04+5onsGa/O7FZUo+5QG5f4LHxaR4
   8eOZ/wXE0TV5QOIQmN3mCgKp6V/qt+mwTAZI+DoKINAWqQqFJcRfevMeM
   zhSjzUaH6B2KC7tcCFvCCuOEBPOXeicHE58sgsFMkoe2LIaS2jRCpILGL
   H0f/2NACTDNAp5d3tQWAOdxyLfLaGnAFlWlPVGW9RPFxbIc1mconk44DY
   g==;
X-CSE-ConnectionGUID: 3mwkVtYKSVmTTMtBKNpPpA==
X-CSE-MsgGUID: 1wrjt5IOSJumXi5z9u+89w==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="164742053"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="164742053"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 19B51D4C3C
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E65F8D729C
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 62854200930C2
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 19E101A0003;
	Tue,  7 Jan 2025 17:01:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/13] libsdl2: upgrade 2.30.10 -> 2.30.11
Date: Tue,  7 Jan 2025 17:01:14 +0800
Message-Id: <1736240482-5243-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-1.997700-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/ySAWHOR37+ATpxAd6mi1Ga0torPLNYrwZOen
	JWNHcKPXL0C3YJUNngqv4iXXP7A2vtJbXmVoVA6OnIGynr5ObIZcmzOpiaag45Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3cgUVP3Cp+vRCE2NlBjIjcdmicEPU684Oyxs
	SRJfpzSZIQkSow0mBRoCKQQAKUhE1QdyAOEl4MR54CIKY/Hg3Am4n49vyf9XEvM/mydp5vVCq2r
	l3dzGQ1e7mFiMk8AqGfeIx58ft2QaXSMxEsGoSSmyTf1c8WOgavQ2HrjPn5ydlqNxvyG6foEik0
	Vqz0bMh1Sv1B43gN+XwQqkLPkb1e1y1Jqsedj8RTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209439

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: copyright updated to 2025

Changelog:
===========
- Fixed a crash if the controller product name is NULL
- Fixed the PS3 controller mapping on Windows
- Allow rendering during the modal resize loop on macOS
- Corrected CoreAudio surround sound channel layouts
- Enabled high refresh rates on iOS
- Fixed SDL_OpenURL() on iOS 18.2 and newer
- Implemented SDL_OpenURL() on tvOS
- Fixed Chinese locales on PSP

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.30.10.bb => libsdl2_2.30.11.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.10.bb => libsdl2_2.30.11.bb} (96%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.11.bb
similarity index 96%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.10.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.11.bb
index 4ee8b6790d..ab6751ddd0 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.11.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Zlib & BSD-2-Clause"
 LIC_FILES_CHKSUM = "\
-    file://LICENSE.txt;md5=25231a5b96ccdd8f39eb53c07717be64 \
+    file://LICENSE.txt;md5=cbf0e3161523f9a9315b6b915c5c4457 \
     file://src/hidapi/LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077 \
     file://src/hidapi/LICENSE-bsd.txt;md5=b5fa085ce0926bb50d0621620a82361f \
     file://src/video/yuv2rgb/LICENSE;md5=79f8f3418d91531e05f0fc94ca67e071 \
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "f59adf36a0fcf4c94198e7d3d776c1b3824211ab7aeebeb31fe19836661196aa"
+SRC_URI[sha256sum] = "8b8d4aef2038533da814965220f88f77d60dfa0f32685f80ead65e501337da7f"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


