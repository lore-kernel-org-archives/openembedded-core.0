Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sy1Pj-0005jg-Is
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 16:02:41 +0200
Received: by wgbdr1 with SMTP id dr1so1706321wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=s6sobcWhMon5AGk+IwQBydewQmpMG9VtnWOuX3LV7rI=;
	b=pLMcbHp+Ag7PtrOv2vyYu0q+T5P0OBpFtbdM3grfqk3X5O/yCJzc4QJKiRlcAJ6GGV
	kkSbFgeW2aew6XW+sTets3dNhysmIGNEcd/DEzBVvskKNLTTyb2lTW5kgBRQ2e8Gv6Kt
	jSCrQeTftOKicEXSsLaEdf8VVYnxA384XGyKVdnmAABUhhogwA58bJI5RX7py2k2onyO
	Uy3es6G+0+nnsTKyX+HcRDckzSnKWUiZ3IISp8wuhRNemENu4t+kahaqMkkRpGdIUIua
	WWih6tR8xlZjIh+NIWX4T4UeE0j1dv2v8x5OS30YQHNy8y9sQueFRU+6NjOgK4oY7qtT
	5ZTg==
Received: by 10.217.5.130 with SMTP id w2mr4034195wes.45.1344174656359;
	Sun, 05 Aug 2012 06:50:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm14355554wiz.9.2012.08.05.06.50.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 06:50:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Aug 2012 15:50:46 +0200
Message-Id: <1344174646-348-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120805131615.GC3267@jama.jama.net>
References: <20120805131615.GC3267@jama.jama.net>
Subject: [PATCH] qt4-native: fix creating /include directory in build host root
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 14:02:41 -0000

* same fix as
  http://git.openembedded.org/openembedded-core/commit/?id=7d3fd68480d54a8ef0d91a772df3506cd45ef2c2
  is needed for native too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/qt4-native.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 90ea63c..e00a1f3 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-INC_PR = "r15"
+INC_PR = "r16"
 
 inherit native
 
@@ -18,6 +18,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://g++.conf \
            file://linux.conf \
            file://fix_qkbdtty_qws.patch \
+           file://set-OUTPUT_DIR-if-empty.patch \
 	"
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
-- 
1.7.8.6



