Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E002977CD8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:38:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v519clci000805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Jun 2017 02:38:50 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 02:38:45 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Jun 2017 05:38:41 -0400
Message-ID: <a8366b6576ef8c4c169613a428ac14c74cc1a017.1496309470.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1496309470.git.dengke.du@windriver.com>
References: <cover.1496309470.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] json-glib: upgrade 1.2.2 -> 1.2.8
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
X-List-Received-Date: Thu, 01 Jun 2017 09:38:51 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../json-glib/{json-glib_1.2.2.bb => json-glib_1.2.8.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.2.2.bb => json-glib_1.2.8.bb} (82%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
similarity index 82%
rename from meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
index 6869ba9..2c5d381 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.2.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "c1daefb8d0fb59612af0c072c8aabb58"
-SRC_URI[archive.sha256sum] = "ea128ab52a824fcd06e5448fbb2bd8d9a13740d51c66d445828edba71321a621"
+SRC_URI[archive.md5sum] = "ff31e7d0594df44318e12facda3d086e"
+SRC_URI[archive.sha256sum] = "fd55a9037d39e7a10f0db64309f5f0265fa32ec962bf85066087b83a2807f40a"
 
 inherit gnomebase gettext lib_package gobject-introspection gtk-doc manpages
 
-- 
2.8.1


