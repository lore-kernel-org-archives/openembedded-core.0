Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QOfsQ-00085l-3m
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 02:53:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2011 17:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,259,1304319600"; 
   d="scan'208";a="6498075"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2011 17:50:33 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 17:50:26 -0700
Message-Id: <8714f72148171686b5e92191e55e0c235a7f1b7f.1306198151.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
In-Reply-To: <c58247a71045c56297c2312e91eff6f17f3c2d7d.1306198151.git.nitin.a.kamble@intel.com>
References: <c58247a71045c56297c2312e91eff6f17f3c2d7d.1306198151.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1306198151.git.nitin.a.kamble@intel.com>
References: <cover.1306198151.git.nitin.a.kamble@intel.com>
Subject: [UPGRADES 4/5] python-pygpbject: upgrade from 2.27 to 2.27.91
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
X-List-Received-Date: Tue, 24 May 2011 00:53:38 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...bject_2.27.0.bb => python-pygobject_2.27.91.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-pygobject_2.27.0.bb => python-pygobject_2.27.91.bb} (87%)

diff --git a/meta/recipes-devtools/python/python-pygobject_2.27.0.bb b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
similarity index 87%
rename from meta/recipes-devtools/python/python-pygobject_2.27.0.bb
rename to meta/recipes-devtools/python/python-pygobject_2.27.91.bb
index 62024c3..d35f672 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.27.0.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
@@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 DEPENDS = "python-pygobject-native-${PV} glib-2.0"
 DEPENDS_virtclass-native = "glib-2.0-native"
 RDEPENDS_virtclass-native = ""
-PR = "r2"
+PR = "r0"
 
 MAJ_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/pygobject/${MAJ_VER}/pygobject-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "9e2496ffa4e55911f94232e29ee9f146"
-SRC_URI[sha256sum] = "7594bd86c5b92a4ba1f26927800f1b29e1ec5c246cad67aa085c279d6425b8a2"
+SRC_URI[md5sum] = "2b11a3050264721aac83188224b093a8"
+SRC_URI[sha256sum] = "a1dffbe2a8e0d490594554ed8d06f0ee4a371acb6c210e7f35158e9ae77e0df4"
 S = "${WORKDIR}/pygobject-${PV}"
 
 FILESPATH = "${FILE_DIRNAME}/python-pygobject:${FILE_DIRNAME}/files"
-- 
1.7.3.5



