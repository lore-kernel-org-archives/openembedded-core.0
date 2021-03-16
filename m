Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.6285.1615889473052716306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 03:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 55/EB-53635-F3480506; Tue, 16 Mar 2021 10:11:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8MxRdeuJSD
  B4HabucWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvH9WmjBGo6KJbtPsTYw3mLvYuTiEBKYwSRx
  5mUfE4RznFHiwMkOIIeTg01AU6J3yxbGLkYODhEBPYmr/0RBwswC6hKX1rWwgISFBTwlbk/nA
  wmzCKhK7OnbwAJi8wq4Smz+dpYZxJYQUJCY8vA9mM0p4CaxfP5FMFsIqGbOvE3sEPWCEidnPm
  GBGC8hcfDFC6heRYnZl5tZIOxKiT2bH7JOYOSfhaRlFpKWBYxMqxgtkooy0zNKchMzc3QNDQx
  0DQ2NdA0tTXWNDE31Eqt0E/VSS3XLU4tLdA31EsuL9Yorc5NzUvTyUks2MQJDMaXg8PUdjLde
  f9A7xCjJwaQkyvu3PCBBiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvZBNQTrAoNT21Ii0zBxgXM
  GkJDh4lEd76ZqA0b3FBYm5xZjpE6hRjOMebtUsWMXO8BZNt9+4CyXYwOXPBwdXMHLPA5P32Q0
  DyAYgUYsnLz0uVEuedArJNAGRcRmke3DJY3F9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMz
  bBjKFJzOvBO6mV0DnMgGdayjtB3JuSSJCSqqBqfbRhlzn/o/3EuIqbGy26kaVlfzwzdtn2VOn
  EC/ls6p/PvfL+oMu/1jr9KdlX1nFUvZD1DTCKOdM2NSjmv7Lamxao46+45RMiPJ89+PXJfNMB
  0OJOcKC1xVt5zTs43q8aZ3h7gcrDjD5lx198OLcnoMO++7zvdq0WEM3Lm7jilVRfWlBDKl/XN
  L9L77ZdClkwtcr3+7rt9R2aNZfuOD52TxDiLHb++D299czX+34d+vt2e8ayqZfOE7/jN20bV5
  Fqt3Raybn7v1h8VBpbWiTaxZvuX42cUvqo51FSWZVi0yy+XTXxxXtUxPLOLtjc1mDfdwljXmz
  5178zWE7a23xW+uAngkCE2O853DqOdXNUGIpzkg01GIuKk4EAGUuXb92AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-271.messagelabs.com!1615889470!1938024!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17449 invoked from network); 16 Mar 2021 10:11:10 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2021 10:11:10 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12GAArCt001285
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 10:11:10 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 10:10:55 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] vulkan-headers: upgrade 1.2.162.0 -> 1.2.170.0
Date: Tue, 16 Mar 2021 18:10:39 +0800
Message-ID: <1615889439-19781-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615889439-19781-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1615889439-19781-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...{vulkan-headers_1.2.162.0.bb => vulkan-headers_1.2.170.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.162.0.bb => vulkan-headers_1.2.170.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
index 19ae67cdd4..4c9c94f3d2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
-SRCREV = "87aaa16d4c8e1ac70f8f04acdcd46eed4bd77209"
+SRCREV = "1d99b835ec3cd5a7fb2f2a2dd9a615ee2d1f0101"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

