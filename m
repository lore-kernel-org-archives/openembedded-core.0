Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63C1C6B272
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 03:35:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBU3ZPrQ026006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 19:35:25 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 29 Dec 2013 19:35:25 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Dec 2013 22:35:02 -0500
Message-ID: <3622518c492591c6bb00af844c8c6d6177939d27.1388369850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1388369850.git.liezhi.yang@windriver.com>
References: <cover.1388369850.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/14] ghostscript: remove unrecognised option
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
X-List-Received-Date: Mon, 30 Dec 2013 03:35:24 -0000
Content-Type: text/plain

Remove --without-jasper since the jasper had been removed:

  commit 6070a6f33bebf7538e48219010bc1e4de8341ea8
  Author: Ray Johnston <ray.johnston@artifex.com>
  Date:   Fri Aug 3 00:32:32 2012 -0700

      Rip out jasper -- openjpeg is our JPX implementation.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.07.bb |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.07.bb b/meta/recipes-extended/ghostscript/ghostscript_9.07.bb
index bd4dd75..3ce9f12 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.07.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.07.bb
@@ -35,13 +35,15 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
 SRC_URI[md5sum] = "57ebf17c5abcf0fc95a386bfff08c1a4"
 SRC_URI[sha256sum] = "44800d004c53f13192d1b5db413119198ddfc8a11c4d2a030aac2f2fda822ebf"
 
-EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-jasper \
-                --with-fontpath=${datadir}/fonts --with-install-cups --without-libidn"
+EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
+                --with-fontpath=${datadir}/fonts --with-install-cups \
+                --without-libidn \
+                "
 
 # Explicity disable libtiff, fontconfig,
 # freetype, cups for ghostscript-native
 EXTRA_OECONF_class-native = "--without-x --with-system-libtiff=no \
-                             --without-jbig2dec --without-jasper \
+                             --without-jbig2dec \
                              --with-fontpath=${datadir}/fonts \
                              --without-libidn --disable-fontconfig \
                              --disable-freetype --disable-cups"
-- 
1.7.10.4


