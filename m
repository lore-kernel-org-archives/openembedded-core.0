Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOd1-0001K6-LW
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283924"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:29 -0700
Message-Id: <bce73e3fda68b57ab051ee7bec883b845d8c6f20.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/51] rxvt-unicode: Fix SRC_URI & LIC_FILES Checksum
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb
index 9657e21..db18169 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb
@@ -7,12 +7,12 @@ output. It also supports mixing multiple fonts at the \
 same time, including Xft fonts."
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://src/main.C;beginline=1;endline=31;md5=633e23cdeb89fe980ded9a3af4f335c2"
+                    file://src/main.C;beginline=1;endline=31;md5=775485398a09fa7aee6f90464af88432"
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
 	   file://rxvt.png"
-PR = "r0"
+PR = "r1"
 
 inherit autotools update-alternatives
 
@@ -61,5 +61,5 @@ do_install_append () {
 
 FILES_${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
 
-SRC_URI[md5sum] = "a23aa40b31e843878b6f9c44768de430"
-SRC_URI[sha256sum] = "1c238f7e545b1a8da81239b826fb2a7d196c73effbcbd211db7a50995a0a067a"
+SRC_URI[md5sum] = "1bed5bfeed026e0bfafa0e9e4f62aa37"
+SRC_URI[sha256sum] = "0452c00066774ef6e32fcd0a1e6f09230392ea9f6f42e1c2ef7b91d6fcb82d85"
-- 
1.7.3.4



