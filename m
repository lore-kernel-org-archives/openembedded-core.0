Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A01B9607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:12 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 26 Oct 2016 06:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="23939368"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 26 Oct 2016 06:28:13 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 929C16A4006;
	Wed, 26 Oct 2016 06:27:38 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:53 +0300
Message-Id: <48c5fb1f89c58ef144d5de6315ee41d9d32912b2.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 12/14] gtk-icon-utils-native: Upgrade 3.20.9 -> 3.22.1
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:13 -0000

Six-monthly feature release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...tk-icon-utils-native_3.20.9.bb => gtk-icon-utils-native_3.22.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.20.9.bb => gtk-icon-utils-native_3.22.1.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.9.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.1.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.9.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.1.bb
index 71c1d62..e6ffc55 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.9.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.1.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "cc76cac5e18c772c6784bf19a3dff08b"
-SRC_URI[sha256sum] = "83a609ba2f3424b5509e73967c49c67833af466d6f91081b24ee5c64fce6ac17"
+SRC_URI[md5sum] = "ebfa5e52167f2b8a4ec6024d51d86f1f"
+SRC_URI[sha256sum] = "127c8c5cfc32681f9ab3cb542eb0d5c16c1c02faba68bf8fcac9a3cf278ef471"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.1.4


