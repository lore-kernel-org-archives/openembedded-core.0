Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDF5573D3E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:24:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t37BOZlj025067
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 04:24:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 04:24:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 04:24:31 -0700
Message-ID: <7c8475e9f21581916595d0ef7d587ce3ec1614a9.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] glib-2.0: 2.42.1 -> 2.44.0
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
X-List-Received-Date: Tue, 07 Apr 2015 11:24:34 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{glib-2.0_2.42.1.bb => glib-2.0_2.44.0.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.42.1.bb => glib-2.0_2.44.0.bb} (83%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.42.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
similarity index 83%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.42.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
index 69b3ef8..100799e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.42.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
@@ -18,5 +18,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "89c4119e50e767d3532158605ee9121a"
-SRC_URI[sha256sum] = "8f3f0865280e45b8ce840e176ef83bcfd511148918cc8d39df2ee89b67dcf89a"
+SRC_URI[md5sum] = "74cf7b4ea200b76e42a4c22c8daf0f93"
+SRC_URI[sha256sum] = "f2d362b106a08fa801770d41829a06fcfe287a00421018869eebf5efc796f5b9"
-- 
1.7.9.5


