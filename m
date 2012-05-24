Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuR-0002x9-Vu
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125505"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:17 -0700
Message-Id: <15c8ea4d35edbcaf03c94aba06ded85851679157.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 06/32] binutils: add embedspu for ppc builds
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
X-List-Received-Date: Thu, 24 May 2012 21:49:28 -0000

From: Saul Wold <sgw@linux.intel.com>

WARNING: For recipe binutils, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/bin/embedspu
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/binutils/binutils.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index e343242..552b808 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -32,6 +32,7 @@ FILES_${PN}-symlinks = " \
 	${bindir}/addr2line \
 	${bindir}/as \
 	${bindir}/c++filt \
+	${bindir}/embedspu \
 	${bindir}/gprof \
 	${bindir}/ld \
 	${bindir}/ld.bfd \
-- 
1.7.9.5



