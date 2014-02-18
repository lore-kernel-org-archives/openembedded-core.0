Return-Path: <diego.sueiro@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id D57876EE36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 16:50:28 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 200so33975736ykr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kzvs/MSQm9UsaXyjGak4VFWK7YWmvp7PbjlqmvesiQA=;
	b=e/mNWspvV54dACD2Ks6v0PAG85c+GC6P4tUmfAjPk1yyYGL+RQTWk7l6YQRzWUtcRy
	1vL9vz1fw4cu38cYPrxaI3Bi7Zujh08ZuXpA/o6tMAavuvb95OpWjKdSKjlSvzNsnjAP
	klopPcHnORt0RgpzKAQVHBDhTzuO9YcXLIMG3O33s0pAhbg/sTNBvIkWkd+X5s9j1YU0
	60ezte1RUc3CR+7tIqXoL3/yc0auCh3YccZPr7ImY7Z+etq4ZN7Y2Dr9PbIa2PaStnik
	YHyseZxM4h61nKBQe2JIi8ANV+yEVee3P6dlpX0x90bmobnDe+AhzZhz6bludAcotIRm
	NTBQ==
X-Received: by 10.236.189.202 with SMTP id c50mr4431577yhn.139.1392742228550; 
	Tue, 18 Feb 2014 08:50:28 -0800 (PST)
Received: from localhost.localdomain ([201.82.73.213])
	by mx.google.com with ESMTPSA id
	k76sm60630536yho.18.2014.02.18.08.50.27 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 08:50:28 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2014 13:49:58 -0300
Message-Id: <1392742198-23333-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] meta-toolchain-qt[e]: add qt4[-embedded]-staticdev
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
X-List-Received-Date: Tue, 18 Feb 2014 16:50:29 -0000

libQtUiTools[E].a needs to be installed on toolchain.
qt4[-embedded]-staticdev is the package which provides this library.

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


