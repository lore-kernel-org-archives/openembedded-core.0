Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.1418.1627969184781992838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 22:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ILvUnzH0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627969182; i=@fujitsu.com;
	bh=B3yKpTO/CWYLexGYM77sFP3kkuQ+O3KS0OD9FH+RjCc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ILvUnzH0MvkRGYOScLRHz7zNBA/4kRj1fJu/3u4kPITlPc9h9lAG4EuqafMksEaQK
	 yGtM4tBW+fPkMcgNIV0npXaIHwJrntf6QjcJh5QXpgDX1d/7NFv7q2E6y4KZCmz+g2
	 0rjm6GkVXRkFitxIhWBe1zAojyK+yA/1jUSl+GaM8qSYpa47LUfVzUdroID1XIm8Vn
	 HXgYZDQYFYEdpU5HWp5JJNCS+FH25D8ETAyb4bNKlN9hVU+zdGJ1FkUoXzHGarwe6k
	 oHh23uxEYV4dKBHXjOHfuzIdJjwXrwBtY/upHNHei0ctfPoHkZVdPTFcu8y2d4MTFN
	 nKx1EkWCU58EQ==
Received: from [100.112.198.31] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 3E/6A-27654-D96D8016; Tue, 03 Aug 2021 05:39:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1Z17jSP
  RoPMZh8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtH1rL7gFUdFw+2prA2Mkzm6GLk4hARmMkn8
  WDaHFcI5zihx8eYDti5GTg42AR2JjhfdLF2MHBwiAnoSV/+JgoSFBRwl5p77zwxiswioSMw7u
  YQFxOYVcJc41nuQHcSWEFCQmPLwPTNEXFDi5MwnYDXMAhISB1+8YIaoUZTYvvMMC4RdIfH68C
  XmCYw8s5C0zELSsoCRaRWjRVJRZnpGSW5iZo6uoYGBrqGhka6hpYWukaGpXmKVbpJeaqlueWp
  xia6hXmJ5sV5xZW5yTopeXmrJJkZgEKUUHLu+g/Hq6w96hxglOZiURHnDjnMkCvEl5adUZiQW
  Z8QXleakFh9ilOHgUJLgFbsClBMsSk1PrUjLzAEGNExagoNHSYT33nmgNG9xQWJucWY6ROoUo
  6KUOK8qSJ8ASCKjNA+uDRZFlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ84pdBZrCk5lXAj
  f9FdBiJqDFUzNYQRaXJCKkpBqY9iyanpKuL6PzKEGNVdGlq/X4GwnxJ8ZP1v9ZqvJv91nnV/k
  hh0JuJjYKlq2pEgz46Fi2dvrylk3PBB4snZ5awp6rKTLhEk/02jsbVcpYjwlHz/Ta53i+9QRj
  ShZnm9miXRM0VOuSVx4/uMVxWVD3tlXuBd9WbdvdrX3Us1jMOTK9V7hm7iIz3QssD+zuK12b/
  ItN1v3jAT9eK//yCSYN/so2a5ZOf/x0fV9l5byJC+o1Ge/Zs/V6Na/KrPNSvPP/ePh1ji8ex9
  c5bu8QYtu01vf9f6NVFu8LQ2x0+li0P+zaqjfJ2zdylvktrt8bDjbP9uQPfPhzjeX3x3etNqg
  9mbDxzOJnqXfWmvgltua1KLEUZyQaajEXFScCAC0aHuMdAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-285.messagelabs.com!1627969180!340092!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18129 invoked from network); 3 Aug 2021 05:39:41 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-20.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Aug 2021 05:39:41 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1735dZYt004623
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Aug 2021 06:39:40 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 3 Aug 2021 06:39:33 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-dbus: upgrade 1.2.16 -> 1.2.18
Date: Tue, 3 Aug 2021 13:39:26 +0800
Message-ID: <1627969166-57082-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-dbus_1.2.16.bb => python3-dbus_1.2.18.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.2.16.bb => python3-dbus_1.2.18.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.16.bb b/meta/recipes-devtools/python/python3-dbus_1.2.18.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dbus_1.2.16.bb
rename to meta/recipes-devtools/python/python3-dbus_1.2.18.bb
index e1700fa869..c2e8ad4548 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.16.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.18.bb
@@ -7,8 +7,7 @@ DEPENDS = "expat dbus glib-2.0 virtual/libintl"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "51a45c973d82bedff033a4b57d69d5d8"
-SRC_URI[sha256sum] = "11238f1d86c995d8aed2e22f04a1e3779f0d70e587caffeab4857f3c662ed5a4"
+SRC_URI[sha256sum] = "92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120acf7260"
 
 S = "${WORKDIR}/dbus-python-${PV}"
 
-- 
2.25.1

