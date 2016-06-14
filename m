Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 245236FF3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718727679"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:02 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:25 +0300
Message-Id: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 01/30] matchbox-theme-sato: Upgrade to 0.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jun 2016 08:15:05 -0000

New theme is tries to be more compatible with Adwaita: titlebar is
thinner, colors are mostly uniform gray instead of green.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../matchbox-theme-sato/matchbox-theme-sato_0.1.bb           |  8 --------
 .../matchbox-theme-sato/matchbox-theme-sato_0.2.bb           |  7 +++++++
 .../matchbox-theme-sato/matchbox-theme-sato_git.bb           | 12 ------------
 3 files changed, 7 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb
 create mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb

diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb
deleted file mode 100644
index f6786dd..0000000
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require matchbox-theme-sato.inc
-
-PR = "r1"
-
-SRC_URI = "http://pokylinux.org/releases/sato/matchbox-theme-sato-0.1.tar.gz"
-
-SRC_URI[md5sum] = "72ae272ef7803141a3dcb69e670cff97"
-SRC_URI[sha256sum] = "5b59f9646edbfb907a309332db3bd6fa7080dc1fe24df549480cfae7d974a3fb"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
new file mode 100644
index 0000000..8fc6bb3
--- /dev/null
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
@@ -0,0 +1,7 @@
+require matchbox-theme-sato.inc
+
+# SRCREV tagged 0.2
+SRCREV = "df085ba9cdaeaf2956890b0e29d7ea1779bf6c78"
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato"
+
+S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
deleted file mode 100644
index 0d3569d..0000000
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require matchbox-theme-sato.inc
-
-SRCREV = "f72cf4ed7d71ad9e47b0f2d3dbc593bc2f3e76f8"
-PV = "0.2+git${SRCPV}"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato"
-
-EXTRA_OECONF += "${@bb.utils.contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
-
-S = "${WORKDIR}/git"
-- 
2.1.4


