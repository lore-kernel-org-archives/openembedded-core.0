Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AAAC54799
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.45975.1747040642648610192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TqBI7CTH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040644; x=1778576644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=u5BZ50X6d8rkSj5iX6N8VSlv7zLz6W4MivqhCsbsiMA=;
  b=TqBI7CTHxroY+OXABRt4p+v7NrBzbLSUqiLLSKv1j+yliQWXpdon4Cll
   LttDO9NlZLiJtlKJwD+tSXLcC2BUopZhKbRorwflIMbj5Fh3nzNKSHPnS
   fG/F36QyGdE4K0hu2nxUxbsq25qzmpFeQoOACW7voeJWwUzDNjml7+bkk
   EiFZTyI3sGCp+fXQobmaytn2UdUbIIC8Tm1rcwvWq904q/9JSRQpPuXw0
   VMGEsHW0+5c4vw/oAtM0NjQTzysE6KsGD/1LQ9Qszu//ZEFUACdnnOJuT
   xGEo4vFSju9GqEALhTor0EyMRM2f+LPGgjZkKHmhQ9xdNbswD1b9QrG7v
   w==;
X-CSE-ConnectionGUID: eCDE5i+XSpuws5dkcQUx/g==
X-CSE-MsgGUID: s12h4xNRTnaiUv6jFgA5Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199125951"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199125951"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 98285D5016
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59885D5045
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 197B61A009A;
	Mon, 12 May 2025 17:03:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/56] libpng: upgrade 1.6.47 -> 1.6.48
Date: Mon, 12 May 2025 17:03:09 +0800
Message-Id: <1747040619-7566-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216328

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-  Fixed the floating-point version of the mDCv setter 'png_set_mDCv'.
-  Added #error directives to discourage the inclusion of private
   libpng implementation header files in PNG-supporting applications.
-  Added the CMake build option 'PNG_LIBCONF_HEADER', to be used as an
   alternative to 'DFA_XTRA'.
-  Removed the Travis CI configuration files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpng/{libpng_1.6.47.bb => libpng_1.6.48.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.47.bb => libpng_1.6.48.bb} (92%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.47.bb b/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
similarity index 92%
rename from meta/recipes-multimedia/libpng/libpng_1.6.47.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.48.bb
index 371ff1436f..338891c683 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.47.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "b213cb381fbb1175327bd708a77aab708a05adde7b471bc267bd15ac99893631"
+SRC_URI[sha256sum] = "46fd06ff37db1db64c0dc288d78a3f5efd23ad9ac41561193f983e20937ece03"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.43.0


