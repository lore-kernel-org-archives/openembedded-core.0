Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVf-0001is-9C
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2011 22:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="433404957"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 22:26:20 -0700
Message-Id: <2a89d3090044d90208c608d5f05511c03a7ca48e.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 13:16:43 -0500
Date: Mon, 09 May 2011 22:26:19 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 13/30] readline: update version
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
X-List-Received-Date: Tue, 10 May 2011 05:29:27 -0000

From: Adrian Alonso <aalonso@secretlab.ca>

* Readline new recipe version 6.2

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/recipes-core/readline/readline_6.2.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/readline/readline_6.2.bb

diff --git a/meta/recipes-core/readline/readline_6.2.bb b/meta/recipes-core/readline/readline_6.2.bb
new file mode 100644
index 0000000..5e32bb5
--- /dev/null
+++ b/meta/recipes-core/readline/readline_6.2.bb
@@ -0,0 +1,6 @@
+require readline.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "67948acb2ca081f23359d0256e9a271c"
+SRC_URI[sha256sum] = "79a696070a058c233c72dd6ac697021cc64abd5ed51e59db867d66d196a89381"
-- 
1.7.1.1



