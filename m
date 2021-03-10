Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.7660.1615376834232903379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.4.174] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 74/8B-38008-FB1B8406; Wed, 10 Mar 2021 11:47:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxVXf/Ro8
  Eg9sThSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owrLS8ZC17xVnx808PawHiBp4uRi0NIYAaT
  xO8n55ghnOOMEj0vtwA5nBxsApoSvVu2MHYxcnCICOhJXP0nChJmFlCXuLSuhQXEFhawlHj/f
  AVYOYuAqsTU5RfZQcp5BVwk1i6XBglLCChITHn4HqyEU8BVou/+FTBbCKjk7ZYVjCA2r4CgxM
  mZT1ggxktIHHzxghmiV1Fi9uVmFgi7UmLP5oesExj5ZyFpmYWkZQEj0ypGy6SizPSMktzEzBx
  dQwMDXUNDY11TXSMTQ73EKt0kvdRS3eTUvJKiRKCsXmJ5sV5xZW5yTopeXmrJJkZgOKYUsn7c
  wXjo9Qe9Q4ySHExKorx9BR4JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4A5cA5QSLUtNTK9Iyc
  4CxAZOW4OBREuF9txYozVtckJhbnJkOkTrFqCglzrtuPVBCACSRUZoH1waLx0uMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHkPgkzhycwrgZv+CmgxE9BiBQM3kMUliQgpqQYmc5s7F3YKTXC
  58Djt2bQ7/3MipV8w6sZfULrZW8DkVSZi8vF9QUj2mXf6mrePsCiY3LY3SlRli3ho+b6XrbK0
  sdCnOepnVswu/rPfX8Rc2/E04OCzaQxGW3KMvCc9kWTeXvJsLb/XtFTZxzlCRTNXXjX7HvfJt
  +zwZDn/S5Ec+4wT8tqtV9a7KrS/mq/cVB0opj5VyGn7Ae7QL4xXHoi/nfPvsFDMzA0pW8Ofxa
  woNpRSjozkmtB/NzDrUiVX8u3ZD2WkbSIPV606p8B417ci/mvS0oXFb46uDOTWLezaPFV3TZr
  csyNLjLsM5xw80rpK/r3yL0nGcHEp7vivzdMePVDYUNf+xVOs5ke7+BUlluKMREMt5qLiRAB9
  awUaQgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-28.tower-245.messagelabs.com!1615376830!1831050!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32734 invoked from network); 10 Mar 2021 11:47:11 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-28.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2021 11:47:11 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ABlAnP023482
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 11:47:10 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 11:47:08 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] jquery: upgrade 3.5.1 -> 3.6.0
Date: Wed, 10 Mar 2021 19:46:06 +0800
Message-ID: <1615376771-3093-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

License file updated

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../jquery/{jquery_3.5.1.bb => jquery_3.6.0.bb}           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/jquery/{jquery_3.5.1.bb => jquery_3.6.0.bb} (75%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.5.1.bb b/meta/recipes-devtools/jquery/jquery_3.6.0.bb
similarity index 75%
rename from meta/recipes-devtools/jquery/jquery_3.5.1.bb
rename to meta/recipes-devtools/jquery/jquery_3.6.0.bb
index cfc32952cd..65905966c1 100644
--- a/meta/recipes-devtools/jquery/jquery_3.5.1.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://jquery.com/"
 DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://${S}/${BP}.js;beginline=8;endline=10;md5=ebd7bc5d23ab165188e526a0c65d24bb"
+LIC_FILES_CHKSUM = "file://${S}/${BP}.js;beginline=8;endline=10;md5=9c7c6e9ab275fc1e0d99cb7180ecd14c"
 
 # unpack items to ${S} so the archiver can see them
 #
@@ -13,9 +13,9 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
     "
 
-SRC_URI[js.sha256sum] = "416a3b2c3bf16d64f6b5b6d0f7b079df2267614dd6847fc2f3271b4409233c37"
-SRC_URI[min.sha256sum] = "f7f6a5894f1d19ddad6fa392b2ece2c5e578cbf7da4ea805b6885eb6985b6e3d"
-SRC_URI[map.sha256sum] = "511d6f6d3e7acec78cd2505f04282b6e01329b4c24931f39d91739d0d1ddeef8"
+SRC_URI[js.sha256sum] = "1fe2bb5390a75e5d61e72c107cab528fc3c29a837d69aab7d200e1dbb5dcd239"
+SRC_URI[min.sha256sum] = "ff1523fb7389539c84c65aba19260648793bb4f5e29329d2ee8804bc37a3fe6e"
+SRC_URI[map.sha256sum] = "399548fb0e7b146c12f5ba18099a47d594a970fee96212eee0ab4852f3e56782"
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
-- 
2.25.1

