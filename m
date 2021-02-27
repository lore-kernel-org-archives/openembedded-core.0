Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web11.628.1614401335023306154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 20:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 7E/65-38244-A2FC9306; Sat, 27 Feb 2021 04:48:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRWlGSWpSXmKPExsViZ8MRqqt53jL
  B4Ps/a4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPNlwlsBYc4K+6vaWBtYDzP0cXIxSEkMINJ
  4tvDrWwQznFGiXeT57J0MXJysAloSvRu2cLYxcjBISKgJ3H1nyhImFlAXeLSuhawEmEBG4l/v
  yYygtgsAqoSZ6bdYQexeQVcJQ79Xc8EYksIKEhMefieGcTmFHCTWH9hAli9EFBN9+ldjBD1gh
  InZz5hgZgvIXHwxQtmiF5FidmXm1kg7EqJPZsfsk5g5J+FpGUWkpYFjEyrGC2TijLTM0pyEzN
  zdA0NDHQNDY11jXUNLU30Eqt0E/VSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgQGZUsh8
  aAfjk9cf9A4xSnIwKYnyOjZbJgjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4J13FignWJSanlqRl
  pkDjA6YtAQHj5II7/JTQGne4oLE3OLMdIjUKcZYjjdrlyxi5ngLJtvu3QWS7WBy1YHpq5g5Zi
  44uJqZYxaYvN9+CEg+AJFCLHn5ealS4rzRIDsFQIZmlObBrYQlgkuMslLCvIwMDAxCPAWpRbm
  ZJajyrxjFORiVhHl9QKbwZOaVwF32CuhoJqCjr8SYgRxdkoiQkmpgUhXbYbcldm6Wg91yGwXj
  pl37Dlj+Uq8rXP736c8y2YvFCc6ps/u513O8ELr9juGtuMHbydz90d5n2FrPeD+6Wle/0bQ88
  d3jgNjoz+2HJzR6avqWzBcUZLXTPTTT3SbS94eThvTSkp/9s45J8H07eOPlNcMtNq2M+zckRd
  4+a/xT/G397FMXlVou2Lptn+th6/Gtp1PHwUq5sGbdjvtNadVKxY/UwiT2bkhYvvD82mTPYj2
  5sCVrHcOYPdrV/xkW/9FwWvw3zLiJQ/FPQMKkQ3Jd36yWL809z8YrdsSDR/GX5zsOLvuek363
  9/YuWu6s8N4iPuUpc0dYS0/O+wXNv5gZZ1kVRR3W5dA2YFZiKc5INNRiLipOBAAyUVM1fwMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-232.messagelabs.com!1614401321!693046!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6081 invoked from network); 27 Feb 2021 04:48:41 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-13.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2021 04:48:41 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11R4mfnN008011
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 04:48:41 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 27 Feb 2021 04:48:39 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] glslang: upgrade 11.1.0 -> 11.2.0
Date: Sat, 27 Feb 2021 12:48:15 +0800
Message-ID: <1614401296-27095-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1614401296-27095-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1614401296-27095-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../glslang/{glslang_11.1.0.bb => glslang_11.2.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_11.1.0.bb => glslang_11.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/glslang/glslang_11.1.0.bb b/meta/recipes-graphics/glslang/glslang_11.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_11.1.0.bb
rename to meta/recipes-graphics/glslang/glslang_11.2.0.bb
index 53d90c9165..902f7345f5 100644
--- a/meta/recipes-graphics/glslang/glslang_11.1.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.2.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
-SRCREV = "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
+SRCREV = "5421877c380d5f92c1965c7a94620dac861297dd"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
            file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
-- 
2.25.1

