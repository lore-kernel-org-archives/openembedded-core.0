Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLj-0003im-Uh
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8299026"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:46 -0700
Message-Id: <cf8ef471d9620011e52462a84962b7f7ebf4e128.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: [CONSOLIDATED PULL 10/13] sqlite: remove dependency on tcl-native
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:16 -0000

From: Phil Blundell <pb@pbcl.net>

Older versions of sqlite required tclsh at compile time but this is no longer
the case with recent 3.7.x.

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/003653.html

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-support/sqlite/sqlite3.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index d8ef8dc..939df14 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "An Embeddable SQL Database Engine"
 HOMEPAGE = "http://www.sqlite.org"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "readline ncurses tcl-native"
-DEPENDS_virtclass-native = "tcl-native"
+DEPENDS = "readline ncurses"
+DEPENDS_virtclass-native = ""
 LICENSE = "PD"
 
 inherit autotools pkgconfig
-- 
1.7.3.4



