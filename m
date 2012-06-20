Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShJEt-00019o-1p
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:38:23 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2012 04:27:37 -0700
Received: by mail-wi0-f172.google.com with SMTP id hm11so1400216wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 04:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=nBhKk2TDCA02TS+TMupyG8ZqcqK96AcQ9RIquYgcDz8=;
	b=PgToPScl2+LMaRgGq7JqMRLqtLVGigVaXngE5VIc2McRbBwK4h/FUKeFOF6beUD0UP
	jzM6DxrnlifFrxWzvjMc7QfGy/9BDDkawjEiraQly1PJ9lI+262dh9sGKqiOGOk9TJEt
	xBjqY4HTjeZu7SCxrMRsRq+XyLk6CfviYCEvrIZFjP1GcGzFNvvMA7Om2n9uUmrls8FR
	yPhlIJ6ww24aNw6FiNW5UudHhgpBRen6Y3av8sT9K8Qvm6YwUSIBNY06c0fi25Zctahj
	MEesRJzYWxm7GQGbMW5g0Y1m64sQ3aemH75KxmVEmgCM7NiNPjDCcHYedxOUb+wdIqZv
	NDoA==
Received: by 10.180.98.69 with SMTP id eg5mr9853544wib.3.1340191657331;
	Wed, 20 Jun 2012 04:27:37 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	fo7sm38528660wib.9.2012.06.20.04.27.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 04:27:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:27:20 +0100
Message-Id: <60328796394dee0763ee93df8a1e74d9a372caa4.1340191527.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
	<715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
In-Reply-To: <cover.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmnfg5/xm6BwuEUxH82oyN9NY40tm6SYly8+ojR5g0dpnHIpmqom/pJnK/7y3vSVURKpwKc
Subject: [PATCH 3/6] connman: upgrade to 1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 11:38:23 -0000

Drop patches that have been merged upstream, or are not relevant any more.

License checksums changed because the (C) years were updated.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc      |    4 +-
 .../connman/connman/disable_alg-test.patch         |   46 ----------------
 .../connman/connman/ethernet_default.patch         |   22 --------
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 ------------------
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 --------------------
 .../connman/{connman_0.79.bb => connman_1.0.bb}    |   10 +---
 6 files changed, 5 insertions(+), 182 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 rename meta/recipes-connectivity/connman/{connman_0.79.bb => connman_1.0.bb} (53%)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 7215f25..ae26689 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -11,7 +11,7 @@ HOMEPAGE = "http://connman.net/"
 BUGTRACKER = "http://bugs.meego.com/buglist.cgi?quicksearch=connman"
 LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-                    file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
+                    file://src/main.c;beginline=1;endline=20;md5=d6a1ac98a6791c5294e8a7f176ecd66d"
 
 # we need to define the depends here, the dynamic stuff is too late
 DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
diff --git a/meta/recipes-connectivity/connman/connman/disable_alg-test.patch b/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
deleted file mode 100644
index f5cea00..0000000
--- a/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3ebba424d56919018733064ad9e0ab8790d2bf1d Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Fri, 16 Dec 2011 19:31:59 -0200
-Subject: [PATCH] Disable building of alg-test
-
-alg-test utility depends on linux/if_alg.h header that is only
-available on kernels >= 2.6.39.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- Makefile.am  |    2 +-
- configure.ac |    3 ---
- 2 files changed, 1 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index a6509f1..93618a3 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -145,7 +145,7 @@ noinst_PROGRAMS += tools/wispr tools/supplicant-test \
- 			tools/dbus-test tools/polkit-test \
- 			tools/iptables-test tools/tap-test tools/wpad-test \
- 			tools/stats-tool tools/private-network-test \
--			tools/alg-test unit/test-session unit/test-ippool \
-+			unit/test-session unit/test-ippool \
- 			unit/test-nat
- 
- tools_wispr_SOURCES = $(gweb_sources) tools/wispr.c
-diff --git a/configure.ac b/configure.ac
-index 3dca02e..3b2da4d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -419,9 +419,6 @@ if (test "${enable_tools}" = "yes"); then
- 				AC_MSG_ERROR(GnuTLS library is required))
- 	AC_SUBST(GNUTLS_CFLAGS)
- 	AC_SUBST(GNUTLS_LIBS)
--
--	AC_CHECK_HEADERS(linux/if_alg.h, dummy=yes,
--		AC_MSG_ERROR(User-space algorithm header files are required))
- fi
- AM_CONDITIONAL(TOOLS, test "${enable_tools}" = "yes")
- 
--- 
-1.7.9.1
-
diff --git a/meta/recipes-connectivity/connman/connman/ethernet_default.patch b/meta/recipes-connectivity/connman/connman/ethernet_default.patch
deleted file mode 100644
index 6dae2aa..0000000
--- a/meta/recipes-connectivity/connman/connman/ethernet_default.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Default to enabling the ethernet interface. If we don't do this, connman
-will shut down all the networking when it starts without any configuration
-which is usualy not what the users expects. This is particularly
-problematic with our qemu images and runtime testing using qemu.
-
-Upstream-Status: Inappropriate [Configuration]
-
-RP 2011/12/12
-
-Index: git/src/storage.c
-===================================================================
---- git.orig/src/storage.c	2011-12-12 16:14:10.892316565 +0000
-+++ git/src/storage.c	2011-12-12 16:14:13.788316431 +0000
-@@ -367,7 +367,7 @@
- 					"Enable", FALSE);
- 
- 		g_key_file_set_boolean(keyfile, "Wired",
--					"Enable", FALSE);
-+					"Enable", TRUE);
- 
- 		g_key_file_set_boolean(keyfile, "3G",
- 					"Enable", FALSE);
diff --git a/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch b/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
deleted file mode 100644
index 78eb19a..0000000
--- a/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0b817dd3096f5c3ca8f0b868ee55ea550054137b Mon Sep 17 00:00:00 2001
-From: Daniel Wagner <daniel.wagner@bmw-carit.de>
-Date: Mon, 19 Mar 2012 14:03:27 +0100
-Subject: [PATCH 3/3] set-ipv4-method: The arguments have to be wrapped into a
- variant
-
-Fixes BMC#24986
-
-Upstream-Status: Backport
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- test/set-ipv4-method |   11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/test/set-ipv4-method b/test/set-ipv4-method
-index 820b24b..235113f 100755
---- a/test/set-ipv4-method
-+++ b/test/set-ipv4-method
-@@ -3,6 +3,9 @@
- import sys
- import dbus
- 
-+def make_variant(string):
-+	return dbus.String(string, variant_level=1)
-+
- def print_usage():
- 	print "Usage: %s <service> [off|dhcp|manual <address> [netmask] [gateway]]" % (sys.argv[0])
- 
-@@ -20,13 +23,13 @@ properties = service.GetProperties()
- 
- print "Setting method %s for %s" % (sys.argv[2], sys.argv[1])
- 
--ipv4_configuration = { "Method": sys.argv[2] }
-+ipv4_configuration = { "Method": make_variant(sys.argv[2]) }
- if (len(sys.argv) > 3):
--	ipv4_configuration["Address"] = sys.argv[3]
-+	ipv4_configuration["Address"] = make_variant(sys.argv[3])
- if (len(sys.argv) > 4):
--	ipv4_configuration["Netmask"] = sys.argv[4]
-+	ipv4_configuration["Netmask"] = make_variant(sys.argv[4])
- if (len(sys.argv) > 5):
--        ipv4_configuration["Gateway"] = sys.argv[5]
-+        ipv4_configuration["Gateway"] = make_variant(sys.argv[5])
- 
- service.SetProperty("IPv4.Configuration", ipv4_configuration)
- print "New IPv4.Configuration: ", ipv4_configuration
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch b/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
deleted file mode 100644
index 773127b..0000000
--- a/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 2885e71c9c0df7ea9866e91ab79d255eaa8de53d Mon Sep 17 00:00:00 2001
-From: Daniel Wagner <daniel.wagner@bmw-carit.de>
-Date: Mon, 19 Mar 2012 14:03:28 +0100
-Subject: [PATCH 2/3] set-ipv6-method: The arguments have to be wrapped into a
- variant
-
-Fixes BMC#24986
-
-Upstream-Status: Backport
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- test/set-ipv6-method |   13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/test/set-ipv6-method b/test/set-ipv6-method
-index 7f60b88..4f2de09 100755
---- a/test/set-ipv6-method
-+++ b/test/set-ipv6-method
-@@ -3,6 +3,9 @@
- import sys
- import dbus
- 
-+def make_variant(string):
-+	return dbus.String(string, variant_level=1)
-+
- def print_usage():
- 	print "Usage: %s <service> off|manual|auto [<address> [prefixlen] [gateway]] [<privacy>]" % (sys.argv[0])
- 
-@@ -19,17 +22,17 @@ properties = service.GetProperties()
- 
- print "Setting method %s for %s" % (sys.argv[2], sys.argv[1])
- 
--ipv6_configuration = { "Method": sys.argv[2] }
-+ipv6_configuration = { "Method": make_variant(sys.argv[2])}
- if sys.argv[2] == "auto":
- 	if (len(sys.argv) > 3):
--		ipv6_configuration["Privacy"] = sys.argv[3]
-+		ipv6_configuration["Privacy"] = make_variant(sys.argv[3])
- else:
- 	if (len(sys.argv) > 3):
--		ipv6_configuration["Address"] = sys.argv[3]
-+		ipv6_configuration["Address"] = make_variant(sys.argv[3])
- 	if (len(sys.argv) > 4):
--		ipv6_configuration["PrefixLength"] = sys.argv[4]
-+		ipv6_configuration["PrefixLength"] = make_variant(sys.argv[4])
- 	if (len(sys.argv) > 5):
--		ipv6_configuration["Gateway"] = sys.argv[5]
-+		ipv6_configuration["Gateway"] = make_variant(sys.argv[5])
- 
- service.SetProperty("IPv6.Configuration", ipv6_configuration)
- print "New IPv6.Configuration: ", ipv6_configuration
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_1.0.bb
similarity index 53%
rename from meta/recipes-connectivity/connman/connman_0.79.bb
rename to meta/recipes-connectivity/connman/connman_1.0.bb
index 898fb11..926d22e 100644
--- a/meta/recipes-connectivity/connman/connman_0.79.bb
+++ b/meta/recipes-connectivity/connman/connman_1.0.bb
@@ -1,14 +1,10 @@
 require connman.inc
 
-# 0.79 tag
-SRCREV = "442b1fe603e005814f592a3dbcf0d0bfb13f961c"
+# 1.0 tag
+SRCREV = "6d6f312fb2b751b4cf7037f2a526c7785364732f"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
-            file://add_xuser_dbus_permission.patch \
-            file://ethernet_default.patch \
-            file://disable_alg-test.patch \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
-            file://test-set-ipv4-method-api-fix.patch \
-            file://test-set-ipv6-method-api-fix.patch \
+            file://add_xuser_dbus_permission.patch \
             file://connman"
 S = "${WORKDIR}/git"
 PR = "${INC_PR}.0"
-- 
1.7.7.6



