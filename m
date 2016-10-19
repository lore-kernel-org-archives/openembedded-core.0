Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 99E8371A70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266983"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:52 +0300
Message-Id: <bdf7128cee2f417bff6d92431b49660a49e77281.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/19] vala: update to 0.34.1
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:25 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/vala.inc                           | 2 +-
 meta/recipes-devtools/vala/{vala_0.32.1.bb => vala_0.34.1.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.32.1.bb => vala_0.34.1.bb} (56%)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 34c9db9..afa09ec 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -46,5 +46,5 @@ vapigen_sysroot_preprocess() {
         # up our wrapper.
         sed -i \
            -e "s|vapigen=.*|vapigen=${bindir}/vapigen-wrapper|" \
-           ${SYSROOT_DESTDIR}${datadir}/pkgconfig/vapigen-${SHRT_VER}.pc
+           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
 }
diff --git a/meta/recipes-devtools/vala/vala_0.32.1.bb b/meta/recipes-devtools/vala/vala_0.34.1.bb
similarity index 56%
rename from meta/recipes-devtools/vala/vala_0.32.1.bb
rename to meta/recipes-devtools/vala/vala_0.34.1.bb
index b34086e..a94e621 100644
--- a/meta/recipes-devtools/vala/vala_0.32.1.bb
+++ b/meta/recipes-devtools/vala/vala_0.34.1.bb
@@ -4,5 +4,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
              file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
 "
 
-SRC_URI[md5sum] = "755881770bffac020b5ea5f625fbe528"
-SRC_URI[sha256sum] = "dd0d47e548a34cfb1e4b04149acd082a86414c49057ffb79902eb9a508a161a9"
+SRC_URI[md5sum] = "4c04e73025127e3ae43b968149c96329"
+SRC_URI[sha256sum] = "f5ccfcfc460a0c6797bfbd7e739042bf5988a0f44d82278dbe1880c0e5f29299"
-- 
2.9.3


