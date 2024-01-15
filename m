Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2CDC47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 08:57:14 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.73299.1705309028294266166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 00:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="125558404"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="125558404"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 17:57:05 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0627CD4F5B
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:57:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 41583D39ED
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:57:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B9B3E6895D
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:57:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 526541A0070;
	Mon, 15 Jan 2024 16:57:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.18.20 -> 9.18.21
Date: Mon, 15 Jan 2024 16:56:44 +0800
Message-Id: <1705309004-23744-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-4.191600-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yTo39wOA02LhpxAd6mi1Ga3Jt7aD46KTu3Qi
	GZe0jWAMp3HiycuTwqDAoSDw5ih5U2/ksrbkVPtMHWRJEfGP5nk5py1dA2ffkiQ96G4yJarjZ3w
	1DDzZ4J8ZPH31Qe1dM4bEyZn9ItmZl8quHiKVRoewVIp8Y8imtSqz6w5v8PFzppiSooS1QHiI02
	r3gvMQPyqq0O5S3DJ8ivFp0d/OglZtF6/n498MP/LeH1FBnhK0wTlc9CcHMZe+kux37vSFMc79P
	lJmAmXDh6d/+mMHstOjrLRBxwnZS4+eiI05y0fpKiJEqUFWRggbVzFi+tzvL7wA/wTt0MUKlIOV
	A+gJRdKxfbhqGxLk+4Ay6p60ZV62fJ5/bZ6npdjGVuWouVipcv+LYGYT+Nj7CutnKKmcZTlUreG
	ZECKB4VhiVZ2b8ELrQEzPkIxeQGZYql3HMeDnZDY6t5uUMVFc9k3oSBmQmfnhWZon9NDSMv6/2/
	nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 08:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193639

From: Wang Mingyu <wangmy@fujitsu.com>

bind-ensure-searching-for-json-headers-searches-sysr.patch
refreshed for 9.18.21

Changelog:
==========
-Improve LRU cleaning behaviour.
-The "resolver-nonbackoff-tries" and "resolver-retry-interval" options are
 deprecated; a warning will be logged if they are used.
-BIND might sometimes crash after startup or re-configuration when one 'tls'
 entry is used multiple times to connect to remote servers due to initialisation
 attempts from contexts of multiple threads. That has been fixed.
-Dig +yaml will now report "no servers could be reached" also for UDP setup
 failure when no other servers or tries are left.
-Recognize escapes when reading the public key from file.
-Dig +yaml will now report "no servers could be reached" on TCP connection
 failure as well as for UDP timeouts.
-Deprecate AES-based DNS cookies.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 6 +++---
 .../bind/{bind_9.18.20.bb => bind_9.18.21.bb}               | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.20.bb => bind_9.18.21.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index f1abd179e8..38d07cae39 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 246087f89e9434b726c7884e4c0964f71084f091 Mon Sep 17 00:00:00 2001
+From 5ae30329f168c1e8d2e0c3831988a4f3e9096e39 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -33,10 +33,10 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 10e8bf6..bf20690 100644
+index 2ab8ddd..92fe983 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -814,7 +814,7 @@ AS_CASE([$with_lmdb],
+@@ -761,7 +761,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind_9.18.20.bb b/meta/recipes-connectivity/bind/bind_9.18.21.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.20.bb
rename to meta/recipes-connectivity/bind/bind_9.18.21.bb
index 187685eef5..f5fb4bd1e5 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.20.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.21.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "4b891ebf58d3f2a7ac3dd2682990f528a3448eaa1c992ddc5c141b8587a98ec5"
+SRC_URI[sha256sum] = "a556be22505d9ea4f9c6717aee9c549739c68498aff3ca69035787ecc648fec5"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


