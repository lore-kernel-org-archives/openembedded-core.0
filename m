Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C5E4D772BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480856"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:42 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:48:06 +0200
Message-Id: <f81ed1685c0d4b290c20b56f6d45d54ad89bf94f.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/16] vala: update to 0.34.4
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:42 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/{vala_0.34.3.bb => vala_0.34.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.34.3.bb => vala_0.34.4.bb} (56%)

diff --git a/meta/recipes-devtools/vala/vala_0.34.3.bb b/meta/recipes-devtools/vala/vala_0.34.4.bb
similarity index 56%
rename from meta/recipes-devtools/vala/vala_0.34.3.bb
rename to meta/recipes-devtools/vala/vala_0.34.4.bb
index a1c290a..d1b49ae 100644
--- a/meta/recipes-devtools/vala/vala_0.34.3.bb
+++ b/meta/recipes-devtools/vala/vala_0.34.4.bb
@@ -4,5 +4,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
              file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
 "
 
-SRC_URI[md5sum] = "71181dd25d06b0bedd378dc8fa7d6310"
-SRC_URI[sha256sum] = "f0fad71aca03cdeadf749ca47f56296a4ddd1a25f4e2f09f0ff9e1e3afbcac3f"
+SRC_URI[md5sum] = "a856989d749fc5e472a3592b96f9ca48"
+SRC_URI[sha256sum] = "6b17bd339414563ebc51f64b0b837919ea7552d8a8ffa71cdc837d25c9696b83"
-- 
2.10.2


