Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id D215E6BBD2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:17 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id g10so5138877pdj.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=eSDfqqnV9MLIGUtuSpRCFLGqlelmIztx5n5kIt4P6kw=;
	b=0kxLrjfY0lREuQD3YKMbLFw9myuKcQBkhCsnwAaYjs6pDvS6BvHmDTqiqqEWJp+C3P
	u2Bb65ZgTD7+TIn3Gt9GO7VWY0zW/ZmM2ahICZ0I39XD00DQK1khrkHePDRRAyBbe45Q
	S/RGKFjIByxmlOmIlKq3abuVgRR0l+Gjkl5mTrTMhRBKUCT34PIH5uZcgcpMebzrmIa1
	Qbyk8SLNDAh0afTyhL6KiiRxkESLlUaXjc6SULF4j9pc06dMGsxsVIYpyR9/dF9Z8f3g
	vzg1nbrPUhwMzjSxlabCiN/DVuNuRRtYjhPneSidRtBTpuBzZsG8XRN1ZzAlbNW3DmyD
	CdcA==
X-Received: by 10.66.243.196 with SMTP id xa4mr9985807pac.174.1377623778925;
	Tue, 27 Aug 2013 10:16:18 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:12 -0700
Message-Id: <9b2e65dcceaa83140248a113d96862e0b9f572c8.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 13/20] python3: Upgrade to 3.3.2
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:18 -0000

3.3.2 is latest bugfix release in 3.3 series

License text is changed to reflect year and prev releases

+++ ../Python-3.3.2/LICENSE     2013-05-15 09:32:54.000000000 -0700
@@ -74,7 +74,9 @@
     3.2.1           3.2         2011        PSF         yes
     3.2.2           3.2.1       2011        PSF         yes
     3.2.3           3.2.2       2012        PSF         yes
+    3.2.4           3.2.3       2013        PSF         yes
     3.3.0           3.2         2012        PSF         yes
+    3.3.1           3.3.0       2013        PSF         yes

 Footnotes:

@@ -110,8 +112,8 @@
 distribute, and otherwise use Python alone or in any derivative
version,
 provided, however, that PSF's License Agreement and PSF's notice of
copyright,
 i.e., "Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008,
2009, 2010,
-2011, 2012 Python Software Foundation; All Rights Reserved" are
retained in Python
-alone or in any derivative version prepared by Licensee.
+2011, 2012, 2013 Python Software Foundation; All Rights Reserved" are
retained
+in Python alone or in any derivative version prepared by Licensee.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...on3-native_3.3.0.bb => python3-native_3.3.2.bb} |   9 +-
 ...sue-13032-where-it-fails-with-UnicodeDeco.patch |  37 +++++
 .../python/python3/030-fixup-include-dirs.patch    |  21 +--
 .../python/python3/140-verbose-sharedmods.patch    |  10 --
 .../python/python3/h2py-pr13032.patch              | 185 ---------------------
 .../python/{python3_3.3.0.bb => python3_3.3.2.bb}  |   9 +-
 6 files changed, 51 insertions(+), 220 deletions(-)
 rename meta/recipes-devtools/python/{python3-native_3.3.0.bb => python3-native_3.3.2.bb} (87%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch
 delete mode 100644 meta/recipes-devtools/python/python3/140-verbose-sharedmods.patch
 delete mode 100644 meta/recipes-devtools/python/python3/h2py-pr13032.patch
 rename meta/recipes-devtools/python/{python3_3.3.0.bb => python3_3.3.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-native_3.3.0.bb b/meta/recipes-devtools/python/python3-native_3.3.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-native_3.3.0.bb
rename to meta/recipes-devtools/python/python3-native_3.3.2.bb
index 3486ca0..f7221ed 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.0.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.2.bb
@@ -12,20 +12,19 @@ file://070-dont-clean-ipkg-install.patch \
 file://080-distutils-dont_adjust_files.patch \
 file://110-enable-zlib.patch \
 file://130-readline-setup.patch \
-file://140-verbose-sharedmods.patch \
 file://150-fix-setupterm.patch \
-file://h2py-pr13032.patch \
 file://python-3.3-multilib.patch \
 file://03-fix-tkinter-detection.patch \
 file://avoid_warning_about_tkinter.patch \
 file://06-ctypes-libffi-fix-configure.patch \
 file://shutil-follow-symlink-fix.patch \
+file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 ${DISTRO_SRC_URI} \
 "
-SRC_URI[md5sum] = "b3b2524f72409d919a4137826a870a8f"
-SRC_URI[sha256sum] = "15c113fd6c058712f05d31b4eff149d4d823b8e39ef5e37228dc5dc4f8716df9"
+SRC_URI[md5sum] = "7dffe775f3bea68a44f762a3490e5e28"
+SRC_URI[sha256sum] = "f77202fe2bbc203205d7bd6e8452567fa1d9bc97f6957c9ef753d9a36cdcbe9a"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d214581529e343354f8e23025bdf582d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a7e738bb078a33a825ce4a0282f8cb31"
 
 S = "${WORKDIR}/Python-${PV}"
 
diff --git a/meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch b/meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch
new file mode 100644
index 0000000..dd6b24f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch
@@ -0,0 +1,37 @@
+From 2f5a4c708d90fa8db21f446ae879cff79387448d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2013 21:03:16 -0700
+Subject: [PATCH] h2py: Fix issue 13032 where it fails with UnicodeDecodeError
+
+use utf-8 to open the files
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ Tools/scripts/h2py.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Tools/scripts/h2py.py b/Tools/scripts/h2py.py
+index 4f871d9..a53fbe0 100755
+--- a/Tools/scripts/h2py.py
++++ b/Tools/scripts/h2py.py
+@@ -69,13 +69,13 @@ def main():
+             sys.stdout.write('# Generated by h2py from stdin\n')
+             process(sys.stdin, sys.stdout)
+         else:
+-            fp = open(filename, 'r')
++            fp = open(filename, 'r', encoding='utf-8')
+             outfile = os.path.basename(filename)
+             i = outfile.rfind('.')
+             if i > 0: outfile = outfile[:i]
+             modname = outfile.upper()
+             outfile = modname + '.py'
+-            outfp = open(outfile, 'w')
++            outfp = open(outfile, 'w', encoding='utf-8')
+             outfp.write('# Generated by h2py from %s\n' % filename)
+             filedict = {}
+             for dir in searchdirs:
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
index 4882118..3e009c1 100644
--- a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
+++ b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
@@ -2,9 +2,11 @@
  setup.py |   15 ++-------------
  1 file changed, 2 insertions(+), 13 deletions(-)
 
---- a/setup.py
-+++ b/setup.py
-@@ -464,7 +464,8 @@ class PyBuildExt(build_ext):
+Index: Python-3.3.2/setup.py
+===================================================================
+--- Python-3.3.2.orig/setup.py
++++ Python-3.3.2/setup.py
+@@ -444,7 +444,8 @@ class PyBuildExt(build_ext):
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
              self.add_gcc_paths()
@@ -14,7 +16,7 @@
  
          # Add paths specified in the environment variables LDFLAGS and
          # CPPFLAGS for header and library files.
-@@ -500,7 +501,7 @@ class PyBuildExt(build_ext):
+@@ -480,7 +481,7 @@ class PyBuildExt(build_ext):
                      for directory in reversed(options.dirs):
                          add_dir_to_list(dir_list, directory)
  
@@ -23,14 +25,3 @@
                  and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
              # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
              # (PYTHONFRAMEWORK is set) to avoid # linking problems when
-@@ -520,6 +521,10 @@ class PyBuildExt(build_ext):
-                 '/lib', '/usr/lib',
-                 ]
-             inc_dirs = self.compiler.include_dirs + ['/usr/include']
-+        if cross_compiling:
-+            lib_dirs = self.compiler.library_dirs
-+            inc_dirs = self.compiler.include_dirs
-+
-         exts = []
-         missing = []
- 
diff --git a/meta/recipes-devtools/python/python3/140-verbose-sharedmods.patch b/meta/recipes-devtools/python/python3/140-verbose-sharedmods.patch
deleted file mode 100644
index db3f124..0000000
--- a/meta/recipes-devtools/python/python3/140-verbose-sharedmods.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -477,7 +477,6 @@ $(SYSCONFIGDATA): $(BUILDPYTHON)
- 
- # Build the shared modules
- sharedmods: $(BUILDPYTHON) $(SYSCONFIGDATA)
--	case $$MAKEFLAGS in *s*) quiet=-q; esac; \
- 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
- 
diff --git a/meta/recipes-devtools/python/python3/h2py-pr13032.patch b/meta/recipes-devtools/python/python3/h2py-pr13032.patch
deleted file mode 100644
index 39b845b..0000000
--- a/meta/recipes-devtools/python/python3/h2py-pr13032.patch
+++ /dev/null
@@ -1,185 +0,0 @@
-This is backport of upstream bug
-
-http://bugs.python.org/issue13032
-
-Fixes issues like below
-
-|   File "/work/yocto/poky/build/tmp/work/x86_64-poky-linux/python3-3.3.0-r0.0/Python-3.3.0rc2/Tools/scripts/h2py.py", line 167, in <module>
-|     main()
-|   File "/work/yocto/poky/build/tmp/work/x86_64-poky-linux/python3-3.3.0-r0.0/Python-3.3.0rc2/Tools/scripts/h2py.py", line 81, in main
-|     process(fp, outfp)
-|   File "/work/yocto/poky/build/tmp/work/x86_64-poky-linux/python3-3.3.0-r0.0/Python-3.3.0rc2/Tools/scripts/h2py.py", line 108, in process
-|     line = fp.readline()
-|   File "/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib/python3.3/encodings/ascii.py", line 26, in decode
-|     return codecs.ascii_decode(input, self.errors)[0]
-| UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 175: ordinal not in range(128)
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/Tools/scripts/h2py.py
-+++ b/Tools/scripts/h2py.py
-@@ -23,55 +23,56 @@
- 
- import sys, re, getopt, os
- 
--p_define = re.compile('^[\t ]*#[\t ]*define[\t ]+([a-zA-Z0-9_]+)[\t ]+')
-+p_define = re.compile(b'^[\t ]*#[\t ]*define[\t ]+([a-zA-Z0-9_]+)[\t ]+')
- 
- p_macro = re.compile(
--  '^[\t ]*#[\t ]*define[\t ]+'
--  '([a-zA-Z0-9_]+)\(([_a-zA-Z][_a-zA-Z0-9]*)\)[\t ]+')
-+  b'^[\t ]*#[\t ]*define[\t ]+'
-+  b'([a-zA-Z0-9_]+)\(([_a-zA-Z][_a-zA-Z0-9]*)\)[\t ]+')
- 
--p_include = re.compile('^[\t ]*#[\t ]*include[\t ]+<([a-zA-Z0-9_/\.]+)')
-+p_include = re.compile(b'^[\t ]*#[\t ]*include[\t ]+<([a-zA-Z0-9_/\.]+)')
- 
--p_comment = re.compile(r'/\*([^*]+|\*+[^/])*(\*+/)?')
--p_cpp_comment = re.compile('//.*')
-+p_comment = re.compile(br'/\*([^*]+|\*+[^/])*(\*+/)?')
-+p_cpp_comment = re.compile(b'//.*')
- 
- ignores = [p_comment, p_cpp_comment]
- 
--p_char = re.compile(r"'(\\.[^\\]*|[^\\])'")
-+p_char = re.compile(br"'(\\.[^\\]*|[^\\])'")
- 
--p_hex = re.compile(r"0x([0-9a-fA-F]+)L?")
-+p_hex = re.compile(br"0x([0-9a-fA-F]+)L?")
- 
- filedict = {}
- importable = {}
- 
- try:
--    searchdirs=os.environ['include'].split(';')
-+    searchdirs=os.environb[b'include'].split(b';')
- except KeyError:
-     try:
--        searchdirs=os.environ['INCLUDE'].split(';')
-+        searchdirs=os.environb[b'INCLUDE'].split(b';')
-     except KeyError:
--        searchdirs=['/usr/include']
-+        searchdirs=[b'/usr/include']
- 
- def main():
-     global filedict
-     opts, args = getopt.getopt(sys.argv[1:], 'i:')
-     for o, a in opts:
-         if o == '-i':
--            ignores.append(re.compile(a))
-+            ignores.append(re.compile(a.encode()))
-     if not args:
-         args = ['-']
-     for filename in args:
-         if filename == '-':
-             sys.stdout.write('# Generated by h2py from stdin\n')
--            process(sys.stdin, sys.stdout)
-+            process(sys.stdin.buffer, sys.stdout.buffer)
-         else:
--            fp = open(filename, 'r')
-+            filename = filename.encode()
-+            fp = open(filename, 'rb')
-             outfile = os.path.basename(filename)
--            i = outfile.rfind('.')
-+            i = outfile.rfind(b'.')
-             if i > 0: outfile = outfile[:i]
-             modname = outfile.upper()
--            outfile = modname + '.py'
--            outfp = open(outfile, 'w')
--            outfp.write('# Generated by h2py from %s\n' % filename)
-+            outfile = modname + b'.py'
-+            outfp = open(outfile, 'wb')
-+            outfp.write(b'# Generated by h2py from ' + filename + b'\n')
-             filedict = {}
-             for dir in searchdirs:
-                 if filename[:len(dir)] == dir:
-@@ -85,9 +86,9 @@
- def pytify(body):
-     # replace ignored patterns by spaces
-     for p in ignores:
--        body = p.sub(' ', body)
-+        body = p.sub(b' ', body)
-     # replace char literals by ord(...)
--    body = p_char.sub("ord('\\1')", body)
-+    body = p_char.sub(b"ord('\\1')", body)
-     # Compute negative hexadecimal constants
-     start = 0
-     UMAX = 2*(sys.maxsize+1)
-@@ -98,7 +99,7 @@
-         val = int(body[slice(*m.span(1))], 16)
-         if val > sys.maxsize:
-             val -= UMAX
--            body = body[:s] + "(" + str(val) + ")" + body[e:]
-+            body = body[:s] + b"(" + str(val).encode() + b")" + body[e:]
-         start = s + 1
-     return body
- 
-@@ -111,7 +112,7 @@
-         match = p_define.match(line)
-         if match:
-             # gobble up continuation lines
--            while line[-2:] == '\\\n':
-+            while line[-2:] == b'\\\n':
-                 nextline = fp.readline()
-                 if not nextline: break
-                 lineno = lineno + 1
-@@ -120,11 +121,11 @@
-             body = line[match.end():]
-             body = pytify(body)
-             ok = 0
--            stmt = '%s = %s\n' % (name, body.strip())
-+            stmt = name + b' = ' + body.strip() + b'\n'
-             try:
-                 exec(stmt, env)
-             except:
--                sys.stderr.write('Skipping: %s' % stmt)
-+                sys.stderr.buffer.write(b'Skipping: ' + stmt)
-             else:
-                 outfp.write(stmt)
-         match = p_macro.match(line)
-@@ -132,11 +133,11 @@
-             macro, arg = match.group(1, 2)
-             body = line[match.end():]
-             body = pytify(body)
--            stmt = 'def %s(%s): return %s\n' % (macro, arg, body)
-+            stmt = b'def ' + macro + b'(' + arg + b'): return ' + body + b'\n'
-             try:
-                 exec(stmt, env)
-             except:
--                sys.stderr.write('Skipping: %s' % stmt)
-+                sys.stderr.buffer.write(b'Skipping: ' + stmt)
-             else:
-                 outfp.write(stmt)
-         match = p_include.match(line)
-@@ -145,23 +146,24 @@
-             a, b = regs[1]
-             filename = line[a:b]
-             if filename in importable:
--                outfp.write('from %s import *\n' % importable[filename])
-+                outfp.write(b'from ' + importable[filename] + b' import *\n')
-             elif filename not in filedict:
-                 filedict[filename] = None
-                 inclfp = None
-                 for dir in searchdirs:
-                     try:
--                        inclfp = open(dir + '/' + filename)
-+                        inclfp = open(dir + b'/' + filename, 'rb')
-                         break
-                     except IOError:
-                         pass
-                 if inclfp:
-                     outfp.write(
--                            '\n# Included from %s\n' % filename)
-+                            b'\n# Included from ' + filename + b'\n')
-                     process(inclfp, outfp, env)
-+                    inclfp.close()
-                 else:
--                    sys.stderr.write('Warning - could not find file %s\n' %
--                                     filename)
-+                    sys.stderr.buffer.write(b'Warning - could not find file ' +
-+                                            filename + b'\n')
- 
- if __name__ == '__main__':
-     main()
-
diff --git a/meta/recipes-devtools/python/python3_3.3.0.bb b/meta/recipes-devtools/python/python3_3.3.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3_3.3.0.bb
rename to meta/recipes-devtools/python/python3_3.3.2.bb
index 081586d..b92824e 100644
--- a/meta/recipes-devtools/python/python3_3.3.0.bb
+++ b/meta/recipes-devtools/python/python3_3.3.2.bb
@@ -14,9 +14,8 @@ file://070-dont-clean-ipkg-install.patch \
 file://080-distutils-dont_adjust_files.patch \
 file://110-enable-zlib.patch \
 file://130-readline-setup.patch \
-file://140-verbose-sharedmods.patch \
 file://150-fix-setupterm.patch \
-file://h2py-pr13032.patch \
+file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 ${DISTRO_SRC_URI} \
 "
 
@@ -31,10 +30,10 @@ SRC_URI += "\
             file://python-3.3-multilib.patch \
             file://shutil-follow-symlink-fix.patch \
            "
-SRC_URI[md5sum] = "b3b2524f72409d919a4137826a870a8f"
-SRC_URI[sha256sum] = "15c113fd6c058712f05d31b4eff149d4d823b8e39ef5e37228dc5dc4f8716df9"
+SRC_URI[md5sum] = "7dffe775f3bea68a44f762a3490e5e28"
+SRC_URI[sha256sum] = "f77202fe2bbc203205d7bd6e8452567fa1d9bc97f6957c9ef753d9a36cdcbe9a"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d214581529e343354f8e23025bdf582d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a7e738bb078a33a825ce4a0282f8cb31"
 
 S = "${WORKDIR}/Python-${PV}"
 
-- 
1.8.3.4


