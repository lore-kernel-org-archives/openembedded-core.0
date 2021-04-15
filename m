Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.3143.1618466886824040333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lpP+33gC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618466884; i=@fujitsu.com;
	bh=Qqs98sQCJAqYDrPEi1lN8Dn3sX7O2PjwEh2qukZ373g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lpP+33gCWKBsZq3XJVBB40WSWs7NlSFcnRDYG8MSsPgI/E3bRPLHWAUgqxY0AT24d
	 viRrsVsiINRJYRaK2nbtVbN7Cg51cChdzJeqVtC+HjL/IEuubo+X8RaNHGD+2m0nMc
	 ohrsv3yDJevqtOzMluG+HPqXNuoHuPnFViWmAVEGhx8b+rmyjjD5dPdOR91mnv0rrY
	 2EiFeSxyYeEp8GpIGEow7VHteSE4nHkPt4YFZaeciA+gnTt/vuUZ42F+8Eb+5Oj1D+
	 KZEUNQzTGEK67U/g8LO0K1JgIM2NxQZUHR0hXY9Asy1Js5vexFHVNepDIohozmcM2T
	 569t3cD8fOoYw==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 8D/1F-07430-348D7706; Thu, 15 Apr 2021 06:08:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRout8ozz
  BYOsOZYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePQlkksBVs5Khaef83awHiVvYuRi0NIYBaT
  xNlH7awQznFGiXuvfwA5nBxsAmoS02/dALI5OEQE9CSu/hMFCTMLqEi8+N3DDmILC1hLfJzUx
  QJiswioSvz6sA+slVfASWLZxumMILaEgILElIfvmUFsTgFnicn7FoHFhYBqXnbOgKoXlDg58w
  kLxHwJiYMvXjBD9CpKzL7czAJhV0p0rl/AOIGRfxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQ
  w0DU0NNY10jU11Eus0k3USy3VTU7NKylKBErqJZYX6xVX5ibnpOjlpZZsYgSGY0ohk/EOxmuv
  P+gdYpTkYFIS5T20oixBiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvjmvlCUKCRanpqRVpmTnA2
  IBJS3DwKInwfrsOlOYtLkjMLc5Mh0idYlSUEueVAUkIgCQySvPg2mDxeIlRVkqYl5GBgUGIpy
  C1KDezBFX+FaM4B6OSMG8NyBSezLwSuOmvgBYzAS2uWFUKsrgkESEl1cC0eOoSrdYb5be1Jf1
  ZJ2wOuV7gZ3dmzZbv1tF/Z3vdnTchdW9lTGiOREpR1gf/hhW5NdYP/PfO/X4o4Is4W+M19nPF
  h/79+n9NOmihk/LH/yXcN89nKb6aaZWUsGLNjKLDX+Z/Wvp9TZIA1z276qB9p079TX5TpblI+
  YeCSASvkOGfuDeRyw/48l+10uXV5rvE9MhnnpPYpy+/vPQvJz//obRFMHP9+teMTN1MxTICvb
  k1JW8EuLd7C51elnaKxdz4zvX7Fsf12C9Jftl/WuVRaePii98DXi/d7lsy+9wbzr4DKSoXPqn
  pdmYF7db1Lt+6m19m0p7bJw9ezm2L977GmqiycdbpGnVJ1xc+Zm4TlFiKMxINtZiLihMBXLth
  VkIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-232.messagelabs.com!1618466882!1508947!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13273 invoked from network); 15 Apr 2021 06:08:03 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 06:08:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F682s2005084
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:08:02 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 07:07:40 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mpg123: upgrade 1.26.4 -> 1.26.5
Date: Thu, 15 Apr 2021 14:07:21 +0800
Message-ID: <1618466841-24292-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1618466841-24292-1-git-send-email-wangmy@fujitsu.com>
References: <1618466841-24292-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mpg123/{mpg123_1.26.4.bb => mpg123_1.26.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.26.4.bb => mpg123_1.26.5.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.26.5.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.26.5.bb
index 35cad6ffc4..7207bd1dd0 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.26.5.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "081991540df7a666b29049ad870f293cfa28863b36488ab4d58ceaa7b5846454"
+SRC_URI[sha256sum] = "502a97e0d935be7e37d987338021d8f301bae35c2884f2a83d59c4b52466ef06"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1

