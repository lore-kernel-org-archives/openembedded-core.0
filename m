Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF2AC77016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:59:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U7xme1003070
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 00:59:48 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 30 Sep 2015 00:59:47 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 03:59:46 -0400
Message-ID: <1443599986-94686-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gnome-doc-utils: xslt - don't install Makefiles
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
X-List-Received-Date: Wed, 30 Sep 2015 07:59:47 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

All the xml files under xslt will be installed by default, the
buildtime stuffs that Makefile, Makefile.in, Makefile.am are not
needed for target.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 9587506..8adfac7 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -15,9 +15,6 @@ CLEANBROKEN = "1"
 EXTRA_OECONF += "--disable-scrollkeeper"
 
 do_install_append() {
-	mkdir -p  ${D}${datadir}/xml/gnome/xslt/
-	cp -pPr ${S}/xslt/* ${D}${datadir}/xml/gnome/xslt/
-
 	chown -R root:root ${D}
 }
 
-- 
1.9.1


