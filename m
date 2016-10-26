Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2BF66013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 17:39:11 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d128so4206523wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=do3cF612N9KoyHZCG8f4WCxVT88iz/IVxiDlu09eNjY=;
	b=rORG7HNaeD1TY3g+zIa4uyIH2qqkYSSqx+kCB5X2DczGWJh9DGoT22PVhntjC8nrN3
	Dxj0YBlKWsuDGHUzPtjOUH4KD89A5tAz5mhnYyVrGVq/OW4S+NKnG0dzvNvbpLGIxwnT
	4ttRA9wVx3aN0x+L/3AC29q4gBdLvsFKeS9uNP4s4+My6J5J1XvcFHejyJFvr13yT628
	tpF6aeYIkJEBTLZZJv/GzQSkmAal0BZGU7yPyjia4xUI1Lvi58MUXK2wQABCs+I33ceW
	QpSKB1Sje3OUYg82nPWExWI1t8JjeNYPjBA73JNX/7XAGyYPMuocnnm0tUqHJlTSlHVd
	oA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=do3cF612N9KoyHZCG8f4WCxVT88iz/IVxiDlu09eNjY=;
	b=dRAqBWRrHR57IjdBe1GABIB2uEIOrFVT1wxp9EU17+EdD9uo3i9HnWoV4grdh5E/rh
	1K5s/tpz+tdC4YJ+T2jw839LTS11teiAhlUaRywxqW5bkiB5HBMl0JVEAJhgdSMavOn5
	u+hWDcR/42z5UhKlXkwhfNnaUnFzAoxLtd1xVqLLz49QLEPV79n3TeZuvkHuN5A2cGJ9
	FHaZulPgEKYybxTKH1/WQhB1Ib25kZ3kjIIGyhB2cBNUtqaG3VByDgsMJq24mGsXWRO7
	uDnjKl7OtcSk1Sne0P3jCuubO3hR4/giSCZc7cuuqlY1X+Ow/K4dnOMMUcPUapsUPjIn
	EEVg==
X-Gm-Message-State: ABUngvdqHwYh9aCT9qLXuGKoiRZ/ysC7MrloyFBG6dlG9BFjQPShYSZRqowyYddzhISz/Q==
X-Received: by 10.28.38.2 with SMTP id m2mr10229777wmm.102.1477503552745;
	Wed, 26 Oct 2016 10:39:12 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:4956:ab83:2adb:d88a])
	by smtp.gmail.com with ESMTPSA id
	pe5sm3801657wjb.15.2016.10.26.10.39.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Oct 2016 10:39:12 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 19:39:04 +0200
Message-Id: <1477503544-13794-2-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477503544-13794-1-git-send-email-ulfalizer@gmail.com>
References: <1477503544-13794-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH v2 1/1] package.bbclass: Remove unused variables and imports
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
X-List-Received-Date: Wed, 26 Oct 2016 17:39:13 -0000

Probably leftovers. Verified with a full core-image-sato build. For
imports, I tried to find helper functions that might use an import from
the parent function as well.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/package.bbclass | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a6f0a7a..3d5b981 100644
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
@@ -1024,7 +1017,7 @@ python split_and_strip_files () {
             fpath = dvar + dest
             # Skip it if the target doesn't exist
             try:
-                s = os.stat(fpath)
+                os.stat(fpath)
             except OSError as e:
                 (err, strerror) = e.args
                 if err != errno.ENOENT:
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


