Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web11.22896.1625672694441330444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BqO1B0te;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625672692; i=@fujitsu.com;
	bh=LeLQQKa/Qt5eIqfQVTHZwE5N0vhU4kGMwFcDOqGOL1k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BqO1B0teGNGe1euDY8ADW1cm0O52CzTzKAvFO6EcPI5bALG691LuGerIdfFk0Pe4x
	 9AjX0NT1KnbJ677ZAP8y03eOZVZKo8JJBjNNDXnOIZPAWiU9ljvRWBOh9V9efxJAxr
	 tyB3wkuydxTYFlIN+PPUSToLPiLs4hyErYMTjdJy6h4mjuoE5ok50d8q2tm22T1VTr
	 yYMdUjesD/7ubwyhZvZ8A19YlNm6FDfBn/hzyaJWT6gfIgkq+wtBwv2Ec3PZ/8+8y/
	 XnfsL3mgIH5EAVc9kcrBCWhs6smJTDHJlzBmTXAV1Wg1wVThL3z4cM7IXzdd4jDRTw
	 kSldpogSHpb4g==
Received: from [100.113.4.179] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 56/3E-07230-3FBC5E06; Wed, 07 Jul 2021 15:44:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MRqvv59NM
  Egw/bNCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozv8z+yF9znqbi16z9jA+My7i5GLg4hgZlM
  Eqt+bGaBcI4zSlxpPsXUxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg9jCArYSu
  3ZMYAEpYQGKXz8IVsIr4CgxYdEbVhBbQkBBYsrD98wgJZwCThIzX2qBhIWASmY/mssKUS4ocX
  LmExaI6RISB1+8YIZoVZSYfbmZBcKukHh9+BLzBEb+WUhaZiFpWcDItIrRIqkoMz2jJDcxM0f
  X0MBA19DQWNdM18JcL7FKN0kvtVQ3OTWvpCgRKKmXWF6sV1yZm5yTopeXWrKJERiKKYVs4TsY
  z7z+oHeIUZKDSUmUd+aKpwlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjdTgHlBItS01Mr0jJzg
  HEBk5bg4FES4Z0NkuYtLkjMLc5Mh0idYrTneLN2ySJmjrZ7d4HkzAUHVzNz3G8/tJpZiCUvPy
  9VSpw3HKRNAKQtozQPbigsji8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZNAZnCk5lXArf
  7FdBZTEBnMRwGO6skESEl1cA0zUBI0uco00GPlymm3z44T4mPXcm5Ynnlx0+7DYtZZJUCbdkL
  Xyrf9rrftiT945kp+35/3HD5WMLBRLWCA/MPxfCfi3rfq2M45YrgJbvMBU3/PM0iV5132uK+N
  ZM5/KtQ79M018k8XzqnveM83LwrLNKIRYRF/PzPdfvD/Q7P8C52/LvpQfKnMmWPG9+mH2KR8v
  jy14xp0u72uelbHU8rFu5c9bHA9X/SjksuhskLLugFJ+S9+H75vdJZs/MT8/XM3wfI2n3cdCi
  +weff6ReL51yNDV46o2AL52nW7u9f+x9Ydnvr24o8Mo2KSZC/ufZI7e+3i28aPcu6KlX1Vf2o
  ofLyRcr7QiMFeq9vX7xruhJLcUaioRZzUXEiAE8zvZ9eAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-248.messagelabs.com!1625672691!37070!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19876 invoked from network); 7 Jul 2021 15:44:51 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-11.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jul 2021 15:44:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 167Fil7o003293
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 16:44:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 7 Jul 2021 16:44:47 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] u-boot: upgrade 2021.04 -> 2021.07
Date: Wed, 7 Jul 2021 23:44:29 +0800
Message-ID: <1625672669-3918-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
References: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

(Changes of v2021.07)

Processed 1730 csets from 187 developers
29 employers found
A total of 402449 lines added, 82710 removed (delta 319739)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2021.04.bb => u-boot-tools_2021.07.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2021.04.bb => u-boot_2021.07.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2021.04.bb => u-boot-tools_2021.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2021.04.bb => u-boot_2021.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index dbbb9ff145..6b9253806f 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "b46dd116ce03e235f2a7d4843c6278e1da44b5e1"
+SRCREV = "840658b093976390e9537724f802281c9c8439f5"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2021.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2021.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2021.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2021.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2021.04.bb b/meta/recipes-bsp/u-boot/u-boot_2021.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2021.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2021.07.bb
-- 
2.25.1

