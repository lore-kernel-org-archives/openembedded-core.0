Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 879827BF58
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 06:47:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI6lC7M004677
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 22:47:12 -0800 (PST)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 17 Dec 2018 22:47:12 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 14:46:43 +0800
Message-ID: <1545115603-30751-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545115603-30751-1-git-send-email-yi.zhao@windriver.com>
References: <1545115603-30751-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 2/2] json-glib: upgrade 1.4.2 -> 1.4.4
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
X-List-Received-Date: Tue, 18 Dec 2018 06:47:11 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../json-glib/{json-glib_1.4.2.bb => json-glib_1.4.4.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.4.2.bb => json-glib_1.4.4.bb} (91%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
similarity index 91%
rename from meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
index b4a6a6f..c4e9349 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
@@ -14,8 +14,8 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome
 
 SRC_URI += "file://run-ptest"
-SRC_URI[archive.md5sum] = "35107e23a7bbbc70f31c34f7b9adf1c3"
-SRC_URI[archive.sha256sum] = "2d7709a44749c7318599a6829322e081915bdc73f5be5045882ed120bb686dc8"
+SRC_URI[archive.md5sum] = "4d4bb9837f6d31e32d0ce658ae135f68"
+SRC_URI[archive.sha256sum] = "720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9fabec4374f4bc47"
 
 # This builds both API docs (via gtk-doc) and manpages
 GTKDOC_ENABLE_FLAG = "-Ddocs=true"
-- 
2.7.4


