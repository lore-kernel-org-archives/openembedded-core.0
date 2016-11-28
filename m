Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3499571ABA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:32 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412258"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:33 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:21 +0200
Message-Id: <b868910a61850d782101b80c922d118d13e4be28.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/18] gobject-introspection: update to 1.50.0
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:32 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ject-introspection_1.48.0.bb => gobject-introspection_1.50.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.48.0.bb => gobject-introspection_1.50.0.bb} (97%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
similarity index 97%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
index abaa485..b6d296a 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
@@ -8,15 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
                     file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
                     file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/1.48/${BPN}-${PV}.tar.xz \
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.50/${BPN}-${PV}.tar.xz \
            file://0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch \
            file://0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch \
            file://0003-giscanner-add-use-binary-wrapper-option.patch \
            file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            "
-SRC_URI[md5sum] = "01301fa9019667d48e927353e08bc218"
-SRC_URI[sha256sum] = "fa275aaccdbfc91ec0bc9a6fd0562051acdba731e7d584b64a277fec60e75877"
+SRC_URI[md5sum] = "5af8d724f25d0c9cfbe6df41b77e5dc0"
+SRC_URI[sha256sum] = "1c6597c666f543c70ef3d7c893ab052968afae620efdc080c36657f4226337c5"
 
 inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
 BBCLASSEXTEND = "native"
-- 
2.10.2


