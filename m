Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8842C54730
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.12714.1724136734165970101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HHALorbR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136739; x=1755672739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/B/2oOBa4oRTncIPqRG56fJL+fv2jxDAT5ojDVuC6to=;
  b=HHALorbRaFYQ1ZPTN99XNTRftaUwCBRJDyfXKnwB8oyqDCC0NJQUipib
   OWy4BGhmMke24N4dmeKrgv6iYplIiIuP+0/97BbqQWbySmCyxeYnj8HJ8
   2wE+UcdiL81JDQu8CHY3ce5VHP4J8t4sWGn3w0giksLrsva9KDKti1h65
   B0TMGckC9Dw/SHzBVHHpL6DpzJDezmZ33/X3aNpGPwBVseZTOJC6u1+LF
   Wjj6shO1rn5CvB7U4obDhHl/ANgg9du9C7CepeOgakAmJ3VFLl++mGfT3
   BuNf2HvwjLqC29JQy4dYlFpeftrQI29sMzZXZ780sPUX6nl0BsL9SGbSU
   g==;
X-CSE-ConnectionGUID: YzczvWVeQ0+IBwq/fLd2rA==
X-CSE-MsgGUID: c+lFdqddSbqTg7dqN0bJJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="170301733"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="170301733"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:17 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B03F4CA1F0
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ED0D3D8ADD
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B3D120086115
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 26AE71A000D;
	Tue, 20 Aug 2024 14:52:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/24] libxfont2: upgrade 2.0.6 -> 2.0.7
Date: Tue, 20 Aug 2024 14:51:32 +0800
Message-Id: <1724136703-20023-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10-2.306800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3zndiJkHFMhKSIGrjDxszFo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLBCL+6U4aX4nFnENX11XpeYWHYxSZqSDCBqS
	0QZAy9/3BRH+0ae7+HrRpWux/2FM6c9QCvs2m35hIqI1S847AR9H6ZefxhYfv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203532

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2019.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxfont2_2.0.6.bb => libxfont2_2.0.7.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.6.bb => libxfont2_2.0.7.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
index 535e7f629e..bf0c7d0775 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -7,7 +7,7 @@ such as freetype)."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT & BSD-4-Clause & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a5d1388c9d40be70dbad35fa440443f7"
 
 DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
 
@@ -15,7 +15,7 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "74ca20017eb0fb3f56d8d5e60685f560fc85e5ff3d84c61c4cb891e40c27aef4"
+SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.34.1


