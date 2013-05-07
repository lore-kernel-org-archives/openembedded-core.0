Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhiu-0007k0-UX
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:32 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47Cwgd9005214; Tue, 7 May 2013 13:58:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rwRUHqqKfFFG; Tue,  7 May 2013 13:58:42 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwbWm005182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:39 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRF-0005bc-Gw; Tue, 07 May 2013 13:56:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:55:53 +0100
Message-Id: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 01/15] classes/recipes/lib: Fix various python whitespace issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 13:14:39 -0000
X-List-Received-Date: Tue, 07 May 2013 13:14:39 -0000

There are some left over tab characters in the python functions. This
removes them and resolves python 3 errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass                        |   26 ++++++++++----------
 meta/classes/multilib_global.bbclass               |    2 +-
 meta/lib/oe/sstatesig.py                           |   20 +++++++--------
 .../meta/external-sourcery-toolchain.bb            |    2 +-
 meta/recipes-devtools/cmake/cmake_2.8.10.2.bb      |    4 +--
 .../linux-libc-headers/linux-libc-headers.inc      |    4 +--
 meta/recipes-kernel/linux/linux-dtb.inc            |    8 +++---
 7 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 336beaa..271e9ff 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -173,10 +173,10 @@ def package_qa_check_rpath(file,name, d, elf, messages):
     import re
     rpath_re = re.compile("\s+RPATH\s+(.*)")
     for line in phdrs.split("\n"):
-    	m = rpath_re.match(line)
-	if m:
-	    rpath = m.group(1)
-	    for dir in bad_dirs:
+        m = rpath_re.match(line)
+        if m:
+            rpath = m.group(1)
+            for dir in bad_dirs:
                 if dir in rpath:
                     messages.append("package %s contains bad RPATH %s in file %s" % (name, rpath, file))
 
@@ -202,13 +202,13 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     import re
     rpath_re = re.compile("\s+RPATH\s+(.*)")
     for line in phdrs.split("\n"):
-    	m = rpath_re.match(line)
-	if m:
-	   rpath = m.group(1)
-	   if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
-	      # The dynamic linker searches both these places anyway.  There is no point in
-	      # looking there again.
-	      messages.append("%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
+        m = rpath_re.match(line)
+        if m:
+           rpath = m.group(1)
+           if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
+              # The dynamic linker searches both these places anyway.  There is no point in
+              # looking there again.
+              messages.append("%s: %s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(file, d), rpath))
 
 QAPATHTEST[dev-so] = "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
@@ -463,7 +463,7 @@ def package_qa_textrel(path, name, d, elf, messages):
     textrel_re = re.compile("\s+TEXTREL\s+")
     for line in phdrs.split("\n"):
         if textrel_re.match(line):
-	   sane = False
+            sane = False
 
     if not sane:
         messages.append("ELF binary '%s' has relocations in .text" % path)
@@ -498,7 +498,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
         if "GNU_HASH" in line:
             sane = True
         if "[mips32]" in line or "[mips64]" in line:
-	    sane = True
+             sane = True
 
     if has_syms and not sane:
         messages.append("No GNU_HASH in the elf binary: '%s'" % path)
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 529e82a..40ae006 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -5,7 +5,7 @@ python multilib_virtclass_handler_global () {
     if isinstance(e, bb.event.RecipePreFinalise):
         for v in e.data.getVar("MULTILIB_VARIANTS", True).split():
             if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + v, False) is None:
-	       e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + v, e.data.getVar("TARGET_VENDOR", False) + "ml" + v)
+               e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + v, e.data.getVar("TARGET_VENDOR", False) + "ml" + v)
 
     variant = e.data.getVar("BBEXTENDVARIANT", True)
 
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 79a410e..852fb7e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -108,16 +108,16 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     foundall = False
     import glob
     for fullpath in glob.glob(filespec):
-	match = False
-	if taskhashlist:
-	    for taskhash in taskhashlist:
-		if fullpath.endswith('.%s' % taskhash):
-		    hashfiles[taskhash] = fullpath
-		    if len(hashfiles) == len(taskhashlist):
-			foundall = True
-			break
-	else:
-	    filedates[fullpath] = os.stat(fullpath).st_mtime
+        match = False
+        if taskhashlist:
+            for taskhash in taskhashlist:
+                if fullpath.endswith('.%s' % taskhash):
+                    hashfiles[taskhash] = fullpath
+                    if len(hashfiles) == len(taskhashlist):
+                        foundall = True
+                        break
+        else:
+            filedates[fullpath] = os.stat(fullpath).st_mtime
 
     if len(filedates) < 2 and not foundall:
         # That didn't work, look in sstate-cache
diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
index 24c7ce8..3218754 100644
--- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
+++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
@@ -142,6 +142,6 @@ CSL_VER_MAIN ??= ""
 
 python () {
     if not d.getVar("CSL_VER_MAIN"):
-	raise bb.parse.SkipPackage("External CSL toolchain not configured (CSL_VER_MAIN not set).")
+        	raise bb.parse.SkipPackage("External CSL toolchain not configured (CSL_VER_MAIN not set).")
 }
 
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.10.2.bb b/meta/recipes-devtools/cmake/cmake_2.8.10.2.bb
index ce398dd..65f75b4 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.10.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.10.2.bb
@@ -17,11 +17,11 @@ python () {
     docdir=d.getVar("docdir", True)
 
     if not docdir.startswith(prefix):
-	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
+        raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
 
     docdir_stripped = docdir[len(prefix):]
     if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
-	docdir_stripped = docdir_stripped[1:]
+        docdir_stripped = docdir_stripped[1:]
 
     d.setVar("docdir_stripped", docdir_stripped)
 }
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 962ca75..96fe2ff 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 python __anonymous () {
     major = d.getVar("PV",True).split('.')[0]
     if major == "3":
-	d.setVar("HEADER_FETCH_VER", "3.0")
+        d.setVar("HEADER_FETCH_VER", "3.0")
     else:
-	d.setVar("HEADER_FETCH_VER", "2.6")
+        d.setVar("HEADER_FETCH_VER", "2.6")
 }
 
 inherit kernel-arch
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 58b93a1..7747718 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -5,10 +5,10 @@ KERNEL_DEVICETREE_FLAGS ?= "-R 8 -p 0x3000"
 python __anonymous () {
     devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
     if devicetree:
-	depends = d.getVar("DEPENDS", True)
-	d.setVar("DEPENDS", "%s dtc-native" % depends)
-	packages = d.getVar("PACKAGES", True)
-	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
+        depends = d.getVar("DEPENDS", True)
+        d.setVar("DEPENDS", "%s dtc-native" % depends)
+        packages = d.getVar("PACKAGES", True)
+        d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
 }
 
 do_install_append() {
-- 
1.7.10.4



