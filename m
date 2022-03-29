Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D439C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 00:24:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.955.1648513443734335935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 17:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MChFbY5f;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648513442; i=@fujitsu.com;
	bh=+zJGyeP/9zWgNgDX1ZV5SUvJwrucKqhUfXLSJ02vTro=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MChFbY5fXEEaCFt35YN23xM1iY+CWSLT4RF70kXy8ed56HCRwUGuOLZ34d/6fzUbf
	 WZjJadL6hcZQ9Uf4Qs+QaWF2hgS1fDLHq/OG1cJP51bx2YadFanX2XBxMoVdyBGZHH
	 kJydE5Y5cnf0TNtIj16ioE0FueCoI9XGt47sUmi1uepcT12L79dvvq0yI4juD+I2TY
	 hCnYQJNZ4Urd6pvdZ95pWJP4sq9ADUCkPYCy3k0mkiUf/HpvR0NMiIialDjR8jEnGG
	 QZy9GgIGKNKncjFJjmx4JTk9ajndQK1mkr4e/NPIkQ4Ok5eACtNY8/gkMp9J8X/Zav
	 M1znEDWPnwoww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxRXdhoFO
  SwfXjAhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bqFQIFe3grft2qb2BcwtPFyMUhJDCLSeLr
  sw9MEM4eRok1XedYuxg5OdgE1CSm37oBZHNwiAjoSVz9JwoSZhZQkXjxu4cdxBYWcJXYPOEgG
  4jNIqAqcf3qNzCbV8BJ4sv1+YwgtoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2aIGkWJ2ZebWS
  DsColZs9qYJjDyzkLSMgtJywJGplWM1klFmekZJbmJmTm6hgYGuoaGprrGFrpGhkZ6iVW6iXq
  ppbrlqcUlukBuebFeanGxXnFlbnJOil5easkmRmCApRSrXdnBuGfVT71DjJIcTEqivBc0nZKE
  +JLyUyozEosz4otKc1KLDzHKcHAoSfBO8APKCRalpqdWpGXmAIMdJi3BwaMkwpvjDZTmLS5Iz
  C3OTIdInWJUlBLnPRQAlBAASWSU5sG1wSLsEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3s
  8gU3gy80rgpr8CWswEtLjusSPI4pJEhJRUA1O/9fnkr9MWTjeMP5bK9sCl4GN0273nmpdCOCM
  M9jNFrFE+9Izz6xXrcEaLV/Y6gto/Lyt7xei8Ob02bbHg00TdwE1XSydO+fzMhClqN8/W7y+/
  pH3m9T3Vb+TqreNw6+QF2UTlsJ8TpD5f+8129i1rhgSzBGNTyxTj5s1f/olzTrD6k3fY99anm
  +89gur7AxlPt/lE9b9ezj39Z/rvY3ffsMfuU5ZUWxSt+qL0g/5/wap7Z5QkVvzrX9Nez+qrrV
  Y41Xpxbt4NVfO68KNRYT+Ejys1PeIInK889S63iPCWlPuTWOTEA+z+lD06mB1187LGtuKHgmG
  zmT7Mqjs+d7vTM4fki1+D4w5Uuz9cy6bEUpyRaKjFXFScCACL58RFKwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1648513441!11810!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25840 invoked from network); 29 Mar 2022 00:24:01 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Mar 2022 00:24:01 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22T0O0AC012280
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:24:00 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 01:23:59 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-asn1crypto: upgrade 1.4.0 -> 1.5.1
Date: Tue, 29 Mar 2022 08:23:49 +0800
Message-ID: <1648513429-20514-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 00:24:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163722

License-Update: year updated to 2022

Changelog:
=========
- Handle RSASSA-PSS in keys.PrivateKeyInfo.bit_size and
  keys.PublicKeyInfo.bit_size
- Handle RSASSA-PSS in keys.PrivateKeyInfo.wrap and keys.PublicKeyInfo.wrap
- Updated docs for keys.PrivateKeyInfo.algorithm and
  keys.PublicKeyInfo.algorithm to reflect that they can return "rsassa_pss"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-asn1crypto_1.4.0.bb => python3-asn1crypto_1.5.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-asn1crypto_1.4.0.bb => python3-asn1crypto_1.5.1.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-asn1crypto_1.4.0.bb b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
rename to meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
index c052cb8c82..5fa2ed987c 100644
--- a/meta/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
@@ -2,12 +2,11 @@ DESCRIPTION = "A fast, pure Python library for parsing and serializing ASN.1 str
 HOMEPAGE = "https://github.com/wbond/asn1crypto"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b5cda97fbd7959ad47a952651a87051a"
 
 PYPI_PACKAGE = "asn1crypto"
 
-SRC_URI[md5sum] = "00bf5b72d37778e62cc73b1d8909ae27"
-SRC_URI[sha256sum] = "f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c"
+SRC_URI[sha256sum] = "13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c805306ccb9c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


