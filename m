Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web10.12526.1631112141970029473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SUh782XH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631112140; i=@fujitsu.com;
	bh=6Y6Q89X5l3hnW5QqR67JV1Br7dz+ZQoO9FFFadlAh6c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SUh782XHlBEF0dpnJFM53sS7BoJxswpfvpEsaEpWFtzsLAo/2DW3dR1g8TKmOkRch
	 p71Vadqa3J77YBXST6HgABTPpJ1p4TmDJgT75RQbhSrncM91pPRpr3vBe9HEUciScZ
	 MoPQIKzMEOOILNegcCKDDNQq1pHtixqB/gsiurAte2KCqElhc0YvEdfh5EBzldHGPo
	 ihRZe++m32Je1X+DIs2K6kZNgBNZtIsnGVyXN+RWY9LErp2tXm6+bqmaIawiY55U0F
	 LnMgh90V8Tp8giklKFo3KM1rXeACiX3gj5OJkGMhTvJXJJvCnd2SLAtqkSO+lJCsaA
	 pP/cUKbXE7rJA==
Received: from [100.113.6.150] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 7E/83-14951-CCBC8316; Wed, 08 Sep 2021 14:42:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRonv6tEW
  iwd0VxhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bnlD7Wgu9cFWvbprM2MP7m7GLk4hASmMkk
  MfvlATYI5zijRPe1i6xdjJwcbAJqEtNv3QCyOThEBPQkrv4TBQkzC6hIvPjdww5iCwuYSsz7u
  4oJxGYBis+/+YIRxOYVcJJ4/WspM4gtIaAgMeXhe2aIuKDEyZlPWCDmSEgcfPECqkZRYvblZh
  YIu0Ji1qw2pgmMvLOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqGBga6hobGuqa6RgaFeYpVukl5
  qqW5yal5JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMMBSCllP7mCc9OaD3iFGSQ4mJVHeXbstEoX4
  kvJTKjMSizPii0pzUosPMcpwcChJ8GqeAsoJFqWmp1akZeYAgx0mLcHBoyTC63QEKM1bXJCYW
  5yZDpE6xagoJc67BqRPACSRUZoH1waLsEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmtQK
  bwZOaVwE1/BbSYCWhx20MTkMUliQgpqQYm2b7ym3PTJjTLPZ5rt9hIal78rpLjd3Z/V/S5v/O
  dcsQrXeVorzf8zCsYdfVFDY5W3Y+fv8jd+Oi5rUf+aPXNsY/PPayblqDya3Vw0b0ZPIeO1Gvy
  dm4yqqu8ESDecIylyVMyZv1Jkf3/Zrbn3fuxdM7zR7fvpejnpodHmk/6+U7xVZOXUI3QnSoxz
  +THiw/Pe1xb2tl5+X2wg4NcR1t40V5eg6IzznHx2y7qWpbFXgizL57zJU3tSvGSmo/NApdvzm
  bO9dASDJ/ef2/K5v+WXT1PD4q4r366NuPB4me9N8xZNm/5HufrLF1Zuaf88rVfFdN2WuTY9Le
  z2f87+znhpbH+w03d3t/Z/k+/ynJbiaU4I9FQi7moOBEAW6XbaisDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-245.messagelabs.com!1631112139!52825!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1347 invoked from network); 8 Sep 2021 14:42:19 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Sep 2021 14:42:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 188EgDqh019599
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 15:42:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 8 Sep 2021 15:42:12 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gzip: upgrade 1.10 -> 1.11
Date: Wed, 8 Sep 2021 22:41:58 +0800
Message-ID: <1631112120-19285-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gzip/{gzip-1.10 => gzip-1.11}/wrong-path-fix.patch         | 0
 meta/recipes-extended/gzip/{gzip_1.10.bb => gzip_1.11.bb}      | 3 +--
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/gzip/{gzip-1.10 => gzip-1.11}/wrong-path-fix.patch (100%)
 rename meta/recipes-extended/gzip/{gzip_1.10.bb => gzip_1.11.bb} (90%)

diff --git a/meta/recipes-extended/gzip/gzip-1.10/wrong-path-fix.patch b/meta/recipes-extended/gzip/gzip-1.11/wrong-path-fix.patch
similarity index 100%
rename from meta/recipes-extended/gzip/gzip-1.10/wrong-path-fix.patch
rename to meta/recipes-extended/gzip/gzip-1.11/wrong-path-fix.patch
diff --git a/meta/recipes-extended/gzip/gzip_1.10.bb b/meta/recipes-extended/gzip/gzip_1.11.bb
similarity index 90%
rename from meta/recipes-extended/gzip/gzip_1.10.bb
rename to meta/recipes-extended/gzip/gzip_1.11.bb
index 120e1d4580..eb3054cc48 100644
--- a/meta/recipes-extended/gzip/gzip_1.10.bb
+++ b/meta/recipes-extended/gzip/gzip_1.11.bb
@@ -36,5 +36,4 @@ do_install_ptest() {
             ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
 }
 
-SRC_URI[md5sum] = "cf9ee51aff167ff69844d5d7d71c8b20"
-SRC_URI[sha256sum] = "c91f74430bf7bc20402e1f657d0b252cb80aa66ba333a25704512af346633c68"
+SRC_URI[sha256sum] = "3e8a0e0c45bad3009341dce17d71536c4c655d9313039021ce7554a26cd50ed9"
-- 
2.25.1

