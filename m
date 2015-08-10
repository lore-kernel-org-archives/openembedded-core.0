Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0269576876
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:07:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Aug 2015 05:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="780435998"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2015 05:06:59 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 15:08:23 +0300
Message-Id: <e308120113bfac371b96eb866dc9c9cd856d9a76.1439204506.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <f3db7c80b857792fb3bd1ee12ffa2d5968a28395.1439204506.git.jussi.kukkonen@intel.com>
References: <f3db7c80b857792fb3bd1ee12ffa2d5968a28395.1439204506.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1439204506.git.jussi.kukkonen@intel.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/5] qmmp: Upgrade 0.8.5 -> 0.8.6
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
X-List-Received-Date: Mon, 10 Aug 2015 12:07:31 -0000

Add a missing runtime dependency.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-qt/qt-apps/{qmmp_0.8.5.bb => qmmp_0.8.6.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-qt/qt-apps/{qmmp_0.8.5.bb => qmmp_0.8.6.bb} (93%)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.8.5.bb b/meta/recipes-qt/qt-apps/qmmp_0.8.6.bb
similarity index 93%
rename from meta/recipes-qt/qt-apps/qmmp_0.8.5.bb
rename to meta/recipes-qt/qt-apps/qmmp_0.8.6.bb
index aa84c46..e68ad0f 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.8.5.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.8.6.bb
@@ -12,9 +12,8 @@ SRC_URI = "http://qmmp.ylsoftware.com/files/${BP}.tar.bz2 \
            file://no-host-paths.patch \
           "
 
-SRC_URI[md5sum] = "c9347ad18913058e8a37b1e88b9c6ce2"
-SRC_URI[sha256sum] = "7fe9347ad6c66e8013b73f2c5cf628037c58151e0cfcb926a8f27b93ad2d7c0d"
-
+SRC_URI[md5sum] = "67e96e89c61b7432e5a12f555db702b1"
+SRC_URI[sha256sum] = "0daea3f0a0df7b34089513c2c57413c82816ab8892bddabf49c18a7956255449"
 inherit cmake qt4x11
 
 QMMP_PLUGIN_OPTIONS ??= "\
@@ -74,4 +73,4 @@ FILES_${PN}-dbg += "\
                 ${libdir}/qmmp/*/.debug/* \
                "
 
-RDEPENDS_${PN} += "taglib alsa-lib libmad curl"
+RDEPENDS_${PN} += "taglib alsa-lib libmad curl libicui18n"
-- 
2.1.4


