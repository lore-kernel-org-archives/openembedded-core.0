Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcU-0000tx-9i
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584258"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:38 -0700
Message-Id: <4ef1737126aaf5dbc64fe26b63a15afb9ea6b3e8.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL [v2] 11/14] gdb: add --with-libexpat-prefix
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
X-List-Received-Date: Tue, 10 Apr 2012 07:36:06 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* otherwise it sometimes finds host's expat

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/gdb/gdb-common.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index a8fca6f..5dd4f74 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -11,7 +11,7 @@ LTTNGUST_mipsel = ""
 LTTNGUST_mips64 = ""
 LTTNGUST_mips64el = ""
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
@@ -36,7 +36,7 @@ B = "${WORKDIR}/build-${TARGET_SYS}"
 
 EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils'"
 
-EXPAT = "--with-expat"
+EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
 
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
-- 
1.7.7.6



