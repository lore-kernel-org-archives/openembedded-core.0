Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SL0Eh-0006ny-8Y
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 00:53:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Apr 2012 15:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="134590347"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.104])
	by orsmga002.jf.intel.com with ESMTP; 19 Apr 2012 15:44:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Thu, 19 Apr 2012 15:44:15 -0700
Message-Id: <666234745a81eb0296a16d3fdaad1b44e2e3c568.1334875218.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334875218.git.sgw@linux.intel.com>
References: <cover.1334875218.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334875218.git.sgw@linux.intel.com>
References: <cover.1334875218.git.sgw@linux.intel.com>
Subject: [PATCH 01/10] binutils: add embedspu for ppc builds
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
X-List-Received-Date: Thu, 19 Apr 2012 22:53:59 -0000

WARNING: For recipe binutils, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/bin/embedspu
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/binutils/binutils.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
1.7.7.6



