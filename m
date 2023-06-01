Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78267C77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.26242.1685610238931541748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119096881"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119096881"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:03:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 67FC6E4289
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:54 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 97B39D5040
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id D4C4F88874;
	Thu,  1 Jun 2023 18:03:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libmicrohttpd: upgrade 0.9.76 -> 0.9.77
Date: Thu,  1 Jun 2023 17:03:13 +0800
Message-Id: <1685610221-29015-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--11.075300-10.000000
X-TMASE-MatchedRID: yX2NuvXOYO2jz0nOeth/yUIIxwDaU5mrKQNhMboqZlrdtCoZAk3E1IO3
	HyUMPRbHZ0qnn2rNwNMt0F81W+G9P/5d7yxEuu/eqTb2sWzCG34xVUWGXs3C83GgXwB+oeRb3LF
	uyqUR8Gwk17/IvnxdZ0mByCbTUoQoOpQG32I6W5MCg1rav4R3DRtuGFXrmRpjLaKzyzWK8GR7WQ
	9jAKKTTnlPG0OYZaCM/GYFHuvsehw23LDAh/mSxfCnSDfauCxf1jd10P+8LE9JTujT4hzPq768E
	aeLk+NuV5cVCzS3+XA1l40zLtvt96k5+6tQ+lSgxDiakrJ+SpmM4p7EnPqPPSt+gViu+UDkCVoX
	M3huKKtup0egwNBwNaHMlwKPxNb+AM0/G7XUdeM/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR6
	8O365bqSdDmDK09MpXf3Mql3z/S5tncNI+1Yma54CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gKq
	42LRYko2c2DNeQxY32jv1AsaVuEzJY7a82p5QM2DhDn5PxEYp+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182063

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 API changes:
-------------
 + Added new function MHD_get_version_bin().

 Improvements and enhancements:
-------------------------------
 * Digest Auth: changed algorithm identifiers in server generated
   headers from "md5" / "sha-256" to "MD5" / "SHA-256" to better match
   RFC (while clients should use caseless matching).
 * Improved Base64 decoding by new implementation with robust input
   data validation checks.
 * Improved configure for cross-compiling, for better compatibility
   with POSIX and for better compatibility with the latest compiler
   versions.
 * New internal tests: for Base64 decoding, Basic Auth and folded
   headers.
 * Supported new libcurl API in tests to mute deprecation warnings.
 * Supported ARM and ARM64 for VC compilers.

 Functionality changes:
------------------------
 * any negative number returned by response data generation callback
   function is treated as an error. Previously negative values except
   predefined error codes could produce undefined behaviour.
 * Added handling of "DEBUG" preprocessor macro as an alias of "_DEBUG".

 Fixes:
---------
 # Fixed functionality with blocking sockets.
 # Fixed very inefficient data pumping for upgraded TLS connections.
 # Fixed processing of folded headers in the requests.
 # Fixed data races when closing upgraded connection.
 # Removed duplication of "Connection: upgrade" header.
 # Digest auth: fixed thread sync to avoid "stale hash" results.
 # Fixed harmless unwanted extra data processing resulting in triggering
   of the assert.
 # Fixed tests for LTO.
 # Removed removed non-portable functions in examples.
 # Fixed delayed call of connection notification callback in
   thread-per-connection mode.
 # Fixed Address Sanitizer unpoison of memory when memory pool is
   destroyed. This fixed periodic ASAN error when used for a long time
   with the sanitizer.
 # Fixed compiler warnings in library code, examples, tests and configure
   checks.
 # New TLS certificates for test-suite: all with SAN fields and SHA-256
   hash.
 # Tests: fixed tests on Darwin 22.x (Ventura).
 # Tests: redesigned one tests group to avoid stress-testing of the OS.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmicrohttpd_0.9.76.bb => libmicrohttpd_0.9.77.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.76.bb => libmicrohttpd_0.9.77.bb} (90%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb
similarity index 90%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb
index 9dff970663..792ac24726 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f0b1547b5a42a6c0f724e8e1c1cb5ce9c4c35fb495e7d780b9930d35011ceb4c"
+SRC_URI[sha256sum] = "9e7023a151120060d2806a6ea4c13ca9933ece4eacfc5c9464d20edddb76b0a0"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.34.1


