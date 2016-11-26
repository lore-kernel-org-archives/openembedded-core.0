Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA9071AC5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 07:55:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAQ7tRIE010326
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 23:55:28 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 25 Nov 2016 23:55:27 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Nov 2016 02:55:26 -0500
Message-ID: <1480146926-236519-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] gdk-pixbuf: fix ptest RDEPENDS for multilib build
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
X-List-Received-Date: Sat, 26 Nov 2016 07:55:28 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
index a5ebeca..f69e888 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
@@ -68,7 +68,7 @@ python populate_packages_prepend () {
 
     # The test suite exercises all the loaders, so ensure they are all
     # dependencies of the ptest package.
-    d.appendVar("RDEPENDS_gdk-pixbuf-ptest", " " + packages)
+    d.appendVar("RDEPENDS_%s-ptest" % d.getVar('PN', True), " " + packages)
 }
 
 do_install_append() {
-- 
2.8.1


