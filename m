Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B16B878170
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 10:15:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6CAFcsr022577
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 03:15:38 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 03:15:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2017 03:15:31 -0700
Message-ID: <96d138921edb8356aa7b683803e4facc4e0ade4e.1499854502.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1499854502.git.liezhi.yang@windriver.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] libbsd: 0.8.3 -> 0.8.5
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
X-List-Received-Date: Wed, 12 Jul 2017 10:15:36 -0000
Content-Type: text/plain

* The LIC_FILES_CHKSUM is changed becauses the files updated the date, and added
  a BSD-3-clause-John-Birrell for man/timeradd.3bsd, this license is already
  there for other files.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libbsd/{libbsd_0.8.3.bb => libbsd_0.8.5.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.8.3.bb => libbsd_0.8.5.bb} (88%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.8.3.bb b/meta/recipes-support/libbsd/libbsd_0.8.5.bb
similarity index 88%
rename from meta/recipes-support/libbsd/libbsd_0.8.3.bb
rename to meta/recipes-support/libbsd/libbsd_0.8.5.bb
index e85ee21..33190a7 100644
--- a/meta/recipes-support/libbsd/libbsd_0.8.3.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.8.5.bb
@@ -30,7 +30,7 @@ HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
 # License: public-domain
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-4-Clause & ISC & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0b9c89d861915b86655b96e5e32fa2aa"
+LIC_FILES_CHKSUM = "file://COPYING;md5=08fc4e66be4526715dab09c5fba5e9e8"
 SECTION = "libs"
 
 SRC_URI = " \
@@ -43,8 +43,8 @@ SRC_URI_append_libc-musl  = " \
     file://0003-Fix-build-breaks-due-to-missing-a.out.h.patch \
 "
 
-SRC_URI[md5sum] = "e935c1bb6cc98a4a43cb1da22795493a"
-SRC_URI[sha256sum] = "934b634f4dfd865b6482650b8f522c70ae65c463529de8be907b53c89c3a34a8"
+SRC_URI[md5sum] = "f1a0dc285f5d21ea40ef5bfc9b647346"
+SRC_URI[sha256sum] = "7647d024f41389305272c263da933a6f2a978213c1801592f47e68d83ac05b28"
 
 inherit autotools pkgconfig
 
-- 
2.10.2


