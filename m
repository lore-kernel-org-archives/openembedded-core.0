Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Mlp-0000I5-NU
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:07:49 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 00:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128321819"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 00:59:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:58:49 -0700
Message-Id: <6c0357430ea6e0f25ac5f445a8b754e1afd84c1e.1331589797.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/23] connman: update to 0.79
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
X-List-Received-Date: Tue, 13 Mar 2012 08:07:49 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../connman/add_xuser_dbus_permission.patch        |   12 +++++++-----
 .../connman/connman/disable_alg-test.patch         |   18 +++++++++---------
 .../connman/{connman_0.78.bb => connman_0.79.bb}   |    6 ++----
 3 files changed, 18 insertions(+), 18 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_0.78.bb => connman_0.79.bb} (79%)

diff --git a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
index 764c689..aa7a910 100644
--- a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
+++ b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
@@ -5,18 +5,20 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
-diff -ruN connman-0.65-orig/src/connman-dbus.conf connman-0.65/src/connman-dbus.conf
---- connman-0.65-orig/src/connman-dbus.conf	2011-03-04 09:34:49.000000000 +0800
-+++ connman-0.65/src/connman-dbus.conf	2011-03-04 09:35:21.000000000 +0800
-@@ -7,6 +7,12 @@
-         <allow send_interface="net.connman.Agent"/>
+diff --git a/src/connman-dbus.conf b/src/connman-dbus.conf
+index 98a773e..cbe2ba3 100644
+--- a/src/connman-dbus.conf
++++ b/src/connman-dbus.conf
+@@ -8,6 +8,13 @@
          <allow send_interface="net.connman.Counter"/>
+         <allow send_interface="net.connman.Notification"/>
      </policy>
 +    <policy user="xuser">
 +        <allow own="net.connman"/>
 +        <allow send_destination="net.connman"/>
 +        <allow send_interface="net.connman.Agent"/>
 +        <allow send_interface="net.connman.Counter"/>
++        <allow send_interface="net.connman.Notification"/>
 +    </policy>
      <policy at_console="true">
          <allow send_destination="net.connman"/>
diff --git a/meta/recipes-connectivity/connman/connman/disable_alg-test.patch b/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
index 44ad768..f5cea00 100644
--- a/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
+++ b/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
@@ -1,4 +1,4 @@
-From b9a20c8eb61b600ced284646a1bea588fdd8a5ea Mon Sep 17 00:00:00 2001
+From 3ebba424d56919018733064ad9e0ab8790d2bf1d Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Fri, 16 Dec 2011 19:31:59 -0200
 Subject: [PATCH] Disable building of alg-test
@@ -15,23 +15,23 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  2 files changed, 1 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index d5a76f9..d42a766 100644
+index a6509f1..93618a3 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -144,7 +144,7 @@ noinst_PROGRAMS += tools/wispr tools/supplicant-test \
+@@ -145,7 +145,7 @@ noinst_PROGRAMS += tools/wispr tools/supplicant-test \
  			tools/dbus-test tools/polkit-test \
  			tools/iptables-test tools/tap-test tools/wpad-test \
  			tools/stats-tool tools/private-network-test \
--			tools/alg-test unit/test-session
-+			unit/test-session
+-			tools/alg-test unit/test-session unit/test-ippool \
++			unit/test-session unit/test-ippool \
+ 			unit/test-nat
  
  tools_wispr_SOURCES = $(gweb_sources) tools/wispr.c
- tools_wispr_LDADD = @GLIB_LIBS@ @GNUTLS_LIBS@ -lresolv
 diff --git a/configure.ac b/configure.ac
-index f63fea8..67bfe85 100644
+index 3dca02e..3b2da4d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -437,9 +437,6 @@ if (test "${enable_tools}" = "yes"); then
+@@ -419,9 +419,6 @@ if (test "${enable_tools}" = "yes"); then
  				AC_MSG_ERROR(GnuTLS library is required))
  	AC_SUBST(GNUTLS_CFLAGS)
  	AC_SUBST(GNUTLS_LIBS)
@@ -42,5 +42,5 @@ index f63fea8..67bfe85 100644
  AM_CONDITIONAL(TOOLS, test "${enable_tools}" = "yes")
  
 -- 
-1.7.7.3
+1.7.9.1
 
diff --git a/meta/recipes-connectivity/connman/connman_0.78.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
similarity index 79%
rename from meta/recipes-connectivity/connman/connman_0.78.bb
rename to meta/recipes-connectivity/connman/connman_0.79.bb
index c73cad9..0c3a6fe 100644
--- a/meta/recipes-connectivity/connman/connman_0.78.bb
+++ b/meta/recipes-connectivity/connman/connman_0.79.bb
@@ -1,9 +1,7 @@
 require connman.inc
 
-PR = "r6"
-
-# 0.78 tag
-SRCREV = "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"
+# 0.79 tag
+SRCREV = "442b1fe603e005814f592a3dbcf0d0bfb13f961c"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://add_xuser_dbus_permission.patch \
             file://ethernet_default.patch \
-- 
1.7.7.6



