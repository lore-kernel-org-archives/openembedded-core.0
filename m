Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web08.9396.1624979128944623686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 08:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IAWoZCzz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624979126; i=@fujitsu.com;
	bh=pijI0bvxzMOXQpgAUE4ago1WXHTFY4ydSoipd45iG0w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IAWoZCzzszBaGd+k822EMelsVLQ9hyBmWjcQwtWCAuKQONSEwqaraW/3CGlc5rCx+
	 t8EH4RiiI43cipKA9juuHoGLOEwdZRm4vPgbk1PhpSvmmQV0YLqMD2/M2+YST6OCF3
	 9kbCIA5T3L6bGNCsBTogkgsfE04bl83PPO2pTcuMPUUjp/NJsGorMq0sYTNynIzf2k
	 v4la4MJUsjmUnj0PO68XwN5ZT4KrGEN3/H3CecMlwVjeKGdSlVuYWvau+VRd19iCb3
	 eRERmv5gpC4HfqQRhx8qST0sThN1bCZ+tiC9JCE4GHIvL3mSCOrTLx3H4rb8CvNExs
	 TwdVajEdxPgnQ==
Received: from [100.112.199.200] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 1F/20-62504-6B63BD06; Tue, 29 Jun 2021 15:05:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxVXer2e0
  Eg0UX9Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1ownZxexFbziqJjw+BtTA+Nn9i5GTg4hgVlM
  Elv313YxcgHZJxglrl79ygqSYBNQk5h+6waQzcEhIqAncfWfKEiYWUBF4sXvHrBeYQFLiZ9bj
  4CVswioStzY9IYJxOYVcJLYMmUyM4gtIaAgMeXhezCbU8BZYvO+uYwgI4WAahZ/loQoF5Q4Of
  MJC8R4CYmDL15AtSpKzL7czAJhV0i8PnyJeQIj/ywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2h
  goGtoaKRraGmha2hurJdYpZukl1qqW55aXKJrqJdYXqxXXJmbnJOil5dasokRGIopBcfW7mDs
  efNB7xCjJAeTkijvJb3bCUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeC+YAOUEi1LTUyvSMnOAc
  QGTluDgURLhnQyS5i0uSMwtzkyHSJ1iVJQS5+U0BUoIgCQySvPg2mCxeIlRVkqYl5GBgUGIpy
  C1KDezBFX+FaM4B6OSMO9tkPE8mXklcNNfAS1mAlq86MlNkMUliQgpqQYmp7xD1+fEPWRM/sh
  27R/X1tW1DKc8wv/5WlaU3ZUUEjj9p+ydycTAbxkar9qtUqQck9b/Prz9auPaqlTLgux1R5QO
  /yxQrJ7I7HXrrVawxsmOPxG8C44FOcxxnv7eyON9W6jEI3m+53ppPyMexbww/D2tef0C9zibX
  R/ab2Q+WC2rId16pde9dGeUxs1HVinXHzV9mM1VM5Fl2d1tiYfzNRVOpylWvVxXMO+yU3vwqk
  cSJ9PfqLmdOngzoMnneKx+yJ3Dxy5LL5v8RPtl/qzldrcaBbxlpk98aL/tc8tasye1Ul3PLp9
  47hr/sTlXkCtMrvzr3H5zf4WPcdyXGVstks6+V3aLKLj9gr9A5k61EktxRqKhFnNRcSIAQ5m0
  gEADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-285.messagelabs.com!1624979125!427228!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13436 invoked from network); 29 Jun 2021 15:05:25 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-10.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jun 2021 15:05:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15TF5Ixw001011
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 16:05:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 16:05:22 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libglu: upgrade 9.0.1 -> 9.0.2
Date: Tue, 29 Jun 2021 23:04:51 +0800
Message-ID: <1624979093-98912-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624979093-98912-1-git-send-email-wangmy@fujitsu.com>
References: <1624979093-98912-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{libglu_9.0.1.bb => libglu_9.0.2.bb}                 | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-graphics/mesa/{libglu_9.0.1.bb => libglu_9.0.2.bb} (84%)

diff --git a/meta/recipes-graphics/mesa/libglu_9.0.1.bb b/meta/recipes-graphics/mesa/libglu_9.0.2.bb
similarity index 84%
rename from meta/recipes-graphics/mesa/libglu_9.0.1.bb
rename to meta/recipes-graphics/mesa/libglu_9.0.2.bb
index 703f131f79..ae18f86532 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.1.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.2.bb
@@ -10,12 +10,10 @@ LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b35645
 
 # Epoch as this used to be part of mesa
 PE = "2"
-PR = "0"
 
 SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5599a0e0a97335e10239d9165aced60d"
-SRC_URI[sha256sum] = "f6f484cfcd51e489afe88031afdea1e173aa652697e4c19ddbcb8260579a10f7"
+SRC_URI[sha256sum] = "24effdfb952453cc00e275e1c82ca9787506aba0282145fff054498e60e19a65"
 
 S = "${WORKDIR}/glu-${PV}"
 
-- 
2.25.1

