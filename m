Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddbx-0005NT-2z
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:45 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233736"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:11 -0800
Message-Id: <3282c5844ddce4bd7c79f3ff38a2d52cd9327a61.1324540322.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/26] mc: Add version 4.8.1 now GPLv3
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mc/mc_4.8.1.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/mc/mc_4.8.1.bb

diff --git a/meta/recipes-extended/mc/mc_4.8.1.bb b/meta/recipes-extended/mc/mc_4.8.1.bb
new file mode 100644
index 0000000..de7fe7a
--- /dev/null
+++ b/meta/recipes-extended/mc/mc_4.8.1.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Midnight Commander is an ncurses based file manager."
+HOMEPAGE = "http://www.midnight-commander.org/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
+SECTION = "console/utils"
+DEPENDS = "ncurses glib-2.0"
+RDEPENDS_${PN} = "ncurses-terminfo"
+
+PR = "r0"
+
+SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "7d60c87d87b359831d976fa28034935e"
+SRC_URI[sha256sum] = "8f9bd09750c65a7786197a8f7e5a10a6dabf8c8737c564079ca393d8ecaf944d"
+
+inherit autotools gettext
+
+EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --without-samba"
+
+FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
+
+do_install_append () {
+	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
+	rm -rf ${D}${libdir}
+}
-- 
1.7.6.4



