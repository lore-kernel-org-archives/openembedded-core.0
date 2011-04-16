Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzRE-0006Gb-5t
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Apr 2011 23:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="420319931"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by azsmga001.ch.intel.com with ESMTP; 15 Apr 2011 23:54:38 -0700
Message-Id: <3923f90924cf37edc26ce80814e6d23fbffe1808.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Mon, 4 Apr 2011 14:26:40 +0100
Date: Fri, 15 Apr 2011 23:54:38 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 36/58] clutter-1.6: fix tarball md5sum and add json-glib to dependencies
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:00 -0000

From: Joshua Lock <josh@linux.intel.com>

* As of Clutter 1.5.2 the project no longer ships an internal version of
json-glib so we must explicitly add it to the DEPENDS.
* Fix the SRC_URI[md5sum]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb b/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
index 04935e3..ffcc42d 100644
--- a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
@@ -2,6 +2,9 @@ require recipes-graphics/clutter/clutter.inc
 
 PR = "r0"
 
+# Internal json-glib was removed in Clutter 1.5.2
+STDDEPENDS += "json-glib"
+
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
 
@@ -14,8 +17,6 @@ S = "${WORKDIR}/clutter-1.6.8"
 
 BASE_CONF += "--disable-introspection"
 
-EXTRA_OECONF += "--with-json=check"
-
 do_configure_prepend () {
 	# Disable DOLT
 	sed -i -e 's/^DOLT//' ${S}/configure.ac
-- 
1.7.1.1



