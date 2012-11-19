Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TaSU8-0003UG-7L
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 15:38:04 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 19 Nov 2012 06:24:00 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so1250413fav.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 06:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=wbWOjGAnVqjng4ZKMy+zKL2Cyvo10ltL17OJgaJAWc4=;
	b=RSkFUmbg6vxl1b6D9K5jb0D5aCS2wDd+Js9O/LpK0mJOPEFxoBU4cCx/p8xcue0/G3
	OMl9tnx2SEpSTcHdsrFpYfX91D0rR1QLg8ozC3Vcrwvt0FNWJZr29PpnIXZCmGRb8Itw
	TgMgDQiY7Bek/zGUxKvT4TGv0kRR0YOeggLjouTP4R8cFP0ZG9a7QyGgQXHQyuk7LEN1
	g7OBRZhPrwg74qjFrvBW19uatJujU3nMFYPPUN9CTv1mXeM9t0llr/zO6U36xI8BZrmk
	yLUe46tjk8pBRzLOx78jMwZZC5USdbg6+wQNkdGYFDSlA3IKiqeK7pwP6c1ekz6E0dS1
	ITlA==
Received: by 10.180.75.135 with SMTP id c7mr9229106wiw.10.1353335038737;
	Mon, 19 Nov 2012 06:23:58 -0800 (PST)
Received: by 10.180.75.135 with SMTP id c7mr9229094wiw.10.1353335038579;
	Mon, 19 Nov 2012 06:23:58 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eu8sm13557202wib.1.2012.11.19.06.23.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 06:23:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 14:22:33 +0000
Message-Id: <1353334954-4909-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnrcqTkZ/+OZCyEG2mP7KFabT8Mc6bUxTUgsz3K2EuIW3S4Pg9wqmq/d6HpOiIIDQjCfmX31mL56EKEX3hPJBscQLtiZMqOVajQ6kSWc6a/gz9yRjpPbEDEgezQ7rl5hSD+CaI0umoFSQMJ37g6bETZtcqVwciCS18QYm+wCO7ZZ3dFCBzFHQiMy6LVCGAJrS91YnMo
Subject: [PATCH 1/2] qt4: remove negative preference on 4.8.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 14:38:04 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb |    2 --
 meta/recipes-qt/qt4/qt4-4.8.3.inc                |    2 --
 meta/recipes-qt/qt4/qt4-native_4.8.3.bb          |    2 --
 3 files changed, 6 deletions(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
index ad5d881..51afe13 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
@@ -1,7 +1,5 @@
 require nativesdk-qt4-tools.inc
 
-DEFAULT_PREFERENCE = "-1"
-
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3.inc b/meta/recipes-qt/qt4/qt4-4.8.3.inc
index e473dc6..4b80c6c 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.3.inc
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
            file://0004-configure-qmake-is-already-built-in-qt4-tools-native.patch \
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.3.bb b/meta/recipes-qt/qt4/qt4-native_4.8.3.bb
index 0f93187..afae0ae 100644
--- a/meta/recipes-qt/qt4/qt4-native_4.8.3.bb
+++ b/meta/recipes-qt/qt4/qt4-native_4.8.3.bb
@@ -1,7 +1,5 @@
 require qt4-native.inc
 
-DEFAULT_PREFERENCE = "-1"
-
 PR = "${INC_PR}.0"
 
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-- 
1.7.10



