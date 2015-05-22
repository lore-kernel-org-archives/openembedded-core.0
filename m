Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 641866AB99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 08:37:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 May 2015 01:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,474,1427785200"; d="scan'208";a="496945480"
Received: from gfois-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.27.18])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 01:37:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 09:37:08 +0100
Message-Id: <d4033cadab577972275ffc75c3351242eee90ced.1432283684.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1432283684.git.paul.eggleton@linux.intel.com>
References: <cover.1432283684.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1432283684.git.paul.eggleton@linux.intel.com>
References: <cover.1432283684.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] packagegroup-core-qt4e: make phonon-gstreamer plugin optional
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
X-List-Received-Date: Fri, 22 May 2015 08:37:15 -0000

Having disabled phonon by default in Qt4 we need to ensure this
packagegroup is still buildable when it's not available.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index d4f0fd1..eb5fa1f 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -36,7 +36,6 @@ RDEPENDS_${PN} = " \
 	qt4-embedded-plugin-imageformat-svg \
 	qt4-embedded-plugin-imageformat-tiff \
 	qt4-embedded-plugin-mousedriver-tslib \
-	qt4-embedded-plugin-phonon-backend-gstreamer \
 	qt4-embedded-plugin-script-dbus \
 	qt4-embedded-plugin-sqldriver-sqlite \
 	${TOUCH} \
@@ -48,5 +47,6 @@ RDEPENDS_${PN} = " \
 
 RRECOMMENDS_${PN} = " \
 	libqt-embeddedxmlpatterns4 \
+	qt4-embedded-plugin-phonon-backend-gstreamer \
 "
 
-- 
2.1.0


