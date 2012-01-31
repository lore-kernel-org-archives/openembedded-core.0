Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rs5EL-0003hm-GE
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 05:22:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2012 20:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112282302"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.89])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2012 20:13:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 20:13:47 -0800
Message-Id: <a12872bdf2ee18e2cb9cae741f35a7882054db08.1327980240.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/19] gdb-common: Drop elfutils from DEPENDS
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
X-List-Received-Date: Tue, 31 Jan 2012 04:24:51 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index d728139..930a71b 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "gdb - GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE="GPLv3+"
 SECTION = "devel"
-DEPENDS = "ncurses readline elfutils ${LTTNGUST}"
+DEPENDS = "ncurses readline ${LTTNGUST}"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-uclibc = ""
@@ -11,7 +11,7 @@ LTTNGUST_mipsel = ""
 LTTNGUST_mips64 = ""
 LTTNGUST_mips64el = ""
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
@@ -40,7 +40,7 @@ EXPAT = "--without-expat"
 
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
-                ${GDBPROPREFIX} --with-libelf=${STAGING_DIR_TARGET} ${EXPAT} \
+                ${GDBPROPREFIX} ${EXPAT} \
                 ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
                "
 
-- 
1.7.6.5



