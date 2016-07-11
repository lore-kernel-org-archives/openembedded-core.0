Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A97D973169
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:34:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Jul 2016 07:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,346,1464678000"; d="scan'208";a="1004642484"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2016 07:34:53 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 17:33:50 +0300
Message-Id: <1468247633-24172-5-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/8] epiphany: update to 3.20.3
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
X-List-Received-Date: Mon, 11 Jul 2016 14:34:52 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-gnome/epiphany/{epiphany_3.18.4.bb => epiphany_3.20.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.18.4.bb => epiphany_3.20.3.bb} (84%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
similarity index 84%
rename from meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
index f0582ac..eba480b 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
@@ -10,8 +10,8 @@ inherit gnomebase gsettings distro_features_check upstream-version-is-even
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
-SRC_URI[archive.md5sum] = "172b78256100e8d3c629764abd0e1495"
-SRC_URI[archive.sha256sum] = "be699d484371111abae754e669187215df73e21533f461e513b79537d7a1c1c1"
+SRC_URI[archive.md5sum] = "31822b6b199f724f212ae9200bc055f1"
+SRC_URI[archive.sha256sum] = "4d9de1bdb44c14adf25aa6dc02ea3de60925cff5eb01fe89545e6032c9b424a2"
 
 EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
 
-- 
2.8.1


