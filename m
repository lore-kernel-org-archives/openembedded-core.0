Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9F72E773AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220189"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:33 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:29 +0200
Message-Id: <c3045e867886525147d2840b5276d4736c7ab603.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/19] gtk+3: update to 3.18.8
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:22 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.18.6.bb => gtk+3_3.18.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.18.6.bb => gtk+3_3.18.8.bb} (83%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.18.6.bb b/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb
similarity index 83%
rename from meta/recipes-gnome/gtk+/gtk+3_3.18.6.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb
index 0ea4fd3..b76c0cc 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.18.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://Do-not-try-to-initialize-GL-without-libGL.patch \
           "
 
-SRC_URI[md5sum] = "e1c41ad4a6012d703a80f7423acf186e"
-SRC_URI[sha256sum] = "78cabf0fd5a662f8723f62d5ac633072c76c557c1d700454c9c3deaa37e441ef"
+SRC_URI[md5sum] = "9671acb41dc13561d19233f1a75cf184"
+SRC_URI[sha256sum] = "1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.7.0


