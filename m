Return-Path: <jhaws@sdl.usu.edu>
Received: from Perses.usurf.usu.edu (unknown [129.123.197.145])
	by mail.openembedded.org (Postfix) with ESMTP id 424807853C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 22:30:47 +0000 (UTC)
Received: from EK.usurf.usu.edu (172.31.35.73) by Perses.usurf.usu.edu
	(172.31.35.68) with Microsoft SMTP Server (TLS) id 15.0.1293.2;
	Tue, 14 Nov 2017 15:30:49 -0700
Received: from PERSES.usurf.usu.edu (172.31.35.68) by Ek.usurf.usu.edu
	(172.31.35.73) with Microsoft SMTP Server (TLS) id 15.0.1293.2;
	Tue, 14 Nov 2017 15:30:48 -0700
Received: from yocto14.usurf.usu.edu (172.31.22.137) by PERSES.usurf.usu.edu
	(172.31.35.68) with Microsoft SMTP Server id 15.0.1293.2 via Frontend
	Transport; Tue, 14 Nov 2017 15:30:48 -0700
From: Jonathan Haws <jhaws@sdl.usu.edu>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 15:30:39 -0700
Message-ID: <1510698639-3858-1-git-send-email-jhaws@sdl.usu.edu>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCHv2] [meta-oe] mariadb: Added missing installation of mysqld_safe_helper to FILES_${PN}-server
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
X-List-Received-Date: Tue, 14 Nov 2017 22:30:48 -0000
Content-Type: text/plain

Per issue MDEV-14044 on https://jira.mariadb.org/browse/MDEV-14044, mysqld_safe_helper
needs to be installed with the server, but was absent from the mariadb.inc file feeding
the recipes. This resulted in a broken mariadb installation. Installing
mysqld_safe_helper alongside mysqld_safe resolves this problem.

Signed-off-by: Jonathan Haws <jhaws@sdl.usu.edu>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 16dd9f9..263b313 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -258,6 +258,7 @@ FILES_${PN}-server = "\
     ${bindir}/mysqlbinlog \
     ${bindir}/mysqld_multi \
     ${bindir}/mysqld_safe \
+    ${bindir}/mysqld_safe_helper \
     ${bindir}/mysqlhotcopy \
     ${bindir}/mysqltest \
     ${bindir}/ndb_delete_all \
-- 
1.9.1


