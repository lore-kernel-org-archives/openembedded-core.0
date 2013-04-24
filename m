Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7f2-0007Ug-HD
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916451"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:37:05 -0700
Message-Id: <962fd2ecc5ee491d4762ce12ab7e1e8c47208ef4.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 12/18] pkgconfig: Move patches in prep for 0.28 update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 21:55:50 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig.inc     | 8 +-------
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb | 7 +++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index 87d7165..52b9ad1 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -12,13 +12,7 @@ DEPENDS = "glib-2.0 popt"
 DEPENDS_class-native = ""
 DEPENDS_class-nativesdk = ""
 
-SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.tar.gz \
-           file://autofoo.patch \
-           file://glibconfig-sysdefs.h \
-           file://pkg-config-native.in \
-           file://disable-legacy.patch \
-           file://obsolete_automake_macros.patch \
-          "
+SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.tar.gz"
 
 S = "${WORKDIR}/pkg-config-${PV}/"
 
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
index a269973..a55d017 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
@@ -2,5 +2,12 @@ require pkgconfig.inc
 
 PR = "r7"
 
+SRC_URI += "file://autofoo.patch \
+            file://glibconfig-sysdefs.h \
+            file://pkg-config-native.in \
+            file://disable-legacy.patch \
+            file://obsolete_automake_macros.patch \
+           "
+
 SRC_URI[md5sum] = "a3270bab3f4b69b7dc6dbdacbcae9745"
 SRC_URI[sha256sum] = "3ba691ee2431f32ccb8efa131e59bf23e37f122dc66791309023ca6dcefcd10e"
-- 
1.8.0.2



