Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980D7C61D9D
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:03:56 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.15286.1700643832065700228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="140729592"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="140729592"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:03:49 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FA3CD9DA9
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:03:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 43793D2941
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:03:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 578AD2005932A;
	Wed, 22 Nov 2023 18:03:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxml2: upgrade 2.11.5 -> 2.12.0
Date: Wed, 22 Nov 2023 17:03:11 +0800
Message-Id: <1700643791-9633-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.006
X-TMASE-Result: 10--7.227900-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/ycZLM5/LTRf/MVVFhl7NwvMPdZmyx8xAa/tN
	2vjEPERN9cJ2OcKCqGk0FJKIRy8cWl9mXRLO6ZMY/HTKStsDGMJyGvikEsYi8N9RlPzeVuQQ1vZ
	7s3YIVDKhOywUZIftbeaffHI8kAmibu8QqMQjwvKVUcz8XpiS9HoCBx19i+GM33Nl3elSfsrzjO
	AlzYlSVV6Jm2QDDX2O+UXIp67YGnL2U2nhCdB5EDsKXyzHgcEbxMZq+YajS9ZM+b8yxBqvA3Y+o
	FbrqO/Js5htgY/WMd6vr1Xc6yEe87xNGXfew0dm3QqJN4m15UFOdKnCeVjjIZsoi2XrUn/JQYMO
	RuDWAmTfaY87m2dqx9934/rDAK3zhG2qikEpQGVDIbuQbye3w1M1qxuBtJDN5ofP2NRAMI4OuKk
	Odjq6lSUICpJcfmab
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191033

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 hash: Rewrite hash table code

install-tests.patch
refreshed for new version.

Changelog:
 https://github.com/GNOME/libxml2/blob/master/NEWS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/libxml/libxml2/install-tests.patch     | 8 ++++----
 .../libxml/{libxml2_2.11.5.bb => libxml2_2.12.0.bb}      | 9 +++++----
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.5.bb => libxml2_2.12.0.bb} (92%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 14ccce5873..ef46af9ba8 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
+From ad68c053d3c9926e43125058d33b5a7028159b44 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -13,11 +13,11 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 5bc4018..57d27af 100644
+index 0a49d37..1097c63 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,6 +26,16 @@ check_PROGRAMS = \
- 	testlimits \
+@@ -27,6 +27,16 @@ check_PROGRAMS = \
+ 	testparser \
  	testrecurse
  
 +ptestdir=$(libexecdir)
diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-core/libxml/libxml2_2.12.0.bb
similarity index 92%
rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
rename to meta/recipes-core/libxml/libxml2_2.12.0.bb
index 319833f053..58b4c14301 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.0.bb
@@ -4,10 +4,11 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/libxml2"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
-                    file://hash.c;beginline=6;endline=15;md5=e77f77b12cb69e203d8b4090a0eee879 \
+LIC_FILES_CHKSUM = "file://Copyright;md5=fec7ecfe714722b2bb0aaff7d200c701 \
+                    file://hash.c;beginline=6;endline=15;md5=9af9349d0ead24569dc332f2116ef5f8 \
                     file://list.c;beginline=4;endline=13;md5=b9c25b021ccaf287e50060602d20f3a7 \
-                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f"
+                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f \
+                    "
 
 DEPENDS = "zlib virtual/libiconv"
 
@@ -19,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
+SRC_URI[archive.sha256sum] = "431521c8e19ca396af4fa97743b5a6bfcccddbba90e16426a15e5374cd64fe0d"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


