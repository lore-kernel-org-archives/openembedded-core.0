Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3678560E49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 13:36:11 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id e16so1894061lan.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 May 2014 06:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fhWI3h55d2zx2wBw1gns7dTAPz+g2TvwMcxBHUzOs2E=;
	b=lP9L9ktaMCOqKeFrwoYtOX5nsUrybFWTGxYJLzfZxQbhuwf1J8JDWl7rfybGWM02x8
	S7iJFWFK+/G8eaFlWXEnvTE9jk4fz/YFwAOANiGfiIGx+MgIifYDEV2MbHeeWiyjATJP
	fFBhD391bQ4bc3x7cbXFkuo2AHk0XZg45QTcMZAwJAo34gzzOUkYYg5c3onN5x57lUqg
	r8dfmToTxXIDWLXd6xGAK/U+AVyB4086eww7RrGeZBRLadyLvdKkvw6YfhUu50N79sZa
	4XXkWSBcfsVoM+0C0ObjmiTlSm2Zl/3kuhYAKPnM5MYOU4Gqd6Q6NZs1hCGcJBYn8UgQ
	E//w==
X-Received: by 10.152.203.168 with SMTP id kr8mr12384322lac.17.1399296971881; 
	Mon, 05 May 2014 06:36:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id r9sm1998451lal.0.2014.05.05.06.36.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 06:36:10 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 May 2014 15:36:28 +0200
Message-Id: <1399296988-26654-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH] qt4: Explicitly disable sqlite2
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
X-List-Received-Date: Mon, 05 May 2014 13:36:14 -0000

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
index 0023f16..6de0202 100644
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


