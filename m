Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B628DC54E58
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:52 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8422.1709105612417738887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t2up/SFK;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105624; x=1740641624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4m00iXlaB/tjW+Yx/3esW9aK149xhYugkPkB4CPHbB4=;
  b=t2up/SFKt1pN2NNGcLZxAm4y4q8Ak4qLN7UC982YKDazYYIHk+SUHMik
   /3sEa9B1oE+62RnoapxCN+W4xNf60KA/q9R3ySFfMjmo21ljBFijf41zm
   s9YAwQcqiku8EQqdZPzXVxS45vB7NM1jW37yH+cljGd56lBFUMu7jRavN
   BsNw+yx4ML/m4w76si8iiE1XIX/LIMPGLXGCdOIOjwuRdNk5GSfDsKTpR
   ICIEw09ah6YZj67xPcTFM12l5p4FiV7kuhemV9ReqY0HULwngocP4nquK
   2ZbZSITCxtH8FP23Ej5/xIh8AhRxoTYMv/1lj5KRHj+EMGoXU9PMF0hWa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150123439"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150123439"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:42 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DFEFD4800
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BBFA9EE64
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F423F2008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A40881A006C;
	Wed, 28 Feb 2024 15:33:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 43/48] python3-urllib3: upgrade 2.1.0 -> 2.2.1
Date: Wed, 28 Feb 2024 15:32:50 +0800
Message-Id: <1709105575-24259-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--8.124000-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgli8Y5a0svL3tZ
	D2MAopNOVcZWhEsLLF2Y5F3zNVn2CLejROPl/CmSelImMnAkWV46rt3TPmIRUVm3w6Cmg+wN+X6
	E2VSgfe91/olXa0HGkKpbh9TgiUTjTmCo2fV29TUK3Ma88LL+bgpbrx4idn+FZeINMWk70bv+fL
	DfcUPmVM42WrNTk3xNVY3RJymdL1bEQS2ecfkpFz9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frlurwUHN2woBLB6mL4lViyFyngcxJAgqZ0Zb056mCmF00ZV4BnlVId1nZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNSEDSoeKo+QxXynjog1idJ7w7iIsBrRLwtPPqsLmLncdN54gHbBN/ws=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196367

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed issue where "InsecureRequestWarning" was emitted for HTTPS connections
 when using Emscripten.
-Fixed "HTTPConnectionPool.urlopen" to stop automatically casting non-proxy
 headers to "HTTPHeaderDict".
-Changed "InvalidChunkLength" to "ProtocolError" when response terminates
 before the chunk length is sent.
-Changed "ProtocolError" to be more verbose on incomplete reads with excess
 content.
-Added support for 'Emscripten and Pyodide
-Added support for "HTTPResponse.read1()" method.
-Added rudimentary support for HTTP/2.
-Fixed issue where requests against urls with trailing dots were failing due to
 SSL errors when using proxy.
-Fixed "HTTPConnection.proxy_is_verified" and
 "HTTPSConnection.proxy_is_verified" to be always set to a boolean after
 connecting to a proxy. It could be "None" in some cases previously.
-Fixed an issue where "headers" passed in a request with "json=" would be
 mutated
-Fixed "HTTPSConnection.is_verified" to be set to "False" when connecting
 from a HTTPS proxy to an HTTP target. It was set to "True" previously.
-Fixed handling of new error message from OpenSSL 3.2.0 when configuring an
 HTTP proxy as HTTPS
-Fixed TLS 1.3 post-handshake auth when the server certificate validation is
 disabled
-Note for downstream distributors: To run integration tests, you now need to run
 the tests a second time with the "--integration" pytest flag.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-urllib3_2.1.0.bb => python3-urllib3_2.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.1.0.bb => python3-urllib3_2.2.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.2.1.bb
index ad6dc6d405..fc1828b4ee 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "df7aa8afb0148fa78488e7899b2c59b5f4ffcfa82e6c54ccb9dd37c1d7b52d54"
+SRC_URI[sha256sum] = "d0570876c61ab9e520d776c38acbbb5b05a776d3f9ff98a5c8fd5162a444cf19"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


