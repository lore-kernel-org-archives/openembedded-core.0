Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D4AC7EE23
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 02:00:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.13817.1677549614504460591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 18:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v9ZzHU9b;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677549612; i=@fujitsu.com;
	bh=eQ9l+Xp2ajdKg05L+sYPxvOuPCBU1vi5lD8Q7DoKCeY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=v9ZzHU9bfXqqKZOeWhMsZoPJWbYHmsasExypgeWsTU5MrD9ws3BYbmWOnEyvsBIRm
	 0v0zeiEXh22Ozls4buMx7nxXFr2+P1vd/Mjbs3IqQt6KbnjnALBKhJyCbNqycXW8SC
	 8MZxnmoLNXE7PaKpgZ+EkaRNLgyKooElkXufHFUeDvblQPsro9AKAvYZ79R4WubF7O
	 duZEDHofTQEo+swexe9bJGgip3+Y4WhUFuvk2tR0l4JoEfA0wM9EFvhqU9Jv1mZUMF
	 Ekseg9C01/73CdjQvCExm2ZfTHxJVZgL6oN5vEGDmgUcyzbwzMgTC4+pNf12ynW+Bz
	 /gzMFFb2qOR/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORpKuT8Df
  Z4MRlIYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNF40OWgqs8Fc9fzWJvYFzC3cXIxSEk8IBR
  YsPRWcwQzhUmievTdrJDOPsYJW6/28fUxcjJwSagIbF76mWgKg4OEQE9iav/REHCzAJqEkdf/
  gRrFhboYJSYt+kAM0iCRUBV4su6tYwgNq+Aq0Tjx7VgcQkBBYkpD98zQ8QFJU7OfMICMUhC4u
  CLF1A1ShJvL+1hhLArJVo//GKBsNUkrp7bxDyBkX8WkvZZSNoXMDKtYjQtTi0qSy3SNdFLKsp
  MzyjJTczM0Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAzGlGLFYzsY//X+
  1TvEKMnBpCTKe/jon2QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryb4v8mCwkWpaanVqRl5gAjA
  yYtwcGjJMJ7wAEozVtckJhbnJkOkTrFqCglzvsuDighAJLIKM2Da4NF4yVGWSlhXkYGBgYhno
  LUotzMElT5V4ziHIxKwrzWINt5MvNK4Ka/AlrMBLS44dofkMUliQgpqQam+acOczP3mCe5u/2
  bFZnR0LvuzZxYlpkeF35KXTFw8XGK7f4qICK1/hrD0i8L5rb+4trAcet9b3cVH4vgf97izeWM
  UoGrZ+6bls1701irqmH5vzcdE5OUzLb1c/Wt3rvW8NWadLlJ17YZFp5V8zdO+TY3PJ1p8fRQF
  ZPt+0T1Pk8T4N3h1FF/Q0UquVLolbvZ7VcPE2qLliV4OsvdqQkOvLJa8tp0kWWPzZy2cnYc0/
  m+LEHLvFYkRS/x0cbF6jWGfprWU82Lyp7ITZPi2/a40l1Kr80pYcsq/spJC8J1/256x5VlyjN
  pRvSBa27Mkckz6qY4Hdod8oV3mrX/mhOvZ7DqL1UV5AudnPczsUmJpTgj0VCLuag4EQCn3Odl
  QQMAAA==
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1677549612!379650!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28550 invoked from network); 28 Feb 2023 02:00:12 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Feb 2023 02:00:12 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0778A1B5
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 02:00:12 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id EFE661B4
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 02:00:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 28 Feb 2023 02:00:10 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] nghttp2: Deleted the entries for -client and -server, and removed a dependency on them from the main package.
Date: Tue, 28 Feb 2023 10:00:02 +0800
Message-ID: <1677549602-21977-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 02:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177814

By default there is nothing in nghttp2-client and nghttp2-server ,nghttp2-client
and nghttp2-server aren't created. So there are dependences error if install
main package.

Problem: conflicting requests
  - nothing provides nghttp2-client >= 1.52.0 needed by nghttp2-1.52.0-r0.core2_64
  - nothing provides nghttp2-server >= 1.52.0 needed by nghttp2-1.52.0-r0.core2_64

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.52.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
index f87def14ad..f57a15954d 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
@@ -17,17 +17,15 @@ PACKAGECONFIG[manpages] = ""
 # first place
 EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF -DENABLE_PYTHON_BINDINGS=OFF"
 
-PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
+PACKAGES =+ "lib${BPN} ${PN}-proxy "
 
-RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
+RDEPENDS:${PN} = "${PN}-proxy (>= ${PV})"
 RDEPENDS:${PN}:class-native = ""
 RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
 
 ALLOW_EMPTY:${PN} = "1"
 FILES:${PN} = ""
 FILES:lib${BPN} = "${libdir}/*${SOLIBS}"
-FILES:${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
 FILES:${PN}-proxy = "${bindir}/nghttpx ${datadir}/${BPN}/fetch-ocsp-response"
-FILES:${PN}-server = "${bindir}/nghttpd"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


