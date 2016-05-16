Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5940E731BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:15:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 16 May 2016 05:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977836967"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 05:15:17 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7E8BB6A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 06:02:48 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 15:15:28 +0300
Message-Id: <1463400929-28739-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] libproxy: update to version 0.4.13
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
X-List-Received-Date: Mon, 16 May 2016 12:15:37 -0000

1. libproxy moved from google-code to github
2. Remove upstreamed patch:
        a) 0001-test-Include-sys-select.h-for-select.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...0001-test-Include-sys-select.h-for-select.patch | 37 ----------------------
 .../{libproxy_0.4.11.bb => libproxy_0.4.13.bb}     | 14 ++++----
 2 files changed, 7 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-support/libproxy/libproxy/0001-test-Include-sys-select.h-for-select.patch
 rename meta/recipes-support/libproxy/{libproxy_0.4.11.bb => libproxy_0.4.13.bb} (68%)

diff --git a/meta/recipes-support/libproxy/libproxy/0001-test-Include-sys-select.h-for-select.patch b/meta/recipes-support/libproxy/libproxy/0001-test-Include-sys-select.h-for-select.patch
deleted file mode 100644
index 5ae52f2..0000000
--- a/meta/recipes-support/libproxy/libproxy/0001-test-Include-sys-select.h-for-select.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f5f2c2289eb35eb804c1c35e46ca41b58e4cae01 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Apr 2015 14:13:49 -0700
-Subject: [PATCH] test: Include <sys/select.h> for select()
-
-As per posix we need to include this file otherwise we end up with errors like
-
-/home/kraj/work/bleeding/openembedded-core/build/tmp-musl/work/mips32r2-oe-linux-musl/libproxy/0.4.11-r0/libproxy-0.4.11/libproxy/test/get-pac-test.cpp: In member function 'bool TestServer::loop()':
-/home/kraj/work/bleeding/openembedded-core/build/tmp-musl/work/mips32r2-oe-linux-musl/libproxy/0.4.11-r0/libproxy-0.4.11/libproxy/test/get-pac-test.cpp:80:4: error: 'fd_set' was not declared in this scope
-    fd_set fds;
-    ^
-/home/kraj/work/bleeding/openembedded-core/build/tmp-musl/work/mips32r2-oe-linux-musl/libproxy/0.4.11-r0/libproxy-0.4.11/libproxy/test/get-pac-test.cpp:89:14: error: 'fds' was not declared in this scope
-    FD_ZERO (&fds);
-<JIRA TICKET #1>, <JIRA TICKET #2>, <JIRA TICKET #n> : <one line summary of change>
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libproxy/test/get-pac-test.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libproxy/test/get-pac-test.cpp b/libproxy/test/get-pac-test.cpp
-index a61fc4b..bda4646 100644
---- a/libproxy/test/get-pac-test.cpp
-+++ b/libproxy/test/get-pac-test.cpp
-@@ -3,6 +3,7 @@
- #include <sstream>
- #include <string>
- 
-+#include <sys/select.h>
- #include <sys/socket.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
--- 
-2.1.4
-
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.13.bb
similarity index 68%
rename from meta/recipes-support/libproxy/libproxy_0.4.11.bb
rename to meta/recipes-support/libproxy/libproxy_0.4.13.bb
index 8cc90bb..3940e22 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.13.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Library providing automatic proxy configuration management"
-HOMEPAGE = "http://code.google.com/p/libproxy/"
-BUGTRACKER = "http://code.google.com/p/libproxy/issues/list"
+HOMEPAGE = "https://github.com/libproxy/libproxy"
+BUGTRACKER = "https://github.com/libproxy/libproxy/issues"
 SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libp/${BPN}/${BPN}_${PV}.orig.tar.gz \
-           file://0001-test-Include-sys-select.h-for-select.patch \
-          "
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"
 
-SRC_URI[md5sum] = "3cd1ae2a4abecf44b3f24d6639d2cd84"
-SRC_URI[sha256sum] = "dc3f33de54163718f82b3e7c496a7de97f8862578414b8ecaad3cbfe4821864b"
+UPSTREAM_CHECK_URI = "https://github.com/libproxy/libproxy/releases"
+
+SRC_URI[md5sum] = "de293bb311f185a2ffa3492700a694c2"
+SRC_URI[sha256sum] = "d610bc0ef81a18ba418d759c5f4f87bf7102229a9153fb397d7d490987330ffd"
 
 inherit cmake pkgconfig
 
-- 
2.4.0


