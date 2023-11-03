Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5146C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:16:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.36344.1698995792642661652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138463384"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138463384"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:16:31 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BD02D6477
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:16:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F6AFD94BA
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:16:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 582636BF4C;
	Fri,  3 Nov 2023 16:16:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lighttpd: upgrade 1.4.72 -> 1.4.73
Date: Fri,  3 Nov 2023 15:15:32 +0800
Message-Id: <1698995732-30377-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10--1.872800-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzBgyvd6hRgkMXm
	NEq/HdfxL9TWdwkgdGl3+NW7wWSu+V4wErl2xpIZLG6gc1cSnZxlMi611URCVVgLks93sG9tPDa
	s/mK+LQlAzk0u60eqdShmR11aDrR6ohBoMfD7UiEyByMiwk6+3pRy1HDTPOXaMoh6scCF9jFs7h
	h1jpl2Uh9aYGC9BR6lYndt5cKMBhz0hqgkYn/Qi3zmmMD/HXF+VBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJogwIsQZbtzZwA34KY0g5BTdlRzZAkKRGDa2EwWJsUOPMnptr
	8PnHpyni8zVgXoAltlPcOF1Vw1gmC24oEZ6SpSmcfuxsiY4QFJXSS1hoGYcVFL4+kX8ZyAR8Yr0
	4aTOMIBKRvYWHG5rKo2ZmLm2smxW7hsoRaRRaeUTH4MXAqpKcFW7/xMQgLLp4qJaYK6CP2ux9n1
	XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190116

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
  * [core] add .mkv to mimetype.assign builtin defaults
  * [core] warn if out-of-range value for config short
  * [mod_openssl] set default curves for ossl < 1.1.0
  * [mod_h2] parse HEADERS flags sooner
  * [mod_h2] check send window before defer frame rd
  * [mod_h2] send GOAWAY to excessive request flood
  * [mod_h2] h2_parse_headers_frame() adjust args
  * [mod_h2] h2_recv_headers() parse trailers earlier
  * [mod_h2] send GOAWAY to excessive request flood
  * [mod_h2] discard new streams after GOAWAY sent
  * [mod_h2] h2_discard_headers() to HPACK-decode hdrs
  * [core] parse entire server.http-parseopts list
  * [mod_wstunnel] Sec-WebSocket-Protocol only if req hdr
  * [mod_h2] disable h2proto if mod_h2 was not found
  * [core] omit dlopen trace for mod_h2, mod_deflate
  * [mod_h2] defer input parsing if large output queue
  * [mod_h2] defer frame handling if stream pend close
  * [mod_h2] detect and log HTTP/2 rapid reset attack
  * [core] honor MBEDTLS_USE_PSA_CRYPTO for hash,rand
  * [mod_mbedtls] honor MBEDTLS_USE_PSA_CRYPTO for rand
  * [core] comment out li_rand_bytes() (unused)
  * [mod_mbedtls] handle mbedtls 3.x partial write
  * [mod_h2] detect and log HTTP/2 rapid reset attack
  * [mod_h2] detect and log HTTP/2 rapid reset attack
  * [mod_openssl] warn if openssl version < 3.0.0
  * [mod_openssl] include openssl/hmac.h for boringssl

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lighttpd/{lighttpd_1.4.72.bb => lighttpd_1.4.73.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.72.bb => lighttpd_1.4.73.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.73.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.73.bb
index 87058719f9..ea83a4b507 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.73.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "f7cade4d69b754a0748c01463c33cd8b456ca9cc03bb09e85a71bcbcd54e55ec"
+SRC_URI[sha256sum] = "818816d0b314b0aa8728a7076513435f6d5eb227f3b61323468e1f10dbe84ca8"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.34.1


