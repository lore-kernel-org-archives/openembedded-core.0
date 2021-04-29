Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.6244.1619700239784109920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 05:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hHKw4SWr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619700237; i=@fujitsu.com;
	bh=vKMsaJnwsZNGDEyuyyptNLC8KL398A3CtaVqkUzAp+o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hHKw4SWr00huNdH/EUivhJBPAyTZkdmFOtnlo+OU4BbCrfzimI426R5kiyZIg3+w7
	 oeYLD/eCIJHyYzHAGKl7YY6vW/TmsNn82GkeJYwgveaEd+6EkL1zILr+5hbnfhqIEJ
	 bFDl2MTAfzz3qfBfBXOoxcV9Mm1Uxqe+Y09GLrSopblZ8Vn6cUFKXdiNCykX4Wzec4
	 wWrPlmPdIvWW+SCyD6lJStN0P9rPX/B6sOiHHQ2oCNgVd/dV4T3w0eMMGYfai8L/WX
	 RGI5BgrUnTZ8OaEY2GBXaRg4ZEQPP03/W47P5Dpiv3AGSJ8odo84pE2SZEy6DchAGO
	 YfvNd6blCyEIg==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 5F/85-46412-D0AAA806; Thu, 29 Apr 2021 12:43:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0eVd1ZV
  gMHWSjMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnF310P2gqWcFZs/HGBpYLzM0cXIxSEkMItJ
  YtXpf0wQzm5GiQNr5rF2MXJysAnoSpx7vJa9i5GDQ0RAT+LqP1GQsLCAt0Tjm8lsIDaLgKpE1
  98usHJeAXeJWYsWgcUlBBQkpjx8zwwRF5Q4OfMJC4jNLCAhcfDFC2aQkRICihKzp8tDlFdKbJ
  92lnECI88sJB2zkHQsYGRaxWiRVJSZnlGSm5iZo2toYKBraGika2hppmtkaKKXWKWbpJdaqlu
  eWlyia6iXWF6sV1yZm5yTopeXWrKJERhEKQVHru1gPPD6g94hRkkOJiVR3i2dnQlCfEn5KZUZ
  icUZ8UWlOanFhxhlODiUJHg3rOhKEBIsSk1PrUjLzAEGNExagoNHSYS3aCVQmre4IDG3ODMdI
  nWKUVFKnHcmSJ8ASCKjNA+uDRZFlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ83aATOHJzC
  uBm/4KaDET0OJl59tAFpckIqSkGpimzJx9Ueff5R/tlV+lDG4w7O/ZUd5jl+g5k69c+Uuk0Ze
  X98O/x/9OfKuzV9Ahy2P5llTZY059l74Z6QcU8/3d983ORXdqxcFNHhGTcr8fexHr2arhG/Vg
  3qqnW1I2TrQ+NivkXIHnj6daKysW5HjzX+tVfl7q8OHz2g/s6cwc02K41H4ob5t2+ofJGh0V1
  wv5JWfT1d9+TAg4c/5Vr9fE2u7+VGXhd2ck2DTi2PM10gRz3842fhWyIl3GL/hoz/7P16L3Jg
  ZfEjvSqNq+KVvn1x1LoblJ2unBjeWH6ldYHwxxTHWvX774zRfGry94bAMmu/oFqE26wCDn9fO
  ztsKMuL2OZbP3h/aHSM9MXanEUpyRaKjFXFScCADcjX/ZHQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-30.tower-287.messagelabs.com!1619700237!259440!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13028 invoked from network); 29 Apr 2021 12:43:57 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-30.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 12:43:57 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13TChmh2028683
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 13:43:57 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 13:43:49 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] wireless-regdb: upgrade 2020.11.20 -> 2021.04.21
Date: Thu, 29 Apr 2021 20:43:43 +0800
Message-ID: <1619700223-5580-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ireless-regdb_2020.11.20.bb => wireless-regdb_2021.04.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.11.20.bb => wireless-regdb_2021.04.21.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
index b3567bca95..f79c0b29ea 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "b4164490d82ff7b0086e812ac42ab27baf57be24324d4c0ee1c5dd6ba27f2a52"
+SRC_URI[sha256sum] = "9e4c02b2a9710df4dbdb327c39612e8cbbae6495987afeddaebab28c1ea3d8fa"
 
 inherit bin_package allarch
 
-- 
2.25.1

