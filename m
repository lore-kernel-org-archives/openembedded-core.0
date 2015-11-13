Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 208E8772D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:43:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:43:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686573"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:43:54 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:48 +0200
Message-Id: <b4a75e3cace9177ce1425b040580aa6417f45bf6.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 03/19] librsvg: Upgrade 2.40.10 -> 2.40.11
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
X-List-Received-Date: Fri, 13 Nov 2015 09:43:54 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/librsvg/{librsvg_2.40.10.bb => librsvg_2.40.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.10.bb => librsvg_2.40.11.bb} (92%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
similarity index 92%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
index 06552c2..8c5206b 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.10.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
 
 SRC_URI += "file://gtk-option.patch"
 
-SRC_URI[archive.md5sum] = "fadebe2e799ab159169ee3198415ff85"
-SRC_URI[archive.sha256sum] = "965c807438ce90b204e930ff80c92eba1606a2f6fd5ccfd09335c99896dd3479"
+SRC_URI[archive.md5sum] = "6b9cd1a048210a8e95bdc04c85fe997f"
+SRC_URI[archive.sha256sum] = "611ac0f544debd0c9bf1ef5509c990d218e83dd1d8c83297075c4b29796a2e02"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-- 
2.1.4


