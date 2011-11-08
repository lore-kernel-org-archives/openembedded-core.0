Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNF-0003DL-LP
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:10 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146541"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:42 -0800
Message-Id: <82d280c1dada75960dc5b6750d8bf1d1a752bb15.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 05/12] mx: add mx toolkit 1.3.2
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:10 -0000

A widget toolkit built on Clutter

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/mx/mx_1.3.2.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/mx/mx_1.3.2.bb

diff --git a/meta/recipes-graphics/mx/mx_1.3.2.bb b/meta/recipes-graphics/mx/mx_1.3.2.bb
new file mode 100644
index 0000000..695249b
--- /dev/null
+++ b/meta/recipes-graphics/mx/mx_1.3.2.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Clutter based widget library"
+LICENSE = "LGPLv2.1"
+PR = "r1"
+
+DEPENDS = "clutter-1.8"
+
+inherit autotools
+
+SRC_URI = "http://source.clutter-project.org/sources/mx/1.3/mx-${PV}.tar.bz2"
+SRC_URI[md5sum] = "6057f3403d1109191dc7ef492bae5867"
+SRC_URI[sha256sum] = "94fd2b307b204945643af1e3193a2a7be96712f9296cf0e525f5fd7538f85513"
+
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
+                    file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
+
+EXTRA_OECONF = "--disable-introspection --disable-gtk-widgets"
+
-- 
1.7.7



