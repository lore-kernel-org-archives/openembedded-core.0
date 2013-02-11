Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U4w0J-0004Xo-5d
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 17:13:19 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Feb 2013 07:57:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="289661765"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.60])
	by fmsmga002.fm.intel.com with ESMTP; 11 Feb 2013 07:56:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 15:56:52 +0000
Message-Id: <1360598212-11812-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] qt4: use system SQLite
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 16:13:20 -0000

We've always been depending on external SQLite, however by default Qt
builds using its own internal copy of SQLite. Add the configure option
to actually use the external SQLite library and make it clearer which
version is in use.

Fixes [YOCTO #2514].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index c1a8387..ab1581e 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -8,7 +8,7 @@ require qt4_arch.inc
 QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
 QT_DISTRO_FLAGS_linuxstdbase = "-sm"
 
-QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite"
+QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite -system-sqlite"
 
 QT_GLFLAGS ?= ""
 
-- 
1.7.10.4



