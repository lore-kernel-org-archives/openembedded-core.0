Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 504FF782D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 14:32:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 07:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,407,1496127600"; d="scan'208";a="1198787080"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2017 07:32:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 17:28:13 +0300
Message-Id: <20170724142818.44403-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/11] vala: upgrade to 0.36.4
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
X-List-Received-Date: Mon, 24 Jul 2017 14:32:14 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/{vala_0.36.3.bb => vala_0.36.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.36.3.bb => vala_0.36.4.bb} (56%)

diff --git a/meta/recipes-devtools/vala/vala_0.36.3.bb b/meta/recipes-devtools/vala/vala_0.36.4.bb
similarity index 56%
rename from meta/recipes-devtools/vala/vala_0.36.3.bb
rename to meta/recipes-devtools/vala/vala_0.36.4.bb
index e5707c88434..51000d9e126 100644
--- a/meta/recipes-devtools/vala/vala_0.36.3.bb
+++ b/meta/recipes-devtools/vala/vala_0.36.4.bb
@@ -4,5 +4,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
              file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
 "
 
-SRC_URI[md5sum] = "ff093f46e1d2e0b179543ec43cf27d76"
-SRC_URI[sha256sum] = "ac8a4ecd01f62d0c5f62ba50b7290d8c5a1edb308eec772a65b8e79be68f061c"
+SRC_URI[md5sum] = "3c19014093f1a3d995357253b463082c"
+SRC_URI[sha256sum] = "e9f23ce711c1a72ce664d10946fbc5953f01b0b7f2a3562e7a01e362d86de059"
-- 
2.13.2


