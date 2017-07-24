Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EDFB1782DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 14:33:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 07:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,407,1496127600"; d="scan'208";a="1198787449"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2017 07:33:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 17:28:17 +0300
Message-Id: <20170724142818.44403-10-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/11] webkitgtk: update to 2.16.6
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
X-List-Received-Date: Mon, 24 Jul 2017 14:33:26 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/{webkitgtk_2.16.5.bb => webkitgtk_2.16.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.5.bb => webkitgtk_2.16.6.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.16.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
index dcaf8a6ed79..fbc74dc4da5 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://detect-atomics-during-configure.patch \
            "
 
-SRC_URI[md5sum] = "fce72dc89cd310a663d9eb97133861fe"
-SRC_URI[sha256sum] = "8e0396f3428e757898c5856e642eed4fcd5a20ae03d96d3eaa03b76634be7dd4"
+SRC_URI[md5sum] = "0e2d142a586e4ff79cf0324f4fdbf20c"
+SRC_URI[sha256sum] = "fc23650df953123c59b9c0edf3855e7bd55bd107820997fc72375811e1ea4b21"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.13.2


