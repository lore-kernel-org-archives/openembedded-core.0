Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEGAK-0004OB-3D
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 09:25:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2011 23:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,265,1301900400"; d="scan'208";a="424900545"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by azsmga001.ch.intel.com with ESMTP; 24 Apr 2011 23:54:38 -0700
Message-Id: <624f00832be53c358f7c20ec73f005c920d0986c.1303714279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303714279.git.sgw@linux.intel.com>
References: <cover.1303714279.git.sgw@linux.intel.com>
Old-Date: Sun, 24 Apr 2011 22:22:09 -0700
Date: Sun, 24 Apr 2011 23:54:38 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 3/3] gdb: set --without-ust for EXTRA_OEFLAGS
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
X-List-Received-Date: Mon, 25 Apr 2011 07:25:05 -0000

From: Saul Wold <sgw@linux.intel.com>

Disable using UST since there are some compiler errors with
the newer version of lttng-ust 0.12, there may be other unknow
problems, so wait for upstream fixes.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 84e36ba..549a934 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -29,7 +29,9 @@ EXPAT = "--without-expat"
 
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
-                ${GDBPROPREFIX} --with-libelf=${STAGING_DIR_TARGET} ${EXPAT}"
+                ${GDBPROPREFIX} --with-libelf=${STAGING_DIR_TARGET} ${EXPAT}
+                --without-ust \
+               "
 GDBPROPREFIX = "--program-prefix=''"
 
 do_configure () {
-- 
1.7.1.1



