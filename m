Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C962371C75
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 21:09:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 14:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,362,1503385200"; d="scan'208";a="1204825096"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.138])
	by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2017 14:09:08 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 16:08:45 -0500
Message-Id: <1507756125-29469-3-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507756125-29469-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1507756125-29469-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH 2/2] python3-pygobject: update to 3.26.0
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
X-List-Received-Date: Wed, 11 Oct 2017 21:09:06 -0000

python3-pygobject needs to be updated to latest stable branch.

This change was tested in qemux86 running core-image-minimal.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 .../{python3-pygobject_3.24.1.bb => python3-pygobject_3.26.0.bb}    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.24.1.bb => python3-pygobject_3.26.0.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.24.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.26.0.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pygobject_3.24.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.26.0.bb
index 9d10af2..f368e6c 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.24.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.26.0.bb
@@ -10,12 +10,10 @@ DEPENDS += "python3 glib-2.0"
 SRCNAME="pygobject"
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
-    file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
-    file://0001-configure.ac-Don-t-use-gnome-common-macros.patch \
 "
 
-SRC_URI[md5sum] = "69a843311d0f0385dff376e11a2d83d2"
-SRC_URI[sha256sum] = "a628a95aa0909e13fb08230b1b98fc48adef10b220932f76d62f6821b3fdbffd"
+SRC_URI[md5sum] = "1c1719b1798cc8bf1cb97777c41c83d1"
+SRC_URI[sha256sum] = "7411acd600c8cb6f00d2125afa23303f2104e59b83e0a4963288dbecc3b029fa"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


