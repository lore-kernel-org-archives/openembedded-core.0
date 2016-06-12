Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 07FEB6FF22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C8PLHi010062
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:22 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:10 -0700
Message-ID: <736a25a1d4f88fac4d25232379e2e60110c4393c.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] libbsd: 0.8.2 -> 0.8.3
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:21 -0000
Content-Type: text/plain

The LIC_FILES_CHKSUM changed because a word changes: http -> https.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libbsd/{libbsd_0.8.2.bb => libbsd_0.8.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.8.2.bb => libbsd_0.8.3.bb} (86%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.8.2.bb b/meta/recipes-support/libbsd/libbsd_0.8.3.bb
similarity index 86%
rename from meta/recipes-support/libbsd/libbsd_0.8.2.bb
rename to meta/recipes-support/libbsd/libbsd_0.8.3.bb
index 3335386..92121ef 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.2.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.3.bb
@@ -30,14 +30,14 @@ HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
 # License: public-domain
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-4-Clause & ISC & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=145ec05a217d8f879f29cfc5f83084be"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0b9c89d861915b86655b96e5e32fa2aa"
 SECTION = "libs"
 
 SRC_URI = " \
     http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "cdee252ccff978b50ad2336278c506c9"
-SRC_URI[sha256sum] = "b2f644cae94a6e2fe109449c20ad79a0f6ee4faec2205b07eefa0020565e250a"
+SRC_URI[md5sum] = "e935c1bb6cc98a4a43cb1da22795493a"
+SRC_URI[sha256sum] = "934b634f4dfd865b6482650b8f522c70ae65c463529de8be907b53c89c3a34a8"
 
 inherit autotools pkgconfig
-- 
2.8.0


