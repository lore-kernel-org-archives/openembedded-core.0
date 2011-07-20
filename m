Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDL-0001aO-TV
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753310"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:19 -0700
Message-Id: <e4d86b4e20a9a8dad113fb599272c58657b26450.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 32/50] autotools.bbclass: Add help2man-native to the main DEPENDS tree
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:15 -0000

From: Tom Rini <tom_rini@mentor.com>

With help2man no longer being required by sanity.bbclass we need to
make sure that if we are going to build autotools stuff that help2man
will be there as it's a frequent implicit dependency.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/autotools.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 98c871a..ed5637e 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -5,9 +5,9 @@ def autotools_dep_prepend(d):
 	pn = bb.data.getVar('PN', d, 1)
 	deps = ''
 
-	if pn in ['autoconf-native', 'automake-native']:
+	if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
 		return deps
-	deps += 'autoconf-native automake-native '
+	deps += 'autoconf-native automake-native help2man-native '
 
 	if not pn in ['libtool', 'libtool-native', 'libtool-cross']:
 		deps += 'libtool-native '
-- 
1.7.3.4



