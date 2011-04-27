Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEN-0005Nz-BS
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2011 00:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="739028418"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2011 00:29:43 -0700
Message-Id: <6a41caf508d20fbb1d084e09968780c86212dde2.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 23:53:44 -0700
Date: Wed, 27 Apr 2011  0:29:43 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 22/52] sstate.bbclass: Reduce SSTATE_MANIFESTS assignment to be weak
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:15 -0000

From: Khem Raj <raj.khem@gmail.com>

Distributions can then override this variable if needed
useful e.g. when building uclibc/eglibc both using
same tmpdir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index be650c4..553c6a2 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,6 +1,6 @@
 SSTATE_VERSION = "2"
 
-SSTATE_MANIFESTS = "${TMPDIR}/sstate-control"
+SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEBASE = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANFILEBASE}${PN}"
 
-- 
1.7.1.1



