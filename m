Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49199C54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:38:04 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7896.1711413477820687463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OcRmlVC1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413478; x=1742949478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jU2gkSlxxgJsT0yW30Io9Xbxp0i9FZlRu18LddJTu3Y=;
  b=OcRmlVC1SiDw+Y5iL1+4i5ODDEb+AUl/SRrq0RGZRu5w8ObKtJY0xggP
   K4tcNSfMN9aADyuCq8CFXQDCvQ0EW5HAk3hCp+l377iU2hM83mAbynoXe
   EfjjcJlVT9y49i038LEcTMjQcdQ+aOq6sP4/EPd/EnwQVYxdzqdfEzGoB
   BdjPETsquMza8KwcreKK6QPa6AofDrQ4WvcW0J+YFCtHoIHPbS4/EBq8u
   aZOYnQeOEPOitfI4Ij9a0KIZ1+RXTBmjbtbyy3BfZRKbnINeI53LRriBO
   qaqaz78SVorUKpLR44ZUBhywYjbcI8cKw885OBZVQxHrzTSBkM2him97Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="132702242"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="132702242"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:40 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 09AABC6819
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 50212D5E88
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CE6A820097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 775E31A006A;
	Tue, 26 Mar 2024 08:37:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 26/34] python3-scons: upgrade 4.6.0 -> 4.7.0
Date: Tue, 26 Mar 2024 08:34:44 +0800
Message-Id: <1711413292-3025-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--0.868300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOrlmG
	OZvTvMReD/SpuYoqPDS5rYfHE0OO95UcZtwNsCroURSScn+QSXhRWSQ077aXdPvBSTRncWKuOhz
	Oa6g8KrWZAXsqDT6fc+Xlt3/SDnnpCKWzjTV6b0dDBGF6rCL0yysoow1OwKfdD3Ov9zjFmdxRnR
	TuIkFlD6MPrBIO3TjYLuiT7lVKkwR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197524

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/SCons/scons/releases/tag/4.7.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-scons_4.6.0.bb => python3-scons_4.7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.6.0.bb => python3-scons_4.7.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.6.0.bb b/meta/recipes-devtools/python/python3-scons_4.7.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-scons_4.6.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.7.0.bb
index c3cc3f0373..bba6c799d4 100644
--- a/meta/recipes-devtools/python/python3-scons_4.6.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.7.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
 SRC_URI += " file://0001-Fix-man-page-installation.patch"
-SRC_URI[sha256sum] = "7db28958b188b800f803c287d0680cc3ac7c422ed0b1cf9895042c52567803ec"
+SRC_URI[sha256sum] = "d8b617f6610a73e46509de70dcf82f76861b79762ff602d546f4e80918ec81f3"
 
 PYPI_PACKAGE = "SCons"
 
-- 
2.34.1


