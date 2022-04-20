Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B5DC38162
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web12.4034.1650427837467168215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 21:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Bep1O0vo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650427835; i=@fujitsu.com;
	bh=O0KyvuT/n/csxDcl95YBmx1WlaMUiCO0ojY5V5RcAPQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Bep1O0voQwXtrdEZYrR8cU9PbrgCyEpHy4WdZxbAg3dXi4A+fF3Ocopp6O8IkLRmC
	 6jaUDpF8kqhS2Bx8WcyrQ64XyP0rGHnHJxF9rQRKbP9tqNJUnaTU0wuooddXmPdxYa
	 vFM/oYVlDG9h36KwZdjE0MjOtdfGkU8B3pP8az7GrKaktdP/QcVQtehOHKL8n0H/4z
	 3rKzKsBOIgxFLXyfDLuOgqveoUeei+DHt2GyDerWPQusEp/BO/oS7bOGhdIgszjWRB
	 X54WHvn3cJ2U3Bl1OjcEtABUo2ToQN7x2Z+tMC29DLxANepCO/QkD9fY9WiVmx7Zc7
	 Fq2+rBfiZHj7A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MRorurPT7
  JYOMeQ4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNKy1GWgpc8FatXtLE1MB7m7mLk4hASmMUk
  8f3XZjYIZw+jxLd9y9i7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x6wEmEBW4nOn
  oMsICUsAqoSL2YqgoR5BZwkZi9aygZiSwgoSEx5+J4ZIi4ocXLmExaIMRISB1+8YIaoUZSYfb
  mZBcKukJg1q41pAiPvLCQts5C0LGBkWsVolVSUmZ5RkpuYmaNraGCga2hoqgskjYz1Eqt0E/V
  SS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECAyylmKF6B+P/3p96hxglOZiURHnLWuKT
  hPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwWoHkBItS01Mr0jJzgMEOk5bg4FES4S0GSfMWFyTmF
  memQ6ROMepyrG04sJdZiCUvPy9VSpy3tw2oSACkKKM0D24ELPIuMcpKCfMyMjAwCPEUpBblZp
  agyr9iFOdgVBLmLWkFmsKTmVcCt+kV0BFMQEdUT4kFOaIkESEl1cAkWjN9ovRdrqXOUh+KXvg
  JWt6ZuGriau3Ln/vTv9/7eaJ/r9TaJxMCXnSFXPWr+L73Tced1V7T73fp/V9i3s01Zc0sH4UN
  eyS/eSx+t6Tk8RmO/OtJ55XlT2XJLj0Ql9NjZbfJrLW7xoJ/vrVIlQlnZNgfx5OLTjz8vs8u/
  NndWVpHltz7Y2fGs89sr2of03KzmL3Pn0m1iH//0T37fP6dlNSrqXPr/Za8KsvdqvmsgsFZU3
  jtx+sVZWWHOXz5xDcwKvR9vN/lyi7kH8EVwsIWcOp4mPzHkufzf3/VSf6j9GfbrgU/zSK5Hl0
  Qnf+xRkEt580pqSnbWT0cFTY1MGrzOjH/8U+tuLRb13D694VRSizFGYmGWsxFxYkA2dH39DcD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1650427834!336545!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 755 invoked from network); 20 Apr 2022 04:10:34 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Apr 2022 04:10:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23K4ARgX023955
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 05:10:34 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 20 Apr 2022 05:10:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxcursor: upgrade 1.2.0 -> 1.2.1
Date: Wed, 20 Apr 2022 12:10:17 +0800
Message-ID: <1650427819-28266-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164654

temporarily override SRC_URI which is hard-coded in xorg-lib-common.inc
since new versions of packages use a new compression format - .tar.xz

License-Update: 
file type changed from "ISO-8859 text" to "UTF-8 Unicode text".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxcursor_1.2.0.bb => libxcursor_1.2.1.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.2.0.bb => libxcursor_1.2.1.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb
index f6794b6882..4fd7e949c4 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb
@@ -7,9 +7,10 @@ can exist in several sizes and the library automatically picks the best \
 size."
 
 require xorg-lib-common.inc
+SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8902e6643f7bcd7793b23dcd5d8031a4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dbf3bd0f2348eeccd0f217146ba26250"
 
 DEPENDS += "libxrender libxfixes"
 
@@ -17,7 +18,6 @@ PE = "1"
 
 XORG_PN = "libXcursor"
 
-SRC_URI[md5sum] = "9b9be0e289130fb820aedf67705fc549"
-SRC_URI[sha256sum] = "3ad3e9f8251094af6fe8cb4afcf63e28df504d46bfa5a5529db74a505d628782"
+SRC_URI[sha256sum] = "46c143731610bafd2070159a844571b287ac26192537d047a39df06155492104"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


