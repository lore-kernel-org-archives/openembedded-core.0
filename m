Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.7524.1615376831624833368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 1A/D2-03420-CB1B8406; Wed, 10 Mar 2021 11:47:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRortno0e
  Cwez/chZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aqlZ1sBdM4KtbOaWRvYNzL3sXIySEkMINJ
  4u5N/y5GLiD7OKPErpXLGEESbAKaEr1btgDZHBwiAnoSV/+JgoSZBdQlLq1rYQEJCwvYSsw7X
  g1isgioSsyfHAVSwSvgIrHu7T82EFtCQEFiysP3zCA2p4CrRN/9K8wQW10k3m5ZwQhRLyhxcu
  YTFojpEhIHX7xghuhVlJh9uZkFwq6U2LP5IesERv5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9f
  QwEDX0NBY1xBImuslVukm6qWW6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECQzGlkLF0B+O0
  Nx/0DjFKcjApifL2FXgkCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgDVwClBMsSk1PrUjLzAHGB
  UxagoNHSYS3bwNQmre4IDG3ODMdInWKUVFKnHfdeqCEAEgiozQPrg0Wi5cYZaWEeRkZGBiEeA
  pSi3IzS1DlXzGKczAqCfOKACNbiCczrwRu+iugxUxAixUM3EAWlyQipKQamHZzfHpduO6Yp/d
  9BrU58RUrGAW9Veq3S1ytEM7c0z09/c3kucUpq8u9rXzE+tt7xfIXtHIxWDUtThf7fIz50KHr
  8Q+mGnJURq1wKxOVsC4oicy/eG1ubMg++/mrX6hv5LrIaXDMws9nz/Xzd9/GMp/Mf1Kt83pvz
  5K3ViYpl6YJH/xwzWP3l298b41/FV9mqxNPqTqgm/+0Y+W6x2aqL7YpmrUbdE3Z9/Lz32/MX7
  bssznm23/O5+5yB5bDvime/21Wl5ZcOXXH1fu0a8ATzrNLeV87L1e5bcdi6LBRN4ZHYGvU1pq
  9Ajb1H/bPLfvQdzHCxC5n+puimck6DI83LTSVtRDYKvXiVP7cHws9ViuxFGckGmoxFxUnAgBL
  wYGjQAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-228.messagelabs.com!1615376827!1698559!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2535 invoked from network); 10 Mar 2021 11:47:08 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2021 11:47:08 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ABl2kZ024118
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 11:47:07 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 11:47:03 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] help2man: upgrade 1.48.1 -> 1.48.2
Date: Wed, 10 Mar 2021 19:46:04 +0800
Message-ID: <1615376771-3093-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../help2man/{help2man_1.48.1.bb => help2man_1.48.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.48.1.bb => help2man_1.48.2.bb} (89%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.48.1.bb b/meta/recipes-devtools/help2man/help2man_1.48.2.bb
similarity index 89%
rename from meta/recipes-devtools/help2man/help2man_1.48.1.bb
rename to meta/recipes-devtools/help2man/help2man_1.48.2.bb
index bdea59d964..3e9b509ed4 100644
--- a/meta/recipes-devtools/help2man/help2man_1.48.1.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.48.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "de8a74740bd058646567b92ab4ecdeb9da9f1a07cc7c4f607a3c14dd38d10799"
+SRC_URI[sha256sum] = "20cb36111df91d61741a20680912ab0e4c59da479c3fb05837c6f0a8cb7cb467"
 
 inherit autotools
 
-- 
2.25.1

