Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBEEC52D72
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.46934.1722215423648085086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sZGGMkL8;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215423; x=1753751423;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AMzDhL/t+7b1+JSSDLE0ejK2BgTA2OlcN4gjFedznTI=;
  b=sZGGMkL8c5ghsZZ1JIibcaq6Es6Aviq1vm7N3nJ7t/YY3epzOXSkpl3i
   TMtX+ffQrmXIly+CoH3fzglYdNf6WhCWswPX850MBuZZhgUqwOEE0wXIu
   wJyAE44OX1VElQtTCTA3Gwgb/42W3Jfv9DKXPSDjSKohqiuxzEPOmTIWq
   bTDXGDNl7WVqd0ZRnpA02CA1o+Yre0hau3WM3YZev0ti0dQXLesCGTqD7
   aXLfUUiGEox0KqaeTe7dhdGsFdZfDB3poqvIfnwDcjO3Bai94yf+WFNkP
   3ZI+C/YCaXcXysG/d8oo5964QR8YjGo7Hz7ncVIJTLXMw3RpM2bpSIREL
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="147746929"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="147746929"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D5C91E852B
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CBCFD506C
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F5FA20071A2C
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 447811A0002;
	Mon, 29 Jul 2024 09:10:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/33] gsettings-desktop-schemas: upgrade 46.0 -> 46.1
Date: Mon, 29 Jul 2024 09:09:39 +0800
Message-Id: <1722215408-27541-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--2.024400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4BwZT3SPru0OgH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJojZg1dQoLUbWsZaZ5UBQsod9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrZqsm8xJ6G4BWTfLD45aLTg9W6PgFfMjrWqCjV2aH7VfRROV+7ARz1YpnK
	0UqPR2xO0NQI/FaLP5RI81ePBFhfBW66ywBJUesx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202577

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...esktop-schemas_46.0.bb => gsettings-desktop-schemas_46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_46.0.bb => gsettings-desktop-schemas_46.1.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb
index 8260c3d357..19a3948f59 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb
@@ -12,4 +12,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "493a46a1161b6388d57aa72f632a79ce96c42d5ffbd1d0b00f496ec5876f8575"
+SRC_URI[archive.sha256sum] = "9b88101437a6958ebe6bbd812e49bbf1d09cc667011e415559d847e870468a61"
-- 
2.34.1


