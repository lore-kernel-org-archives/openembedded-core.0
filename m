Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAKYr-00029x-Nl
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 13:22:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Mar 2012 05:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121485284"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.204])
	by azsmga001.ch.intel.com with ESMTP; 21 Mar 2012 05:12:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 12:12:41 +0000
Message-Id: <6f994e4f963a78e7321ff29138574f297dd740f7.1332331918.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332331918.git.paul.eggleton@linux.intel.com>
References: <cover.1332331918.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332331918.git.paul.eggleton@linux.intel.com>
References: <cover.1332331918.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] libacpi: fix stripped file warning
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
X-List-Received-Date: Wed, 21 Mar 2012 12:22:42 -0000

Fix the following package warning:
WARNING: File '/usr/bin/test-libacpi' from libacpi was already stripped, this will prevent future debugging!

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/libacpi/libacpi_0.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index 2d98fae..1a6dc97 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 HOMEPAGE = "http://www.ngolde.de/libacpi.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fec17f82f16630adf2dfb7d2a46f21c5"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 	   file://makefile-fix.patch \
@@ -23,6 +23,7 @@ FILES_${PN}-bin = "${bindir}"
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
 CFLAGS += "-fPIC"
+EXTRA_OEMAKE += 'STRIP="echo"'
 
 do_install() {
 	oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
-- 
1.7.5.4



