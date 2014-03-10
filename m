Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9E89B6F66F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 03:48:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 09 Mar 2014 20:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,621,1389772800"; d="scan'208";a="488936392"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.212])
	by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2014 20:48:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Mar 2014 20:48:08 -0700
Message-Id: <1394423288-11049-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394423288-11049-1-git-send-email-sgw@linux.intel.com>
References: <1394423288-11049-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/3] bind: Update to 9.9.5
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

Remove CVE patches that are in bind
Updated COPYRIGHT includes date changes the NetBSD Copyright
Modifies the Base BSD License to 3-Clause (removes advertising clause)w
Add patch to disable running tests on host
bind: Add python-core for dnssec

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../bind-9.8.1-CVE-2012-5166.patch                   |  0
 .../{bind-9.8.1 => bind}/bind-CVE-2011-4313.patch    |  0
 .../{bind-9.8.1 => bind}/bind-CVE-2012-1667.patch    |  0
 .../{bind-9.8.1 => bind}/bind-CVE-2012-3817.patch    |  0
 .../{bind-9.8.1 => bind}/bind-CVE-2013-2266.patch    |  0
 .../bind-Fix-CVE-2012-4244.patch                     |  0
 .../bind/{bind-9.8.1 => bind}/conf.patch             |  0
 .../bind/{bind-9.8.1 => bind}/cross-build-fix.patch  |  0
 .../bind/bind/dont-test-on-host.patch                | 13 +++++++++++++
 .../make-etc-initd-bind-stop-work.patch              |  0
 .../mips1-not-support-opcode.diff                    |  0
 .../bind/{bind_9.8.1.bb => bind_9.9.5.bb}            | 20 ++++++++------------
 12 files changed, 21 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-9.8.1-CVE-2012-5166.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2011-4313.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2012-1667.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2012-3817.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2013-2266.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-Fix-CVE-2012-4244.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/cross-build-fix.patch (100%)
 create mode 100644 meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/mips1-not-support-opcode.diff (100%)
 rename meta/recipes-connectivity/bind/{bind_9.8.1.bb => bind_9.9.5.bb} (76%)

diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch b/meta/recipes-connectivity/bind/bind/bind-9.8.1-CVE-2012-5166.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch
rename to meta/recipes-connectivity/bind/bind/bind-9.8.1-CVE-2012-5166.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch b/meta/recipes-connectivity/bind/bind/bind-CVE-2011-4313.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch
rename to meta/recipes-connectivity/bind/bind/bind-CVE-2011-4313.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch b/meta/recipes-connectivity/bind/bind/bind-CVE-2012-1667.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch
rename to meta/recipes-connectivity/bind/bind/bind-CVE-2012-1667.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch b/meta/recipes-connectivity/bind/bind/bind-CVE-2012-3817.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch
rename to meta/recipes-connectivity/bind/bind/bind-CVE-2012-3817.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch b/meta/recipes-connectivity/bind/bind/bind-CVE-2013-2266.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch
rename to meta/recipes-connectivity/bind/bind/bind-CVE-2013-2266.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch b/meta/recipes-connectivity/bind/bind/bind-Fix-CVE-2012-4244.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch
rename to meta/recipes-connectivity/bind/bind/bind-Fix-CVE-2012-4244.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
rename to meta/recipes-connectivity/bind/bind/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/cross-build-fix.patch b/meta/recipes-connectivity/bind/bind/cross-build-fix.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.8.1/cross-build-fix.patch
rename to meta/recipes-connectivity/bind/bind/cross-build-fix.patch
diff --git a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch b/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
new file mode 100644
index 0000000..8920740
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
@@ -0,0 +1,13 @@
+Index: bind-9.9.5/bin/Makefile.in
+===================================================================
+--- bind-9.9.5.orig/bin/Makefile.in
++++ bind-9.9.5/bin/Makefile.in
+@@ -19,7 +19,7 @@ srcdir =	@srcdir@
+ VPATH =		@srcdir@
+ top_srcdir =	@top_srcdir@
+ 
+-SUBDIRS =	named rndc dig dnssec tools tests nsupdate \
++SUBDIRS =	named rndc dig dnssec tools nsupdate \
+ 		check confgen @PYTHON_TOOLS@ @PKCS11_TOOLS@
+ TARGETS =
+ 
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.8.1/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/mips1-not-support-opcode.diff b/meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.8.1/mips1-not-support-opcode.diff
rename to meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
similarity index 76%
rename from meta/recipes-connectivity/bind/bind_9.8.1.bb
rename to meta/recipes-connectivity/bind/bind_9.9.5.bb
index d59f7e5..1d70b62 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -3,32 +3,26 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=a3df5f651469919a0e6cb42f84fb6ff1"
 
 DEPENDS = "openssl libcap"
-PR = "r6"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
            file://cross-build-fix.patch \
            file://make-etc-initd-bind-stop-work.patch \
-           file://bind-9.8.1-CVE-2012-5166.patch \
-           file://bind-CVE-2011-4313.patch \
-           file://bind-CVE-2012-1667.patch \
-           file://bind-CVE-2012-3817.patch \
-           file://bind-CVE-2013-2266.patch \
-           file://bind-Fix-CVE-2012-4244.patch \
            file://mips1-not-support-opcode.diff \
+           file://dont-test-on-host.patch \
 	   "
 
-SRC_URI[md5sum] = "cf31117c5d35af34d4c0702970ad9fb7"
-SRC_URI[sha256sum] = "02285dc429cb2a6687a1b2446e9ee22c1df27f2577225b05be5092395ee7c92c"
+SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
+SRC_URI[sha256sum] = "d4b64c1dde442145a316679acff2df4008aa117ae52dfa3a6bc69efecc7840d1"
 
 # --enable-exportlib is necessary for building dhcp
 ENABLE_IPV6 = "--enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                  --disable-devpoll --disable-epoll --with-gost=no \
-                 --with-gssapi=no \
+                 --with-gssapi=no --with-ecdsa=yes \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
                  --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \
@@ -40,7 +34,9 @@ INITSCRIPT_PARAMS = "defaults"
 
 PARALLEL_MAKE = ""
 
-PACKAGES_prepend = "${PN}-utils "
+RDEPENDS_${PN} = "python-core"
+
+PACKAGES_preprend = " ${PN}-utils "
 FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/nslookup"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 
-- 
1.8.3.1


