Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E22C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:00:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.61622.1638198014978633809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x3dr/+gP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198012; i=@fujitsu.com;
	bh=lrGgtRyfSzpS8tZeagP/qNzqpYlQqRO4JIxmfzw/Aok=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=x3dr/+gPkbmoP6hxLuYY9a00pAL9nYRhDlzWFHnG4waOuKZGtX8NnjbHa8ebYQNrF
	 ygvBlYKEjKGUiXw8/AHKxnrfZTR52TgNnn/D3Pscc8PZn1G/K6VjZE4Btv4yOT0tI6
	 Z4i4p5rHkmm3t168ZpHvjtJF/kI9TiUsyaavOVjZb0Ob1MlOwQgk7uUj1uNppUZXGg
	 Xyn0bY5to0IixUVfb/5Yfooa2WmmSMGbyk0V2umFt+HhOeLYp/9PvNtPaz//hPsO9A
	 Kaqfb/GnofiB0HFI2QWBwvFUZ7dmDeMzTcyej6uKgtfWCoMBbnhPfhTn/fxlVkzCpq
	 BiAKKtQ3lo6WA==
Received: from [100.115.32.166] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 8E/1E-17169-CFAE4A16;
 Mon, 29 Nov 2021 15:00:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqPvn1ZJ
  Eg+v3RSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxJf/QKzrFXdK8+ztrA+Jiti5GLQ0jgMaPE
  zgez2CGc80wS1zZsYoRwTjBKbFlxirWLkZODTUBNYvqtG0A2B4eIgJ7E1X+iIGFmARWJF7972
  EFsYQFbieMLFzOBlLAIqEo0XC4FCfMKOEv0NfaygdgSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itE4qykzPKMlNzMzRNTQ
  w0DU0NNU1NtU1MjDRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMmUYuUz
  Oxg/Xfqmd4hRkoNJSZQ3a8mSRCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvPufAeUEi1LTUyvSM
  nOA8QGTluDgURLhLX4BlOYtLkjMLc5Mh0idYlSUEudNegmUEABJZJTmwbXBYvISo6yUMC8jAw
  ODEE9BalFuZgmq/CtGcQ5GJWHe1yBTeDLzSuCmvwJazAS0+O3SxSCLSxIRUlINTJxBC1xvu5j
  xWXYutNZIln15+fb6R42Sz99qSecKxM576JpudGih4YuJNhnG3wX2xO2+qvLr51Ophftycj7v
  ddm+odQ+Jb8rxNX9z4qFkz+bGD5g2rMjKChiSTKfjPuSh6dcWySnbKq1qJHivi5jvLIzZ0Xae
  lGv1203PpX51DJPX9S18sOpd4KT1XekTLjhYtLKbDPl5ynu85nb45Zcey6eeMRr3qV1kQ16Jv
  I8tVr+YWt9j+5v0D6W+Xdt1dNFT5sXXNobzHXzfVKP9r2QytOP/5/6FXWuLXXjeb1zrovmTXr
  lFJTwznGP0S+fzuX5vVE8tusuTl9/d+6Np0FWK7q4ig9KnnGw3MvYvm7xA0klluKMREMt5qLi
  RAAodMWrRAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-548.messagelabs.com!1638198012!5466!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28335 invoked from network); 29 Nov 2021 15:00:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:00:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D74E11009E9
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:00:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CBDA8100236
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:00:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:00:01 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.108 -> 2.4.109
Date: Mon, 29 Nov 2021 22:59:48 +0800
Message-ID: <1638197991-118955-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:00:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158941

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.108.bb => libdrm_2.4.109.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.108.bb => libdrm_2.4.109.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.108.bb b/meta/recipes-graphics/drm/libdrm_2.4.109.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.108.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.109.bb
index 66b2c9f54f..fb5ddd82c0 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.108.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.109.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "a1d7948cbc536763fde14b4beb5e4da7867607966d4cf46301087e8b8fe3d6a0"
+SRC_URI[sha256sum] = "629352e08c1fe84862ca046598d8a08ce14d26ab25ee1f4704f993d074cb7f26"
 
 inherit meson pkgconfig manpages
 
-- 
2.25.1


