Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.3020.1630634363882849402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 18:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hdWMizpd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630634361; i=@fujitsu.com;
	bh=+G2Ko2mMsexv+5cDcy2dOfYdr32LN2pN1djPTmKkpI4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hdWMizpd8Ri01Q0O3fp9omzT+VEkzOAwj+krGN3Qvsak9MSoWUoFXd+T2mNaT1uLF
	 b4BVsQq3BqmG93WZCaQ7Z9fRuKqvIv0X5qrtfr6kgPwDX42zi8cFcvbU/NgJQa+SPT
	 p5dN5h3d9muzYHA5b74lZ6RITyXGnRCFAAysAUNuMgEuK5DoXtLAWkIj9D/jUx4JaG
	 JgzU34i/UN0+D+URokvL/G2EPDfk3XVjJXoizoyymhm3qUJMm+xw/WfOunVDrImfjr
	 MxEVjpRYmCVNU2TfYbTa0QvJ/pChmKp+Jh1wUMehEzQ6+N7s2wD3M+sSEa7FzYOSz2
	 xrLvDhCtcD3/Q==
Received: from [100.113.6.156] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 03/71-09251-87181316; Fri, 03 Sep 2021 01:59:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVbei0TD
  RYMpbDYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPT7EvsBe0cFfu6JjI3MK5i72Lk4hASmMkk
  cW71bCYI5zijRMvui8xdjJwcbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0sYCmxv
  P0mK4jNAhT/c+QSmM0r4CjxacMpRhBbQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0SNosTsy8
  0sEHaFxKxZbUwTGHlnIWmZhaRlASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NjXVNdIxNDvcQq3SS
  91FLd5NS8kqJEoKxeYnmxXnFlbnJOil5easkmRmCApRSyftzBeOj1B71DjJIcTEqivIvtDROF
  +JLyUyozEosz4otKc1KLDzHKcHAoSfCerQHKCRalpqdWpGXmAIMdJi3BwaMkwitaC5TmLS5Iz
  C3OTIdInWJUlBLnvdsAlBAASWSU5sG1wSLsEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3u
  J6oCk8mXklcNNfAS1mAlo8740ByOKSRISUVANTRZapfViE3KOtJ1me3T9qct9hy4GPSmq8Jkk
  V73NP3/mzu+wnj9PtLY1BDS/qUk6/PHb5HRubzTNZ8U9PlydpS6gp8qZUFPFWBZ9YfWcK1/M3
  OWrXuk1beOQXJH5xZVr8+KsO4+G0J/ssnZO+3Hmp67u18IqyrX+U7q5fm+tPyod8jzw211ChP
  ixXvSZS0GDejLO+70Ijd/I9vv7sd4+EY+upPRO2uNec7dnR/se2+ObH34uEljKr7Pi34+bs67
  UtAk2s9zdyMuoffnTD4YDxx/bf9sb3xLl2iKRMfT3/bLT9n3kieyZwfZkeGR/9bWMZ657Lm16
  9/XbBNenK0l2zNffoHNvUcf+OnuS0jBNxn5VYijMSDbWYi4oTAR0aI8QrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-245.messagelabs.com!1630634360!71094!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28215 invoked from network); 3 Sep 2021 01:59:20 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Sep 2021 01:59:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1831x30Q001674
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Sep 2021 02:59:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 3 Sep 2021 02:59:01 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 181 -> 182
Date: Fri, 3 Sep 2021 09:58:53 +0800
Message-ID: <1630634333-3882-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_181.bb => diffoscope_182.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_181.bb => diffoscope_182.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_181.bb b/meta/recipes-support/diffoscope/diffoscope_182.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_181.bb
rename to meta/recipes-support/diffoscope/diffoscope_182.bb
index 8b2f3cc826..d5875423c4 100644
--- a/meta/recipes-support/diffoscope/diffoscope_181.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_182.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a295024acf713c58693c152f9a43fae268c08078f60ba502a7947b7840ece5d7"
+SRC_URI[sha256sum] = "5969c6f0060c5c553e5ae9fdff45fbd344f102ee8fb2c5673cf0c73999c50df4"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.25.1

