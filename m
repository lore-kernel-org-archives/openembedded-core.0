Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.513.1631662604254498454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 16:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fmySBIgq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631662602; i=@fujitsu.com;
	bh=3OVhOM6H6eYfIltdztIeNCiJECKqaJBEcyHU7sDpJRY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fmySBIgq/4wLi1muBS0NOyS1DXKtRjFtYs76Jql4ZO7g8YB42IZjdWDIgs7m2jjYS
	 SJlvQZTMu0GObshMAACceM2j4hEDCz5pq1LPlbrIFsojUQX9mdrLgSaZRepU4u1Dz9
	 D6bqazMFeN1uhDw0WbUGPKqY3UqEnEGAhAxpUuK+iU7iCEAtPrYnCsm/O+r0XhvVqm
	 odd6D5mawt1TC0DtuJTnTCYs3M7Rlxod1cndUFr5aXmiSdcb0usZDRQWnEVHxSv5bz
	 VJG+9+e/2SUY+orUx83yFxFUs7JyFc/mYtEPHcEWqwrLGcm2G40aQeOZ/MmE5BcUl3
	 cujBxQPhTPUnA==
Received: from [100.112.192.69] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 0F/F6-02380-90231416; Tue, 14 Sep 2021 23:36:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRZfTyDH
  R4MgWDos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWProy6WghecFT27L7A1MD7m6GLk4hASmMUk
  0fNhCRuEc4JR4ueu/SxdjJwcbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0sYCvx+
  uQRRhCbRUBV4sTJucwgNq+Ak8T+M/PYQGwJAQWJKQ/fQ8UFJU7OfMICMUdC4uCLF8wQNYoSsy
  83s0DYFRKzZrUxTWDknYWkZRaSlgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLY10jQxM9BK
  rdBP1Ukt1y1OLS3QN9RLLi/WKK3OTc1L08lJLNjECwyul4MCZHYynXn/QO8QoycGkJMq7g8cx
  UYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7wM9oJxgUWp6akVaZg4w1GHSEhw8SiK8jgZAad7ig
  sTc4sx0iNQpRkUpcV5RQ6CEAEgiozQPrg0WX5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCf
  Oy6ANN4cnMK4Gb/gpoMRPQ4iP7HUAWlyQipKQamIzmy/kpKTW/3vzo9uSbJlM6xJ9sYxKc7tK
  murNkbeF25kkd7s+PHrkl52wz9dW127Zddapzt7H52bGcK12a43Tv8I2fB++sEdjyO55nSbPK
  R/YYWSbLuVKm5vWZ97qcd9SGSMXMCJVMtSy6YTN3pmNS2OF6VU3DOhmNCo2ZTJsV42OPHVRe+
  23jAV3GtK9dLcfPRbXXzlpwrvVVx063S5d3nuaZvTrojVj/6iZ3ZXVPnef/JBovOuRWf260iJ
  7iG1trXTDRPtNs/ZxJTssUry+48HvDrCyO3FK55Xa3ds0UOP495kp73G63w9ySb+7OW/zgWDi
  vs7PYGrnJYVtPyZ++qMXQd+nTquOWbGr+XkosxRmJhlrMRcWJAKtShy8qAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-271.messagelabs.com!1631662600!88332!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30776 invoked from network); 14 Sep 2021 23:36:41 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Sep 2021 23:36:41 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18ENaei5023323
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 00:36:40 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 00:36:39 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] help2man: upgrade 1.48.4 -> 1.48.5
Date: Wed, 15 Sep 2021 07:36:25 +0800
Message-ID: <1631662587-37143-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

   * Use @samp{} around the option in the menu description for "--help
     recommendations" to avoid rendering the -- as endash.
   * Update French translations
   * Update standards version to 4.6.0 (no changes).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../help2man/{help2man_1.48.4.bb => help2man_1.48.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.48.4.bb => help2man_1.48.5.bb} (89%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.48.4.bb b/meta/recipes-devtools/help2man/help2man_1.48.5.bb
similarity index 89%
rename from meta/recipes-devtools/help2man/help2man_1.48.4.bb
rename to meta/recipes-devtools/help2man/help2man_1.48.5.bb
index cdc2056e6f..7fe59cbab7 100644
--- a/meta/recipes-devtools/help2man/help2man_1.48.4.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.48.5.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "937194af8e31e97467768ec2e3ce8d396bd1e32e8ea56df23f634485b5f14e09"
+SRC_URI[sha256sum] = "6739e4caa42e6aed3399be4387ca79399640967334e91728863b8eaa922582be"
 
 inherit autotools
 
-- 
2.25.1

