Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEBC2782AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:09:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L6A05w003037
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Aug 2017 23:10:00 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 20 Aug 2017 23:09:59 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 02:09:57 -0400
Message-ID: <72306a586ef604d6d7a13949e3cc821b3c71c0ed.1503295544.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1503295544.git.wenzong.fan@windriver.com>
References: <cover.1503295544.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] gdk-pixbuf: fix ptest RDEPENDS for multilib build
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
X-List-Received-Date: Mon, 21 Aug 2017 06:09:59 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Don't hardcode the package name, it could be gdk-pixbuf or
lib32-gdk-pixbuf.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
index 3d16ee0..14e63d9 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
@@ -74,7 +74,7 @@ python populate_packages_prepend () {
 
     # The test suite exercises all the loaders, so ensure they are all
     # dependencies of the ptest package.
-    d.appendVar("RDEPENDS_gdk-pixbuf-ptest", " " + packages)
+    d.appendVar("RDEPENDS_%s-ptest" % d.getVar('PN', True), " " + packages)
 }
 
 do_install_append() {
-- 
2.8.1


