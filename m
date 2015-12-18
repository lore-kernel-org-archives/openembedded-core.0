Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8560F731BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 15:43:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 18 Dec 2015 07:43:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="710464775"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 18 Dec 2015 07:43:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 17:40:54 +0200
Message-Id: <d5363673abceecae34f9473e5370f081a9cec7ad.1450453089.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/6] gnome-desktop3: update to 3.18.2
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
 .../{gnome-desktop3_3.16.2.bb => gnome-desktop3_3.18.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.16.2.bb => gnome-desktop3_3.18.2.bb} (83%)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
similarity index 83%
rename from meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
rename to meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
index 43546ce..09850d6 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 BPN = "gnome-desktop"
 
 inherit gnome pkgconfig upstream-version-is-even
-SRC_URI[archive.md5sum] = "ab5bf4cc94ad63639f42adcc1542b1f0"
-SRC_URI[archive.sha256sum] = "3a8f196b46eb9dbd3ba2afb8fb5fef6a8825539d449a02181311242e22227bd0"
+SRC_URI[archive.md5sum] = "9a5875247abdb99bad93f1c4230d1d6d"
+SRC_URI[archive.sha256sum] = "ddd46d022de137543a71f50c7392b32f9b98d5d3f2b53040b35f5802de2e7b56"
 
 DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification xkeyboard-config iso-codes"
 
-- 
2.6.2


