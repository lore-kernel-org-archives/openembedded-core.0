Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web09.4515.1616038499984191147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 20:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id DA/BF-41911-16AC2506; Thu, 18 Mar 2021 03:34:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxRTfxVFC
  Cwe1frBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b3a6EFazgqluw+xdrAeIu9i5GLQ0hgM5PE
  i2ffmCCcE4wSVxtmAzmcHGwCmhK9W7YwdjFycIgI6Elc/ScKEmYWUJe4tK6FBcQWFvCTODDvG
  Vg5i4CqRMfP++wgNq+Aq8Smg1vA4hICChJTHr5nhogLSpyc+YQFYo6ExMEXL5ghahQlZl9uZo
  GwqyTWdExjm8DIOwtJyywkLQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGusa6poa6iVW6SbqpZb
  qJqfmlRQlAiX1EsuL9Yorc5NzUvTyUks2MQKDK6WQ0XgH48HXH/QOMUpyMCmJ8oquD0oQ4kvK
  T6nMSCzOiC8qzUktPsQow8GhJMGbcwIoJ1iUmp5akZaZAwx0mLQEB4+SCO/LI0Bp3uKCxNziz
  HSI1CnGcI43a5csYuZ4Cybb7t0Fku1gcuaCg6uZOWaByfvth4DkAxApxJKXn5cqJc7rDLJNAG
  RcRmke3DJYJF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMx7FGQKT2ZeCdxNr4DOZQI6N4I
  f7NySRISUVAPT5Fu3k3c1bKsr3LiivOxg+g2/G+ZOQfE/+0LbAuSaMuI/9jGv1WLiEN514tpV
  72VZJw4LpWm1nIuZr7wtJfPbkWjXp/qy+y6emvqgJaepe97ulQ93zW0ye3ja0k5qUXj2mhnyk
  w5nTX/rv4NVTe+WxtuQ3TvuluzjutboGrzSLEyvYlryBqmrDVZvyg1L0jJXSnz20n8t8Vm9s/
  etnNGpnyduTsp+rHi08fT6nrLDE7mNajd/ZJ144KuVyss7NhOXNa44x77w3gPp/H9bY5gjWAU
  mvNa8n3HM0uTZX4HOxOoVkSKvsx7uePO8uHjNho3M23Z85H/Mf/axlDFjyNeHxUt3Hny6xmpj
  eJz4j7z0JiWW4oxEQy3mouJEALV4fSxfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-228.messagelabs.com!1616038496!70776!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9938 invoked from network); 18 Mar 2021 03:34:57 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 03:34:57 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12I3Yo01006298
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 03:34:56 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 03:34:49 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 1/3] vulkan-headers: upgrade 1.2.162.0 -> 1.2.170.0
Date: Thu, 18 Mar 2021 11:34:38 +0800
Message-ID: <1616038480-24925-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
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

