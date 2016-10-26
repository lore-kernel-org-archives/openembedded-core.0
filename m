Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3AA71AFD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 17:24:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c17so1497410wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 10:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=t78aTZOFkvq5XZGuzMT4xRe39puFmBVyGqvofT9jo/E=;
	b=LSyJ735RbrJj2iDCCWBIFNJUuhiLPF/pLnTp0NdcOSSG0UBTjAssmQyAfnUvSYl74E
	cTlfYmV6ZpXkQwBzWim0VJaSCuE8hsFJ0KTfSO7jbX13RZOZTyAYwUTEhRms5HMtVXLh
	kFYTyETCO5YSbU5f8oAdyGcLFd6xpThWS/KHzShsydFHrjXMTzJ9mpT83uQceL6lGx6E
	R9HirVfUqxcgPFUi+21jwmi6KjL70xmEWdSWnl1nKqckLhUCzyY8GIrYlHZQY+TnAOTK
	R+B0t3mr+GsBpYnC1mdgjGbKs9faSYwNpJPm3pm2FQT1RByxPaMz801Eg2pCXU+MFcsn
	9e0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t78aTZOFkvq5XZGuzMT4xRe39puFmBVyGqvofT9jo/E=;
	b=CoeR0rTUGCDKk82mBmQhHXcR/kquLgGJaLSZAqHTLt9cBjpQS/OI7S/VRAf5a9IgGi
	38I7BG37IsyiYznq0STRr612/XPu6ojlRlj0pplzW2nQbvFnFuLO0J0Yh8DLvDRJ/Sv5
	r39QuK6jNrEWzbvsiQaIch8k8JBrG8FTyunHGGivgwHpwdR5ZTs0A5mSXgDMVd7btU0H
	f2F0JRWj0cnzFadQqdJVtT9JbT5JXNkzv0rG+AT16e7mOl35AoEHFSicXlhOqrJaehw8
	46JCfaMvjHyTPMkNPP1tVJeEjBQsMuv8BkZkk4A4Q9U1y2qtEJoqWe/GG8tQUm9oeprE
	1OsQ==
X-Gm-Message-State: ABUngvcisL0Z0sVbRL31n1KAmLDK26vdROfKE1d7o9IU/nNV5ljbHLAPVvXmNcpgyVYNEQ==
X-Received: by 10.194.113.35 with SMTP id iv3mr3039972wjb.169.1477502694301;
	Wed, 26 Oct 2016 10:24:54 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:4956:ab83:2adb:d88a])
	by smtp.gmail.com with ESMTPSA id
	wh3sm3689969wjb.49.2016.10.26.10.24.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Oct 2016 10:24:53 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 19:24:47 +0200
Message-Id: <1477502687-25444-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/1] package.bbclass: Remove unused variables and imports
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
X-List-Received-Date: Wed, 26 Oct 2016 17:24:54 -0000

Probably leftovers. Verified with a full core-image-sato build. For
imports, I tried to find helper functions that might use an import from
the parent function as well.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/package.bbclass | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a6f0a7a..4f85e2e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -335,7 +335,6 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
 
     import stat
 
-    dvar = d.getVar('PKGD', True)
     objcopy = d.getVar("OBJCOPY", True)
     debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
 
@@ -378,14 +377,9 @@ def copydebugsources(debugsrcdir, d):
     # The debug src information written out to sourcefile is further procecessed
     # and copied to the destination here.
 
-    import stat
-
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     if debugsrcdir and os.path.isfile(sourcefile):
         dvar = d.getVar('PKGD', True)
-        strip = d.getVar("STRIP", True)
-        objcopy = d.getVar("OBJCOPY", True)
-        debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
         workdir = d.getVar("WORKDIR", True)
         workparentdir = os.path.dirname(os.path.dirname(workdir))
         workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
@@ -489,7 +483,6 @@ def runtime_mapping_rename (varname, pkg, d):
 
 python package_get_auto_pr() {
     import oe.prservice
-    import re
 
     # Support per recipe PRSERV_HOST
     pn = d.getVar('PN', True)
@@ -1073,8 +1066,6 @@ python split_and_strip_files () {
 }
 
 python populate_packages () {
-    import glob, re
-
     workdir = d.getVar('WORKDIR', True)
     outdir = d.getVar('DEPLOY_DIR', True)
     dvar = d.getVar('PKGD', True)
@@ -1219,7 +1210,6 @@ python populate_packages () {
 populate_packages[dirs] = "${D}"
 
 python package_fixsymlinks () {
-    import errno
     pkgdest = d.getVar('PKGDEST', True)
     packages = d.getVar("PACKAGES", False).split()
 
@@ -1630,7 +1620,6 @@ python package_do_shlibs() {
         sonames = list()
         renames = list()
         for file in pkgfiles[pkg]:
-                soname = None
                 if cpath.islink(file):
                     continue
                 if targetos == "darwin" or targetos == "darwin8":
-- 
2.7.4


