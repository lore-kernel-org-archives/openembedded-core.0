Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740C8C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:34:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.8721.1702978477403716293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="131553857"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="131553857"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:34:34 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D669D9DA6
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:34:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C02DFD2989
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:34:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FF61202C2A05
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:34:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F28711A006F;
	Tue, 19 Dec 2023 17:34:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxml2: upgrade 2.11.5 -> 2.12.3
Date: Tue, 19 Dec 2023 17:34:24 +0800
Message-Id: <1702978464-7753-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--3.810900-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv4V3z98vLukXfL
	uRKrFFnfJ2spf+DCeJxrI5aCKllhbuW5YZxMb7aKxkszn8tNF/83l2plwgrtWJVnfeErUBVy2d8
	mtRIRsUOPHlfcV0jhQOaffHI8kAmibu8QqMQjwvKVUcz8XpiS9ARryDXHx6oX4mT47a5JLf1i4H
	yyL6eYhF6Jm2QDDX2O+UXIp67YGnL2U2nhCdB5EDsKXyzHgcEbxMZq+YajS9ZM+b8yxBqvA3Y+o
	FbrqO/Js5htgY/WMd6vr1Xc6yEe87xNGXfew0dm3QqJN4m15UFOdKnCeVjjIZsoi2XrUn/JQYMO
	RuDWAmTfaY87m2dqx9934/rDAK3zlGdyD+QE2h81R1nTKNmytq0bYfj7GWyNbOloZaNEJsZ5yce
	2ZAqV1ojlQm58EfVk5Qw2MpJTk4cFU3TYM1s9QA0w0Q7RoJc42x9p4aJZ0aT+v9v52ZIoWjoAf3
	89xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192703

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- parser: Fix namespaces redefined from default attributes
- include: Rename XML_EMPTY helper macro
- include: Move declaration of xmlInitGlobals
- include: Add missing includes
- include: Move globals from xmlsave.h to parser.h
- include: Readd circular dependency between tree.h and parser.h

install-tests.patch
refreshed for 2.12.3

License-Update:
 hash: Rewrite hash table code

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/libxml/libxml2/install-tests.patch     | 8 ++++----
 .../libxml/{libxml2_2.11.5.bb => libxml2_2.12.3.bb}      | 9 +++++----
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.5.bb => libxml2_2.12.3.bb} (92%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 14ccce5873..62988f6bfe 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
+From 16b46f8ef89aeebe8eb110ab8ef8e69e3a23c145 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-core/libxml/libxml2_2.12.3.bb
similarity index 92%
rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
rename to meta/recipes-core/libxml/libxml2_2.12.3.bb
index 319833f053..8f37a39fe2 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.3.bb
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
+SRC_URI[archive.sha256sum] = "8c8f1092340a89ff32bc44ad5c9693aff9bc8a7a3e161bb239666e5d15ac9aaa"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


