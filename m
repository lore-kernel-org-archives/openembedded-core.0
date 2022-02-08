Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15580C43217
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 10:27:16 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.9347.1644316034278978765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dBIw0fNY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644316031; i=@fujitsu.com;
	bh=ylfARl24hKC8Y+B6pNmE1K7YNWG2k2XLqZhvE9d0310=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dBIw0fNYKuE7d4BjytmdQGOno8F95zWWaTHkIGf6Hc6uvQrLwhH6GfsaujF9IHnIy
	 u7IPtUVHrf8uopl7fIW2tZNZkJJeUx8p1YNOt/QF2qH9MbmXtQNno5+i5jBHJHZa5Q
	 yCdwbOe/ZnIFLakFez4kERnNZSdhzOTN1M/vx7YCKF5L8VUBRvkW7i95ZN/5mEBtLE
	 TIrmQ1gO3Qtwv3ythFLZ0K7xFViLWnZ/xEbCtIE4KjPFHWWszCLJrsGJLannMweG/p
	 H+MI9OrA1WCbNpFRBzcfwE+ZqdToO7U0NLt0YjhT8lVCyPUos6H0p4oCHK0rr3r8OQ
	 1RqVg0NRNZcgg==
Received: from [100.115.64.195] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 DC/49-24566-F7542026; Tue, 08 Feb 2022 10:27:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxSbfOlSn
  JYPE1c4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPzzxG2go28FX1THjM1MD7i7mLk4hASeMwo
  ce7uGTYI5zyTxOc9e6Gc44wS73tvsXcxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  WAlwgLOEmevtrGC2CxA8ekN79hAbF4BR4mO/e1gtoSAgsSUh++ZQWxOASeJ+zuesYDYQkA1H3
  etZIWoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJdUlJmeUZKbmJmja2hgoGtoaKprZq5raGaml1ilm6iXWqqbnJpXUpQIlNZLLC/WSy0u
  1iuuzE3OSdHLSy3ZxAgM5pRi52U7GN/1/dQ7xCjJwaQkypukypQkxJeUn1KZkVicEV9UmpNaf
  IhRhoNDSYLX2gUoJ1iUmp5akZaZA4wsmLQEB4+SCO9qkDRvcUFibnFmOkTqFKOilDivDEhCAC
  SRUZoH1waL5kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHldQKbwZOaVwE1/BbSYCWjx10X
  /EoEWlyQipKQamIL8+Tkzq1/sfXHUvM3Ro9bh3Nz9fcpvnEKEVwfs9ThQIMv3mHfuDLtcOT5e
  zsDkpsM/tmQ9CXx4RZvzb8GFm8c+Sx5s8ti18nO+rm5M6Q4Z0ReHSkX7Vyc4hjzS4ha4XsYkf
  K73WmWX4aelJ7L8LzyxnzM7k605RU/KeZvX6bRj0h4J5WsCyiYy2oXXO7xnmX1s4eUVJjccwk
  3bLFTCw+J2fbiwS6NS5L7W7ci7skW9MS4T/qfPWeB55DOn8d7bq99YRu0OL3h/n+nMDbVFWW2
  HPKYv/V93bsrlR78tg76Vvat14b3k6fXx6pojF9xXGTFrHVR59WjN/ILPjfu+iXKwmm7rqWcL
  PrfMvm5ikxJLcUaioRZzUXEiAECbrxhhAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-545.messagelabs.com!1644316030!14234!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24610 invoked from network); 8 Feb 2022 10:27:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 10:27:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 69B33100446
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 10:27:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 48DF010044F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 10:27:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 10:26:55 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pyelftools: upgrade 0.27 -> 0.28
Date: Tue, 8 Feb 2022 18:26:39 +0800
Message-ID: <1644316000-5853-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644316000-5853-1-git-send-email-wangmy@fujitsu.com>
References: <1644316000-5853-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 10:27:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161495

Changelog:
=========
  - Added a method for returning the index of a section by name (#331)
  - Allow filtering by section types in iter_sections (#345)
  - Support Android compressed rel/rela sections (#357)
  - Initial support for PPC64LE (#360)
  - Initial DWARF v5 support (#363 with several follow-ups)
  - Fixed parsing for structures containing uids or gids in core
    dumps (#354)
  - Allow filtering by segment types in iter_segments (#375)
  - Add support for .note.gnu.property (#386)
  - Update readelf tests to work with more recent version of
    readelf (#387)
  - Add support for note GNU_PROPERTY_X86_FEATURE_1_AND (#388)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyelftools_0.27.bb => python3-pyelftools_0.28.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.27.bb => python3-pyelftools_0.28.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb b/meta/recipes-devtools/python/python3-pyelftools_0.28.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyelftools_0.27.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.28.bb
index e2d0e18277..0ceddcb68a 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.28.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "cde854e662774c5457d688ca41615f6594187ba7067af101232df889a6b7a66b"
+SRC_URI[sha256sum] = "53e5609cac016471d40bd88dc410cd90755942c25e58a61021cfdf7abdfeacff"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.25.1


