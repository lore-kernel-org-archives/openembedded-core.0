Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B99AC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 23:57:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.2787.1646697476145866394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 15:57:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hiNKWtCK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646697474; i=@fujitsu.com;
	bh=WMBTOLwq6oaSbhauLrCqWhJ42h0xBtRb/eXrV3VIGFY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hiNKWtCK4C9omnS9bGbOkuNlFYM6IfMulXKQRHEL+CICCrGSGA+dPD85JsIWI4bZQ
	 cZYuu5q/tpaLHeZDSTtD6gEBtvf5JSsOs+ULN7qERIQLvgJwJnIb5xG74DulcgcK/A
	 k2JghnQRiDQq0vZm1iKgPfKPW3kv8DDkVD0ckH4sLRG63z4g2AUGaI66Razx8ox5GW
	 fsTLQqXqFlBhAbzVWuMRKlrBwTO+m70nT2NnrWBprN4GYAFLzvtZl3hpEvqqqkHbAo
	 4Yi5G9jdQFF8p0zbFdpEgQTJhMavE3UIyHG1rUgiveyOb1qcHKqyHk62mdooGRqThQ
	 i79PbuPVgq08g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8MxRZdhjlq
  SwdUPehZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b1kwfZChbzVMw+dYa1gfE+VxcjF4eQwHQm
  idt/3jFBOMcZJa5+usDexcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfveAlQgLOEic2
  PGbFcRmAYpfXt7OBmLzCjhJXNpznBHElhBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQxRoygx+3
  IzC4RdITFrVhvTBEbeWUhaZiFpWcDItIrRKqkoMz2jJDcxM0fX0MBA19DQVNfYWNfcRC+xSjd
  RL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzDEUooVvXYwvlrxU+8QoyQHk5IoL1uq
  WpIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6IGUA5waLU9NSKtMwcYLjDpCU4eJREeKfPBErzF
  hck5hZnpkOkTjEac1y9cmUvM8cNECnEkpeflyolzhsyC6hUAKQ0ozQPbhAsDi8xykoJ8zIyMD
  AI8RSkFuVmlqDKv2IU52BUEuYVAlnIk5lXArfvFdApTECn2BmBnVKSiJCSamASa3zPkrP76MI
  ND5hO/9wjWfdmRqvWlP8Sv76tv7bbaL9B3guWh5p2GlzHdfv/t25Kagvsapj01OWr+7yQz4uW
  79g24e896XenrPfceOG2788fxzk7Ky238WUEXWG+3n17w4aUWWe+RV6WEPZ4wVDd8dj/IJ/l8
  2Nf1e+UbOsKjos8zLYjrXThvbmFF+KYP1ooNPQsjdIwLTt2O2jVPTv2i00NHBN2FWq66QjEq3
  ttYbw1ZXmnYMzhjOWHp99jM2GaduRh8cm7fpyvWg694Ol4qBF8+MfWI7EGulJLLHPmOErenvm
  j7qxLQOm9JRKBR/bI7Y/9ysvGk7r7g0j4/4OP18v0fbjlY7JMedOGLX/vOiixFGckGmoxFxUn
  AgDMG4ErPgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1646697472!14836!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31174 invoked from network); 7 Mar 2022 23:57:52 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 23:57:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 227NvlRA007986
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Mar 2022 23:57:52 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 23:57:45 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] asciidoc: upgrade 10.1.3 -> 10.1.4
Date: Tue, 8 Mar 2022 07:57:35 +0800
Message-ID: <1646697455-57590-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 23:57:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162870

License-Update: year updated to 2022.

Changelog:
=========
.Bug fixes
- Add missing test py files to dist archives
- Fix DeprecationWarnings in a2x regexes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asciidoc/{asciidoc_10.1.3.bb => asciidoc_10.1.4.bb}    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.1.3.bb => asciidoc_10.1.4.bb} (84%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
similarity index 84%
rename from meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
index fc8cbc89c8..484250b33e 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
@@ -5,11 +5,12 @@ articles, books and UNIX man pages."
 HOMEPAGE = "http://asciidoc.org/"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
-                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=aaee33adce0fc7cc40fee23f82f7f101 \
+                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py;protocol=https;branch=main"
-SRCREV = "342639edbbc0dcc64354a0291d2214d4d5e65cab"
+SRCREV = "c724bbf95b1840b04bb298a61a72b6a5ea94c2ef"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.25.1


