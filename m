Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QW9RA-00053X-77
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:52:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jun 2011 08:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="15668374"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2011 08:48:58 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 23:48:35 +0800
Message-Id: <5eaabec8b07fb1a796faef9dd6b24560db495f30.1307979545.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
References: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307979545.git.dexuan.cui@intel.com>
References: <cover.1307979545.git.dexuan.cui@intel.com>
Subject: [PATCH 10/13] pixman: upgrade from 0.20.2 to the latest stable 0.22.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2011 15:52:24 -0000

Update LIC_FILES_CHKSUM:
1) COPYING: only format change; no actual license change.
2) 0.22.0 doesn't have pixman-x64-mmx-emulation.h, so let's remove it.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{pixman_0.20.2.bb => pixman_0.22.0.bb}         |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.20.2.bb => pixman_0.22.0.bb} (66%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.20.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
similarity index 66%
rename from meta/recipes-graphics/xorg-lib/pixman_0.20.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
index 00a58bf..e5472c0 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.20.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
@@ -8,10 +8,10 @@ including trapezoids, triangles, and rectangles."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT-style & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fea989a44fb012b5e79584972a863d22 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=25;md5=ba6e8769bfaaee2c41698755af04c4be \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
-                    file://pixman/pixman-x64-mmx-emulation.h;beginline=4;endline=9;md5=4e32716f2efaa6c4659222667c339bb8"
+                   "
 
 DEPENDS = "virtual/libx11"
 
@@ -20,6 +20,6 @@ PR = "r0"
 
 EXTRA_OECONF="--disable-gtk"
 
-SRC_URI[md5sum] = "7ed10a0f0fde6853613105a99735e7e7"
-SRC_URI[sha256sum] = "30316f269a6b84c32b47545ca7fc428fd16875849fea644dc6910b3f8c33f4a9"
+SRC_URI[md5sum] = "307fe4d7dc83b1a558c362907097c0d0"
+SRC_URI[sha256sum] = "24a1bce57c36c773f67d48f7f25f80d69a47ef92a67404f1644d94dee156ae2b"
 
-- 
1.7.1



