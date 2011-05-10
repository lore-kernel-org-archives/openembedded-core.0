Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVd-0001is-J7
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2011 22:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="433404927"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 22:26:17 -0700
Message-Id: <18c640de3882d433b92a9e169856347ca2b8dd26.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 11:27:55 -0500
Date: Mon, 09 May 2011 22:26:17 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 08/30] kernel-arch: add microblaze to valid archs
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
X-List-Received-Date: Tue, 10 May 2011 05:29:26 -0000

From: Adrian Alonso <aalonso@secretlab.ca>

* Add Microblaze target to valid arch list definition

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/classes/kernel-arch.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index d6ae2e7..692d4fb 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -12,7 +12,8 @@ valid_archs = "alpha cris ia64 \
                m32r mips \
 	       sh sh64 um h8300   \
 	       parisc s390  v850 \
-	       avr32 blackfin"
+	       avr32 blackfin \
+              microblaze"
 
 def map_kernel_arch(a, d):
 	import re
-- 
1.7.1.1



