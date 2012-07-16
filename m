Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhV-0006t0-05
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443373"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:32 -0700
Message-Id: <ed9da50b365aa329aef657d98e98fa559c146da3.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/30] base.bbclass: add GNUmakefile to the list of possible makefile names
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:09 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 08065c6..f691799 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -280,7 +280,7 @@ base_do_configure() {
 addtask compile after do_configure
 do_compile[dirs] = "${S} ${B}"
 base_do_compile() {
-	if [ -e Makefile -o -e makefile ]; then
+	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
 		oe_runmake || die "make failed"
 	else
 		bbnote "nothing to compile"
-- 
1.7.7.6



