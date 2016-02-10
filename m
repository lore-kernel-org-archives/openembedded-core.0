Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4EAB1731D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:45:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2016 04:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="45548567"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2016 04:45:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:42:43 +0200
Message-Id: <d3085017da51c3b9027cfa607c28f0e722bdbced.1455107972.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/7] libwnck3: update to 3.14.1
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
X-List-Received-Date: Wed, 10 Feb 2016 12:45:57 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libwnck/{libwnck3_3.14.0.bb => libwnck3_3.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libwnck/{libwnck3_3.14.0.bb => libwnck3_3.14.1.bb} (77%)

diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb b/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
similarity index 77%
rename from meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
rename to meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
index 3ee1ae9..97d6b88 100644
--- a/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
+++ b/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
@@ -11,8 +11,8 @@ PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
 inherit gnomebase
-SRC_URI[archive.md5sum] = "4538672e0d775fadedf10abeb8020047"
-SRC_URI[archive.sha256sum] = "f5080076346609b4c36394b879f3a86b92ced3b90a37cb54c8e9a14f00e7921c"
+SRC_URI[archive.md5sum] = "d96c0b74c4dc5fdae758964098603c90"
+SRC_URI[archive.sha256sum] = "bb643c9c423c8aa79c59973ce27ce91d3b180d1e9907902278fb79391f52befa"
 
 inherit distro_features_check
 # libxres means x11 only
-- 
2.7.0


