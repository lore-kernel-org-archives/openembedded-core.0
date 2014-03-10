Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 51C2760E07
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 03:48:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 09 Mar 2014 20:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,621,1389772800"; d="scan'208";a="488936391"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.212])
	by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2014 20:48:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Mar 2014 20:48:07 -0700
Message-Id: <1394423288-11049-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394423288-11049-1-git-send-email-sgw@linux.intel.com>
References: <1394423288-11049-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/3] dhcp: Update to 4.3.0
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
X-List-Received-Date: Mon, 10 Mar 2014 03:48:40 -0000

Rebase fix-external-bind patch
LICENSE file has date update to 2014

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |   2 +-
 .../dhcp/dhcp/fix-external-bind.patch              | 115 +++++++++++----------
 .../dhcp/{dhcp_4.2.5-P1.bb => dhcp_4.3.0.bb}       |   6 +-
 3 files changed, 65 insertions(+), 58 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.5-P1.bb => dhcp_4.3.0.bb} (65%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index ad82b57..512127c 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -8,7 +8,7 @@ easier to administer devices."
 HOMEPAGE = "http://www.isc.org/"
 
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=bb6fd41f5895b67088ebea61ad365e74"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1753"
 
 DEPENDS = "openssl bind"
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
index 4f11655..a291fda 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
@@ -6,37 +6,39 @@ this patch is to allow building with external bind
 
 Signed-off-by: Qing He <qing.he@intel.com>
 
-diff --git a/Makefile.am b/Makefile.am
-index 928d926..cd17af8 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -21,7 +21,7 @@ EXTRA_DIST = RELNOTES LICENSE \
- 	     util/bindvar.sh \
- 	     bind/Makefile bind/bind.tar.gz bind/version.tmp 
+Index: dhcp-4.3.0/Makefile.am
+===================================================================
+--- dhcp-4.3.0.orig/Makefile.am
++++ dhcp-4.3.0/Makefile.am
+@@ -25,7 +25,7 @@ EXTRA_DIST = RELNOTES LICENSE \
+ 	     bind/Makefile bind/bind.tar.gz bind/version.tmp \
+ 	     common/tests/Atffile server/tests/Atffile
  
 -SUBDIRS = bind includes tests common dst omapip client dhcpctl relay server
 +SUBDIRS = includes tests common dst omapip client dhcpctl relay server
  
  nobase_include_HEADERS = dhcpctl/dhcpctl.h
  
-diff --git a/client/Makefile.am b/client/Makefile.am
-index 77ed055..5a77f2d 100644
---- a/client/Makefile.am
-+++ b/client/Makefile.am
-@@ -5,7 +5,7 @@ dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
+Index: dhcp-4.3.0/client/Makefile.am
+===================================================================
+--- dhcp-4.3.0.orig/client/Makefile.am
++++ dhcp-4.3.0/client/Makefile.am
+@@ -4,8 +4,8 @@ dhclient_SOURCES = clparse.c dhclient.c
+ 		   scripts/bsdos scripts/freebsd scripts/linux scripts/macos \
  		   scripts/netbsd scripts/nextstep scripts/openbsd \
  		   scripts/solaris scripts/openwrt
- dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
--		 ../bind/lib/libdns.a ../bind/lib/libisc.a
-+		 $(libbind)/libdns.a $(libbind)/libisc.a
+-dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a ../bind/lib/libirs.a \
+-		 ../bind/lib/libdns.a ../bind/lib/libisccfg.a ../bind/lib/libisc.a
++dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a $(libbind)/libirs.a \
++		 $(libbind)/libdns.a $(libbind)/libisccfg.a $(libbind)/libisc.a
  man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
  EXTRA_DIST = $(man_MANS)
  
-diff --git a/configure.ac b/configure.ac
-index ff832aa..60d342c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -500,6 +500,7 @@ no)
+Index: dhcp-4.3.0/configure.ac
+===================================================================
+--- dhcp-4.3.0.orig/configure.ac
++++ dhcp-4.3.0/configure.ac
+@@ -566,6 +566,7 @@ no)
  	libbind="$use_libbind"
  	;;
  esac
@@ -44,60 +46,67 @@ index ff832aa..60d342c 100644
  
  # OpenLDAP support.
  AC_ARG_WITH(ldap,
-diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
-index 61049be..85aefa3 100644
---- a/dhcpctl/Makefile.am
-+++ b/dhcpctl/Makefile.am
-@@ -6,10 +6,10 @@ EXTRA_DIST = $(man_MANS)
+Index: dhcp-4.3.0/dhcpctl/Makefile.am
+===================================================================
+--- dhcp-4.3.0.orig/dhcpctl/Makefile.am
++++ dhcp-4.3.0/dhcpctl/Makefile.am
+@@ -6,12 +6,12 @@ EXTRA_DIST = $(man_MANS)
  
  omshell_SOURCES = omshell.c
  omshell_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
--	        ../bind/lib/libdns.a ../bind/lib/libisc.a
-+	        $(libbind)/libdns.a $(libbind)/libisc.a
+-	        ../bind/lib/libirs.a ../bind/lib/libdns.a \
+-	        ../bind/lib/libisccfg.a ../bind/lib/libisc.a
++	        $(libbind)/libirs.a $(libbind)/libdns.a \
++	        $(libbind)/libisccfg.a $(libbind)/libisc.a
  
  libdhcpctl_a_SOURCES = dhcpctl.c callback.c remote.c
  
  cltest_SOURCES = cltest.c
  cltest_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
--	       ../bind/lib/libdns.a ../bind/lib/libisc.a
-\ No newline at end of file
-+	       $(libbind)/libdns.a $(libbind)/libisc.a
-diff --git a/omapip/Makefile.am b/omapip/Makefile.am
-index 595950a..17f2233 100644
---- a/omapip/Makefile.am
-+++ b/omapip/Makefile.am
-@@ -10,5 +10,5 @@ man_MANS = omapi.3
+-	       ../bind/lib/libirs.a ../bind/lib/libdns.a \
+-               ../bind/lib/libisccfg.a ../bind/lib/libisc.a
++	       $(libbind)/libirs.a $(libbind)/libdns.a \
++               $(libbind)/libisccfg.a $(libbind)/libisc.a
+Index: dhcp-4.3.0/omapip/Makefile.am
+===================================================================
+--- dhcp-4.3.0.orig/omapip/Makefile.am
++++ dhcp-4.3.0/omapip/Makefile.am
+@@ -10,6 +10,6 @@ man_MANS = omapi.3
  EXTRA_DIST = $(man_MANS)
  
  svtest_SOURCES = test.c
--svtest_LDADD = libomapi.a ../bind/lib/libdns.a ../bind/lib/libisc.a
-+svtest_LDADD = libomapi.a $(libbind)/libdns.a $(libbind)/libisc.a
+-svtest_LDADD = libomapi.a ../bind/lib/libirs.a ../bind/lib/libdns.a \
+-		../bind/lib/libisccfg.a ../bind/lib/libisc.a
++svtest_LDADD = libomapi.a $(libbind)/libirs.a $(libbind)/libdns.a \
++		$(libbind)/libisccfg.a $(libbind)/libisc.a
  
-diff --git a/relay/Makefile.am b/relay/Makefile.am
-index d8757ca..a7885da 100644
---- a/relay/Makefile.am
-+++ b/relay/Makefile.am
-@@ -3,7 +3,7 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
+Index: dhcp-4.3.0/relay/Makefile.am
+===================================================================
+--- dhcp-4.3.0.orig/relay/Makefile.am
++++ dhcp-4.3.0/relay/Makefile.am
+@@ -3,8 +3,8 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localst
  sbin_PROGRAMS = dhcrelay
  dhcrelay_SOURCES = dhcrelay.c
  dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
--		 ../bind/lib/libdns.a ../bind/lib/libisc.a
-+		 $(libbind)/libdns.a $(libbind)/libisc.a
+-		 ../bind/lib/libirs.a ../bind/lib/libdns.a \
+-		 ../bind/lib/libisccfg.a ../bind/lib/libisc.a
++		 $(libbind)/libirs.a $(libbind)/libdns.a \
++		 $(libbind)/libisccfg.a $(libbind)/libisc.a
  man_MANS = dhcrelay.8
  EXTRA_DIST = $(man_MANS)
  
-diff --git a/server/Makefile.am b/server/Makefile.am
-index cdfaf47..d2c254b 100644
---- a/server/Makefile.am
-+++ b/server/Makefile.am
-@@ -8,8 +8,8 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c confpars.c db.c class.c failover.c \
+Index: dhcp-4.3.0/server/Makefile.am
+===================================================================
+--- dhcp-4.3.0.orig/server/Makefile.am
++++ dhcp-4.3.0/server/Makefile.am
+@@ -14,8 +14,8 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c c
  
  dhcpd_CFLAGS = $(LDAP_CFLAGS)
  dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
--	      ../dhcpctl/libdhcpctl.a ../bind/lib/libdns.a \
--	      ../bind/lib/libisc.a
-+	      ../dhcpctl/libdhcpctl.a $(libbind)/libdns.a \
-+	      $(libbind)/libisc.a
+-	      ../dhcpctl/libdhcpctl.a ../bind/lib/libirs.a \
+-	      ../bind/lib/libdns.a ../bind/lib/libisccfg.a ../bind/lib/libisc.a
++	      ../dhcpctl/libdhcpctl.a $(libbind)/libirs.a \
++	      $(libbind)/libdns.a $(libbind)/libisccfg.a $(libbind)/libisc.a
  
  man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
  EXTRA_DIST = $(man_MANS)
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb
similarity index 65%
rename from meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb
index 77cdb4e..6da28fa 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb
@@ -1,7 +1,5 @@
 require dhcp.inc
 
-PR = "r4"
-
 SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://fix-external-bind.patch \
             file://link-with-lcrypto.patch \
@@ -9,5 +7,5 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://dhclient-script-drop-resolv.conf.dhclient.patch \
            "
 
-SRC_URI[md5sum] = "f68e3c1f00a9af5742bc5e71d567cf93"
-SRC_URI[sha256sum] = "59b06c9f5d775e46999b422c45b9229402c462b114ce1685617bfb2b8b028250"
+SRC_URI[md5sum] = "1020d77e1a4c1f01b76279caff9beb80"
+SRC_URI[sha256sum] = "a7b6517d5cf32c5e49d2323a63de00efe5391df7cb0045dfa0ec8f6ee46ebe8a"
-- 
1.8.3.1


