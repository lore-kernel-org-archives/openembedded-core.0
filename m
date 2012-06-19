Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11U-00028Y-Nv
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520378"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:48 -0700
Message-Id: <67cb780bb1c65d95866ce6b048283114a0fb35d2.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 30/39] js: clean up FILE after PACKAGE reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:21 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
index adca44e..45a6fa7 100644
--- a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
+++ b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 # the package is licensed under either of the following
 LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://jsapi.c;beginline=4;endline=39;md5=347c6bbf4fb4547de1fa5ad830030063"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/js-1.8.0-rc1.tar.gz \
            file://link_with_gcc.patch \
@@ -46,5 +46,6 @@ do_install() {
 	install -m 0644 ${S}/jsproto.tbl ${D}${includedir}/js
 }
 
+FILES_SOLIBSDEV = ""
 FILES_${PN} = "${libdir}/lib*.so"
 
-- 
1.7.7.6



