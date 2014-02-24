Return-Path: <diego.sueiro@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 233156BB41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 22:29:35 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id b6so66018yha.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nPuquz2kXr3h7wAWmH8PyPx88gtmeDoa1ke97vTmlew=;
	b=ONvTBZggOGymIbmr53YOwaKZW5eHSb/raDFznoDdkvMwb4Wj49v29iu5PkWBVfhftk
	dXpi0Z1op5aKMBtKKfjIzQhE1kv9GOYr1Z8EN9HphxO2EKfGzHgxDXRGKO+ivvF5tuDD
	4v5qjyzykQXzz2/iWXevx5sUsnDhWjKDm7fultvy4OwoLJYHslBE1TI4BXmSaxNRRQXN
	VKx8MKyE6ckXzAPBmsb33aMbTByjpx1+JewjJMiW31v4+7YUK0MisSx6Ya+0wwx0ZdZy
	hO5UxcI/da6sfpVk2rDVJvSy77Y4YbKqXeJSdhAbIJkb+SSG5no3fQ8sol9XddGueKKO
	6zrw==
X-Received: by 10.236.131.163 with SMTP id m23mr1438388yhi.61.1393280976425;
	Mon, 24 Feb 2014 14:29:36 -0800 (PST)
Received: from localhost.localdomain ([201.82.73.213])
	by mx.google.com with ESMTPSA id a67sm1917705yhj.10.2014.02.24.14.29.34
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 14:29:35 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 19:29:18 -0300
Message-Id: <1393280958-18379-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Mon, 24 Feb 2014 22:29:38 -0000

libQtUiTools.a and libQtUiToolsE.a needs to be installed on meta-toolchain-qt
and meta-toolchain-qte respectively.
Whitout this static library, compiling qt apps which needs uitools will fail.

qt4[-embedded]-staticdev is the package that contains this library and is the
only file in it.

Since a static library is shipped, special attention regarding the lincese
should be taken.
Here is the main header (tools/designer/src/uitools/quiloader.h) license
notes for uitools.

/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Designer of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$

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


