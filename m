Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkABn-0008T9-9d
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:30:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2011 00:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,246,1309762800"; d="scan'208";a="31084146"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.1])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2011 00:26:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 00:26:00 -0700
Message-Id: <d38ca77de9df19dc6c14b74f67fc459a24c3fbf5.1311318447.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/16] .gitignore: Update build ignores to have wildcard
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
X-List-Received-Date: Fri, 22 Jul 2011 07:30:27 -0000

From: Kumar Gala <galak@kernel.crashing.org>

ignore not just build/* but any build*/* cases.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .gitignore |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/.gitignore b/.gitignore
index b13086d..d44e729 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,11 +1,11 @@
 *.pyc
 *.pyo
-build/conf/local.conf
-build/conf/bblayers.conf
-build/downloads
-build/tmp/
-build/sstate-cache
-build/pyshtables.py
+build*/conf/local.conf
+build*/conf/bblayers.conf
+build*/downloads
+build*/tmp/
+build*/sstate-cache
+build*/pyshtables.py
 pstage/
 scripts/oe-git-proxy-socks
 sources/
-- 
1.7.3.4



