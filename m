Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web11.6965.1616723560545731572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.113.1.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 4C/11-41911-56E3D506; Fri, 26 Mar 2021 01:52:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1U21i00
  w2LFTxuLOz3fsDowe5zauYAxgjGLNzEvKr0hgzfj9+AB7wR+OiimXFzM3MM7m6GLk4hAS2Mwk
  cfnnWzYIZw+jxLEts5i7GDk52AQMJPafvcDexcjBISKgJ3H1nyhIWFjAUWLXnXNgJSwCqhJ/e
  5qYQGxeAW+JP2+XsoHYEgIKElMevmeGiAtKnJz5hAXEZhaQkDj44gUzyEgJAUWJ2dPlIcwqiS
  Mz1SYw8sxC0jALScMCRqZVjJZJRZnpGSW5iZk5uoYGBrqGhsa6xrqGliZ6iVW6iXqppbrJqXk
  lRYlAWb3E8mK94src5JwUvbzUkk2MwCBKKWQ+tIPxyesPeocYJTmYlER5D52ISRDiS8pPqcxI
  LM6ILyrNSS0+xCjDwaEkwfvaNjZBSLAoNT21Ii0zBxjQMGkJDh4lEd4fIGne4oLE3OLMdIjUK
  UZFKXHeQpCEAEgiozQPrg0WRZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNagUzhycwrgZ
  v+CmgxE9DijT8iQRaXJCKkpBqYrvyYJHZKIM7C7rY639PGuyYhp5fbveP0UrJ9n2BprRi1tP7
  wqf+st6+nerj8v5z8+Fu1SeS7s/sapdceq1CabvCE+6PM993XnNdkzNb5dfGW233xWw3ugXY3
  H77PWSZSpp25c9OSzKsnU7M1tyj8qrnitUHzb/Gh2XzPfs+Pv33Gc4v07n0z/N1WP7XZVs5sv
  3PLA8dT57imrzFYxLCPd1HU1E0rxFhKrhitvnU4v+m4Ql6Ch+v7v4ubm0U4yo2lVwvJmk8+fN
  v4sMD26Tvvxk2uyXhYdupr2tnSWV+ybi1/FculGMXA+PFv8DYFheDUttKEff9j54k7ROtuz+6
  fffKwc+5n9Z4D+0RmhpzybFJiKc5INNRiLipOBAB4SB0lHQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-232.messagelabs.com!1616723556!89663!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32132 invoked from network); 26 Mar 2021 01:52:37 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 01:52:37 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q1qauI004735
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 01:52:36 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 01:52:35 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] wpebackend-fdo: upgrade 1.8.0 -> 1.8.2
Date: Fri, 26 Mar 2021 18:24:17 +0800
Message-ID: <1616754257-67733-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.8.2.bb} (89%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.2.bb
similarity index 89%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.8.2.bb
index 344aa9717c..2ce631a73c 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.2.bb
@@ -13,7 +13,7 @@ inherit meson features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9652a99c75fe1c6eab0585b6395f4e104b2427e4d1f42969f1f77df29920d253"
+SRC_URI[sha256sum] = "98c291071128326a72918d670a46ef63268c43267928560ac3b84b6aebb2d78d"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.25.1

