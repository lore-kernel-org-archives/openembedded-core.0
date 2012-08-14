Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCC-0000Xj-II
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Aug 2012 05:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181052"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:13:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:12:49 +0300
Message-Id: <746f655732c574acb3e39dd2510ed0ba761e6a42.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 02/64] rxvt-unicode: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:04 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
index 1f144e6..69ef25d 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
@@ -23,8 +23,8 @@ SRC_URI[sha256sum] = "ec1aa2932da844979ed8140bd92223defb12042aa5e877e05ac31139ca
 inherit autotools update-alternatives
 
 PROVIDES = "virtual/x-terminal-emulator"
-ALTERNATIVE_NAME = "x-terminal-emulator"
-ALTERNATIVE_PATH = "${bindir}/rxvt"
+ALTERNATIVE_${PN} = "x-terminal-emulator"
+ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"
 
 CFLAGS_append = " -fpermissive"
 
-- 
1.7.7.6



