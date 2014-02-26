Return-Path: <diego.sueiro@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id C9F926B89F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 18:35:29 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f73so1449034yha.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 10:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LHh7vKSi3+2QHOyhS5j3sgfwFMjykp+eDF77yWnNWh8=;
	b=acKLwVpir2rCXcdwOKeqhdi88Adk3pceD4VQOqThJPq8A9i4afwXrnmBa8zHA7zGSH
	uDf/NR4WpdC8kXb+barDfV8onfpdC1y9MHRacmGBnYzZ1ied/mzid9DtCgl+70RaUFyT
	6GUiDq2P+kDsH/jagGeTM7IR8bPlqeX5UIVsT1HAr5fRbOwpsEV7hXuOHAhagUiZcGkx
	xwKgjC1LhRR1WdJlMSOK5THapLgdUia6lHxci1t87B37ZTsBRw4sKpO1+h2Bol2c62vd
	ySv4kaMf8pluHnF/qXeO0KFJaIEqjWss1xtXd4BvrOBookQ/4MW5JTUMi97tUwWlqVxA
	1+uw==
X-Received: by 10.236.0.129 with SMTP id 1mr3097208yhb.142.1393439729956;
	Wed, 26 Feb 2014 10:35:29 -0800 (PST)
Received: from localhost.localdomain ([201.82.73.213])
	by mx.google.com with ESMTPSA id w8sm5197316yhg.8.2014.02.26.10.35.28
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Feb 2014 10:35:29 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 15:35:15 -0300
Message-Id: <1393439715-317-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v4] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Wed, 26 Feb 2014 18:35:31 -0000

libQtUiTools is only built as a static library by upstream intentionally.
So, libQtUiTools.a and libQtUiToolsE.a needs to be installed on meta-toolchain-qt
and meta-toolchain-qte respectively.
Whitout this static library, building qt apps which needs uitools will fail.

qt4[-embedded]-staticdev is the package that contains this library and is the
only file in it.

Since a static library is shipped, special attention regarding the lincese
should be taken.

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


