Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.1844.1614817641003038230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 16:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.197.83] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id A4/AD-49021-76920406; Thu, 04 Mar 2021 00:27:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8MxVTdN0yH
  B4MFbDYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePZ2hksBX85K+Y05zcwvuToYuTiEBLYxCRx
  8+1edgjnOKPEtjtvmLoYOTnYBDQlerdsYexi5OAQEdCTuPpPFCTMLKAucWldCwuILSxgLfH2e
  jNYOYuAisSRq2cZQWxeAVeJKU3H2UBsCQEFiSkP3zOD2JwCbhIfv/8C6xUCqjlx4BwzRL2gxM
  mZT1gg5ktIHHzxghmiV1Fi9uVmFgi7SmJNxzS2CYz8s5C0zELSsoCRaRWjeVJRZnpGSW5iZo6
  uoYGBrqGhka6hpZmumYleYpVukl5qqW55anGJrqFeYnmxXnFlbnJOil5easkmRmAophQccdjB
  eP/1B71DjJIcTEqivAe+2CcI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCV0HBIEBIsSk1PrUjLz
  AHGBUxagoNHSYRXTQ0ozVtckJhbnJkOkTrFGM7xZu2SRcwcb8Fk2727QLIdTM5ccHA1M8csMH
  m//RCQfAAihVjy8vNSpcR5j4FsEwAZl1GaB7cMFveXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinM
  wKgnzcqoDTeHJzCuBu+kV0LlMQOfOcrMDObckESEl1cBkmbziYMorjZ5lDC8k0t9+KPB8xPJA
  gsnsTUVx2Me+eY0l/BVN+6e0zHdTEzi8tKAs4Fd8yUKXfs8+hztToz5+/32T+0FC7qGSTZMu7
  nxZojYrqvW0rGNaBPOVvbNfXPVU7f9vL+lc3lHzacLsL57Sl3d8Wt/tN3lP5p6zt30XPa+4uY
  SpLNC65t7i9RNKeE3/PeU7sX9y5q6v/c9Y929L+GO5w1TP5sa6/Zws5dku+gGnE7gMDs17Z/P
  S6cxRwUOBBTfLtk9hW85tPMl6hlW3waw9yd/D5zn8fhr/7sdmoeuSLibs2yOXV2yLF3o5q+CL
  qvzk/rCm04ZTmyYk3azaKJOZJrGuTMrI699K+4pUJZbijERDLeai4kQA0BDDn3YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-291.messagelabs.com!1614817638!782567!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5865 invoked from network); 4 Mar 2021 00:27:18 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-15.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2021 00:27:18 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1240RIUV013667
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 00:27:18 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 00:27:16 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] procps: upgrade 3.3.16 -> 3.3.17
Date: Thu, 4 Mar 2021 08:26:38 +0800
Message-ID: <1614817602-40383-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1614817602-40383-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1614817602-40383-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../procps/{procps_3.3.16.bb => procps_3.3.17.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/procps/{procps_3.3.16.bb => procps_3.3.17.bb} (97%)

diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
similarity index 97%
rename from meta/recipes-extended/procps/procps_3.3.16.bb
rename to meta/recipes-extended/procps/procps_3.3.17.bb
index ef3ac86e97..24d2b68df7 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -15,7 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
            file://sysctl.conf \
            "
-SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
+SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
 
 S = "${WORKDIR}/git"
 
@@ -98,4 +98,4 @@ ALTERNATIVE_LINK_NAME[ps] = "${base_bindir}/ps"
 
 ALTERNATIVE_${PN}-sysctl = "sysctl"
 ALTERNATIVE_TARGET[sysctl] = "${base_sbindir}/sysctl"
-ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
\ No newline at end of file
+ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
-- 
2.25.1

