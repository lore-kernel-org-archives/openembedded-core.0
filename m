Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 111746FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:01:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 07:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="975020339"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 07:01:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 17:00:50 +0300
Message-Id: <a7b81da27a3ef38a6d70f264d00ad72fc3c45ac4.1464271067.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/6] gcr: upgrade to 3.20.0
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
X-List-Received-Date: Thu, 26 May 2016 14:01:15 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gcr/{gcr_3.18.0.bb => gcr_3.20.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gcr/{gcr_3.18.0.bb => gcr_3.20.0.bb} (89%)

diff --git a/meta/recipes-gnome/gcr/gcr_3.18.0.bb b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
similarity index 89%
rename from meta/recipes-gnome/gcr/gcr_3.18.0.bb
rename to meta/recipes-gnome/gcr/gcr_3.20.0.bb
index 35dadbe..bcce57d 100644
--- a/meta/recipes-gnome/gcr/gcr_3.18.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
@@ -11,8 +11,8 @@ inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check upstrea
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "b959bac99e17c9bb0990a15c9be11aed"
-SRC_URI[archive.sha256sum] = "d4d16da5af55148a694055835ccd07ad34daf0ad03bdad929bf7cad15637ce00"
+SRC_URI[archive.md5sum] = "4314bf89eac293dd0a9d806593ff1b35"
+SRC_URI[archive.sha256sum] = "90572c626d8a708225560c42b4421f7941315247fa1679d4ef569bde7f4bb379"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.8.1


