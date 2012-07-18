Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5J-0004Vi-56
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:42:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736773"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:42:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:30 -0700
Message-Id: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/18] gcc-package-runtime.inc: Fix QA warning
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:14 -0000

From: Matthew McClintock <msm@freescale.com>

> ERROR: QA Issue: gcc-runtime: Files/directories were installed but not shipped
>   /usr/lib/libgomp.so.1.0.0
>   /usr/lib/libgomp.so.1

Signed-off-by: Matthew McClintock <msm@freescale.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-package-runtime.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index a81e3b7..75847b6 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -64,8 +64,9 @@ FILES_libmudflap-dev = "\
   ${libdir}/libmudflap*.a \
   ${libdir}/libmudflap*.la"
 
+FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
 FILES_libgomp-dev = "\
-  ${libdir}/libgomp*.so \
+  ${libdir}/libgomp*${SOLIBSDEV} \
   ${libdir}/libgomp*.la \
   ${libdir}/libgomp.spec \
   ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
-- 
1.7.7.6



