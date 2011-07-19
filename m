Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3W-0001ds-SF
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396942"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:50:59 -0700
Message-Id: <25609d6e907ea770dfb09f40a8ee5f8a1001caf7.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/22] libcap: pass prefix to "make install"
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:52 -0000

From: Phil Blundell <philb@gnu.org>

Otherwise it will use /usr by default which may not be the right place.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-support/libcap/libcap.inc     |    2 +-
 meta/recipes-support/libcap/libcap_2.20.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 3bff3b9..efa46d6 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -29,7 +29,7 @@ do_compile() {
 }
 
 do_install() {
-	oe_runmake install DESTDIR="${D}"
+	oe_runmake install DESTDIR="${D}" prefix="${prefix}"
 }
 
 # pam files
diff --git a/meta/recipes-support/libcap/libcap_2.20.bb b/meta/recipes-support/libcap/libcap_2.20.bb
index c9741c2..a2b49c6 100644
--- a/meta/recipes-support/libcap/libcap_2.20.bb
+++ b/meta/recipes-support/libcap/libcap_2.20.bb
@@ -1,6 +1,6 @@
 require libcap.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "10e47ed32ca2214eb0e58780282d27b4"
 SRC_URI[sha256sum] = "20e7c1ea4d3d5c410efb3a6ff138dc417912fae316d883460dcd58d9803a9220"
-- 
1.7.3.4



