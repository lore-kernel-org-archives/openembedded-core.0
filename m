Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web10.338.1622073121258294029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 16:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=o5/jvIpS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622073119; i=@fujitsu.com;
	bh=Hl9gfeZUNryqsYSHk8iyqAuIFpHgc3W8/9rWHc3jtmA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=o5/jvIpSJ22c/I+K3tCRbHC49euI+4fMuGUHYQ+UhMIc41h6V5qkC9ASUQMgPkErF
	 5Vs9t4sIck41kaXXoIzywB5HMHN1qohjJ9X6POt4jPaCVy7bTiZjIBPVkQcuHnc5gK
	 qFn0Adw/gODoHlXTsoPvC0HJVdf8I6Wu6yp+XhjJyLQimIN1zb/8CdsrkEyz3Ce5ML
	 7J6YDO6PzWExBHYbMNIBgzzdwESVrOyA/ABAYv/pGLoqcgY2xsSo4o2Z5SDVrG/j3s
	 wTg/rCwld/6scAoDDROoX5r2HHdU7wXHqmCOZVg5AlwKdJ1xVke7nhDaWz5KrLrdeX
	 gAjqOwnm/1GiQ==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id C2/81-62504-E1FDEA06; Wed, 26 May 2021 23:51:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRoit3f12
  CwbFryhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bbTTfZCnZzVlzqf8nawLifo4uRi0NIYBaT
  xLyZzewQzglGif59/1m7GDk52ATUJKbfugFkc3CICOhJXP0nChJmFlCRePG7hx3EFhawk2h+s
  Y0FxGYRUJWYfO4ZmM0r4CjxfOYCsBoJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixfMEDWKErMvN7
  NA2BUSrw9fYp7AyDsLScssJC0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGlqa6xoam+slVuk
  m6aWW6panFpfoGuollhfrFVfmJuek6OWllmxiBIZXSsHRzh2Mv1590DvEKMnBpCTKe+3EugQh
  vqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryTbwPlBItS01Mr0jJzgKEOk5bg4FES4e29BZTmLS5Iz
  C3OTIdInWJUlBLn9bwLlBAASWSU5sG1weLrEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXn
  OQKTyZeSVw018BLWYCWiyUCLa4JBEhJdXANPVKrs/yJVWxtt59v1mS7v/ep2Q8/dEXD5eNdoG
  XVoo7Fl/0EXiSnLg3+Nj5tf0n969+8Sww+6/bBf+n+57sP6GosPnoi//2Pl/Nvly46jB14bpv
  jpUyKX6Xfjacny/9cxFXnG/IWsvpq+vYTx1PiQiY7ZPs9a/6YWP8wZuBzutXtd1aL8oQ/2XW+
  w0mqwv95DbF3+WWai5aOPvGrAMlS5YGNtucnyQtujvh6GR5FwPZ/aXp6Tfrb96dq7+WK/DXi8
  Ccd/4TshgSme/GOEwVKXNaeqlNMWL+rpIk/U1MtRqrczf83V2hu5IhbWP4nsdnnibv5qh7UBc
  QP21vz68Urm2MqW/lmOVOHGDQEXaOqFFiKc5INNRiLipOBACDVRbJKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-287.messagelabs.com!1622073118!10450!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4167 invoked from network); 26 May 2021 23:51:58 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 May 2021 23:51:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14QNpw1M027391
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 00:51:58 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 00:51:56 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] logrotate: upgrade 3.18.0 -> 3.18.1
Date: Thu, 27 May 2021 07:51:47 +0800
Message-ID: <1622073108-6638-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logrotate/{logrotate_3.18.0.bb => logrotate_3.18.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.18.0.bb => logrotate_3.18.1.bb} (97%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.18.0.bb b/meta/recipes-extended/logrotate/logrotate_3.18.1.bb
similarity index 97%
rename from meta/recipes-extended/logrotate/logrotate_3.18.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.18.1.bb
index c2115e7142..d853f7bec9 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.18.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[sha256sum] = "841f81bf09d0014e4a2e11af166bb33fcd8429cc0c2d4a7d3d9ceb3858cfccc5"
+SRC_URI[sha256sum] = "14a924e4804b3974e85019a9f9352c2a69726702e6656155c48bcdeace68a5dc"
 
 # These CVEs are debian, gentoo or SUSE specific on the way logrotate was installed/used
 CVE_CHECK_WHITELIST += "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
-- 
2.25.1

