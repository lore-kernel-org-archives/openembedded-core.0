Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPjhe-0001hD-JA
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 01:10:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 16:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="5588266"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.104])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 16:07:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 16:07:35 -0700
Message-Id: <dce254d1dbe3cf3dadc795da35882bdc41c592e6.1306451124.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306451124.git.sgw@linux.intel.com>
References: <cover.1306451124.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306451124.git.sgw@linux.intel.com>
References: <cover.1306451124.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 4/9] gnutls: Add libcap to DEPENDS
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
X-List-Received-Date: Thu, 26 May 2011 23:10:54 -0000

Setup INC_PR for PR bumps

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc       |    6 ++++--
 meta/recipes-support/gnutls/gnutls_2.10.4.bb |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 2dcd8a0..fd77af4 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
-DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2)"
+DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap"
 
-BBCLASSEXTEND = "native"
+INC_PR = "r1"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -44,3 +44,5 @@ FILES_${PN}-dev += "${bindir}/*-config ${bindir}/gnutls-cli-debug"
 FILES_${PN}-extra = "${libdir}/libgnutls-extra.so.*"
 FILES_${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
 FILES_${PN}-xx = "${libdir}/libgnutlsxx.so.*"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/gnutls/gnutls_2.10.4.bb b/meta/recipes-support/gnutls/gnutls_2.10.4.bb
index 3924ecd..cc2fa27 100644
--- a/meta/recipes-support/gnutls/gnutls_2.10.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.10.4.bb
@@ -1,6 +1,6 @@
 require gnutls.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://gnutls-texinfo-euro.patch \
-- 
1.7.3.4



