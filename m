Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7757D60851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 15:43:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 18 Dec 2015 07:43:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="710464766"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 18 Dec 2015 07:43:22 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 17:40:53 +0200
Message-Id: <88e61e43fbf0f96fab16c63dcd9089f457785db2.1450453089.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/6] gcr: update to 3.18.0
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
X-List-Received-Date: Fri, 18 Dec 2015 15:43:43 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gcr/{gcr_3.16.0.bb => gcr_3.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gcr/{gcr_3.16.0.bb => gcr_3.18.0.bb} (79%)

diff --git a/meta/recipes-gnome/gcr/gcr_3.16.0.bb b/meta/recipes-gnome/gcr/gcr_3.18.0.bb
similarity index 79%
rename from meta/recipes-gnome/gcr/gcr_3.16.0.bb
rename to meta/recipes-gnome/gcr/gcr_3.18.0.bb
index e50b3a8..0636afe 100644
--- a/meta/recipes-gnome/gcr/gcr_3.16.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.18.0.bb
@@ -11,8 +11,8 @@ inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "d5835680be0b6a838e02a528d5378d9c"
-SRC_URI[archive.sha256sum] = "ecfe8df41cc88158364bb15addc670b11e539fe844742983629ba2323888d075"
+SRC_URI[archive.md5sum] = "b959bac99e17c9bb0990a15c9be11aed"
+SRC_URI[archive.sha256sum] = "d4d16da5af55148a694055835ccd07ad34daf0ad03bdad929bf7cad15637ce00"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.6.2


