Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 78812731A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:34:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Jul 2016 07:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,346,1464678000"; d="scan'208";a="1004642463"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2016 07:34:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 17:33:49 +0300
Message-Id: <1468247633-24172-4-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/8] libwnck3: upgrade to 3.20.1
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
X-List-Received-Date: Mon, 11 Jul 2016 14:34:51 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libwnck/{libwnck3_3.14.1.bb => libwnck3_3.20.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libwnck/{libwnck3_3.14.1.bb => libwnck3_3.20.1.bb} (77%)

diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb b/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
similarity index 77%
rename from meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
rename to meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
index 6f09533..d3c3a86 100644
--- a/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
+++ b/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
@@ -11,8 +11,8 @@ PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
 inherit gnomebase gobject-introspection
-SRC_URI[archive.md5sum] = "d96c0b74c4dc5fdae758964098603c90"
-SRC_URI[archive.sha256sum] = "bb643c9c423c8aa79c59973ce27ce91d3b180d1e9907902278fb79391f52befa"
+SRC_URI[archive.md5sum] = "487938d65d4bfae1f2501052b1bd7492"
+SRC_URI[archive.sha256sum] = "1cb03716bc477058dfdf3ebfa4f534de3b13b1aa067fcd064d0b7813291cba72"
 
 inherit distro_features_check
 # libxres means x11 only
-- 
2.8.1


