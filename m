Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.1830.1614817836425373598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 16:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.6.236] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 04/04-08502-A2A20406; Thu, 04 Mar 2021 00:30:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRoqul5ZB
  gsGAJv8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH+92vWgm72ihe/prM2MB5m62Lk4hAS2MQk
  cXbGBRYI5zijxP8PbUAZTg42AU2J3i1bGLsYOThEBPQkrv4TBQkzC6hLXFrXwgJiCwtYSrR/+
  s8KYrMIqEjcfjgNzOYVcJU41zSfCcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDFGjKDH7cj
  MLhF0lsaZjGtsERt5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBY10zXwlwvsUo3SS+
  1VDc5Na+kKBEoqZdYXqxXXJmbnJOil5dasokRGF4phWzhOxjPvP6gd4hRkoNJSZT3wBf7BCG+
  pPyUyozE4oz4otKc1OJDjDIcHEoSvBIaDglCgkWp6akVaZk5wFCHSUtw8CiJ8KqpAaV5iwsSc
  4sz0yFSpxgVpcR5j4H0CYAkMkrz4Npg8XWJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjAvpz
  rQFJ7MvBK46a+AFjMBLZ7lZgeyuCQRISXVwBT2Uahw8YOp7Ta5pub8xn7ts/aUOs3W/qo+JXI
  Fs5p7ONuHWt/QGPkrc1edEAzQmHzk/4T0KZWd3UduPM9nu/tbyPIbC/ft72sL1vyJzXx7hyNu
  5tLNbl9iD4cc2L91s5Bjye11MqWMd6c0lh+zET5b/mw237dH69bJW7ru1mhIeMd6OjvoV1oC6
  9sNeuJvJExeSRfEF3vfvFm56+4RzYxMrmOzOeZP23AtfO/SUzxeqznurV6ZHu56SsXWVPpS2K
  c328+pbLuSq53cvnBF2N5fhvpNW5hPVwrzWx1g+Lg/zk2lXD/ZuTr24978Fws2+dT2+Oy0Xb5
  14bXvp1yXHfRZcic+vmlm3h6x21lcUzqVWIozEg21mIuKEwFBjLuvKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-29.tower-238.messagelabs.com!1614817833!1850056!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7005 invoked from network); 4 Mar 2021 00:30:34 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-29.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2021 00:30:34 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1240UXG9022474
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 00:30:33 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 00:30:31 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] vala: upgrade 0.50.3 -> 0.50.4
Date: Thu, 4 Mar 2021 08:30:26 +0800
Message-ID: <1614817826-40571-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-devtools/vala/{vala_0.50.3.bb => vala_0.50.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.50.3.bb => vala_0.50.4.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.50.3.bb b/meta/recipes-devtools/vala/vala_0.50.4.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.50.3.bb
rename to meta/recipes-devtools/vala/vala_0.50.4.bb
index 302f562549..4381635517 100644
--- a/meta/recipes-devtools/vala/vala_0.50.3.bb
+++ b/meta/recipes-devtools/vala/vala_0.50.4.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "6165c1b42beca4856e2fb9a31c5e81949d76fa670e2f0cfc8389ce9b95eca5db"
+SRC_URI[sha256sum] = "58fc31fa8bf492035b11d1a7d514801710afc65bd458b24c0f8d00280a92a38c"
-- 
2.25.1

