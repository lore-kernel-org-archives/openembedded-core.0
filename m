Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.9278.1619078318474218989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ip1VtIWF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619078317; i=@fujitsu.com;
	bh=YLdvlaSUCa/5u9ZkepLpN3WPS/I4yoeBkI80AGAEziI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ip1VtIWF3+uL3souZ6VofDQNpUG/MV1MbkWVvvOgXupx7Sj8nhl7Lupk9wr+oVno5
	 lEQWxS3kLFvpi8Oqv56UOBqEkTnA9Uyjujke5B6JM0RDoDO9QbUpNIAlfPIS+WzBjQ
	 8Henq10YsTQiu4I00sZerBv4Tat5lyHNr1BXxWFU9K0xpX1lgijLdVpiSYp2MIJsuu
	 pNUHkjyhDwqsi20v75yfygR02j926/PbXXMLsnzDvLpqUuT6I1MpS8HNsZQQ8Y8ydU
	 oDATohg6YxiJsKyDK7sp50Kg4YeExTlYt7PWWZmYkhclgdHl0ToGgVzYp1aDPjXf5F
	 CguHvbD/h5Lgw==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 39/A0-53635-DAC21806; Thu, 22 Apr 2021 07:58:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRqrtGpzH
  B4PNnXYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePU/j/MBa+5K+ZM38HawPieq4uRi0NIYBaT
  xJIlS9m7GDmBnOOMEjd7NEBsNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxuwesXFjASuL5l
  A4WEJtFQFXi6tvDjCA2r4CjxK0ft9lAbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8wQNYoSsy
  83s0DYlRKd6xcwTmDknYWkZRaSlgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLY10jQxM9BK
  rdBP1Ukt1y1OLS3QN9RLLi/WKK3OTc1L08lJLNjECgyul4MCZHYynXn/QO8QoycGkJMq7kK8x
  QYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7wstoJxgUWp6akVaZg4w0GHSEhw8SiK89iBp3uKCx
  NzizHSI1ClGRSlx3tUgCQGQREZpHlwbLLouMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmld
  cGmsKTmVcCN/0V0GImoMXaU2pBFpckIqSkGpgS1295cGtbi8n7w8pG5lu0Tq/1es+p8dloTVH
  Ql5b/z36XhLFktC87p34pYlrfu2Kzmu3CdXf3qjo2dTdlM54OZ5m+l+/lPr17a3r9Zz1d5peW
  +fdJ2PqpAZ2XGbfWbP5UotjGn/jZ7O8sLrVlX7I8d5lyfl8QUPBDxalrvoSB55RF2ycaqXzna
  AwTXN3C6OLrUnWnxnfeBfHPywzYWSKNPuVWRdqelcy/t+xyt8EiFea9YvvtXQp6qpwcnnldVu
  /5rvP4gYd9oNChJ/z+i1t7r5h+unevifuM/bRdH/ZMddj7nb0wNCP4m3mzwkrnbs2MK4q5N/S
  0Hcsywu+0fY/R/VZ2tMTrSs2cPfGTm5RYijMSDbWYi4oTATD4kJYpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-271.messagelabs.com!1619078316!1931623!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29100 invoked from network); 22 Apr 2021 07:58:36 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:58:36 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7wanX009198
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:58:36 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:58:34 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] boost: upgrade 1.75.0 -> 1.76.0
Date: Thu, 22 Apr 2021 15:58:24 +0800
Message-ID: <1619078305-5630-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../boost/{boost-1.75.0.inc => boost-1.76.0.inc}                | 2 +-
 meta/recipes-support/boost/{boost_1.75.0.bb => boost_1.76.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-1.75.0.inc => boost-1.76.0.inc} (90%)
 rename meta/recipes-support/boost/{boost_1.75.0.bb => boost_1.76.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.75.0.inc b/meta/recipes-support/boost/boost-1.76.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.75.0.inc
rename to meta/recipes-support/boost/boost-1.76.0.inc
index e5a8488c58..3ae5a25b29 100644
--- a/meta/recipes-support/boost/boost-1.75.0.inc
+++ b/meta/recipes-support/boost/boost-1.76.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb"
+SRC_URI[sha256sum] = "f0397ba6e982c4450f27bf32a2a83292aba035b827a5623a14636ea583318c41"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost_1.75.0.bb b/meta/recipes-support/boost/boost_1.76.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.75.0.bb
rename to meta/recipes-support/boost/boost_1.76.0.bb
-- 
2.25.1

