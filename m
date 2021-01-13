Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.5450.1610527121722353112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 00:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; 
   d="scan'208";a="103437683"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 16:38:40 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E848C4CE602C
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 16:38:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 16:38:41 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.35 -> 0.36
Date: Wed, 13 Jan 2021 16:38:36 +0800
Message-ID: <1610527116-21405-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: E848C4CE602C.A35C9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-ell-add-missing-include-in-dhcp-server.patch
removed since it is included in 0.36

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...l-add-missing-include-in-dhcp-server.patch | 23 -------------------
 .../ell/{ell_0.35.bb => ell_0.36.bb}          |  3 +--
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
 rename meta/recipes-core/ell/{ell_0.35.bb => ell_0.36.bb} (83%)

diff --git a/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch b/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
deleted file mode 100644
index 2460d26bdc..0000000000
--- a/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From dd350f4e2258b5a638bc8fb26a6193147902d292 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C3=89rico=20Nogueira?= <ericonr@disroot.org>
-Date: Mon, 30 Nov 2020 18:40:33 -0300
-Subject: [PATCH] ell: add missing include in dhcp-server.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ell/dhcp-server.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ell/dhcp-server.c b/ell/dhcp-server.c
-index c983ed4..144e83e 100644
---- a/ell/dhcp-server.c
-+++ b/ell/dhcp-server.c
-@@ -24,6 +24,7 @@
- #include <config.h>
- #endif
- 
-+#include <linux/types.h>
- #include <net/ethernet.h>
- #include <sys/socket.h>
- #include <arpa/inet.h>
diff --git a/meta/recipes-core/ell/ell_0.35.bb b/meta/recipes-core/ell/ell_0.36.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.35.bb
rename to meta/recipes-core/ell/ell_0.36.bb
index ccc54b5ff7..4535ec2186 100644
--- a/meta/recipes-core/ell/ell_0.35.bb
+++ b/meta/recipes-core/ell/ell_0.36.bb
@@ -14,10 +14,9 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
-           file://0001-ell-add-missing-include-in-dhcp-server.patch \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "2bfe9da7781f65f1cb1595a5a068a3ae74d4b68b74f287c6f0c892cfe623913f"
+SRC_URI[sha256sum] = "2f99e743a235b1c834b19112e4e0283d02da93b863899381466cde47bf159cf6"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1



