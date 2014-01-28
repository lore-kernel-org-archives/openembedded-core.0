Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 78AA46EA3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 21:53:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jan 2014 13:53:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,738,1384329600"; d="scan'208";a="472249605"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.109])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2014 13:53:46 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 13:53:45 -0800
Message-Id: <1390946025-14369-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] pkgconfig: finish removing glibconfig-sysdefs.h as unused now
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
X-List-Received-Date: Tue, 28 Jan 2014 21:53:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb | 1 -
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
index 6a17d7a..3070da9 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
@@ -1,7 +1,6 @@
 require pkgconfig.inc
 
 SRC_URI += " \
-            file://glibconfig-sysdefs.h \
             file://pkg-config-native.in \
             file://fix-glib-configure-libtool-usage.patch \
             file://obsolete_automake_macros.patch \
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index cc0814b..9bfb59f 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -2,7 +2,7 @@ require pkgconfig.inc
 
 SRC_URI = "git://anongit.freedesktop.org/pkg-config \
            file://autofoo.patch \
-           file://glibconfig-sysdefs.h"
+          "
 
 S = "${WORKDIR}/git/"
 
-- 
1.8.3.1


