Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C3CC433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:00:16 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.62214.1638198015544542771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eurabZdr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198013; i=@fujitsu.com;
	bh=LBp0ZxoFW8FUVGbSaD2z/RMJ7ecN5XTdOdGtZ0VS+4M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eurabZdrtLYJ1uuTn5A31ARGnX46geWxoN8JEAx63B3zj2doz9ZJTD+Opc+4RzKgZ
	 qb7OCaFwVGVPegrBx255Op5G2O1audQpljeDBHVKaWAu8znTrTMOtozz5XQ+DVqmcC
	 JrWAgvYstlX2XTMeAFtAEQQJPzqrtr4SxtrxnyRwV7YtZBhUMxQoHTYG7dsBkZVbCy
	 S7073q6RBcgyDeJAPuvKJctA2p9rMv5VJrVKsuU3wo7SUBxtzOC9QYS+dypcvpthMV
	 08EKeu+B+HbAIf1q45YDHkmxk0H3NXs8eObO1Q7aiRtHbn0CESKtL8gR/RnyJ9PbAR
	 xMe6gN3BwsTOg==
Received: from [100.113.5.97] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 3F/F9-30139-CFAE4A16;
 Mon, 29 Nov 2021 15:00:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqPvn1ZJ
  Eg8lXxCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxpba1sBb28FR8m3mBtYLzD3cXIxSEk8JhR
  4njjCyYI5zyTxP+169ggnBOMEse+b2HtYuTkYBNQk5h+6waQzcEhIqAncfWfKEiYWUBF4sXvH
  naQsLCAjcSOPnaQMIuAqsSXZVPAOnkFnCWm/b3MDGJLCChITHn4HszmFHCReDvtNDNIqxBQzd
  H/tRDlghInZz5hgZguIXHwxQuoVkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxgtk4oy0zNKchMzc3QNDQx0DQ2NdU11jYwt9BKrdJP0Ukt1k1PzSooSgbJ6ieXFesWVuck5
  KXp5qSWbGIHhm1LI+m4H47PXH/QOMUpyMCmJ8mYtWZIoxJeUn1KZkVicEV9UmpNafIhRhoNDS
  YJ3/zOgnGBRanpqRVpmDjCWYNISHDxKIrzFL4DSvMUFibnFmekQqVOMilLivEkvgRICIImM0j
  y4Nlj8XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPsaZApPZl4J3PRXQIuZgBa/XboYZHF
  JIkJKqoEpcGGwzvXMxutzVTN1eg4cYdbZntlUbRfcd+qzz/Ky9j3sy5PvpkkzrXC3m/lZNzdv
  gvSNmNs33U95Ru/dof48+kKRZkxHltdB4eYV20yXnLnVvsfjVaxj5GSjKw9NRD2+SXnovhd+m
  P9e/jfHn90JO5XkjhTKMJReYD74RkEg12jyr1NnXbdc77sXLnLAXv11WvnOib/mv+nfHKJ5OH
  T+1LAvz0LUnkxYLDbfQuO22p1/DtpmmrOKmzb81imozDqnmSfrEnH0+KO9bxaWuN5YuH/mHK8
  G38IK3iMyPyR+5B1RVhFk6Hi1Z/LW63d33tYuZct4Kx70/+QhmyrZSP6TCv+TW7gaFsnx7wpp
  7G5WYinOSDTUYi4qTgQAD6ogqVoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-238.messagelabs.com!1638198012!414679!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9626 invoked from network); 29 Nov 2021 15:00:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:00:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DCF491009EF
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:00:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CE14E10023D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:00:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:00:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libexif: upgrade 0.6.23 -> 0.6.24
Date: Mon, 29 Nov 2021 22:59:49 +0800
Message-ID: <1638197991-118955-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638197991-118955-1-git-send-email-wangmy@fujitsu.com>
References: <1638197991-118955-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:00:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158944

libexif-0.6.24 Changelog:

Translation updates: sr, vi, pl, uk, french
fixed regression in exif_data_load_data which could not load EXIF in JPEG data anymore
Decode lots of Canon tag names
removed empty strings from translation (empty string would translate to the PO info header)
various warning removals and code improvements
added sample "persistent" afl fuzzer (100x faster than normal afl fuzzer)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libexif/{libexif_0.6.23.bb => libexif_0.6.24.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libexif/{libexif_0.6.23.bb => libexif_0.6.24.bb} (86%)

diff --git a/meta/recipes-support/libexif/libexif_0.6.23.bb b/meta/recipes-support/libexif/libexif_0.6.24.bb
similarity index 86%
rename from meta/recipes-support/libexif/libexif_0.6.23.bb
rename to meta/recipes-support/libexif/libexif_0.6.24.bb
index b33522dfc4..95fa68c67e 100644
--- a/meta/recipes-support/libexif/libexif_0.6.23.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 def version_underscore(v):
     return "_".join(v.split("."))
 
-SRC_URI = "https://github.com/libexif/libexif/releases/download/v${PV}/libexif-${PV}.tar.xz \
+SRC_URI = "https://github.com/libexif/libexif/releases/download/v${PV}/libexif-${PV}.tar.bz2 \
            "
 
-SRC_URI[sha256sum] = "a740a99920eb81ae0aa802bb46e683ce6e0cde061c210f5d5bde5b8572380431"
+SRC_URI[sha256sum] = "d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae"
 
 UPSTREAM_CHECK_URI = "https://github.com/libexif/libexif/releases/"
 
-- 
2.25.1


