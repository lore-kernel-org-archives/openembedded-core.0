Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QfEw5-0004tK-0H
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:33:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2011 10:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="24991318"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2011 10:29:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:29:41 -0700
Message-Id: <42b00cb4a230a2e9453c04846f398fbb4c190368.1310145969.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310145969.git.sgw@linux.intel.com>
References: <cover.1310145969.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310145969.git.sgw@linux.intel.com>
References: <cover.1310145969.git.sgw@linux.intel.com>
Subject: [PATCH v2 3/4] eglibc: add RDEPENDS for bash on eglibc-utils
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
X-List-Received-Date: Fri, 08 Jul 2011 17:33:53 -0000

[YOCTO #1214]

The eglibc-utils contains 2 scripts (tzselect and xtrace) that use
bash, so add an RDEPENDS to eglibc-utils.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 1c6626c..f0fac76 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -69,7 +69,7 @@ FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
 FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
 RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
-EDEPENDS_eglibc-utils = "libsotruss"
+RDEPENDS_eglibc-utils += "libsotruss bash"
 FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db*"
 RPROVIDES_eglibc-dev += "libc-dev"
-- 
1.7.3.4



