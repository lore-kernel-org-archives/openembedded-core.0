Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11P-00027q-HI
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520330"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:37 -0700
Message-Id: <38e43a9328a9506ef7ec7f4549d5bd960bcf9b92.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 19/39] icu: clean up FILE after PACKAGE reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/icu/icu-3.6.inc |    2 ++
 meta/recipes-support/icu/icu_3.6.bb  |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
index e3f9dd2..23447d3 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu-3.6.inc
@@ -46,6 +46,8 @@ do_install_append() {
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx libicutu libicuio"
 
+FILES_${PN}-dev += "${libdir}/${BPN}/"
+
 FILES_libicudata = "${libdir}/libicudata.so.*"
 FILES_libicuuc = "${libdir}/libicuuc.so.*"
 FILES_libicui18n = "${libdir}/libicui18n.so.*"
diff --git a/meta/recipes-support/icu/icu_3.6.bb b/meta/recipes-support/icu/icu_3.6.bb
index f5a3d8c..d7be522 100644
--- a/meta/recipes-support/icu/icu_3.6.bb
+++ b/meta/recipes-support/icu/icu_3.6.bb
@@ -1,6 +1,6 @@
 require icu-3.6.inc
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI[md5sum] = "6243f7a19e03e05403ce84e597510d4c"
 SRC_URI[sha256sum] = "5135e8d69d6206d320515df7aeee7027711ab1aef9d8dbf29571a97a9746b041"
-- 
1.7.7.6



