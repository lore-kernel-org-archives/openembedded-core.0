Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 75F3C7845A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279586"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:45 +0300
Message-Id: <1dcf74a2c67d4e30a0bd03b15b462b0e6937c71a.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/32] gobject-introspection: update to 1.52.1
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ject-introspection_1.50.0.bb => gobject-introspection_1.52.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.50.0.bb => gobject-introspection_1.52.1.bb} (97%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.52.1.bb
similarity index 97%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.52.1.bb
index 509fc5fa592..5df981a0e0a 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.52.1.bb
@@ -8,15 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
                     file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
                     file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/1.50/${BPN}-${PV}.tar.xz \
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.52/${BPN}-${PV}.tar.xz \
            file://0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch \
            file://0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch \
            file://0003-giscanner-add-use-binary-wrapper-option.patch \
            file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            "
-SRC_URI[md5sum] = "5af8d724f25d0c9cfbe6df41b77e5dc0"
-SRC_URI[sha256sum] = "1c6597c666f543c70ef3d7c893ab052968afae620efdc080c36657f4226337c5"
+SRC_URI[md5sum] = "34157073991f9eeb0ed953351b65eb61"
+SRC_URI[sha256sum] = "2ed0c38d52fe1aa6fc4def0c868fe481cb87b532fc694756b26d6cfab29faff4"
 
 inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
 BBCLASSEXTEND = "native"
-- 
2.11.0


