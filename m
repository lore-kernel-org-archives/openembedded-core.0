Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4F1F66010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 26 Oct 2016 06:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="777950948"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2016 06:28:13 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 441C86A4006;
	Wed, 26 Oct 2016 06:27:37 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:52 +0300
Message-Id: <745cd6cbe58745d51d5c0c845e3f794941d837be.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 11/14] gdk-pixbuf: 2.34.0 -> 2.36.0
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:11 -0000

Six-monthly feature release, mostly bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.34.0.bb => gdk-pixbuf_2.36.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.34.0.bb => gdk-pixbuf_2.36.0.bb} (96%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.34.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
similarity index 96%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.34.0.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
index 4f39494..a5ebeca 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.34.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            "
 
-SRC_URI[md5sum] = "63cb19f92cf7709ccf44bbb6fe1ff70c"
-SRC_URI[sha256sum] = "d55e5b383ee219bd0e23bf6ed4427d56a7db5379729a6e3e0a0e0eba9a8d8879"
+SRC_URI[md5sum] = "1a3baf91956c7923dab49ee3de100ce1"
+SRC_URI[sha256sum] = "85ab52ce9f2c26327141b3dcf21cca3da6a3f8de84b95fa1e727d8871a23245c"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc
 
-- 
2.1.4


