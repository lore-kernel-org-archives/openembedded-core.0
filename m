Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QP9h8-0002N1-7A
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 10:43:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 01:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,266,1304319600"; 
   d="scan'208";a="1223577"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 01:40:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 01:40:33 -0700
Message-Id: <30afae80a5a1a069f94b40659e0cf309cd3ba230.1306312621.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
Subject: [Updated Consolidated Pull 11/19] python-pygpbject: upgrade from 2.27 to 2.27.91
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
X-List-Received-Date: Wed, 25 May 2011 08:43:59 -0000

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
1.7.3.4



