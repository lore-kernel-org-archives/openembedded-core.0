Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A53D7586F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:15:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7F03v019113
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:15:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 00:15:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 00:14:51 -0700
Message-ID: <98915966e5b8294dc90754540fa3ab02f1225e21.1436512030.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436512030.git.liezhi.yang@windriver.com>
References: <cover.1436512030.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/12] rpm: remove invalid sed command
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
X-List-Received-Date: Fri, 10 Jul 2015 07:15:02 -0000
Content-Type: text/plain

There is no __check_files in rpm/macros any more, so remove the sed
command.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb |    1 -
 meta/recipes-devtools/rpm/rpm_5.4.14.bb  |    1 -
 2 files changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index a85e28f..8903f3b 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -411,7 +411,6 @@ do_configure() {
 }
 
 do_install_append() {
-	sed -i -e 's,%__check_files,#%%__check_files,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__perl_provides,#%%__perl_provides,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
 	sed -i -e 's,%__perl_requires,#%%__perl_requires,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index bff0687..ddbdcb9 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -396,7 +396,6 @@ do_configure() {
 }
 
 do_install_append() {
-	sed -i -e 's,%__check_files,#%%__check_files,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__perl_provides,#%%__perl_provides,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
 	sed -i -e 's,%__perl_requires,#%%__perl_requires,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
-- 
1.7.9.5


