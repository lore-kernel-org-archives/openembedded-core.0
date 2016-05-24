Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5F47465CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498158"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:14 +0300
Message-Id: <8c7374d7dbae0b79760e77944ce8e5f051d8c276.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 25/45] git: remove Python package (to which nothing was packaged)
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
X-List-Received-Date: Tue, 24 May 2016 11:54:03 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/git/git.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 7b3bec7..753b047 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -32,8 +32,7 @@ do_compile_prepend () {
 
 do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
-		template_dir=${datadir}/git-core/templates \
-		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
+		template_dir=${datadir}/git-core/templates
 	install -d ${D}/${mandir}/man1
 	install -d ${D}/${mandir}/man5
 	install -d ${D}/${mandir}/man7
@@ -108,10 +107,6 @@ FILES_${PN}-perltools += " \
 "
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
 
-PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${libdir}/python*"
-
-
 # git-tk package with gitk and git-gui
 PACKAGES =+ "${PN}-tk"
 #RDEPENDS_${PN}-tk = "${PN} tk tcl"
-- 
2.8.1


