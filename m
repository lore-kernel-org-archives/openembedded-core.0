Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1AF97C038
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 07:21:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x097LJP0031425
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2019 23:21:40 -0800
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 8 Jan 2019 23:21:32 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2019 15:19:43 +0800
Message-ID: <1547018383-19134-10-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
References: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 9/9] json-glib: upgrade 1.4.2 -> 1.4.4
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
X-List-Received-Date: Wed, 09 Jan 2019 07:21:48 -0000
Content-Type: text/plain

Add PACKAGECONFIG[manpages] for generating man pages.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../json-glib/{json-glib_1.4.2.bb => json-glib_1.4.4.bb}       | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.4.2.bb => json-glib_1.4.4.bb} (83%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
similarity index 83%
rename from meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
index b4a6a6f..95f9056 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
@@ -11,13 +11,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 DEPENDS = "glib-2.0"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome
+inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome manpages
 
 SRC_URI += "file://run-ptest"
-SRC_URI[archive.md5sum] = "35107e23a7bbbc70f31c34f7b9adf1c3"
-SRC_URI[archive.sha256sum] = "2d7709a44749c7318599a6829322e081915bdc73f5be5045882ed120bb686dc8"
+SRC_URI[archive.md5sum] = "4d4bb9837f6d31e32d0ce658ae135f68"
+SRC_URI[archive.sha256sum] = "720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9fabec4374f4bc47"
 
-# This builds both API docs (via gtk-doc) and manpages
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
+
+# This builds both API docs (via gtk-doc)
 GTKDOC_ENABLE_FLAG = "-Ddocs=true"
 GTKDOC_DISABLE_FLAG = "-Ddocs=false"
 
-- 
2.7.4


