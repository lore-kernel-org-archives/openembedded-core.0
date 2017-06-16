Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BC10B784D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279595"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:13 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:48 +0300
Message-Id: <4c18906737c964851be21becb0b199a027541e2c.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 25/32] vala: upgrade to 0.36.3
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:29 -0000

From: Upgrade Helper <auh@auh.yoctoproject.org>

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/{vala_0.36.2.bb => vala_0.36.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.36.2.bb => vala_0.36.3.bb} (56%)

diff --git a/meta/recipes-devtools/vala/vala_0.36.2.bb b/meta/recipes-devtools/vala/vala_0.36.3.bb
similarity index 56%
rename from meta/recipes-devtools/vala/vala_0.36.2.bb
rename to meta/recipes-devtools/vala/vala_0.36.3.bb
index 9cea5b6a795..e5707c88434 100644
--- a/meta/recipes-devtools/vala/vala_0.36.2.bb
+++ b/meta/recipes-devtools/vala/vala_0.36.3.bb
@@ -4,5 +4,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
              file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
 "
 
-SRC_URI[md5sum] = "481774eb4f0f5aa6987e5ea30a0aea31"
-SRC_URI[sha256sum] = "863dbfb399d59289dfc34379c0cd34d94e505a49787497550588810310cdf689"
+SRC_URI[md5sum] = "ff093f46e1d2e0b179543ec43cf27d76"
+SRC_URI[sha256sum] = "ac8a4ecd01f62d0c5f62ba50b7290d8c5a1edb308eec772a65b8e79be68f061c"
-- 
2.11.0


