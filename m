Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f181.google.com (unknown [209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 57D4566056
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:34:43 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id u14so7213052lbd.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=W+UbJ1PxnHkRly35vb4+KpdggrCzS9FRxGGaNe2RsvI=;
	b=wwism/DUVLsDzro3tbwDLPygKWXLlFyPtexxMaIPOGDLQVtOFqy2H+tUhb/eTsiUqW
	kpcCTqzfGr2LyP+JI2S3m2VzrSd4VZEZMZB+wiP6i+nBs+G0fJQ4TPnAmC8XJojyipME
	GH2+jc4TeqVqpcqF2LE0M6pwfbVmqhRdYFMzySxHiUoIndCz+NLqih/+9IDfTE2ua5xG
	PdhcBWo3C2JBrP6jnCWbDMyfpHB8h+sFsKPkUYCuPDvJd/ra1+5PWHBpuOID1Prn4pu0
	3a3ACxUOvbQ2AxU0ReMnvy/zXvoXrOu2agNJs5e4o6Uv7g+1AD1UPYoafdzwEGlNDvao
	IRVw==
X-Received: by 10.152.23.136 with SMTP id m8mr13014740laf.2.1399894484466;
	Mon, 12 May 2014 04:34:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r2sm11475757laa.5.2014.05.12.04.34.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:34:43 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:52 +0200
Message-Id: <46732215b62d1a9b2a272809e46d1323172e944d.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 03/10] qt4: Explicitly disable sqlite2
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
X-List-Received-Date: Mon, 12 May 2014 11:34:44 -0000

* notice that this disables only sqlite2 (sqlite dependency),
  sqlite (sqlite3 dependency) stays enabled

* fixes these errors detected by test-dependencies.sh:
  qt4-embedded/qt4-embedded-plugin-sqldriver-sqlite2/latest doesn't exist
  qt4-embedded/qt4-embedded-plugin-sqldriver-sqlite2-dbg/latest doesn't exist
  qt4-x11-free/qt4-plugin-sqldriver-sqlite2/latest doesn't exist
  qt4-x11-free/qt4-plugin-sqldriver-sqlite2-dbg/latest doesn't exist

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/qt4.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 9a10138..223b29c 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -8,7 +8,7 @@ require qt4_arch.inc
 QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
 QT_DISTRO_FLAGS_linuxstdbase = "-sm"
 
-QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite -system-sqlite"
+QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -no-sql-sqlite2 -plugin-sql-sqlite -system-sqlite"
 
 QT_GLFLAGS ?= ""
 
-- 
1.9.2


