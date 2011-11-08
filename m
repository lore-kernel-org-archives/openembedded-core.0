Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNF-0003Cy-5v
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146540"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:41 -0800
Message-Id: <49ddb74e47c9f09b36e8a54cca146f2ff94847e9.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 04/12] clutter-gtk-1.8: add clutter-gtk 0.11.4
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:09 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../clutter/clutter-gtk-1.8_0.11.4.bb              |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.8_0.11.4.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.8_0.11.4.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.8_0.11.4.bb
new file mode 100644
index 0000000..0885ce1
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.8_0.11.4.bb
@@ -0,0 +1,11 @@
+require recipes-graphics/clutter/clutter-gtk.inc
+
+SRC_URI = "http://source.clutter-project.org/sources/clutter-gtk/0.11/clutter-gtk-${PV}.tar.bz2"
+SRC_URI[md5sum] = "8b88cfcb0358ecfe3e9228efd55f7ebc"
+SRC_URI[sha256sum] = "58d5b027c4589ff442d820f624d7991e25cbeaab795b05f2df2e4c7bc1af2cf6"
+
+DEPENDS += "clutter-1.8"
+
+inherit gettext
+
+S = "${WORKDIR}/clutter-gtk-${PV}"
\ No newline at end of file
-- 
1.7.7



