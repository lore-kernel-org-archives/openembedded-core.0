Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7A20C74D03
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 12:08:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y1so4128530wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2018 04:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xCOoqgdFlS2lL6ZlU83sd5hMFNNxGJMgmSsYsp82SqY=;
	b=ICNpSaiF4NnnPI+tQLnqoO7b6Ek7n1exm6TjPM8jZBOoklg/pvogph4WydHmem/F3I
	7BgCJ2Vde3mTQ4dmsIs/5RZNdfjEuvJoknQlvKkma1zDGkXxMPa9zvRH4iqD+Wg0CNGU
	Y+xzXQfY3kZBc9mlFJcO47beg0H9UpEn9Yi3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xCOoqgdFlS2lL6ZlU83sd5hMFNNxGJMgmSsYsp82SqY=;
	b=FaNhVT58XlpbS1l43EKJz2y5cDqNBExJOM1hwzrHm7/LZP54603Ff8uGXdO7b/1zPm
	DbS5gcpoO8Al3A0p1YsXsit0ootGcpEF8mIG9vwh2BalXSfKVvn39EKcC+7MEDUs7pFI
	VVxpl+zdrR7I/n96uKxq+49985r0MEi+5jrzXn97r2AX438M4gExTP5JbfeRoLCiyP9T
	noy/F0p8u9SlCRYM3ZxpFjstN8+XxeALIEHHiaDJjETwkkT7z71ym9wlY20QYhSaCYgD
	rBxPDMXtRZOLNe9TLyedQ0V6CAQ01zbVm7vzvYyPhbxv559jrLh3lraAhhU378Q4PIyQ
	+qVQ==
X-Gm-Message-State: AA+aEWbO5fckKG5TdyzFYxyROAn49M/eCS2ndaebRZtOOzx/xju5Oepa
	8lS6eF7OZMaxGF6NecqLlEb0OHzD5xE=
X-Google-Smtp-Source: AFSGD/WtD5/2+9REKY65ls/qD+CTNXVn4myWnv3//a+ubT17jxuA48xsCVV7HEnaDHFBt8zaU12W+A==
X-Received: by 2002:a1c:a755:: with SMTP id q82mr2138519wme.6.1544184506814;
	Fri, 07 Dec 2018 04:08:26 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r76-v6sm4656286wmb.21.2018.12.07.04.08.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 04:08:25 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2018 12:08:24 +0000
Message-Id: <20181207120824.11481-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] classes: Correctly markup regex strings
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
X-List-Received-Date: Fri, 07 Dec 2018 12:08:26 -0000
Content-Transfer-Encoding: 8bit

There are various escape characters in these stings which python warns
about so use the correct regex markup for them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/clutter.bbclass       |  4 ++--
 meta/classes/cmake.bbclass         |  2 +-
 meta/classes/insane.bbclass        | 16 ++++++++--------
 meta/classes/license_image.bbclass | 14 +++++++-------
 meta/classes/perl-version.bbclass  |  2 +-
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/classes/clutter.bbclass b/meta/classes/clutter.bbclass
index 8550363bdfd..5edab0e55d6 100644
--- a/meta/classes/clutter.bbclass
+++ b/meta/classes/clutter.bbclass
@@ -1,11 +1,11 @@
 def get_minor_dir(v):
     import re
-    m = re.match("^([0-9]+)\.([0-9]+)", v)
+    m = re.match(r"^([0-9]+)\.([0-9]+)", v)
     return "%s.%s" % (m.group(1), m.group(2))
 
 def get_real_name(n):
     import re
-    m = re.match("^([a-z]+(-[a-z]+)?)(-[0-9]+\.[0-9]+)?", n)
+    m = re.match(r"^([a-z]+(-[a-z]+)?)(-[0-9]+\.[0-9]+)?", n)
     return "%s" % (m.group(1))
 
 VERMINOR = "${@get_minor_dir("${PV}")}"
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index fd40a9863ea..b364d2bc20d 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -20,7 +20,7 @@ python() {
     elif generator == "Ninja":
         d.appendVar("DEPENDS", " ninja-native")
         d.setVar("OECMAKE_GENERATOR_ARGS", "-G Ninja -DCMAKE_MAKE_PROGRAM=ninja")
-        d.setVarFlag("do_compile", "progress", "outof:^\[(\d+)/(\d+)\]\s+")
+        d.setVarFlag("do_compile", "progress", r"outof:^\[(\d+)/(\d+)\]\s+")
     else:
         bb.fatal("Unknown CMake Generator %s" % generator)
 }
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 6718feb3af5..295feb8a5fd 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -111,7 +111,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
     phdrs = elf.run_objdump("-p", d)
 
     import re
-    rpath_re = re.compile("\s+RPATH\s+(.*)")
+    rpath_re = re.compile(r"\s+RPATH\s+(.*)")
     for line in phdrs.split("\n"):
         m = rpath_re.match(line)
         if m:
@@ -140,7 +140,7 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     phdrs = elf.run_objdump("-p", d)
 
     import re
-    rpath_re = re.compile("\s+RPATH\s+(.*)")
+    rpath_re = re.compile(r"\s+RPATH\s+(.*)")
     for line in phdrs.split("\n"):
         m = rpath_re.match(line)
         if m:
@@ -203,8 +203,8 @@ def package_qa_check_libdir(d):
     # The re's are purposely fuzzy, as some there are some .so.x.y.z files
     # that don't follow the standard naming convention. It checks later
     # that they are actual ELF files
-    lib_re = re.compile("^/lib.+\.so(\..+)?$")
-    exec_re = re.compile("^%s.*/lib.+\.so(\..+)?$" % exec_prefix)
+    lib_re = re.compile(r"^/lib.+\.so(\..+)?$")
+    exec_re = re.compile(r"^%s.*/lib.+\.so(\..+)?$" % exec_prefix)
 
     for root, dirs, files in os.walk(pkgdest):
         if root == pkgdest:
@@ -302,7 +302,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
     # Check the architecture and endiannes of the binary
     is_32 = (("virtual/kernel" in provides) or bb.data.inherits_class("module", d)) and \
             (target_os == "linux-gnux32" or target_os == "linux-muslx32" or \
-            target_os == "linux-gnu_ilp32" or re.match('mips64.*32', d.getVar('DEFAULTTUNE')))
+            target_os == "linux-gnu_ilp32" or re.match(r'mips64.*32', d.getVar('DEFAULTTUNE')))
     is_bpf = (oe.qa.elf_machine_to_string(elf.machine()) == "BPF")
     if not ((machine == elf.machine()) or is_32 or is_bpf):
         package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
@@ -342,7 +342,7 @@ def package_qa_textrel(path, name, d, elf, messages):
     sane = True
 
     import re
-    textrel_re = re.compile("\s+TEXTREL\s+")
+    textrel_re = re.compile(r"\s+TEXTREL\s+")
     for line in phdrs.split("\n"):
         if textrel_re.match(line):
             sane = False
@@ -952,7 +952,7 @@ python do_package_qa () {
 
     import re
     # The package name matches the [a-z0-9.+-]+ regular expression
-    pkgname_pattern = re.compile("^[a-z0-9.+-]+$")
+    pkgname_pattern = re.compile(r"^[a-z0-9.+-]+$")
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     taskdeps = set()
@@ -1160,7 +1160,7 @@ python () {
     if pn in overrides:
         msg = 'Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE"), pn)
         package_qa_handle_error("pn-overrides", msg, d)
-    prog = re.compile('[A-Z]')
+    prog = re.compile(r'[A-Z]')
     if prog.search(pn):
         package_qa_handle_error("uppercase-pn", 'PN: %s is upper case, this can result in unexpected behavior.' % pn, d)
 
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 6515ee82783..6ac63e01928 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -52,8 +52,8 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                 except oe.license.LicenseError as exc:
                     bb.fatal('%s: %s' % (d.getVar('P'), exc))
             else:
-                pkg_dic[pkg]["LICENSES"] = re.sub('[|&()*]', ' ', pkg_dic[pkg]["LICENSE"])
-                pkg_dic[pkg]["LICENSES"] = re.sub('  *', ' ', pkg_dic[pkg]["LICENSES"])
+                pkg_dic[pkg]["LICENSES"] = re.sub(r'[|&()*]', ' ', pkg_dic[pkg]["LICENSE"])
+                pkg_dic[pkg]["LICENSES"] = re.sub(r'  *', ' ', pkg_dic[pkg]["LICENSES"])
                 pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
 
             if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
@@ -78,7 +78,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
             for lic in pkg_dic[pkg]["LICENSES"]:
                 lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY'),
                                         pkg_dic[pkg]["PN"], "generic_%s" % 
-                                        re.sub('\+', '', lic))
+                                        re.sub(r'\+', '', lic))
                 # add explicity avoid of CLOSED license because isn't generic
                 if lic == "CLOSED":
                    continue
@@ -119,14 +119,14 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                     pkg_license = os.path.join(pkg_license_dir, lic)
                     pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
 
-                    if re.match("^generic_.*$", lic):
+                    if re.match(r"^generic_.*$", lic):
                         generic_lic = canonical_license(d,
-                                re.search("^generic_(.*)$", lic).group(1))
+                                re.search(r"^generic_(.*)$", lic).group(1))
 
                         # Do not copy generic license into package if isn't
                         # declared into LICENSES of the package.
-                        if not re.sub('\+$', '', generic_lic) in \
-                                [re.sub('\+', '', lic) for lic in \
+                        if not re.sub(r'\+$', '', generic_lic) in \
+                                [re.sub(r'\+', '', lic) for lic in \
                                  pkg_manifest_licenses]:
                             continue
 
diff --git a/meta/classes/perl-version.bbclass b/meta/classes/perl-version.bbclass
index fafe68a775f..bafd96518a5 100644
--- a/meta/classes/perl-version.bbclass
+++ b/meta/classes/perl-version.bbclass
@@ -13,7 +13,7 @@ def get_perl_version(d):
         return None
     l = f.readlines();
     f.close();
-    r = re.compile("^version='(\d*\.\d*\.\d*)'")
+    r = re.compile(r"^version='(\d*\.\d*\.\d*)'")
     for s in l:
         m = r.match(s)
         if m:
-- 
2.19.1


