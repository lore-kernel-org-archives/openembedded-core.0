Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EDB06731C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 15:43:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 18 Dec 2015 07:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="710464812"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 18 Dec 2015 07:43:27 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 17:40:57 +0200
Message-Id: <6643cb1cbca7a33371bf0bebbee11910f3f8a4c5.1450453089.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/6] epiphany: update to 3.18.2
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
 .../recipes-gnome/epiphany/{epiphany_3.16.3.bb => epiphany_3.18.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.16.3.bb => epiphany_3.18.2.bb} (84%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.18.2.bb
similarity index 84%
rename from meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.18.2.bb
index 09633a6..a0d1e67 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.18.2.bb
@@ -10,8 +10,8 @@ inherit gnomebase gsettings distro_features_check upstream-version-is-even
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
-SRC_URI[archive.md5sum] = "3296af4532b8019775f4b40d21a341ae"
-SRC_URI[archive.sha256sum] = "d527f1770779ec22d955aeb13b148a846a26144e433ff0480c981af80e2390b1"
+SRC_URI[archive.md5sum] = "ede1e5e7e420a2f4c6231d185a94250f"
+SRC_URI[archive.sha256sum] = "8436170731966bb40b7d8e29dbedfa5d5ddbf78572cf5fd51fce1ac6da5da6c2"
 
 EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
 
-- 
2.6.2


