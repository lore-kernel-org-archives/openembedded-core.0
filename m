Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4757DD6A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 08:50:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; d="scan'208";a="79574613"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 16:50:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 58F554CE1C93
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 16:42:24 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 4 Dec 2019 16:50:53 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Dec 2019 07:09:40 -0800
Message-ID: <1575472180-11923-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 58F554CE1C93.A98FF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] netbase: 5.6 -> 5.7
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
X-List-Received-Date: Wed, 04 Dec 2019 08:50:56 -0000
Content-Type: text/plain

netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
Removed since it is included in 5.7

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...netbase-add-rpcbind-as-an-alias-to-sunrpc.patch | 46 ----------------------
 .../netbase/{netbase_5.6.bb => netbase_5.7.bb}     |  7 ++--
 2 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
 rename meta/recipes-core/netbase/{netbase_5.6.bb => netbase_5.7.bb} (69%)

diff --git a/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch b/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
deleted file mode 100644
index 27ba2f6..0000000
--- a/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 52d46c4d1fbd4c88d69c2fcf7837b2f2ba7ef6f2 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Thu, 12 Jan 2017 16:50:58 +0200
-Subject: [PATCH] netbase: add rpcbind as an alias to sunrpc
-
-the patch comes from:
-https://bugs.archlinux.org/task/20273
-
-Upstream-Status: Pending
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-
----
- etc-rpc      | 2 +-
- etc-services | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/etc-rpc b/etc-rpc
-index 1b30625..9a9a81a 100644
---- a/etc-rpc
-+++ b/etc-rpc
-@@ -1,7 +1,7 @@
- # This file contains user readable names that can be used in place of rpc
- # program numbers.
- 
--portmapper	100000	portmap sunrpc
-+portmapper	100000	portmap sunrpc rpcbind
- rstatd		100001	rstat rstat_svc rup perfmeter
- rusersd		100002	rusers
- nfs		100003	nfsprog
-diff --git a/etc-services b/etc-services
-index fa7ae24..10ba2bc 100644
---- a/etc-services
-+++ b/etc-services
-@@ -51,8 +51,8 @@ kerberos	88/udp		kerberos5 krb5 kerberos-sec	# Kerberos v5
- iso-tsap	102/tcp		tsap		# part of ISODE
- acr-nema	104/tcp		dicom		# Digital Imag. & Comm. 300
- pop3		110/tcp		pop-3		# POP version 3
--sunrpc		111/tcp		portmapper	# RPC 4.0 portmapper
--sunrpc		111/udp		portmapper
-+sunrpc		111/tcp		portmapper rpcbind # RPC 4.0 portmapper
-+sunrpc		111/udp		portmapper rpcbind
- auth		113/tcp		authentication tap ident
- sftp		115/tcp
- nntp		119/tcp		readnews untp	# USENET News Transfer Protocol
diff --git a/meta/recipes-core/netbase/netbase_5.6.bb b/meta/recipes-core/netbase/netbase_5.7.bb
similarity index 69%
rename from meta/recipes-core/netbase/netbase_5.6.bb
rename to meta/recipes-core/netbase/netbase_5.7.bb
index 2aa4971..754c244 100644
--- a/meta/recipes-core/netbase/netbase_5.6.bb
+++ b/meta/recipes-core/netbase/netbase_5.7.bb
@@ -6,11 +6,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz \
-           file://netbase-add-rpcbind-as-an-alias-to-sunrpc.patch"
+SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
-SRC_URI[md5sum] = "7ad156272c5a42f49c73386ff39c8624"
-SRC_URI[sha256sum] = "5d93a099deb28869b7306e914700fafbd293b55bdb5df05a5aa6effd0af5930c"
+SRC_URI[md5sum] = "f1e50e8d637f6be12af169fa1b67b40a"
+SRC_URI[sha256sum] = "1802ed95847a30d0b618cdfb6fc8f62989fda9fc3d1c0efd0b19e3011a34f915"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
-- 
2.7.4




