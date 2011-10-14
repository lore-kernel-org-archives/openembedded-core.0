Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUK-0002Sz-Nc
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540439"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:01 -0700
Message-Id: <04f4acac350e1399a01205ab66369cf9c20b77aa.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/28] farsight2, ldconfig-native, gnutls: There is no GPLv2.1, correct the fields
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:21 -0000

From: Khem Raj <raj.khem@gmail.com>

The licenses were either LGPLv2.1 or GPLv2
make the changes appropriately

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../farsight/farsight2_0.0.9.bb                    |    4 ++--
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    4 ++--
 meta/recipes-support/gnutls/gnutls.inc             |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb b/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
index a7bdc97..ee0ce8a 100644
--- a/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
+++ b/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
 HOMEPAGE = "http://farsight.sf.net"
 SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${BPN}-${PV}.tar.gz"
-LICENSE = "GPLv2.1"
+LICENSE = "LGPLv2.1"
 DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
 inherit autotools
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF = " \
   --disable-debug \
diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
index 00edb6e..2a93913 100644
--- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A standalone native ldconfig build"
 
-LICENSE = "GPLv2.1"
+LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://${S}/ldconfig.c;endline=17;md5=1d15f20937c055cb5de2329a4c054399"
 
@@ -12,7 +12,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://flag_fix.patch \
            file://endianess-header.patch"
 
-PR = "r1"
+PR = "r2"
 
 inherit native
 
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 3569648..cdcf85b 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,11 +3,11 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
-LICENSE_${PN}-xx = "GPLv2.1+"
+LICENSE_${PN}-xx = "LGPLv2.1+"
 LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN}-extra = "GPLv3+"
 LICENSE_${PN}-openssl = "GPLv3+"
-- 
1.7.6.2



