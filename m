Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F2E617326E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 13:23:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2016 05:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,557,1444719600"; d="scan'208";a="888877482"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2016 05:23:18 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 15:20:27 +0200
Message-Id: <552e7c7d720af5a22008fee4b2e5a28a89e365e8.1452604534.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/5] epiphany: upgrade to 3.18.3
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
X-List-Received-Date: Tue, 12 Jan 2016 13:23:18 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-gnome/epiphany/{epiphany_3.18.2.bb => epiphany_3.18.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.18.2.bb => epiphany_3.18.3.bb} (84%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.18.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.18.3.bb
similarity index 84%
rename from meta/recipes-gnome/epiphany/epiphany_3.18.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.18.3.bb
index a0d1e67..e822d3b 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.18.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.18.3.bb
@@ -10,8 +10,8 @@ inherit gnomebase gsettings distro_features_check upstream-version-is-even
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
-SRC_URI[archive.md5sum] = "ede1e5e7e420a2f4c6231d185a94250f"
-SRC_URI[archive.sha256sum] = "8436170731966bb40b7d8e29dbedfa5d5ddbf78572cf5fd51fce1ac6da5da6c2"
+SRC_URI[archive.md5sum] = "5ed8b4506666f301949a2e12d39f2b4d"
+SRC_URI[archive.sha256sum] = "cd4e9ce588c4c66109547d93999d9740d338c3f9dbfbc2143cf2cbb74260def9"
 
 EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
 
-- 
2.6.4


