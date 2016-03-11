Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A82E76486
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:07:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 11 Mar 2016 05:06:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907975066"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 05:06:57 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:22 +0200
Message-Id: <5e5908a4c0db2b74be0427f978d3abbfe16543ff.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
References: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Subject: [RFC PATCH 03/12] matchbox-theme-sato: Upgrade to JKU
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
X-List-Received-Date: Fri, 11 Mar 2016 13:07:19 -0000

Modify the WM theme to more resemble Adwaita (titlebar is thinner,
colors are mostly uniform gray instead of green ).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb | 8 --------
 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb | 8 ++------
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb

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
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
index 0d3569d..d251f0c 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
@@ -1,12 +1,8 @@
 require matchbox-theme-sato.inc
 
-SRCREV = "f72cf4ed7d71ad9e47b0f2d3dbc593bc2f3e76f8"
+SRCREV = "0405ea2e5f5ea3fab12434886c97c592a7e1ce43"
 PV = "0.2+git${SRCPV}"
 
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato"
-
-EXTRA_OECONF += "${@bb.utils.contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
+SRC_URI = "git://github.com/jku/matchbox-sato;branch=gtk3"
 
 S = "${WORKDIR}/git"
-- 
2.1.4


