Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4D09C76DFF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:17:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2015 05:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="550250999"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2015 05:17:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 15:18:53 +0300
Message-Id: <e4bf032034a3c1b780834d9e509b6d2c0bdd7fff.1440763946.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/8] libnotify: don't inherit unnecessary distro_features_check
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
X-List-Received-Date: Fri, 28 Aug 2015 12:17:47 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
index 5d7b4ce..c5788c8 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "dbus gtk+3 dbus-glib"
 
-inherit gnomebase distro_features_check gtk-doc
+inherit gnomebase gtk-doc
 
 SRC_URI[archive.md5sum] = "a4997019d08f46f3bf57b78e6f795a59"
 SRC_URI[archive.sha256sum] = "0ef61ca400d30e28217979bfa0e73a7406b19c32dd76150654ec5b2bdf47d837"
-- 
2.1.4


