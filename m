Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.1407.1615433326768814159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 19:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id B2/04-60958-C6E89406; Thu, 11 Mar 2021 03:28:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRqpvd55l
  gcHWjpsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFw+xuWgr18FeuXP2RpYJzB28XIxSEkMINJ
  4vHZQ6wQznFGiV8LpgA5nBxsApoSvVu2MHYxcnCICOhJXP0nChJmFlCXuLSuhQUkLCxgI7HvJ
  jdImEVAVaLp0wSwTl4BF4mWB4uYQGwJAQWJKQ/fM0PEBSVOznzCAjFGQuLgixfMEDWKErMvN7
  NA2JUSezY/ZJ3AyDsLScssJC0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGlpa6BoaG+glVuk
  m6aWW6panFpfoGuollhfrFVfmJuek6OWllmxiBAZXSsGxph2MJ19/0DvEKMnBpCTK21fgkSDE
  l5SfUpmRWJwRX1Sak1p8iFGGg0NJgvd2i2eCkGBRanpqRVpmDjDQYdISHDxKIrwKjUBp3uKCx
  NzizHSI1ClGRSlx3qU9QAkBkERGaR5cGyy6LjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5t
  3cCzSFJzOvBG76K6DFTCCLDdxAFpckIqSkGpgyTs83+ev5gVlB98Fa3Y0bdvwLsVm21UGKo17
  m5ufN1kpTp9kFTVB6F1+7wWXOxhrFa8oqmafunj2YamLRdrBE87l3y434aZ38Der7A3d/engw
  dNb7II++Kr/v59o6WF9/7HC21HeMNT1xYFebq+vVxM+9Vi9zFz5XEszYccegvUcrvVPqR/iul
  YnrqtWfyF+rfpKtsamqaVu9GKdI78aXnUnKKfeXR750YHZzTLt79sZBCzNlnSBjr+qtdR82zB
  T9euucvu7WX0ErBJUkdrOWnenjDWLkOaboMLlmX8UiF49z7F99f3F2fjDaJ/9pwRmhx5e6rN2
  Pt5a6nMkO+OojzXfXVMn1yN7H/u+lrJVYijMSDbWYi4oTAeJVL+spAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-285.messagelabs.com!1615433323!536470!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15842 invoked from network); 11 Mar 2021 03:28:43 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-3.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Mar 2021 03:28:43 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12B3SbAT027653
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 03:28:43 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 11 Mar 2021 03:28:35 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v2] jquery: upgrade 3.5.1 -> 3.6.0
Date: Thu, 11 Mar 2021 11:28:25 +0800
Message-ID: <1615433305-5081-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

License file updated:
Copyright changed from "JS Foundation" to "OpenJS Foundation"
Source code changed

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

