Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AE7CD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.130861.1712646654990847562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AVwov92j;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646655; x=1744182655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=THS4oY7gg13tX8IZkcLso+yDeH/2G4oA4JNO+bsW1j0=;
  b=AVwov92jOi8B52mK/FwWVf72s1yiFX4cQ81MzXO6KyXOGZ5N9MKtEaMJ
   avqJosYBFBDn71yBdWw5YglUBvTBjzIs7jK8CHemp61MTJCFu+SL9CQlr
   Sa9RiBl1XEZqk/NjRleK+/8CcoV3gC4XGcwRjnYuSycQ0yFGabEkaTuOt
   WLrN8h5XXWL0jKDwnTQHX94W8Xtfs1TvRmyB/o0mnvgHDNRJK4GmSSL8l
   K719BozFjWn+UhU4MrR0aFBjvVAakDxsatqTBXxvxLSowP+W64CBVjXlS
   N0Z4ZtdhIClG8cZxg2gHCq4K+F0nnTZj+fEeUz7SAyWUy6PqErYgoT8DO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="143011383"
X-IronPort-AV: E=Sophos;i="6.07,189,1708354800"; 
   d="scan'208";a="143011383"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:53 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 222D65EA02
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E23520129
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 02DD61EA82C
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A53391A0002;
	Tue,  9 Apr 2024 15:10:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/33] python3-typing-extensions: upgrade 4.10.0 -> 4.11.0
Date: Tue,  9 Apr 2024 15:10:16 +0800
Message-Id: <1712646620-16608-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10-2.495400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuMJxigKCCiSwbH
	MdjMUdxay//gu8KXM8CBKiPS77AlwG94Ipa1otxoP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiF8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZj+E6sNeZT+f2YeItz5bm3QQ/TjNHRQiEmc8UQlblH2a97+tZiW5umkGiZVnPamYd5/6
	lmIqyKm3/06mRK+uyu6i2jOAEj5Y4ByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198050

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix tests on Python 3.13.0a5.
-Fix the runtime behavior of type parameters with defaults
-Fix minor discrepancy between error messages produced by typing and
 typing_extensions on Python 3.10.
-When include_extra=False, get_type_hints() now strips ReadOnly from the
 annotation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...extensions_4.10.0.bb => python3-typing-extensions_4.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.10.0.bb => python3-typing-extensions_4.11.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.10.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.10.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb
index 8698a80cc5..ad45b669ec 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.10.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "b0abd7c89e8fb96f98db18d86106ff1d90ab692004eb746cf6eda2682f91b3cb"
+SRC_URI[sha256sum] = "83f085bd5ca59c80295fc2a82ab5dac679cbe02b9f33f7d83af68e241bea51b0"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


