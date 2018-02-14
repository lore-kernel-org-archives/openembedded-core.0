Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9ACA71B9E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 16:03:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1EG3DnX000372
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 08:03:13 -0800 (PST)
Received: from fidler.wrs.com (128.224.56.223) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 14 Feb 2018 08:03:01 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Feb 2018 11:03:13 -0500
Message-ID: <20180214160313.21147-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH v2] package.bbclass: fix typos
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
X-List-Received-Date: Wed, 14 Feb 2018 16:03:13 -0000
Content-Type: text/plain

All typos were in comments but some of these comments end up in run/log files.
The typos can be annoying when searching the log files so they're worth
fixing with ispell.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/classes/package.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6a7f35a3e7..aecaeed1e6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -26,7 +26,7 @@
 #    a list of affected files in FILER{PROVIDES,DEPENDS}FLIST_pkg
 #
 # h) package_do_shlibs - Look at the shared libraries generated and autotmatically add any
-#    depenedencies found. Also stores the package name so anyone else using this library
+#    dependencies found. Also stores the package name so anyone else using this library
 #    knows which package to depend on.
 #
 # i) package_do_pkgconfig - Keep track of which packages need and provide which .pc files
@@ -401,7 +401,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     return 0
 
 def copydebugsources(debugsrcdir, d):
-    # The debug src information written out to sourcefile is further procecessed
+    # The debug src information written out to sourcefile is further processed
     # and copied to the destination here.
 
     import stat
@@ -650,7 +650,7 @@ python fixup_perms () {
     # __str__ can be used to print out an entry in the input format
     #
     # if fs_perms_entry.path is None:
-    #    an error occured
+    #    an error occurred
     # if fs_perms_entry.link, you can retrieve:
     #    fs_perms_entry.path = path
     #    fs_perms_entry.link = target of link
@@ -972,7 +972,7 @@ python split_and_strip_files () {
                     continue
                 if not s:
                     continue
-                # Check its an excutable
+                # Check its an executable
                 if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
                         or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
                     # If it's a symlink, and points to an ELF file, we capture the readlink target
@@ -1000,7 +1000,7 @@ python split_and_strip_files () {
                         #  b) Only strip any hardlinked file once (no races)
                         #  c) Track any hardlinks between files so that we can reconstruct matching debug file hardlinks
 
-                        # Use a reference of device ID and inode number to indentify files
+                        # Use a reference of device ID and inode number to identify files
                         file_reference = "%d_%d" % (s.st_dev, s.st_ino)
                         if file_reference in inodes:
                             os.unlink(file)
@@ -1122,7 +1122,7 @@ python populate_packages () {
         d.setVar('FILES_%s' % src_package_name, '/usr/src/debug')
 
     # Sanity check PACKAGES for duplicates
-    # Sanity should be moved to sanity.bbclass once we have the infrastucture
+    # Sanity should be moved to sanity.bbclass once we have the infrastructure
     package_list = []
 
     for pkg in packages.split():
-- 
2.14.3


