Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 55BBD71C9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 12:57:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 13 Jan 2017 04:57:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1093650390"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2017 04:57:06 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 41B3D6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 04:56:11 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 14:57:10 +0200
Message-Id: <1484312231-28167-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1484312231-28167-1-git-send-email-maxin.john@intel.com>
References: <1484312231-28167-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/4] netbase: upgrade to version 5.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jan 2017 12:57:07 -0000

5.3 -> 5.4

Refreshed the following patch:
 a) netbase-add-rpcbind-as-an-alias-to-sunrpc.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...netbase-add-rpcbind-as-an-alias-to-sunrpc.patch | 24 +++++++++++++---------
 .../netbase/{netbase_5.3.bb => netbase_5.4.bb}     |  6 +++---
 2 files changed, 17 insertions(+), 13 deletions(-)
 rename meta/recipes-core/netbase/{netbase_5.3.bb => netbase_5.4.bb} (76%)

diff --git a/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch b/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
index 35ce21e..56c8d5b 100644
--- a/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
+++ b/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
@@ -1,4 +1,7 @@
-netbase: add rpcbind as an alias to sunrpc
+From 76989205a1411f16d7ab09ff9d279539a73dc259 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Thu, 12 Jan 2017 16:50:58 +0200
+Subject: [PATCH] netbase: add rpcbind as an alias to sunrpc
 
 the patch comes from:
 https://bugs.archlinux.org/task/20273
@@ -6,9 +9,10 @@ https://bugs.archlinux.org/task/20273
 Upstream-Status: Pending
 
 Signed-off-by: Li Wang <li.wang@windriver.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- etc-rpc      |    2 +-
- etc-services |    4 ++--
+ etc-rpc      | 2 +-
+ etc-services | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/etc-rpc b/etc-rpc
@@ -25,20 +29,20 @@ index 1b30625..9a9a81a 100644
  rusersd		100002	rusers
  nfs		100003	nfsprog
 diff --git a/etc-services b/etc-services
-index 9d64a52..a19f7c8 100644
+index e3202ec..a039d7e 100644
 --- a/etc-services
 +++ b/etc-services
-@@ -72,8 +72,8 @@ pop2		109/tcp		postoffice pop-2 # POP version 2
- pop2		109/udp		pop-2
+@@ -64,8 +64,8 @@ csnet-ns	105/udp		cso-ns
+ rtelnet		107/tcp				# Remote Telnet
+ rtelnet		107/udp
  pop3		110/tcp		pop-3		# POP version 3
- pop3		110/udp		pop-3
 -sunrpc		111/tcp		portmapper	# RPC 4.0 portmapper
 -sunrpc		111/udp		portmapper
-+sunrpc		111/tcp		portmapper rpcbind	# RPC 4.0 portmapper
++sunrpc		111/tcp		portmapper rpcbind # RPC 4.0 portmapper
 +sunrpc		111/udp		portmapper rpcbind
  auth		113/tcp		authentication tap ident
  sftp		115/tcp
- uucp-path	117/tcp
+ nntp		119/tcp		readnews untp	# USENET News Transfer Protocol
 -- 
-1.7.9.5
+2.4.0
 
diff --git a/meta/recipes-core/netbase/netbase_5.3.bb b/meta/recipes-core/netbase/netbase_5.4.bb
similarity index 76%
rename from meta/recipes-core/netbase/netbase_5.3.bb
rename to meta/recipes-core/netbase/netbase_5.4.bb
index 543596a..5ab0c58 100644
--- a/meta/recipes-core/netbase/netbase_5.3.bb
+++ b/meta/recipes-core/netbase/netbase_5.4.bb
@@ -6,12 +6,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/n/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20170112T093812Z/pool/main/n/${BPN}/${BPN}_${PV}.tar.xz \
            file://netbase-add-rpcbind-as-an-alias-to-sunrpc.patch \
            file://hosts"
 
-SRC_URI[md5sum] = "2637a27fd3de02a278d2b5be7e6558c1"
-SRC_URI[sha256sum] = "81f6c69795044d62b8ad959cf9daf049d0545fd466c52860ad3f933b1e97b88b"
+SRC_URI[md5sum] = "117cb70c55ef3c1c002f127812b114c1"
+SRC_URI[sha256sum] = "66ff73d2d162e2d49db43988d8b8cd328cf7fffca042db73397f14c71825e80d"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
-- 
2.4.0


