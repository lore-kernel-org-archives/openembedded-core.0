Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 90215719C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:15:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 17 Oct 2016 08:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="180649410"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2016 08:15:46 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 18:12:58 +0300
Message-Id: <7d590bbcc077bfe94b5ef030571af5bcaf02182b.1476716907.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/23] libuser: do not depend on SGML stack
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
X-List-Received-Date: Mon, 17 Oct 2016 15:15:43 -0000

libuser tarballs already supply pre-generated html/txt outputs.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/libuser/libuser_0.62.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb b/meta/recipes-extended/libuser/libuser_0.62.bb
index 3d0b516..6960d71 100644
--- a/meta/recipes-extended/libuser/libuser_0.62.bb
+++ b/meta/recipes-extended/libuser/libuser_0.62.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
 SRC_URI[md5sum] = "63e5e5c551e99dc5302b40b80bd6d4f2"
 SRC_URI[sha256sum] = "a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3cace20b"
 
-DEPENDS = "popt libpam glib-2.0 docbook-utils-native linuxdoc-tools-native python3"
+DEPENDS = "popt libpam glib-2.0 python3"
 
 inherit autotools gettext python3native python3-dir pkgconfig gtk-doc
 
-- 
2.9.3


