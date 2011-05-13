Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QKswz-000674-CF
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 16:02:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2011 06:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,364,1301900400"; 
   d="scan'208";a="1814926"
Received: from unknown (HELO helios) ([10.255.16.107])
	by fmsmga001.fm.intel.com with SMTP; 13 May 2011 06:59:46 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 13 May 2011 14:59:45 +0100
Message-Id: <8e2a54d05b21f33bd2249bab21343c25170ffc83.1305295079.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1305295079.git.paul.eggleton@linux.intel.com>
References: <cover.1305295079.git.paul.eggleton@linux.intel.com>
Old-Date: Fri, 13 May 2011 14:28:13 +0100
Date: Fri, 13 May 2011 14:59:45 +0100
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] qt4: split out SQL driver config flags to QT_SQL_DRIVER_FLAGS
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
X-List-Received-Date: Fri, 13 May 2011 14:02:42 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This allows meta-oe to override these options easily in order to enable more
SQL driver plugins.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index b86f89f..7e15b61 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -9,11 +9,13 @@ QT_ENDIAN = "${@qt_endian(d)}"
 QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
 QT_DISTRO_FLAGS_linuxstdbase = "-sm"
 
+QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite"
+
 QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -shared -no-nas-sound -no-nis \
                     -qt-gif -system-libjpeg -system-libpng -system-zlib \
-                    -no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite \
                     -no-pch -qdbus -stl -glib -phonon -webkit \
+                    ${QT_SQL_DRIVER_FLAGS} \
                     ${QT_DISTRO_FLAGS} "
 
 EXTRA_OEMAKE = "-e"
-- 
1.7.4.4



