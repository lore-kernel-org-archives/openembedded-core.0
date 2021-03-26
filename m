Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web09.6774.1616723533736174875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id CC/AB-42200-B4E3D506; Fri, 26 Mar 2021 01:52:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MRouttF5t
  g0HpbwOLOz3fsDowe5zauYAxgjGLNzEvKr0hgzZh4/T1LwROeiv5XO9gaGPdydzFycQgJbGaS
  ePiphR3C2cMocWD9BeYuRk4ONgEDif1nLwAlODhEBPQkrv4TBTGFBewl5h1mBTFZBFQlJqzTB
  inmFfCWuP70PxOILSGgIDHl4XtmiLigxMmZT1hAbGYBCYmDL14wg7RKCChKzJ4uD2FWSRyZqT
  aBkWcWkoZZSBoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQ01zU0NtdLrNJN0kst1S1PLS7
  RNdRLLC/WK67MTc5J0ctLLdnECAyflIKjnTsYf736oHeIUZKDSUmU99CJmAQhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKEryvbWMThASLUtNTK9Iyc4ChDJOW4OBREuH9AZLmLS5IzC3OTIdInWIM5
  3izdskiZo63YLLt3l0g2Q4mZy44uJqZYxaYvN9+CEg+AJFCLHn5ealS4ryFIOMEQMZllObBLY
  PF6iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxWIFN4MvNK4G56BXQuE9C5G39Egpxbkoi
  QkmpgKqnc52yuuW6dWOHursvrH6v5dl3UVQq4ot8g6lb4KfjRwwC/fc9rdBRPbDC46/Zpw8yn
  THe7FyquXLOt/t99s0NrGl8tCZkVyBq53tmeW+yfotaSxU4L9vBM1sy0C8tXncr21Inn09mml
  80ZPz911zTNcerK2RCjqiDtYGJd0uj+f21d2reK99dOClz6vs9uYq3/kmxx6wemU10kX22Smr
  dy24KSUi+dJZuNzP9Ou+e3KiKi4Ukkp3bJ1CkGqfP6tB9b5H5siUm791ug+P/aHbUczk9lo3r
  OJGzeU3i+cJ7f+l7PGQICF313n7xk43+n9d6mPQz7tKf9MDrLe7wgLNo1913lQt01Wz7b6Rgl
  KrEUZyQaajEXFScCAOWVCkBQAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-285.messagelabs.com!1616723530!336176!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8826 invoked from network); 26 Mar 2021 01:52:11 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 01:52:11 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q1qAbF021366
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 01:52:10 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 01:52:09 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] systemd-boot: upgrade 247.4 -> 247.5
Date: Fri, 26 Mar 2021 18:23:49 +0800
Message-ID: <1616754229-67687-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../systemd/{systemd-boot_247.4.bb => systemd-boot_247.5.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_247.4.bb => systemd_247.5.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_247.4.bb => systemd-boot_247.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_247.4.bb => systemd_247.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_247.4.bb b/meta/recipes-core/systemd/systemd-boot_247.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_247.4.bb
rename to meta/recipes-core/systemd/systemd-boot_247.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 098bca98f1..87ee794f05 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "069525e84a67375e27429cb490e8d28af78e673a"
+SRCREV = "c86f4f5f287258938d0c30354040c3b034b0c066"
 SRCBRANCH = "v247-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_247.4.bb b/meta/recipes-core/systemd/systemd_247.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_247.4.bb
rename to meta/recipes-core/systemd/systemd_247.5.bb
-- 
2.25.1

