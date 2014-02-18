Return-Path: <diego.sueiro@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id B05766EE32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 17:50:10 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 9so34279847ykp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xa4aQiwRdXvEO++DclwARWB2zymWof5I7noEucXzCos=;
	b=yQ5Mu6B+P6DlTP6DDVN4zVMKnhJYWNY3nXre001S3LBLtoVkfWO8XbmlSGPTcFd3PM
	AqTCuA4hx01BpRqhmn2DFvMvdkKNBxZzijsNv4WObZvXf/oDAwQoB4I6wuNhLXH9SKD2
	RJzT/Dm+YpA3csRa1IdSVu/UzE4jE/MzNllJwquMIy1wWgf3j8090A2NYZbDf+YIYYzx
	xlwxU6aKQQTjcYMd89AMHfXDKdyvTPCVpiR+IUpXSmdGGxG/hkpj3KO8yvUFgEBfvEzZ
	84pQk+pj2vxnz9CZeF9P9TGBnxg4iNpdN3Vau7nuRJsqjlp3LHuV9sW/nja4mthnpchJ
	oCpg==
X-Received: by 10.236.110.132 with SMTP id u4mr5454682yhg.119.1392745810990;
	Tue, 18 Feb 2014 09:50:10 -0800 (PST)
Received: from localhost.localdomain ([201.82.73.213])
	by mx.google.com with ESMTPSA id 48sm61120405yhq.11.2014.02.18.09.50.09
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 09:50:10 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2014 14:49:15 -0300
Message-Id: <1392745755-20315-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v1] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Tue, 18 Feb 2014 17:50:11 -0000

libQtUiTools.a and libQtUiToolsE.a needs to be installed on meta-toolchain-qt
and meta-toolchain-qte respectively.
Whitout this static library, compiling qt apps which needs uitools will fail.

qt4[-embedded]-staticdev is the package that contains this library and is the
only file in it.

Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
---
 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
index fc1ccba..b040182 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
@@ -33,4 +33,5 @@ RDEPENDS_${PN} += " \
         libqt${QTLIBPREFIX}xmlpatterns4-dev \
         libsqlite3-dev \
         expat-dev \
+        qt4${QTLIBPREFIX}-staticdev \
         "
-- 
1.7.10.4


