Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CC1C3DA58
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.10236.1720604661462978068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q1gRWpKN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604661; x=1752140661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YxE8yXDkVlBkcc620GR9EJ7fSt/YknMfmXu2+eaWW4Q=;
  b=q1gRWpKNb842XckbFmP0EYZNriJtdO8Zvc8i6zoOw6aozv4rPx+23aaX
   DTbP1soGSNy8LNaov/Btq1d5oKcDVNTs0iLRSKJ6arlGeZtqI5WcFRX9O
   iAMCZ4hmfFEYtr9HKxgEUcLeF6hlOqWC0u97i4/pOngSO0o2BXfVX+eQD
   3qaPaJZpMOo3tEdP+YR3D/cHwKoa5vdD6+4GphOJFE/lTzvFfcFj/wzXv
   agGXR61Q9GkUYd97IMAjN70Gp62HbBP+J4Ue5Sd6diPwsmB4ButEd12RM
   Mf/ntZcdWHAX0R0hPgTiZqH0KAzrmnGclfmk4B/ktaE3yAh7jgjeCZF8F
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="166642928"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="166642928"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E885D4250
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CF13BD4C19
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E5E11EBE69
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0CB571A000C;
	Wed, 10 Jul 2024 17:44:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/30] libsdl2: upgrade 2.30.4 -> 2.30.5
Date: Wed, 10 Jul 2024 17:43:41 +0800
Message-Id: <1720604634-23406-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10-0.909900-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9ddTgH6um3ormql
	qAK1p7bQCseo5GIVbMbdzqDpDGWFLbhPu4tF1R7Be015woyPLfaRkhbJN5lbvkJsNXD374+p/8D
	yUDdxlZLRl1nY66RmErTgydUvVSSzHVikQ9YmLLM/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bq8FBzdsKASwY018kD9GAOET18zKtCer/nzmmMD/HXF+fS0Ip2eEHnyFh/DzryTTlvc8O
	Jc7+0VJjoczmuoPCq13VUMqSlTnAFUOFkqbW3FRGF50Zc6z6Z4SpqeiWUYEF8BNnzvm7bQQRDYO
	9w/34O2RyjZ3mvPxd0xYbeD0PFKG/Cq5EpAVCOYdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201714

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Respect SDL_HINT_RENDER_DRIVER when creating an accelerated window surface
- Clean up any accelerated renderer in SDL_DestroyWindowSurface()
- Disable low level USB controller support on Android by default
- Fixed USB permissions dialog on Android 14
- Fixed controller mapping matching when one entry has a CRC specified and another doesn't
- Enable joystick support on FreeBSD when building using CMake
- Reduced input latency when using an fcitx IME on Linux
- Fixed graphical corruption on Raspberry Pi
- Fixed crash when using an unstable sort function in SDL_qsort

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.30.4.bb => libsdl2_2.30.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.4.bb => libsdl2_2.30.5.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.4.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.4.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb
index a6a3f4ef52..302c52ee9c 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.4.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "59c89d0ed40d4efb23b7318aa29fe7039dbbc098334b14f17f1e7e561da31a26"
+SRC_URI[sha256sum] = "f374f3fa29c37dfcc20822d4a7d7dc57e58924d1a5f2ad511bfab4c8193de63b"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


