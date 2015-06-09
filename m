Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99EC47422B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:51:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t59Eq0bi015182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:52:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:52:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:53 -0700
Message-ID: <6801473acf79a3b2f6e4950231be7f15475a1b2b.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/12] qmmp: 0.7.7 -> 0.8.5
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:04 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../qt-apps/{qmmp_0.7.7.bb => qmmp_0.8.5.bb}       |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-qt/qt-apps/{qmmp_0.7.7.bb => qmmp_0.8.5.bb} (92%)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.7.7.bb b/meta/recipes-qt/qt-apps/qmmp_0.8.5.bb
similarity index 92%
rename from meta/recipes-qt/qt-apps/qmmp_0.7.7.bb
rename to meta/recipes-qt/qt-apps/qmmp_0.8.5.bb
index 9725b42..aa84c46 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.7.7.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.8.5.bb
@@ -8,12 +8,12 @@ SECTION = "multimedia"
 
 DEPENDS = "taglib libmad libvorbis libogg alsa-lib libsndfile1 libsamplerate0 curl"
 
-SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "http://qmmp.ylsoftware.com/files/${BP}.tar.bz2 \
            file://no-host-paths.patch \
           "
 
-SRC_URI[md5sum] = "9376b5d535ed540e97bdff79b42607ae"
-SRC_URI[sha256sum] = "dda66bf60121a8a2cb7175b16b3b948099f8c119ee9a11c671555e8c38caa387"
+SRC_URI[md5sum] = "c9347ad18913058e8a37b1e88b9c6ce2"
+SRC_URI[sha256sum] = "7fe9347ad6c66e8013b73f2c5cf628037c58151e0cfcb926a8f27b93ad2d7c0d"
 
 inherit cmake qt4x11
 
-- 
1.7.9.5


