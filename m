Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11M-00027q-RB
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520252"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:25 -0700
Message-Id: <00bc8ed546df0b0d053125333a1e246867ccf10f.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 07/39] taglib: correct location of taglib-config to -dev
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:13 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/taglib/taglib_1.6.3.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/taglib/taglib_1.6.3.bb b/meta/recipes-support/taglib/taglib_1.6.3.bb
index 97980f7..bda7d02 100644
--- a/meta/recipes-support/taglib/taglib_1.6.3.bb
+++ b/meta/recipes-support/taglib/taglib_1.6.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=db979804f025cf55aabec7129cb671ed \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                     file://taglib/audioproperties.h;beginline=1;endline=24;md5=39dcdd772f378a0f8c9a41bc929eccce"
 
-PR = "r1"
+PR = "r2"
 # http://developer.kde.org/~wheeler/files/src/taglib-${PV}.tar.gz
 SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.gz \
            file://configuretweak.patch \
@@ -20,7 +20,6 @@ S = "${WORKDIR}/taglib-${PV}"
 inherit autotools pkgconfig binconfig
 
 PACKAGES =+ "${PN}-c"
-FILES_${PN}-dbg += "${bindir}/taglib-config"
 FILES_${PN}-c = "${libdir}/libtag_c.so.*"
 
 do_configure_prepend () {
-- 
1.7.7.6



