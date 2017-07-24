Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBDF782E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 14:31:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 07:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,407,1496127600"; d="scan'208";a="1198786917"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2017 07:31:30 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 17:28:11 +0300
Message-Id: <20170724142818.44403-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/11] epiphany: upgrade to 3.24.3
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
X-List-Received-Date: Mon, 24 Jul 2017 14:31:40 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-gnome/epiphany/{epiphany_3.24.2.bb => epiphany_3.24.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.24.2.bb => epiphany_3.24.3.bb} (84%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.24.3.bb
similarity index 84%
rename from meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.24.3.bb
index dafad8a7938..c507d23ae93 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.24.3.bb
@@ -12,8 +12,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch \
             file://0001-bookmarks-Check-for-return-value-of-fread.patch \
            "
-SRC_URI[archive.md5sum] = "e035dc6f64f0c1909de823e03f16b2f3"
-SRC_URI[archive.sha256sum] = "5abc0d0c60591df5236ac9b8979dc9f7d9acbb8ad0902b4772d2b7beea81c58d"
+SRC_URI[archive.md5sum] = "c0221aec6a08935e6854eaa9de9451ef"
+SRC_URI[archive.sha256sum] = "fef51676310d9f37e18c9b2d778254232eb17cccd988c2d1ecf42c7b2963a154"
 
 EXTRA_OECONF += " --with-distributor-name=${DISTRO} --enable-debug=no"
 
-- 
2.13.2


