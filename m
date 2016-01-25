Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C5D6C7706E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143892"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:50 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:13 +0200
Message-Id: <1a62793778958c9607d1d4af59d6bab23589a623.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/16] gcr: check only even upstream versions
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:43 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.18.0.bb b/meta/recipes-gnome/gcr/gcr_3.18.0.bb
index 0636afe..ed6e8c4 100644
--- a/meta/recipes-gnome/gcr/gcr_3.18.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.18.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt vala"
 
-inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check
+inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.7.0.rc3


