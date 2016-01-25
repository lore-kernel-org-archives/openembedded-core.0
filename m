Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D66D4770F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143948"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:20 +0200
Message-Id: <15c87c283ed5cd76c49f529c469004e44500bba4.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/16] gtk+3: update to 3.18.6
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:46 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.18.2.bb => gtk+3_3.18.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.18.2.bb => gtk+3_3.18.6.bb} (83%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.18.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.18.6.bb
similarity index 83%
rename from meta/recipes-gnome/gtk+/gtk+3_3.18.2.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.18.6.bb
index 46f0cf9..0ea4fd3 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.18.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.18.6.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://Do-not-try-to-initialize-GL-without-libGL.patch \
           "
 
-SRC_URI[md5sum] = "230fd78e42419d35ff790784b457e5f2"
-SRC_URI[sha256sum] = "5dbec561c4a00070073bf9cf4cfdd61fab4a14c8ff5b15d700bd378f8185e152"
+SRC_URI[md5sum] = "e1c41ad4a6012d703a80f7423acf186e"
+SRC_URI[sha256sum] = "78cabf0fd5a662f8723f62d5ac633072c76c557c1d700454c9c3deaa37e441ef"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.7.0.rc3


