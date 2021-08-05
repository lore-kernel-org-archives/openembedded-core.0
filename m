Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.4326.1628133439194669436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 20:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f0svqmuf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628133436; i=@fujitsu.com;
	bh=L66tFej1cFEwpqNpsjlTko0Q2Kw0batv6NwV0P8w8ug=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=f0svqmufkpA7+fDgGPpC9o0MdhHq0VA4KFhNLQpLB/BDlyrapuWz3MooXG6sqt3xA
	 Yjc13IDbRERyBMcRagxNOqyxslDONKeMj47r262mqYlePL+fHDt8l42djff8t+R6F9
	 USdEakn6x2eywPHeNPGmKJoYxySf3uroDy6z1u1zLotxBis+bUbu2b0j2roYz/DzOy
	 xIN6X4Z1HdeWH4jXXMvTHZeiqYks6rJrmTQz886pBaeJ/0mn+Fp6hXIPFHnh8VH09b
	 cdcXoQJ3bWL1P9Wc7Qzff/FjgNV7YMbEo/7YZ1kbHrTIALkbfpBneq7cvXL0JFI1ot
	 V4hfkJGh1e0xQ==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 2A/1A-16478-B385B016; Thu, 05 Aug 2021 03:17:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVdc6gjv
  R4P9RXos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPl+Z8sBXfZK168eMnewPierYuRi0NIYCaT
  ROuHm4wQznFGiRP/trN3MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z1gJcICphKTm
  iYwgtgsQPFZt+4ygdi8Ao4SB06cBrMlBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9QoSsy+3M
  wCYVdIzJrVxjSBkXcWkpZZSFoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTWNdI1NdRLrNJN1Es
  t1U1OzSspSgRK6iWWF+sVV+Ym56To5aWWbGIEhldKIZPxDsZrrz/oHWKU5GBSEuX9IMGdKMSX
  lJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd0IoUE6wKDU9tSItMwcY6jBpCQ4eJRHepWFAad7igsTc4
  sx0iNQpRkUpcV6DcKCEAEgiozQPrg0WX5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNWgo
  znycwrgZv+CmgxE9DiC7GcIItLEhFSUg1MwetXGj21cpqVG9H0Ojwn5ZJn+XTmLZGpFn8/+W/
  nLV2bPklQdXXG1i+psuz5++Ydmd9Yc9tbNkpKwoKrxtbUyjTYw18tSSy598rHFq4UUY6jk/5v
  XxLnZrxec/66zb8uhEyQ3LPw/P2St99td07/FvdY9QZDIm/krT0XuAqaJawir81fqeKUEj1x7
  vpoPx//WEmX97cEG+376yedj4sU/fdNhpNJcSZPyAKPpRnFTjtMarUTfA9MVYi5f3BWtPFCQ4
  0eodiKqXaNMhfMlT5Gm3HUvGjX3llUGlD/v2RFqd87y772pgd+e4+vrbVcUylj9CxlxtX4L3f
  /H8ioE3iUsdHJ2GBhpczUNM+Lr5RYijMSDbWYi4oTAcfLJSMqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-226.messagelabs.com!1628133434!21379!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14768 invoked from network); 5 Aug 2021 03:17:15 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-17.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 03:17:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1753HEkF005862
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Aug 2021 04:17:14 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 04:17:12 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.41 -> 0.42
Date: Thu, 5 Aug 2021 11:17:03 +0800
Message-ID: <1628133423-4961-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.41.bb => ell_0.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.41.bb => ell_0.42.bb} (90%)

diff --git a/meta/recipes-core/ell/ell_0.41.bb b/meta/recipes-core/ell/ell_0.42.bb
similarity index 90%
rename from meta/recipes-core/ell/ell_0.41.bb
rename to meta/recipes-core/ell/ell_0.42.bb
index f6da957b51..7d021c5e3c 100644
--- a/meta/recipes-core/ell/ell_0.41.bb
+++ b/meta/recipes-core/ell/ell_0.42.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "4e8dba6c53cf152dbd0fd1dc3d4c7b04abf79e20a948895f85943e586870505c"
+SRC_URI[sha256sum] = "8b926eebb053f545a03349c0e3d02be586f5aa041f5660b6ced85b55fc531bb7"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1

