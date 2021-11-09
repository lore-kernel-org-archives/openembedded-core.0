Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC23C4332F
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:07:10 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.13170.1636470429125710991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 07:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y6DZbDC4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636470426; i=@fujitsu.com;
	bh=lNeQddpeLI5yL/eFy3FF2RqHUgJiq5tASOgb9cfe87M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y6DZbDC4WeXYnGYJLNegwdyUOFzzTdp8ASsVoE40SG5ZaYeaXmpEPQf9DRKwOFoPd
	 z+eukHGli9IyngSiIP2gTVR4yq6J00ivP/sqajGCypyvOn77uMqFw5GvtrASIBraDV
	 y7aJvElaPQeSVWha3i+Mk2uknsXJDshRFc6pIBkf31Yfz5C1aTo0+YWFGsDvC6tAS5
	 mjRZ52IpQrMZg3x0kUnK9is2v7IIaWfP5WGMHKS5ui1t4pXMkTtQIRnBhOnyze2WGs
	 y/y0GYaLdXCAvDNMoWKCTKACYkqjXBWsVQuw18hfopv+tCmXVx7AQzDx4SV7wWMWA2
	 u58/gXBtw1a5g==
Received: from [100.112.193.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 7E/1A-02128-A9E8A816;
 Tue, 09 Nov 2021 15:07:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRWlGSWpSXmKPExsViZ8MxRXdWX1e
  iwa5NYhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aet74FS3kqTu7pYG9g7ODuYuTkEBKYziTx
  dr1xFyMXkH2cUeLSzmlsIAk2ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7hx3EFhawlph9e
  QIjiM0CFL/Xc5cFpJxXwEli+sM4kLCEgILElIfvmUFsXgFBiZMzn7BAjJGQOPjiBTNEjSLQmG
  YWCLtCYtasNqYJjLyzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6hgYGuoaGRrqGlka6RgYleYpV
  uol5qqW55anGJrqFeYnmxXnFlbnJOil5easkmRmBgpRQcOLOD8dTrD3qHGCU5mJREef91dSUK
  8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDdApITLEpNT61Iy8wBBjlMWoKDR0mEV6wDKM1bXJCYW
  5yZDpE6xagoJc7bXw+UEABJZJTmwbXBIusSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHepF
  6gKTyZeSVw018BLWYCWnzwSzvI4pJEhJRUAxP3pQyDP2HbM+OWtWmKtHwwk7Bvy+zj6SzRXSL
  8n9ndNDD1CdvP9NrC/wk6VXqBUVd/Tbjlfj87q/+Jil3/s5sv1xR4sT6Q9mv3ubRAtPdEeP33
  20dr2IyOsznfZahoUtTTLt9b8bw8PyRggQ9z+pN8tc69+cuvfGiymLhZM8i0QelIs2tq7PbAf
  b3Gr03u/Nuz/fpf5TTWuK/hecsD1r/V3sS55KTR+5+XO0J2yj4uZ+SWXvto16R2R7/VQmdas3
  9cCFd00rt59cbzM8GBd3ftX2XC81G6JemMf5t9T22Ovulbo09XhHceCpu1Uazocdf6g3pCC2S
  1dF5rHV0TZPHcoTrinc/7c9/EZ0yZqcRSnJFoqMVcVJwIABWykFMnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-267.messagelabs.com!1636470426!36905!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1992 invoked from network); 9 Nov 2021 15:07:06 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 15:07:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A9F75cP032237
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Nov 2021 15:07:06 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 15:07:03 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libpcre2: upgrade 10.37 -> 10.39
Date: Tue, 9 Nov 2021 23:06:53 +0800
Message-ID: <1636470414-60993-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 15:07:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158054

This release is mainly to fix an important JIT bug, but it also
contains an update to Unicode 14.0.0 and some code and configuration tidies.

License-Update: 
 Add "Retired from" before "University of Cambridge Computing Service"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpcre/{libpcre2_10.37.bb => libpcre2_10.39.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.37.bb => libpcre2_10.39.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.37.bb b/meta/recipes-support/libpcre/libpcre2_10.39.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre2_10.37.bb
rename to meta/recipes-support/libpcre/libpcre2_10.39.bb
index ccedf688d7..b5ec62fe18 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.37.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.39.bb
@@ -8,13 +8,13 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=6b3022283c9a79238d521848ea9dcb4d"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=43cfa999260dd853cd6cb174dc396f3d"
 
 SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
-SRC_URI[sha256sum] = "4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270"
+SRC_URI[sha256sum] = "0f03caf57f81d9ff362ac28cd389c055ec2bf0678d277349a1a4bee00ad6d440"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.25.1


