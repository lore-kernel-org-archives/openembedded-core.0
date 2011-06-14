Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QWMZQ-0005q5-7n
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 07:53:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2011 22:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,362,1304319600"; d="scan'208";a="13190401"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2011 22:48:53 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 13:59:28 +0800
Message-Id: <c3921b032b4db674706a2e17e6100d97c30ba994.1308030161.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1308030161.git.lei.mei@intel.com>
References: <cover.1308030161.git.lei.mei@intel.com>
In-Reply-To: <cover.1308030161.git.lei.mei@intel.com>
References: <cover.1308030161.git.lei.mei@intel.com>
Subject: [PATCH 1/1] gupnp: upgrade from 0.16.0 to 0.16.1
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
X-List-Received-Date: Tue, 14 Jun 2011 05:53:49 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../gupnp/{gupnp_0.16.0.bb => gupnp_0.16.1.bb}     |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/gupnp/{gupnp_0.16.0.bb => gupnp_0.16.1.bb} (79%)

diff --git a/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
similarity index 79%
rename from meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
rename to meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
index 07b6b90..5b23134 100644
--- a/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
+++ b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
@@ -7,8 +7,8 @@ DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme"
 
 SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "61b240c1a9fdf8ca82c5c3adde0d6757"
-SRC_URI[sha256sum] = "1b77201866b7632fb68bc2a3bdea22ef8ead34ba850b3ee367797432cfc0f04a"
+SRC_URI[md5sum] = "021bb237741532af4bca50157ff326e4"
+SRC_URI[sha256sum] = "f01a1f4fd36ce161a3df29fa83e1a0a2fb40d3c9f30f6b403e7791688ad24cfe"
 
 PR = "r0"
 
@@ -19,6 +19,9 @@ inherit autotools pkgconfig
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
 
+do_configure_prepend() {
+	sed -i -e 's:GOBJECT_INTROSPECTION_CHECK(\[0.6.4\]):AM_CONDITIONAL([HAVE_INTROSPECTION], [false]):g' ${S}/configure.ac
+}
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 
 gupnp_sysroot_preprocess () {
-- 
1.6.3.3



