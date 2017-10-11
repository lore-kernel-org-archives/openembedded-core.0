Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 069957823D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945901"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:39:07 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:35 +0300
Message-Id: <811f5f3e8c7e435b1db5e32dc857c1f01ddead08.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 43/50] librsvg: update to 2.40.19
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/librsvg/{librsvg_2.40.18.bb => librsvg_2.40.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.18.bb => librsvg_2.40.19.bb} (91%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.18.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.19.bb
similarity index 91%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.18.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.19.bb
index 21a0dc2038b..6aeeb6b5fd6 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.18.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.19.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-ev
 
 SRC_URI += "file://gtk-option.patch"
 
-SRC_URI[archive.md5sum] = "eaa5c8a8bbe2600ab5194c0d3b1b621b"
-SRC_URI[archive.sha256sum] = "bfc8c488c89c1e7212c478beb95c41b44701636125a3e6dab41187f1485b564c"
+SRC_URI[archive.md5sum] = "934eff469b34c732fb91ddb9afd40638"
+SRC_URI[archive.sha256sum] = "612b4d8b8609036f5d899be3fe70d9866b5f6ac5c971154c1c0ef7242216c1f7"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-- 
2.14.1


