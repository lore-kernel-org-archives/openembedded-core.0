Return-Path: <diego.sueiro@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 822626AC79
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 11:49:11 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id v1so5531244yhn.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 04:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GqXyVv/7PFA+/KjNeJgDPcN9w7lt3hGRvnVpIhSuhVo=;
	b=eYBcb3Nx7iIqIYlSFUhl+p/K6Pz5wKc2EOYgpkF3OGpcQiLH8YnBDIw2EdRFomdOiE
	iojzHNXP+JXr3bn4AD1T+K+CBGgXWgXmJpLkB7iBBxOQokcdUaIKY+sDM/LrQMAFp+tW
	0O2L3iNlJ5ee31isnpMD3dMzYYDd1fEk5NcrZ/QBUwCOXhJQzRea760HDvZpD27Cg70M
	2iCfX7BNMd7G6Cj3RXFApFKDpifBQDvxkUphwb8X87uyk75fXwlTzAR89pChMzQFzUa9
	m05WCUQorgApAa2ag+Cp62bb/PvsYY6LDNButeLvaDx4ZO7HbJM9D87LmsCK5/c+ZYVG
	CYrA==
X-Received: by 10.236.89.97 with SMTP id b61mr1938522yhf.181.1407671353093;
	Sun, 10 Aug 2014 04:49:13 -0700 (PDT)
Received: from localhost.localdomain ([177.194.103.104])
	by mx.google.com with ESMTPSA id 28sm17311530yhc.19.2014.08.10.04.49.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Aug 2014 04:49:12 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 08:49:03 -0300
Message-Id: <1407671343-5490-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [for-dora][for-daisy][PATCH] qt4: Fix Qt 4.8.5 source to new location
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
X-List-Received-Date: Sun, 10 Aug 2014 11:49:14 -0000

Qt 4.8.5 was moved from http://download.qt-project.org/official_releases/qt/4.8/ to
http://download.qt-project.org/archive/qt/4.8/

Thi fix must be applied for dora and daisy branches.

Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.8.5.inc
index dcbf26f..843ad7a 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
-SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://download.qt-project.org/archive/qt/4.8/${PV}/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
            file://0004-configure-qmake-is-already-built-in-qt4-tools-native.patch \
            file://0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch \
-- 
1.9.1


