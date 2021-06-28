Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.7516.1624859961726401961
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 22:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EOyuBmYK;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so12084083pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 22:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+49RFbC808YHvYRGUoQc3frH82WLZJ0JBRKWMb3GPfE=;
        b=EOyuBmYKqDGKfidmENNXc3Mv3kj0zkEVqYYGviaL8fflvoZ/xUjUvlHEuZnQj9e9CK
         9gVT3cXTe2svRyI0yxEu39UEekR6BXTSnoA3Jc1JskkgBN/wf3PL0lSVW7+Oz8ZomUgX
         N7B9gFIG5JL4xxOcBEBJ7XsOzgDQ98Tsg96DP8jcfBinI0XTx2kBulW42qoAc7lsJ+WU
         ukF8xuR1vPMSbIFbnJyuxvQnJPuTXL3kvQyypWIBfArRMPULQNeIuWQpGUkTDvKMsl2A
         hUHpbR5Yz35w+vK86phJuEXlmkULHkZtO0j17BDzpC5Z1gvVtBvKj4lAt9oYeGrxXZi2
         m7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+49RFbC808YHvYRGUoQc3frH82WLZJ0JBRKWMb3GPfE=;
        b=gOJ8n5QVBrl88KkCpoAsMUF9oQNa2i4INnQENxFL1WpcxaAE1odawbB6bIO9sPwULZ
         v6FjJucz2UiT38hzp7H5F5rwIrNPVznPKHkbALkdputLtRsJTYYkQRpKEHM4PYbtUvbZ
         K2fjlwoAzqqhIbHW56eStwARoNd+wGGLZz+14wtSbpLJvhLdTTuQzu9dyN7LStIaSHFs
         O+KVJe5t+D74vWG/Azx24Xe9UU46p/2k0bmHhdtRl6tX2myOi06JzYE9lAjDgWve/DF0
         AYhsqkxNtlu3VcHx6sxQ03fKfH78ns0juAziX/A+zdFVgqzWAXWRwjJPIZfwaaFeOdTV
         RnQw==
X-Gm-Message-State: AOAM531Wv+oekao3FRG8ffbISjOL0+oeTG4Y6W4U6TCSqheXu/lJA42z
	qRFM1SlXNC0AvMOMcQ4YywXM2KKNvxPnLw==
X-Google-Smtp-Source: ABdhPJzi6FFf2486x59AzZJ5vZUTY/WF7NCKLDRF3UHd0bUU0IDj+LF9JbPI2PC2ww5fyemDo0TWvg==
X-Received: by 2002:a17:90a:5401:: with SMTP id z1mr25216727pjh.7.1624859960091;
        Sun, 27 Jun 2021 22:59:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b522])
        by smtp.gmail.com with ESMTPSA id c18sm12768912pgf.66.2021.06.27.22.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 22:59:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/8] PEP8 double aggressive E251 and E252
Date: Sun, 27 Jun 2021 22:59:10 -0700
Message-Id: <20210628055915.1107-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628055915.1107-1-raj.khem@gmail.com>
References: <20210628055915.1107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lib/oeqa/runtime/cases/dnf_runtime.py     |  8 ++--
 .../lib/oeqa/selftest/cases/external-layer.py |  2 +-
 meta/lib/oe/buildhistory_analysis.py          |  2 +-
 meta/lib/oe/cachedpath.py                     |  2 +-
 meta/lib/oe/classextend.py                    |  6 +--
 meta/lib/oe/package_manager/rpm/__init__.py   |  8 ++--
 meta/lib/oe/patch.py                          | 26 ++++++-------
 meta/lib/oe/path.py                           |  2 +-
 meta/lib/oe/prservice.py                      |  2 +-
 meta/lib/oe/sstatesig.py                      |  4 +-
 meta/lib/oe/terminal.py                       |  2 +-
 meta/lib/oe/types.py                          |  2 +-
 meta/lib/oe/utils.py                          |  2 +-
 meta/lib/oeqa/core/case.py                    |  2 +-
 meta/lib/oeqa/core/runner.py                  | 22 +++++------
 meta/lib/oeqa/core/target/qemu.py             |  4 +-
 meta/lib/oeqa/core/tests/test_decorators.py   |  2 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   | 18 ++++-----
 meta/lib/oeqa/oetest.py                       |  2 +-
 meta/lib/oeqa/runexported.py                  |  2 +-
 meta/lib/oeqa/runtime/cases/apt.py            |  2 +-
 meta/lib/oeqa/runtime/cases/boot.py           |  2 +-
 meta/lib/oeqa/runtime/cases/buildcpio.py      |  2 +-
 .../lib/oeqa/runtime/cases/buildgalculator.py |  2 +-
 meta/lib/oeqa/runtime/cases/buildlzip.py      |  2 +-
 meta/lib/oeqa/runtime/cases/dnf.py            |  2 +-
 meta/lib/oeqa/runtime/cases/logrotate.py      | 18 ++++-----
 meta/lib/oeqa/runtime/cases/opkg.py           |  2 +-
 meta/lib/oeqa/runtime/cases/pam.py            |  8 ++--
 meta/lib/oeqa/runtime/cases/parselogs.py      |  2 +-
 meta/lib/oeqa/runtime/cases/ping.py           |  2 +-
 meta/lib/oeqa/runtime/cases/scp.py            |  2 +-
 meta/lib/oeqa/runtime/cases/storage.py        | 20 +++++-----
 meta/lib/oeqa/runtime/cases/suspend.py        |  6 +--
 meta/lib/oeqa/runtime/cases/usb_hid.py        |  4 +-
 meta/lib/oeqa/selftest/cases/bblayers.py      | 18 ++++-----
 meta/lib/oeqa/selftest/cases/bbtests.py       | 28 +++++++-------
 meta/lib/oeqa/selftest/cases/binutils.py      |  2 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py  | 20 +++++-----
 meta/lib/oeqa/selftest/cases/devtool.py       |  4 +-
 meta/lib/oeqa/selftest/cases/gcc.py           |  6 +--
 meta/lib/oeqa/selftest/cases/glibc.py         |  6 +--
 meta/lib/oeqa/selftest/cases/manifest.py      |  6 +--
 .../oeqa/selftest/cases/oelib/buildhistory.py | 12 +++---
 meta/lib/oeqa/selftest/cases/oelib/path.py    |  6 +--
 meta/lib/oeqa/selftest/cases/pkgdata.py       |  2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  6 +--
 meta/lib/oeqa/targetcontrol.py                | 38 +++++++++----------
 meta/lib/oeqa/utils/__init__.py               |  2 +-
 meta/lib/oeqa/utils/network.py                |  2 +-
 meta/lib/oeqa/utils/nfs.py                    |  8 ++--
 meta/lib/oeqa/utils/qemurunner.py             |  8 ++--
 meta/lib/oeqa/utils/qemutinyrunner.py         |  2 +-
 meta/lib/oeqa/utils/sshcontrol.py             |  2 +-
 .../glibc/glibc/check-test-wrapper            |  2 +-
 scripts/bitbake-whatchanged                   | 10 ++---
 scripts/buildhistory-collect-srcrevs          | 10 ++---
 scripts/buildhistory-diff                     |  2 +-
 scripts/combo-layer                           | 30 +++++++--------
 scripts/contrib/list-packageconfig-flags.py   | 10 ++---
 scripts/contrib/verify-homepage.py            |  2 +-
 scripts/lib/checklayer/__init__.py            |  2 +-
 scripts/lib/scriptutils.py                    |  2 +-
 scripts/lib/wic/ksparser.py                   |  2 +-
 scripts/lib/wic/partition.py                  |  2 +-
 scripts/lib/wic/plugins/source/rootfs.py      |  2 +-
 scripts/oe-depends-dot                        | 10 ++---
 scripts/pybootchartgui/pybootchartgui/draw.py |  4 +-
 .../pybootchartgui/process_tree.py            |  8 ++--
 .../pybootchartgui/pybootchartgui/samples.py  |  2 +-
 .../pybootchartgui/tests/process_tree_test.py |  2 +-
 71 files changed, 238 insertions(+), 238 deletions(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 64a3502370..837a15730a 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -41,10 +41,10 @@ class DnfSelftest(DnfTest):
         import re
         # Use '-y' for non-interactive mode: automatically import the feed signing key
         output_makecache = self.dnf('-vy makecache')
-        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
-        self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
+        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg="dnf makecache failed to synchronize repo: %s" %(output_makecache))
+        self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg="dnf makecache failed: %s" %(output_makecache))
 
         output_repoinfo = self.dnf('-v repoinfo')
         matchobj = re.match(r".*Repo-pkgs\s*:\s*(?P<n_pkgs>[0-9]+)", output_repoinfo, re.DOTALL)
-        self.assertTrue(matchobj is not None, msg = "Could not find the amount of packages in dnf repoinfo output: %s" %(output_repoinfo))
-        self.assertTrue(int(matchobj.group('n_pkgs')) > 0, msg = "Amount of remote packages is not more than zero: %s\n" %(output_repoinfo))
+        self.assertTrue(matchobj is not None, msg="Could not find the amount of packages in dnf repoinfo output: %s" %(output_repoinfo))
+        self.assertTrue(int(matchobj.group('n_pkgs')) > 0, msg="Amount of remote packages is not more than zero: %s\n" %(output_repoinfo))
diff --git a/meta-selftest/lib/oeqa/selftest/cases/external-layer.py b/meta-selftest/lib/oeqa/selftest/cases/external-layer.py
index 59b1afab7d..351332bf2c 100644
--- a/meta-selftest/lib/oeqa/selftest/cases/external-layer.py
+++ b/meta-selftest/lib/oeqa/selftest/cases/external-layer.py
@@ -13,4 +13,4 @@ class ImportedTests(OESelftestTestCase):
         Author: Mariano Lopez <mariano.lopez@intel.com
         """
 
-        self.assertEqual(True, True, msg = "Impossible to fail this test")
+        self.assertEqual(True, True, msg="Impossible to fail this test")
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 9869564e7f..5a50eef711 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -215,7 +215,7 @@ class FileChange:
     changetype_link = 'L'
     changetype_move = 'M'
 
-    def __init__(self, path, changetype, oldvalue = None, newvalue = None):
+    def __init__(self, path, changetype, oldvalue=None, newvalue=None):
         self.path = path
         self.changetype = changetype
         self.oldvalue = oldvalue
diff --git a/meta/lib/oe/cachedpath.py b/meta/lib/oe/cachedpath.py
index 254257a83f..607421e29d 100644
--- a/meta/lib/oe/cachedpath.py
+++ b/meta/lib/oe/cachedpath.py
@@ -198,7 +198,7 @@ class CachedPath(object):
 
         return (file, is_dir)
 
-    def realpath(self, file, root, use_physdir = True, loop_cnt = 100, assume_dir = False):
+    def realpath(self, file, root, use_physdir=True, loop_cnt=100, assume_dir=False):
         """ Returns the canonical path of 'file' with assuming a
         toplevel 'root' directory. When 'use_physdir' is set, all
         preceding path components of 'file' will be resolved first;
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index d3d8fbe724..20366f78be 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -40,7 +40,7 @@ class ClassExtender(object):
             return self.extname + "-" + name
         return name
 
-    def map_variable(self, varname, setvar = True):
+    def map_variable(self, varname, setvar=True):
         var = self.d.getVar(varname)
         if not var:
             return ""
@@ -53,7 +53,7 @@ class ClassExtender(object):
             self.d.setVar(varname, newdata)
         return newdata
 
-    def map_regexp_variable(self, varname, setvar = True):
+    def map_regexp_variable(self, varname, setvar=True):
         var = self.d.getVar(varname)
         if not var:
             return ""
@@ -84,7 +84,7 @@ class ClassExtender(object):
                         return dep
             return self.extend_name(dep)
 
-    def map_depends_variable(self, varname, suffix = ""):
+    def map_depends_variable(self, varname, suffix=""):
         # We need to preserve EXTENDPKGV so it can be expanded correctly later
         if suffix:
             varname = varname + "_" + suffix
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index b392581069..c5419a3bc7 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -181,7 +181,7 @@ class RpmPM(PackageManager):
         os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
 
-    def install(self, pkgs, attempt_only = False):
+    def install(self, pkgs, attempt_only=False):
         if len(pkgs) == 0:
             return
         self._prepare_pkg_transaction()
@@ -208,7 +208,7 @@ class RpmPM(PackageManager):
         if len(failed_scriptlets_pkgnames) > 0:
             failed_postinsts_abort(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
 
-    def remove(self, pkgs, with_dependencies = True):
+    def remove(self, pkgs, with_dependencies=True):
         if not pkgs:
             return
 
@@ -268,7 +268,7 @@ class RpmPM(PackageManager):
 
     def list_installed(self):
         output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{name}-%{version}-%{release}.%{arch}.rpm\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
-                                  print_output = False)
+                                  print_output=False)
         packages = {}
         current_package = None
         current_deps = None
@@ -300,7 +300,7 @@ class RpmPM(PackageManager):
     def update(self):
         self._invoke_dnf(["makecache", "--refresh"])
 
-    def _invoke_dnf(self, dnf_args, fatal = True, print_output = True ):
+    def _invoke_dnf(self, dnf_args, fatal=True, print_output=True ):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
 
         dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index fccbedb519..eeea18ef04 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -23,7 +23,7 @@ class CmdError(bb.BBHandledException):
                 (self.command, self.status, self.output)
 
 
-def runcmd(args, dir = None):
+def runcmd(args, dir=None):
     import pipes
     import subprocess
 
@@ -106,7 +106,7 @@ class PatchSet(object):
     def Pop(self, force):
         raise NotImplementedError()
 
-    def Refresh(self, remote = None, all = None):
+    def Refresh(self, remote=None, all=None):
         raise NotImplementedError()
 
     @staticmethod
@@ -199,7 +199,7 @@ class PatchTree(PatchSet):
         patch['strippath'] = p.split(",")[1]
         self._applypatch(patch, False, True)
 
-    def _removePatchFile(self, all = False):
+    def _removePatchFile(self, all=False):
         if not os.path.exists(self.seriespath):
             return
         with open(self.seriespath, 'r+') as f:
@@ -215,7 +215,7 @@ class PatchTree(PatchSet):
             for p in patches:
                 f.write(p)
          
-    def Import(self, patch, force = None):
+    def Import(self, patch, force=None):
         """"""
         PatchSet.Import(self, patch, force)
 
@@ -225,7 +225,7 @@ class PatchTree(PatchSet):
             i = 0
         self.patches.insert(i, patch)
 
-    def _applypatch(self, patch, force = False, reverse = False, run = True):
+    def _applypatch(self, patch, force=False, reverse=False, run=True):
         shellcmd = ["cat", patch['file'], "|", "patch", "--no-backup-if-mismatch", "-p", patch['strippath']]
         if reverse:
             shellcmd.append('-R')
@@ -253,7 +253,7 @@ class PatchTree(PatchSet):
 
         return output
 
-    def Push(self, force = False, all = False, run = True):
+    def Push(self, force=False, all=False, run=True):
         bb.note("self._current is %s" % self._current)
         bb.note("patches is %s" % self.patches)
         if all:
@@ -273,7 +273,7 @@ class PatchTree(PatchSet):
             self._current = next
             return ret
 
-    def Pop(self, force = None, all = None):
+    def Pop(self, force=None, all=None):
         if all:
             self._removePatchFile(True)
             self._current = None
@@ -478,10 +478,10 @@ class GitApplyTree(PatchTree):
         finally:
             shutil.rmtree(tempdir)
 
-    def _applypatch(self, patch, force = False, reverse = False, run = True):
+    def _applypatch(self, patch, force=False, reverse=False, run=True):
         import shutil
 
-        def _applypatchhelper(shellcmd, patch, force = False, reverse = False, run = True):
+        def _applypatchhelper(shellcmd, patch, force=False, reverse=False, run=True):
             if reverse:
                 shellcmd.append('-R')
 
@@ -560,7 +560,7 @@ class GitApplyTree(PatchTree):
 
 
 class QuiltTree(PatchSet):
-    def _runcmd(self, args, run = True):
+    def _runcmd(self, args, run=True):
         quiltrc = self.d.getVar('QUILTRCFILE')
         if not run:
             return ["quilt"] + ["--quiltrc"] + [quiltrc] + args
@@ -616,7 +616,7 @@ class QuiltTree(PatchSet):
                     self._current = self.patches.index(patch)
         self.initialized = True
 
-    def Import(self, patch, force = None):
+    def Import(self, patch, force=None):
         if not self.initialized:
             self.InitFromDir()
         PatchSet.Import(self, patch, force)
@@ -633,7 +633,7 @@ class QuiltTree(PatchSet):
         self.patches.insert(self._current or 0, patch)
 
 
-    def Push(self, force = False, all = False, run = True):
+    def Push(self, force=False, all=False, run=True):
         # quilt push [-f]
 
         args = ["push"]
@@ -651,7 +651,7 @@ class QuiltTree(PatchSet):
         else:
             self._current = 0
 
-    def Pop(self, force = None, all = None):
+    def Pop(self, force=None, all=None):
         # quilt pop [-f]
         args = ["pop"]
         if force:
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index c8d8ad05b9..c92a4f98cd 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -229,7 +229,7 @@ def __realpath(file, root, loop_cnt, assume_dir):
 
     return (file, is_dir)
 
-def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False):
+def realpath(file, root, use_physdir=True, loop_cnt=100, assume_dir=False):
     """ Returns the canonical path of 'file' with assuming a
     toplevel 'root' directory. When 'use_physdir' is set, all
     preceding path components of 'file' will be resolved first;
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index a8d82783c4..afc8ea23bc 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-def prserv_make_conn(d, check = False):
+def prserv_make_conn(d, check=False):
     import prserv.serv
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 47f3ca4efb..5198203367 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -90,7 +90,7 @@ class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
         self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
         pass
-    def rundep_check(self, fn, recipename, task, dep, depname, dataCaches = None):
+    def rundep_check(self, fn, recipename, task, dep, depname, dataCaches=None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCaches)
 
 class SignatureGeneratorOEBasicHashMixIn(object):
@@ -131,7 +131,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             newsafedeps.append(a1 + "->" + a2)
         self.saferecipedeps = newsafedeps
 
-    def rundep_check(self, fn, recipename, task, dep, depname, dataCaches = None):
+    def rundep_check(self, fn, recipename, task, dep, depname, dataCaches=None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCaches)
 
     def get_taskdata(self):
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 80e76adc21..116c104536 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -234,7 +234,7 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
     # until it exits.
     import tempfile
     import time
-    pidfile = tempfile.NamedTemporaryFile(delete = False).name
+    pidfile = tempfile.NamedTemporaryFile(delete=False).name
     try:
         sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
         pipe = terminal(sh_cmd, title, env, d)
diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index bbbabafbf6..ee7cc0e659 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -17,7 +17,7 @@ class OEList(list):
 
     name = "list"
 
-    def __init__(self, value, separator = None):
+    def __init__(self, value, separator=None):
         if value is not None:
             list.__init__(self, value.split(separator))
         else:
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index c9b2be9dc3..b33d049722 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -17,7 +17,7 @@ def read_file(filename):
         return data
     return None
 
-def ifelse(condition, iftrue = True, iffalse = False):
+def ifelse(condition, iftrue=True, iffalse=False):
     if condition:
         return iftrue
     else:
diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index 0a8aff182e..84daa343d8 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -74,7 +74,7 @@ class OEPTestResultTestCase:
             self.extraresults = {"ptestresult.sections" : {}}
         self.extraresults["ptestresult.rawlogs"] = {"log" : self._compress_log(log)}
 
-    def ptest_section(self, section, duration = None, log = None, logfile = None, exitcode = None):
+    def ptest_section(self, section, duration=None, log=None, logfile=None, exitcode=None):
         if not hasattr(self, "extraresults"):
             self.extraresults = {"ptestresult.sections" : {}}
 
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index d50690ab37..1d325e188d 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -130,7 +130,7 @@ class OETestResult(_TestResult):
 
         return 'UNKNOWN', None
 
-    def extractExtraResults(self, test, details = None):
+    def extractExtraResults(self, test, details=None):
         extraresults = None
         if details is not None and "extraresults" in details:
             extraresults = details.get("extraresults", {})
@@ -145,26 +145,26 @@ class OETestResult(_TestResult):
                 else:
                     self.extraresults[k] = v
 
-    def addError(self, test, *args, details = None):
-        self.extractExtraResults(test, details = details)
+    def addError(self, test, *args, details=None):
+        self.extractExtraResults(test, details=details)
         return super(OETestResult, self).addError(test, *args)
 
-    def addFailure(self, test, *args, details = None):
-        self.extractExtraResults(test, details = details)
+    def addFailure(self, test, *args, details=None):
+        self.extractExtraResults(test, details=details)
         return super(OETestResult, self).addFailure(test, *args)
 
-    def addSuccess(self, test, details = None):
+    def addSuccess(self, test, details=None):
         #Added so we can keep track of successes too
         self.successes.append((test, None))
-        self.extractExtraResults(test, details = details)
+        self.extractExtraResults(test, details=details)
         return super(OETestResult, self).addSuccess(test)
 
-    def addExpectedFailure(self, test, *args, details = None):
-        self.extractExtraResults(test, details = details)
+    def addExpectedFailure(self, test, *args, details=None):
+        self.extractExtraResults(test, details=details)
         return super(OETestResult, self).addExpectedFailure(test, *args)
 
-    def addUnexpectedSuccess(self, test, details = None):
-        self.extractExtraResults(test, details = details)
+    def addUnexpectedSuccess(self, test, details=None):
+        self.extractExtraResults(test, details=details)
         return super(OETestResult, self).addUnexpectedSuccess(test)
 
     def logDetails(self, json_file_dir=None, configuration=None, result_id=None,
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 79fd724f7d..bb93b4ee99 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -24,7 +24,7 @@ class OEQemuTarget(OESSHTarget):
             port=None, machine='', rootfs='', kernel='', kvm=False, slirp=False,
             dump_dir='', dump_host_cmds='', display='', bootlog='',
             tmpdir='', dir_image='', boottime=60, serial_ports=2,
-            boot_patterns = defaultdict(str), ovmf=False, tmpfsdir=None, **kwargs):
+            boot_patterns=defaultdict(str), ovmf=False, tmpfsdir=None, **kwargs):
 
         super(OEQemuTarget, self).__init__(logger, None, server_ip, timeout,
                 user, port)
@@ -46,7 +46,7 @@ class OEQemuTarget(OESSHTarget):
                                  logfile=bootlog, boottime=boottime,
                                  use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir,
                                  dump_host_cmds=dump_host_cmds, logger=logger,
-                                 serial_ports=serial_ports, boot_patterns = boot_patterns, 
+                                 serial_ports=serial_ports, boot_patterns=boot_patterns, 
                                  use_ovmf=ovmf, tmpfsdir=tmpfsdir)
         dump_monitor_cmds = kwargs.get("testimage_dump_monitor")
         self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index 5095f39948..39e5e2164f 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -16,7 +16,7 @@ from oeqa.core.utils.test import getCaseMethod, getSuiteCasesNames, getSuiteCase
 
 class TestTagDecorator(TestBase):
     def _runTest(self, modules, filterfn, expect):
-        tc = self._testLoader(modules = modules, tags_filter = filterfn)
+        tc = self._testLoader(modules=modules, tags_filter=filterfn)
         test_loaded = set(getSuiteCasesIDs(tc.suites))
         self.assertEqual(expect, test_loaded)
 
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 161a2f6e90..678484243b 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -85,22 +85,22 @@ class ProxyTestResult:
         self.result = target
         self.failed_tests = 0
 
-    def _addResult(self, method, test, *args, exception = False, **kwargs):
+    def _addResult(self, method, test, *args, exception=False, **kwargs):
         return method(test, *args, **kwargs)
 
-    def addError(self, test, err = None, **kwargs):
+    def addError(self, test, err=None, **kwargs):
         self.failed_tests += 1
-        self._addResult(self.result.addError, test, err, exception = True, **kwargs)
+        self._addResult(self.result.addError, test, err, exception=True, **kwargs)
 
-    def addFailure(self, test, err = None, **kwargs):
+    def addFailure(self, test, err=None, **kwargs):
         self.failed_tests += 1
-        self._addResult(self.result.addFailure, test, err, exception = True, **kwargs)
+        self._addResult(self.result.addFailure, test, err, exception=True, **kwargs)
 
     def addSuccess(self, test, **kwargs):
         self._addResult(self.result.addSuccess, test, **kwargs)
 
-    def addExpectedFailure(self, test, err = None, **kwargs):
-        self._addResult(self.result.addExpectedFailure, test, err, exception = True, **kwargs)
+    def addExpectedFailure(self, test, err=None, **kwargs):
+        self._addResult(self.result.addExpectedFailure, test, err, exception=True, **kwargs)
 
     def addUnexpectedSuccess(self, test, **kwargs):
         self._addResult(self.result.addUnexpectedSuccess, test, **kwargs)
@@ -112,7 +112,7 @@ class ProxyTestResult:
         return getattr(self.result, attr)
 
 class ExtraResultsDecoderTestResult(ProxyTestResult):
-    def _addResult(self, method, test, *args, exception = False, **kwargs):
+    def _addResult(self, method, test, *args, exception=False, **kwargs):
         if "details" in kwargs and "extraresults" in kwargs["details"]:
             if isinstance(kwargs["details"]["extraresults"], Content):
                 kwargs = kwargs.copy()
@@ -126,7 +126,7 @@ class ExtraResultsDecoderTestResult(ProxyTestResult):
         return method(test, *args, **kwargs)
 
 class ExtraResultsEncoderTestResult(ProxyTestResult):
-    def _addResult(self, method, test, *args, exception = False, **kwargs):
+    def _addResult(self, method, test, *args, exception=False, **kwargs):
         if hasattr(test, "extraresults"):
             extras = lambda : [json.dumps(test.extraresults).encode()]
             kwargs = kwargs.copy()
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 1f4993c9d5..2ee67586f6 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -101,7 +101,7 @@ class oeRuntimeTest(oeTest):
         if self.tc.sigterm:
             self.fail("Got SIGTERM")
         elif (type(self.target).__name__ == "QemuTarget"):
-            self.assertTrue(self.target.check(), msg = "Qemu not running?")
+            self.assertTrue(self.target.check(), msg="Qemu not running?")
 
         self.setUpLocal()
 
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 7e37213df6..5f087bc950 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -66,7 +66,7 @@ class FakeTarget(object):
 
 
 class MyDataDict(dict):
-    def getVar(self, key, unused = None):
+    def getVar(self, key, unused=None):
         return self.get(key, "")
 
 def main():
diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index 53745df93f..1e01138760 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -10,7 +10,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 
 class AptTest(OERuntimeTestCase):
 
-    def pkg(self, command, expected = 0):
+    def pkg(self, command, expected=0):
         command = 'apt-get %s' % command
         status, output = self.target.run(command, 1500)
         message = os.linesep.join([command, output])
diff --git a/meta/lib/oeqa/runtime/cases/boot.py b/meta/lib/oeqa/runtime/cases/boot.py
index 2142f400a0..b801d13fc0 100644
--- a/meta/lib/oeqa/runtime/cases/boot.py
+++ b/meta/lib/oeqa/runtime/cases/boot.py
@@ -30,4 +30,4 @@ class BootTest(OERuntimeTestCase):
                 count = 0
         msg = ('Expected 5 consecutive, got %d.\n'
                'ping output is:\n%s' % (count,output))
-        self.assertEqual(count, 5, msg = msg)
+        self.assertEqual(count, 5, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index e29bf16ccb..095a82c10b 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -15,7 +15,7 @@ class BuildCpioTest(OERuntimeTestCase):
         uri = 'https://downloads.yoctoproject.org/mirror/sources/cpio-2.13.tar.gz'
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
-                                         dl_dir = cls.tc.td['DL_DIR'])
+                                         dl_dir=cls.tc.td['DL_DIR'])
 
     @classmethod
     def tearDownClass(cls):
diff --git a/meta/lib/oeqa/runtime/cases/buildgalculator.py b/meta/lib/oeqa/runtime/cases/buildgalculator.py
index e5cc3e2888..f7af48c3be 100644
--- a/meta/lib/oeqa/runtime/cases/buildgalculator.py
+++ b/meta/lib/oeqa/runtime/cases/buildgalculator.py
@@ -15,7 +15,7 @@ class GalculatorTest(OERuntimeTestCase):
         uri = 'http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2'
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
-                                         dl_dir = cls.tc.td['DL_DIR'])
+                                         dl_dir=cls.tc.td['DL_DIR'])
 
     @classmethod
     def tearDownClass(cls):
diff --git a/meta/lib/oeqa/runtime/cases/buildlzip.py b/meta/lib/oeqa/runtime/cases/buildlzip.py
index bc70b41461..ef4c9cebac 100644
--- a/meta/lib/oeqa/runtime/cases/buildlzip.py
+++ b/meta/lib/oeqa/runtime/cases/buildlzip.py
@@ -16,7 +16,7 @@ class BuildLzipTest(OERuntimeTestCase):
         uri = '%s/lzip-1.19.tar.gz' % uri
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
-                                         dl_dir = cls.tc.td['DL_DIR'])
+                                         dl_dir=cls.tc.td['DL_DIR'])
 
     @classmethod
     def tearDownClass(cls):
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index f40c63026e..aeef8c6086 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -14,7 +14,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 
 class DnfTest(OERuntimeTestCase):
 
-    def dnf(self, command, expected = 0):
+    def dnf(self, command, expected=0):
         command = 'dnf %s' % command
         status, output = self.target.run(command, 1500)
         message = os.linesep.join([command, output])
diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index a4efcd07c0..7d7dbb7afb 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -27,45 +27,45 @@ class LogrotateTest(OERuntimeTestCase):
         # /var/log/wtmp may not always exist initially, so use touch to ensure it is present
         status, output = self.target.run('touch /var/log/wtmp')
         msg = ('Could not create/update /var/log/wtmp with touch')
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
 
         status, output = self.target.run('mkdir $HOME/logrotate_dir')
         msg = ('Could not create logrotate_dir. Output: %s' % output)
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
 
         status, output = self.target.run('echo "create \n olddir $HOME/logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
         msg = ('Could not write to /tmp/logrotate-test.conf')
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
         
         # If logrotate fails to rotate the log, view the verbose output of logrotate to see what prevented it
         _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test.conf')
         status, _ = self.target.run('find $HOME/logrotate_dir -type f | grep wtmp.1')
         msg = ("logrotate did not successfully rotate the wtmp log. Output from logrotate -vf: \n%s" % (logrotate_output))
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
        
     @OETestDepends(['logrotate.LogrotateTest.test_logrotate_wtmp'])
     def test_logrotate_newlog(self):
         
         status, output = self.target.run('echo "oeqa logrotate test file" > /var/log/logrotate_testfile')
         msg = ('Could not create logrotate test file in /var/log')
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
         
         status, output = self.target.run('echo "/var/log/logrotate_testfile {\n missingok \n monthly \n rotate 1" > /etc/logrotate.d/logrotate_testfile')
         msg = ('Could not write to /etc/logrotate.d/logrotate_testfile')
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
 
         status, output = self.target.run('echo "create \n olddir $HOME/logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
         msg = ('Could not write to /tmp/logrotate_test2.conf')
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
 
         status, output = self.target.run('find $HOME/logrotate_dir -type f | grep logrotate_testfile.1')
         msg = ('A rotated log for logrotate_testfile is already present in logrotate_dir')
-        self.assertEqual(status, 1, msg = msg)
+        self.assertEqual(status, 1, msg=msg)
 
         # If logrotate fails to rotate the log, view the verbose output of logrotate instead of just listing the files in olddir
         _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test2.conf')
         status, _ = self.target.run('find $HOME/logrotate_dir -type f | grep logrotate_testfile.1')
         msg = ('logrotate did not successfully rotate the logrotate_test log. Output from logrotate -vf: \n%s' % (logrotate_output))
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
 
 
diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/cases/opkg.py
index 9cfee1cd88..de96b3ff3a 100644
--- a/meta/lib/oeqa/runtime/cases/opkg.py
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -10,7 +10,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 
 class OpkgTest(OERuntimeTestCase):
 
-    def pkg(self, command, expected = 0):
+    def pkg(self, command, expected=0):
         command = 'opkg %s' % command
         status, output = self.target.run(command, 1500)
         message = os.linesep.join([command, output])
diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
index a482ded945..4cd5325201 100644
--- a/meta/lib/oeqa/runtime/cases/pam.py
+++ b/meta/lib/oeqa/runtime/cases/pam.py
@@ -20,19 +20,19 @@ class PamBasicTest(OERuntimeTestCase):
         status, output = self.target.run('login --help')
         msg = ('login command does not work as expected. '
                'Status and output:%s and %s' % (status, output))
-        self.assertEqual(status, 1, msg = msg)
+        self.assertEqual(status, 1, msg=msg)
 
         status, output = self.target.run('passwd --help')
         msg = ('passwd command does not work as expected. '
                'Status and output:%s and %s' % (status, output))
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
 
         status, output = self.target.run('su --help')
         msg = ('su command does not work as expected. '
                'Status and output:%s and %s' % (status, output))
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
 
         status, output = self.target.run('useradd --help')
         msg = ('useradd command does not work as expected. '
                'Status and output:%s and %s' % (status, output))
-        self.assertEqual(status, 0, msg = msg)
+        self.assertEqual(status, 0, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 1bb0425521..d58968923e 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -328,7 +328,7 @@ class ParseLogsTest(OERuntimeTestCase):
     # Grep only the errors so that their context could be collected.
     # Default context is 10 lines before and after the error itself
     def parse_logs(self, errors, ignore_errors, logs,
-                   lines_before = 10, lines_after = 10):
+                   lines_before=10, lines_after=10):
         results = {}
         rez = []
         grep_output = ''
diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index f6603f75ec..d550efe17f 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -23,4 +23,4 @@ class PingTest(OERuntimeTestCase):
                 count = 0
         msg = ('Expected 5 consecutive, got %d.\n'
                'ping output is:\n%s' % (count,output))
-        self.assertEqual(count, 5, msg = msg)
+        self.assertEqual(count, 5, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index 3a5f292152..aca9bd673a 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -32,6 +32,6 @@ class ScpTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
         (status, output) = self.target.run('ls -la %s' % dst)
-        self.assertEqual(status, 0, msg = 'SCP test failed')
+        self.assertEqual(status, 0, msg='SCP test failed')
 
         self.target.run('rm %s' % dst)
diff --git a/meta/lib/oeqa/runtime/cases/storage.py b/meta/lib/oeqa/runtime/cases/storage.py
index 166d26b252..1d037ef2e0 100644
--- a/meta/lib/oeqa/runtime/cases/storage.py
+++ b/meta/lib/oeqa/runtime/cases/storage.py
@@ -15,35 +15,35 @@ class StorageBase(OERuntimeTestCase):
         (status, output) = cls.target.run('mkdir -p %s' % cls.mount_point)
         (status, output) = cls.target.run('mount %s %s' % (cls.device, cls.mount_point))
         msg = ('Mount failed: %s.' % status)
-        cls.assertFalse(output, msg = msg)
+        cls.assertFalse(output, msg=msg)
         time.sleep(tmo)
         (status, output) = cls.target.run('cat /proc/mounts')
         match = re.search('%s' % cls.device, output)
         if match:
             msg = ('Device %s not mounted.' % cls.device)
-            cls.assertTrue(match, msg = msg)
+            cls.assertTrue(match, msg=msg)
 
         (status, output) = cls.target.run('mkdir -p %s' % cls.test_dir)
 
         (status, output) = cls.target.run('rm -f %s/*' % cls.test_dir)
         msg = ('Failed to cleanup files @ %s/*' % cls.test_dir)
-        cls.assertFalse(output, msg = msg)
+        cls.assertFalse(output, msg=msg)
 
 
     def storage_basic(cls):
         # create file on device
         (status, output) = cls.target.run('touch %s/%s' % (cls.test_dir, cls.test_file))
         msg = ('File %s not created on %s' % (cls.test_file, cls.device))
-        cls.assertFalse(status, msg = msg)
+        cls.assertFalse(status, msg=msg)
         # move file
         (status, output) = cls.target.run('mv %s/%s %s/%s1' %  
                 (cls.test_dir, cls.test_file, cls.test_dir, cls.test_file))
         msg = ('File %s not moved to %s' % (cls.test_file, cls.device))
-        cls.assertFalse(status, msg = msg)
+        cls.assertFalse(status, msg=msg)
         # remove file
         (status, output) = cls.target.run('rm %s/%s1' % (cls.test_dir, cls.test_file))
         msg = ('File %s not removed on %s' % (cls.test_file, cls.device))
-        cls.assertFalse(status, msg = msg)
+        cls.assertFalse(status, msg=msg)
 
     def storage_read(cls):
         # check if message is in file
@@ -52,14 +52,14 @@ class StorageBase(OERuntimeTestCase):
 
         match = re.search('%s' % cls.test_msg, output)
         msg = ('Test message %s not in file %s.' % (cls.test_msg, cls.test_file))
-        cls.assertEqual(status, 0,  msg = msg)
+        cls.assertEqual(status, 0,  msg=msg)
 
     def storage_write(cls):
         # create test message in file on device
         (status, output) = cls.target.run('echo "%s" >  %s/%s' % 
                 (cls.test_msg, cls.test_dir, cls.test_file))
         msg = ('File %s not create test message on %s' % (cls.test_file, cls.device))
-        cls.assertEqual(status, 0,  msg = msg)
+        cls.assertEqual(status, 0,  msg=msg)
 
     def storage_umount(cls, tmo=1):
         time.sleep(tmo)
@@ -70,13 +70,13 @@ class StorageBase(OERuntimeTestCase):
             return
         else:
             msg = ('Device not unmount %s' % cls.mount_point)
-            cls.assertEqual(status, 0,  msg = msg)
+            cls.assertEqual(status, 0,  msg=msg)
 
         (status, output) = cls.target.run('cat /proc/mounts')
         match = re.search('%s' % cls.device, output)
         if match:
             msg = ('Device %s still mounted.' % cls.device)
-            cls.assertTrue(match, msg = msg)
+            cls.assertTrue(match, msg=msg)
 
 
 class UsbTest(StorageBase):
diff --git a/meta/lib/oeqa/runtime/cases/suspend.py b/meta/lib/oeqa/runtime/cases/suspend.py
index 67b6f7e56f..9aa1cf6f5d 100644
--- a/meta/lib/oeqa/runtime/cases/suspend.py
+++ b/meta/lib/oeqa/runtime/cases/suspend.py
@@ -8,7 +8,7 @@ class Suspend_Test(OERuntimeTestCase):
 
     def test_date(self): 
         (status, output) = self.target.run('date')
-        self.assertEqual(status, 0,  msg = 'Failed to run date command, output : %s' % output)
+        self.assertEqual(status, 0,  msg='Failed to run date command, output : %s' % output)
         
     def test_ping(self):
         t_thread = threading.Thread(target=self.target.run, args=("ping 8.8.8.8",))
@@ -17,11 +17,11 @@ class Suspend_Test(OERuntimeTestCase):
         
         status, output = self.target.run('pidof ping')
         self.target.run('kill -9 %s' % output)
-        self.assertEqual(status, 0, msg = 'Not able to find process that runs ping, output : %s' % output)  
+        self.assertEqual(status, 0, msg='Not able to find process that runs ping, output : %s' % output)  
         
     def set_suspend(self): 
         (status, output) = self.target.run('sudo rtcwake -m mem -s 10')
-        self.assertEqual(status, 0,  msg = 'Failed to suspends your system to RAM, output : %s' % output)
+        self.assertEqual(status, 0,  msg='Failed to suspends your system to RAM, output : %s' % output)
     
     @skipIfQemu('qemuall', 'Test only runs on real hardware')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
diff --git a/meta/lib/oeqa/runtime/cases/usb_hid.py b/meta/lib/oeqa/runtime/cases/usb_hid.py
index 3c292cf661..dbc8eada74 100644
--- a/meta/lib/oeqa/runtime/cases/usb_hid.py
+++ b/meta/lib/oeqa/runtime/cases/usb_hid.py
@@ -7,11 +7,11 @@ class USB_HID_Test(OERuntimeTestCase):
 
     def keyboard_mouse_simulation(self): 
         (status, output) = self.target.run('export DISPLAY=:0 && xdotool key F2 && xdotool mousemove 100 100')
-        return self.assertEqual(status, 0,  msg = 'Failed to simulate keyboard/mouse input event, output : %s' % output)
+        return self.assertEqual(status, 0,  msg='Failed to simulate keyboard/mouse input event, output : %s' % output)
              
     def set_suspend(self): 
         (status, output) = self.target.run('sudo rtcwake -m mem -s 10')
-        return self.assertEqual(status, 0,  msg = 'Failed to suspends your system to RAM, output : %s' % output)
+        return self.assertEqual(status, 0,  msg='Failed to suspends your system to RAM, output : %s' % output)
     
     @OEHasPackage(['xdotool'])
     @skipIfQemu('qemuall', 'Test only runs on real hardware')
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 7d74833f61..139c65978f 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -15,7 +15,7 @@ class BitbakeLayers(OESelftestTestCase):
     def test_bitbakelayers_layerindexshowdepends(self):
         result = runCmd('bitbake-layers layerindex-show-depends meta-poky')
         find_in_contents = re.search("openembedded-core", result.output)
-        self.assertTrue(find_in_contents, msg = "openembedded-core should have been listed at this step. bitbake-layers layerindex-show-depends meta-poky output: %s" % result.output)
+        self.assertTrue(find_in_contents, msg="openembedded-core should have been listed at this step. bitbake-layers layerindex-show-depends meta-poky output: %s" % result.output)
 
     def test_bitbakelayers_showcrossdepends(self):
         result = runCmd('bitbake-layers show-cross-depends')
@@ -40,14 +40,14 @@ class BitbakeLayers(OESelftestTestCase):
         recipe_path = "recipes-graphics/xcursor-transparent-theme"
         recipe_file = self.get_recipe_basename(recipe)
         testoutdir = os.path.join(self.builddir, 'test_bitbakelayers_flatten')
-        self.assertFalse(os.path.isdir(testoutdir), msg = "test_bitbakelayers_flatten should not exist at this point in time")
+        self.assertFalse(os.path.isdir(testoutdir), msg="test_bitbakelayers_flatten should not exist at this point in time")
         self.track_for_cleanup(testoutdir)
         result = runCmd('bitbake-layers flatten %s' % testoutdir)
         bb_file = os.path.join(testoutdir, recipe_path, recipe_file)
-        self.assertTrue(os.path.isfile(bb_file), msg = "Cannot find xcursor-transparent-theme_0.1.1.bb in the test_bitbakelayers_flatten local dir.")
+        self.assertTrue(os.path.isfile(bb_file), msg="Cannot find xcursor-transparent-theme_0.1.1.bb in the test_bitbakelayers_flatten local dir.")
         contents = ftools.read_file(bb_file)
         find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
-        self.assertTrue(find_in_contents, msg = "Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
+        self.assertTrue(find_in_contents, msg="Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
 
     def test_bitbakelayers_add_remove(self):
         test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
@@ -55,16 +55,16 @@ class BitbakeLayers(OESelftestTestCase):
         self.assertNotIn('meta-skeleton', result.output, "This test cannot run with meta-skeleton in bblayers.conf. bitbake-layers show-layers output: %s" % result.output)
         result = runCmd('bitbake-layers add-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertIn('meta-skeleton', result.output, msg = "Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf.  bitbake-layers show-layers output: %s" % result.output)
+        self.assertIn('meta-skeleton', result.output, msg="Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf.  bitbake-layers show-layers output: %s" % result.output)
         result = runCmd('bitbake-layers remove-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
+        self.assertNotIn('meta-skeleton', result.output, msg="meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
         result = runCmd('bitbake-layers add-layer %s' % test_layer)
         result = runCmd('bitbake-layers show-layers')
-        self.assertIn('meta-skeleton', result.output, msg = "Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf.  bitbake-layers show-layers output: %s" % result.output)
+        self.assertIn('meta-skeleton', result.output, msg="Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf.  bitbake-layers show-layers output: %s" % result.output)
         result = runCmd('bitbake-layers remove-layer */meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
-        self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
+        self.assertNotIn('meta-skeleton', result.output, msg="meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
 
     def test_bitbakelayers_showrecipes(self):
         result = runCmd('bitbake-layers show-recipes')
@@ -119,5 +119,5 @@ class BitbakeLayers(OESelftestTestCase):
                 recipe_file = line
                 break
 
-        self.assertTrue(os.path.isfile(recipe_file), msg = "Can't find recipe file for %s" % recipe)
+        self.assertTrue(os.path.isfile(recipe_file), msg="Can't find recipe file for %s" % recipe)
         return os.path.basename(recipe_file)
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 79390acc0d..e8ce78480b 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -20,21 +20,21 @@ class BitbakeTests(OESelftestTestCase):
     # Test bitbake can run from the <builddir>/conf directory
     def test_run_bitbake_from_dir_1(self):
         os.chdir(os.path.join(self.builddir, 'conf'))
-        self.assertEqual(bitbake('-e').status, 0, msg = "bitbake couldn't run from \"conf\" dir")
+        self.assertEqual(bitbake('-e').status, 0, msg="bitbake couldn't run from \"conf\" dir")
 
     # Test bitbake can run from the <builddir>'s parent directory
     def test_run_bitbake_from_dir_2(self):
         my_env = os.environ.copy()
         my_env['BBPATH'] = my_env['BUILDDIR']
         os.chdir(os.path.dirname(os.environ['BUILDDIR']))
-        self.assertEqual(bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from builddir's parent directory")
+        self.assertEqual(bitbake('-e', env=my_env).status, 0, msg="bitbake couldn't run from builddir's parent directory")
 
     # Test bitbake can run from some other random system location (we use /tmp/)
     def test_run_bitbake_from_dir_3(self):
         my_env = os.environ.copy()
         my_env['BBPATH'] = my_env['BUILDDIR']
         os.chdir("/tmp/")
-        self.assertEqual(bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from /tmp/")
+        self.assertEqual(bitbake('-e', env=my_env).status, 0, msg="bitbake couldn't run from /tmp/")
 
 
     def test_event_handler(self):
@@ -42,8 +42,8 @@ class BitbakeTests(OESelftestTestCase):
         result = bitbake('m4-native')
         find_build_started = re.search(r"NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Executing.*Tasks", result.output)
         find_build_completed = re.search(r"Tasks Summary:.*(\n.*)*NOTE: Test for bb\.event\.BuildCompleted", result.output)
-        self.assertTrue(find_build_started, msg = "Match failed in:\n%s"  % result.output)
-        self.assertTrue(find_build_completed, msg = "Match failed in:\n%s" % result.output)
+        self.assertTrue(find_build_started, msg="Match failed in:\n%s"  % result.output)
+        self.assertTrue(find_build_completed, msg="Match failed in:\n%s" % result.output)
         self.assertNotIn('Test for bb.event.InvalidEvent', result.output)
 
     def test_local_sstate(self):
@@ -51,11 +51,11 @@ class BitbakeTests(OESelftestTestCase):
         bitbake('m4-native -cclean')
         result = bitbake('m4-native')
         find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
-        self.assertTrue(find_setscene, msg = "No \"m4-native.*do_.*_setscene\" message found during bitbake m4-native. bitbake output: %s" % result.output )
+        self.assertTrue(find_setscene, msg="No \"m4-native.*do_.*_setscene\" message found during bitbake m4-native. bitbake output: %s" % result.output )
 
     def test_bitbake_invalid_recipe(self):
         result = bitbake('-b asdf', ignore_status=True)
-        self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg = "Though asdf recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % result.output)
+        self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg="Though asdf recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
     def test_bitbake_invalid_target(self):
         result = bitbake('asdf', ignore_status=True)
@@ -79,7 +79,7 @@ class BitbakeTests(OESelftestTestCase):
         for l in result.output.split('\n'):
             if l.startswith("ERROR:") and "failed" in l and "do_patch" in l:
                 found = l
-        self.assertTrue(found and found.startswith("ERROR:"), msg = "Incorrectly formed patch application didn't fail. bitbake output: %s" % result.output)
+        self.assertTrue(found and found.startswith("ERROR:"), msg="Incorrectly formed patch application didn't fail. bitbake output: %s" % result.output)
 
     def test_force_task_1(self):
         # test 1 from bug 5875
@@ -123,7 +123,7 @@ class BitbakeTests(OESelftestTestCase):
         result = bitbake('-g %s' % recipe)
         for f in ['pn-buildlist', 'task-depends.dot']:
             self.addCleanup(os.remove, f)
-        self.assertTrue('Task dependencies saved to \'task-depends.dot\'' in result.output, msg = "No task dependency \"task-depends.dot\" file was generated for the given task target. bitbake output: %s" % result.output)
+        self.assertTrue('Task dependencies saved to \'task-depends.dot\'' in result.output, msg="No task dependency \"task-depends.dot\" file was generated for the given task target. bitbake output: %s" % result.output)
         self.assertIn(recipe, ftools.read_file(os.path.join(self.builddir, 'task-depends.dot')))
 
     def test_image_manifest(self):
@@ -150,7 +150,7 @@ INHERIT_remove = \"report-error\"
         self.assertEqual(result.status, 1, msg="Command succeded when it should have failed. bitbake output: %s" % result.output)
         self.assertIn('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:', result.output)
         line = self.getline(result, 'Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.')
-        self.assertTrue(line and line.startswith("ERROR:"), msg = "\"invalid\" file \
+        self.assertTrue(line and line.startswith("ERROR:"), msg="\"invalid\" file \
 doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result.output)
 
     def test_rename_downloaded_file(self):
@@ -165,9 +165,9 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.write_recipeinc('aspell', data)
         result = bitbake('-f -c fetch aspell', ignore_status=True)
         self.delete_recipeinc('aspell')
-        self.assertEqual(result.status, 0, msg = "Couldn't fetch aspell. %s" % result.output)
+        self.assertEqual(result.status, 0, msg="Couldn't fetch aspell. %s" % result.output)
         dl_dir = get_bb_var("DL_DIR")
-        self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz')), msg = "File rename failed. No corresponding test-aspell.tar.gz file found under %s" % dl_dir)
+        self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz')), msg="File rename failed. No corresponding test-aspell.tar.gz file found under %s" % dl_dir)
         self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz.done')), "File rename failed. No corresponding test-aspell.tar.gz.done file found under %s" % dl_dir)
 
     def test_environment(self):
@@ -208,7 +208,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 
     def test_checkuri(self):
         result = runCmd('bitbake -c checkuri m4')
-        self.assertEqual(0, result.status, msg = "\"checkuri\" task was not executed. bitbake output: %s" % result.output)
+        self.assertEqual(0, result.status, msg="\"checkuri\" task was not executed. bitbake output: %s" % result.output)
 
     def test_continue(self):
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
@@ -222,7 +222,7 @@ INHERIT_remove = \"report-error\"
         errorpos = result.output.find('ERROR: Function failed: do_fail_task')
         manver = re.search("NOTE: recipe xcursor-transparent-theme-(.*?): task do_unpack: Started", result.output)
         continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
-        self.assertLess(errorpos,continuepos, msg = "bitbake didn't pass do_fail_task. bitbake output: %s" % result.output)
+        self.assertLess(errorpos,continuepos, msg="bitbake didn't pass do_fail_task. bitbake output: %s" % result.output)
 
     def test_non_gplv3(self):
         self.write_config('INCOMPATIBLE_LICENSE = "GPLv3"')
diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index 821f52f5a8..2f6aeadffc 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -43,7 +43,7 @@ class BinutilsCrossSelfTest(OESelftestTestCase, OEPTestResultTestCase):
         logpath = os.path.splitext(sumspath)[0] + ".log"
 
         ptestsuite = "binutils-{}".format(suite) if suite != "binutils" else suite
-        self.ptest_section(ptestsuite, logfile = logpath)
+        self.ptest_section(ptestsuite, logfile=logpath)
         with open(sumspath, "r") as f:
             for test, result in parse_values(f):
                 self.ptest_result(ptestsuite, test, result)
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 754b77defd..35ff0cbcf2 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -26,17 +26,17 @@ class ImageOptionsTests(OESelftestTestCase):
         log_data_created = ftools.read_file(log_data_file)
         incremental_created = re.search(r"Installing\s*:\s*packagegroup-core-ssh-openssh", log_data_created)
         self.remove_config('IMAGE_FEATURES += "ssh-server-openssh"')
-        self.assertTrue(incremental_created, msg = "Match failed in:\n%s" % log_data_created)
+        self.assertTrue(incremental_created, msg="Match failed in:\n%s" % log_data_created)
         bitbake("core-image-minimal")
         log_data_removed = ftools.read_file(log_data_file)
         incremental_removed = re.search(r"Erasing\s*:\s*packagegroup-core-ssh-openssh", log_data_removed)
-        self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
+        self.assertTrue(incremental_removed, msg="Match failed in:\n%s" % log_data_removed)
 
     def test_ccache_tool(self):
         bitbake("ccache-native")
         bb_vars = get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'ccache-native')
         p = bb_vars['SYSROOT_DESTDIR'] + bb_vars['bindir'] + "/" + "ccache"
-        self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
+        self.assertTrue(os.path.isfile(p), msg="No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
         recipe = "libgcc-initial"
         self.add_command_to_tearDown('bitbake -c clean %s' % recipe)
@@ -59,16 +59,16 @@ class DiskMonTest(OESelftestTestCase):
 
     def test_stoptask_behavior(self):
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
-        res = bitbake("delay -c delay", ignore_status = True)
-        self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
-        self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
+        res = bitbake("delay -c delay", ignore_status=True)
+        self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg="Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
+        self.assertEqual(res.status, 1, msg="bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
-        res = bitbake("delay -c delay", ignore_status = True)
+        res = bitbake("delay -c delay", ignore_status=True)
         self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
-        self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
+        self.assertEqual(res.status, 1, msg="bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay")
-        self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
+        self.assertTrue('WARNING: The free space' in res.output, msg="A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
 class SanityOptionsTest(OESelftestTestCase):
     def getline(self, res, line):
@@ -88,7 +88,7 @@ class SanityOptionsTest(OESelftestTestCase):
         self.delete_recipeinc('xcursor-transparent-theme')
         line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
         self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
-        self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
+        self.assertEqual(res.status, 1, msg="bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         self.append_config('ERROR_QA_remove = "packages-list"')
         self.append_config('WARN_QA_append = " packages-list"')
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3385546e8e..95142aeaa7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -249,14 +249,14 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         result = runCmd('devtool create-workspace %s' % tempdir)
-        self.assertTrue(os.path.isfile(os.path.join(tempdir, 'conf', 'layer.conf')), msg = "No workspace created. devtool output: %s " % result.output)
+        self.assertTrue(os.path.isfile(os.path.join(tempdir, 'conf', 'layer.conf')), msg="No workspace created. devtool output: %s " % result.output)
         result = runCmd('bitbake-layers show-layers')
         self.assertIn(tempdir, result.output)
         # Try creating a workspace layer with the default path
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool create-workspace')
-        self.assertTrue(os.path.isfile(os.path.join(self.workspacedir, 'conf', 'layer.conf')), msg = "No workspace created. devtool output: %s " % result.output)
+        self.assertTrue(os.path.isfile(os.path.join(self.workspacedir, 'conf', 'layer.conf')), msg="No workspace created. devtool output: %s " % result.output)
         result = runCmd('bitbake-layers show-layers')
         self.assertNotIn(tempdir, result.output)
         self.assertIn(self.workspacedir, result.output)
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 3efe15228f..46fd9813d6 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -18,7 +18,7 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         if suite not in targets:
             self.skipTest("Target does not use {0}".format(suite))
 
-    def run_check(self, *suites, ssh = None):
+    def run_check(self, *suites, ssh=None):
         targets = set()
         for s in suites:
             if s == "gcc":
@@ -54,7 +54,7 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
 
             ptestsuite = "gcc-{}".format(suite) if suite != "gcc" else suite
             ptestsuite = ptestsuite + "-user" if ssh is None else ptestsuite
-            self.ptest_section(ptestsuite, logfile = logpath)
+            self.ptest_section(ptestsuite, logfile=logpath)
             with open(sumspath, "r") as f:
                 for test, result in parse_values(f):
                     self.ptest_result(ptestsuite, test, result)
@@ -69,7 +69,7 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("core-image-minimal")
 
         # wrap the execution with a qemu instance
-        with runqemu("core-image-minimal", runqemuparams = "nographic") as qemu:
+        with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
             # validate that SSH is working
             status, _ = qemu.run("uname")
             self.assertEqual(status, 0)
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index c687f6ef93..852c8635df 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -15,7 +15,7 @@ def parse_values(content):
                 break
 
 class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
-    def run_check(self, ssh = None):
+    def run_check(self, ssh=None):
         # configure ssh target
         features = []
         if ssh is not None:
@@ -61,7 +61,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             bitbake("core-image-minimal")
 
             # start runqemu
-            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic"))
+            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams="nographic"))
 
             # validate that SSH is working
             status, _ = qemu.run("uname")
@@ -75,7 +75,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             if status != 0:
                 raise Exception("Failed to setup NFS mount on target ({})".format(repr(output)))
 
-            self.run_check(ssh = qemu.ip)
+            self.run_check(ssh=qemu.ip)
 
 @OETestTag("toolchain-user")
 class GlibcSelfTest(GlibcSelfTestBase):
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index e4755c595b..b5505fa60e 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -38,7 +38,7 @@ class VerifyManifest(OESelftestTestCase):
 
     #this will possibly move from here
     @classmethod
-    def get_dir_from_bb_var(self, bb_var, target = None):
+    def get_dir_from_bb_var(self, bb_var, target=None):
         target == self.buildtarget if target == None else target
         directory = get_bb_var(bb_var, target)
         if not directory or not os.path.isdir(directory):
@@ -81,8 +81,8 @@ class VerifyManifest(OESelftestTestCase):
         pkgdata_dir = reverse_dir = {}
         mfilename = mpath = m_entry = {}
         # get manifest location based on target to query about
-        d_target= dict(target = self.buildtarget,
-                         host = 'nativesdk-packagegroup-sdk-host')
+        d_target= dict(target=self.buildtarget,
+                         host='nativesdk-packagegroup-sdk-host')
         try:
             mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
             for k in d_target.keys():
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 802a91a488..8b0fb8a8f6 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -28,7 +28,7 @@ class TestBlobParsing(OESelftestTestCase):
         import shutil
         shutil.rmtree(self.repo_path)
 
-    def commit_vars(self, to_add={}, to_remove = [], msg="A commit message"):
+    def commit_vars(self, to_add={}, to_remove=[], msg="A commit message"):
         if len(to_add) == 0 and len(to_remove) == 0:
             return
 
@@ -50,7 +50,7 @@ class TestBlobParsing(OESelftestTestCase):
         """
         from oe.buildhistory_analysis import blob_to_dict
         valuesmap = { "foo" : "1", "bar" : "2" }
-        self.commit_vars(to_add = valuesmap)
+        self.commit_vars(to_add=valuesmap)
 
         blob = self.repo.head.commit.tree.blobs[0]
         self.assertEqual(valuesmap, blob_to_dict(blob),
@@ -64,10 +64,10 @@ class TestBlobParsing(OESelftestTestCase):
 
         changesmap = { "foo-2" : ("2", "8"), "bar" : ("","4"), "bar-2" : ("","5")}
 
-        self.commit_vars(to_add = { "foo" : "1", "foo-2" : "2", "foo-3" : "3" })
+        self.commit_vars(to_add={ "foo" : "1", "foo-2" : "2", "foo-3" : "3" })
         blob1 = self.repo.heads.master.commit.tree.blobs[0]
 
-        self.commit_vars(to_add = { "foo-2" : "8", "bar" : "4", "bar-2" : "5" })
+        self.commit_vars(to_add={ "foo-2" : "8", "bar" : "4", "bar-2" : "5" })
         blob2 = self.repo.heads.master.commit.tree.blobs[0]
 
         change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
@@ -83,10 +83,10 @@ class TestBlobParsing(OESelftestTestCase):
         from oe.buildhistory_analysis import compare_dict_blobs
         defaultmap = { x : ("default", "1")  for x in ["PKG", "PKGE", "PKGV", "PKGR"]}
 
-        self.commit_vars(to_add = { "foo" : "1" })
+        self.commit_vars(to_add={ "foo" : "1" })
         blob1 = self.repo.heads.master.commit.tree.blobs[0]
 
-        self.commit_vars(to_add = { "PKG" : "1", "PKGE" : "1", "PKGV" : "1", "PKGR" : "1" })
+        self.commit_vars(to_add={ "PKG" : "1", "PKGE" : "1", "PKGV" : "1", "PKGR" : "1" })
         blob2 = self.repo.heads.master.commit.tree.blobs[0]
 
         change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index 098734fa5d..39e683ab5a 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -44,7 +44,7 @@ class TestRealPath(TestCase):
     ]
 
     def setUp(self):
-        self.tmpdir = tempfile.mkdtemp(prefix = "oe-test_path")
+        self.tmpdir = tempfile.mkdtemp(prefix="oe-test_path")
         self.root = os.path.join(self.tmpdir, "R")
 
         os.mkdir(os.path.join(self.tmpdir, "_real"))
@@ -60,9 +60,9 @@ class TestRealPath(TestCase):
     def tearDown(self):
         shutil.rmtree(self.tmpdir)
 
-    def __realpath(self, file, use_physdir, assume_dir = True):
+    def __realpath(self, file, use_physdir, assume_dir=True):
         return oe.path.realpath(os.path.join(self.root, file), self.root,
-                                use_physdir, assume_dir = assume_dir)
+                                use_physdir, assume_dir=assume_dir)
 
     def test_norm(self):
         for l in self.LINKS:
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 254abc40c6..e837daf8b1 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -223,4 +223,4 @@ class OePkgdataUtilTests(OESelftestTestCase):
         result = runCmd('oe-pkgdata-util', ignore_status=True)
         self.assertEqual(result.status, 2, "Status different than 2. output: %s" % result.output)
         currpos = result.output.find('usage: oe-pkgdata-util')
-        self.assertTrue(currpos != -1, msg = "Test is Failed. Help is not Displayed in %s" % result.output)
+        self.assertTrue(currpos != -1, msg="Test is Failed. Help is not Displayed in %s" % result.output)
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 9db2a0bb44..9b62e5164e 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -137,7 +137,7 @@ class SStateTests(SStateBase):
             filtered_results.append(r)
         self.assertTrue(filtered_results == [], msg="Found distro non-specific sstate for: %s (%s)" % (', '.join(map(str, targets)), str(filtered_results)))
         file_tracker_1 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
-        self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
+        self.assertTrue(len(file_tracker_1) >= len(targets), msg="Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
 
         self.track_for_cleanup(self.distro_specific_sstate + "_old")
         shutil.copytree(self.distro_specific_sstate, self.distro_specific_sstate + "_old")
@@ -146,7 +146,7 @@ class SStateTests(SStateBase):
         bitbake(['-cclean'] + targets)
         bitbake(targets)
         file_tracker_2 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
-        self.assertTrue(len(file_tracker_2) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
+        self.assertTrue(len(file_tracker_2) >= len(targets), msg="Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
 
         not_recreated = [x for x in file_tracker_1 if x not in file_tracker_2]
         self.assertTrue(not_recreated == [], msg="The following sstate files ware not recreated: %s" % ', '.join(map(str, not_recreated)))
@@ -196,7 +196,7 @@ class SStateTests(SStateBase):
                 expected_remaining_sstate += [x for x in target_sstate_after_build if x not in target_sstate_before_build if not any(pattern in x for pattern in ignore_patterns)]
             self.remove_config(global_config[idx])
             self.remove_recipeinc(target, target_config[idx])
-            self.assertEqual(result.status, 0, msg = "build of %s failed with %s" % (target, result.output))
+            self.assertEqual(result.status, 0, msg="build of %s failed with %s" % (target, result.output))
 
         runCmd("sstate-cache-management.sh -y --cache-dir=%s --remove-duplicated --extra-archs=%s" % (self.sstate_path, ','.join(map(str, sstate_archs_list))))
         actual_remaining_sstate = [x for x in self.search_sstate(target + r'.*?\.tgz$') if not any(pattern in x for pattern in ignore_patterns)]
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 005ebaa7f3..751d1303cf 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -127,28 +127,28 @@ class QemuTarget(BaseTarget):
         if d.getVar("DISTRO") == "poky-tiny":
             self.runner = QemuTinyRunner(machine=d.getVar("MACHINE"),
                             rootfs=self.rootfs,
-                            tmpdir = d.getVar("TMPDIR"),
-                            deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE"),
-                            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY"),
-                            logfile = self.qemulog,
-                            kernel = self.kernel,
-                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
-                            tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
-                            logger = logger)
+                            tmpdir=d.getVar("TMPDIR"),
+                            deploy_dir_image=d.getVar("DEPLOY_DIR_IMAGE"),
+                            display=d.getVar("BB_ORIGENV", False).getVar("DISPLAY"),
+                            logfile=self.qemulog,
+                            kernel=self.kernel,
+                            boottime=int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
+                            tmpfsdir=d.getVar("RUNQEMU_TMPFS_DIR"),
+                            logger=logger)
         else:
             self.runner = QemuRunner(machine=d.getVar("MACHINE"),
                             rootfs=self.rootfs,
-                            tmpdir = d.getVar("TMPDIR"),
-                            deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE"),
-                            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY"),
-                            logfile = self.qemulog,
-                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
-                            use_kvm = use_kvm,
-                            dump_dir = dump_dir,
-                            dump_host_cmds = d.getVar("testimage_dump_host"),
-                            logger = logger,
-                            tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
-                            serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
+                            tmpdir=d.getVar("TMPDIR"),
+                            deploy_dir_image=d.getVar("DEPLOY_DIR_IMAGE"),
+                            display=d.getVar("BB_ORIGENV", False).getVar("DISPLAY"),
+                            logfile=self.qemulog,
+                            boottime=int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
+                            use_kvm=use_kvm,
+                            dump_dir=dump_dir,
+                            dump_host_cmds=d.getVar("testimage_dump_host"),
+                            logger=logger,
+                            tmpfsdir=d.getVar("RUNQEMU_TMPFS_DIR"),
+                            serial_ports=len(d.getVar("SERIAL_CONSOLES").split()))
 
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
         self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index 96926746cc..fb81c136f0 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -8,7 +8,7 @@ __path__ = extend_path(__path__, __name__)
 # Borrowed from CalledProcessError
 
 class CommandError(Exception):
-    def __init__(self, retcode, cmd, output = None):
+    def __init__(self, retcode, cmd, output=None):
         self.retcode = retcode
         self.cmd = cmd
         self.output = output
diff --git a/meta/lib/oeqa/utils/network.py b/meta/lib/oeqa/utils/network.py
index 59d01723a1..0436d27582 100644
--- a/meta/lib/oeqa/utils/network.py
+++ b/meta/lib/oeqa/utils/network.py
@@ -4,7 +4,7 @@
 
 import socket
 
-def get_free_port(udp = False):
+def get_free_port(udp=False):
     s = socket.socket(socket.AF_INET, socket.SOCK_STREAM if not udp else socket.SOCK_DGRAM)
     s.bind(('', 0))
     addr = s.getsockname()
diff --git a/meta/lib/oeqa/utils/nfs.py b/meta/lib/oeqa/utils/nfs.py
index a37686c914..1dd65588bb 100644
--- a/meta/lib/oeqa/utils/nfs.py
+++ b/meta/lib/oeqa/utils/nfs.py
@@ -8,7 +8,7 @@ from oeqa.utils.commands import bitbake, get_bb_var, Command
 from oeqa.utils.network import get_free_port
 
 @contextlib.contextmanager
-def unfs_server(directory, logger = None):
+def unfs_server(directory, logger=None):
     unfs_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "unfs3-native")
     if not os.path.exists(os.path.join(unfs_sysroot, "usr", "bin", "unfsd")):
         # build native tool
@@ -18,16 +18,16 @@ def unfs_server(directory, logger = None):
     cmd = None
     try:
         # create the exports file
-        with tempfile.NamedTemporaryFile(delete = False) as exports:
+        with tempfile.NamedTemporaryFile(delete=False) as exports:
             exports.write("{0} (rw,no_root_squash,no_all_squash,insecure)\n".format(directory).encode())
 
         # find some ports for the server
-        nfsport, mountport = get_free_port(udp = True), get_free_port(udp = True)
+        nfsport, mountport = get_free_port(udp=True), get_free_port(udp=True)
 
         nenv = dict(os.environ)
         nenv['PATH'] = "{0}/sbin:{0}/usr/sbin:{0}/usr/bin:".format(unfs_sysroot) + nenv.get('PATH', '')
         cmd = Command(["unfsd", "-d", "-p", "-N", "-e", exports.name, "-n", str(nfsport), "-m", str(mountport)],
-                bg = True, env = nenv, output_log = logger)
+                bg=True, env=nenv, output_log=logger)
         cmd.run()
         yield nfsport, mountport
     finally:
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c7f7860317..96355fbfc3 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -34,7 +34,7 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
-                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None):
+                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns=defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -134,7 +134,7 @@ class QemuRunner:
                 self.stop()
                 self._dump_host()
 
-    def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
+    def start(self, qemuparams=None, get_ip=True, extra_bootparams=None, runqemuparams='', launch_cmd=None, discard_writes=True):
         env = os.environ.copy()
         if self.display:
             env["DISPLAY"] = self.display
@@ -175,7 +175,7 @@ class QemuRunner:
 
         return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
 
-    def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
+    def launch(self, launch_cmd, get_ip=True, qemuparams=None, extra_bootparams=None, env=None):
         # use logfile to determine the recipe-sysroot-native path and
         # then add in the site-packages path components and add that
         # to the python sys.path so qmp.py can be found.
@@ -574,7 +574,7 @@ class QemuRunner:
         if self.thread:
             self.thread.allowexit()
 
-    def restart(self, qemuparams = None):
+    def restart(self, qemuparams=None):
         self.logger.warning("Restarting qemu process")
         if self.runqemu.poll() is None:
             self.stop()
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 20009401ca..be82a7947a 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -64,7 +64,7 @@ class QemuTinyRunner(QemuRunner):
             with open(self.logfile, "a") as f:
                 f.write("%s" % msg)
 
-    def start(self, qemuparams = None, ssh=True, extra_bootparams=None, runqemuparams='', discard_writes=True):
+    def start(self, qemuparams=None, ssh=True, extra_bootparams=None, runqemuparams='', discard_writes=True):
 
         if self.display:
             os.environ["DISPLAY"] = self.display
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 36c2ecb3db..403bad7b1f 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -120,7 +120,7 @@ class SSHControl(object):
             with open(self.logfile, "a") as f:
                 f.write("%s\n" % msg)
 
-    def _internal_run(self, command, timeout=None, ignore_status = True):
+    def _internal_run(self, command, timeout=None, ignore_status=True):
         self.log("[Running]$ %s" % " ".join(command))
 
         proc = SSHProcess()
diff --git a/meta/recipes-core/glibc/glibc/check-test-wrapper b/meta/recipes-core/glibc/glibc/check-test-wrapper
index 6ec9b9b29e..820d4732da 100644
--- a/meta/recipes-core/glibc/glibc/check-test-wrapper
+++ b/meta/recipes-core/glibc/glibc/check-test-wrapper
@@ -73,7 +73,7 @@ else:
     sys.exit(-1)
 
 try:
-    r = subprocess.run(command, timeout = 1800, env = env)
+    r = subprocess.run(command, timeout=1800, env=env)
     sys.exit(r.returncode)
 except subprocess.TimeoutExpired:
     sys.exit(-1)
diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index 674d690450..8c4486ee62 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -104,7 +104,7 @@ def split_pntask(s):
     return (tmp.group(1), tmp.group(2))
 
 
-def print_added(d_new = None, d_old = None):
+def print_added(d_new=None, d_old=None):
     """
     Print the newly added tasks
     """
@@ -137,7 +137,7 @@ def print_added(d_new = None, d_old = None):
 
     return counter
 
-def print_vrchanged(d_new = None, d_old = None, vr = None):
+def print_vrchanged(d_new=None, d_old=None, vr=None):
     """
     Print the pv or pr changed tasks.
     The arg "vr" is "pv" or "pr"
@@ -165,7 +165,7 @@ def print_vrchanged(d_new = None, d_old = None, vr = None):
 
     return counter
 
-def print_depchanged(d_new = None, d_old = None, verbose = False):
+def print_depchanged(d_new=None, d_old=None, verbose=False):
     """
     Print the dependency changes
     """
@@ -210,7 +210,7 @@ def main():
     3) Use bb.siggen.compare_sigfiles to diff the old and new stamps
     """
 
-    parser = argparse_oe.ArgumentParser(usage = """%(prog)s [options] [package ...]
+    parser = argparse_oe.ArgumentParser(usage="""%(prog)s [options] [package ...]
 print what will be done between the current and last builds, for example:
 
     $ bitbake core-image-sato
@@ -226,7 +226,7 @@ Note:
 """
 )
     parser.add_argument("recipe", help="recipe to check")
-    parser.add_argument("-v", "--verbose", help = "print the verbose changes", action = "store_true")
+    parser.add_argument("-v", "--verbose", help="print the verbose changes", action="store_true")
     args = parser.parse_args()
 
     # Get the STAMPS_DIR
diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index 340bee78bb..653972a969 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -26,18 +26,18 @@ logger = logger_create()
 
 def main():
     parser = optparse.OptionParser(
-        description = "Collects the recorded SRCREV values from buildhistory and reports on them.",
-        usage = """
+        description="Collects the recorded SRCREV values from buildhistory and reports on them.",
+        usage="""
     %prog [options]""")
 
     parser.add_option("-a", "--report-all",
-            help = "Report all SRCREV values, not just ones where AUTOREV has been used",
+            help="Report all SRCREV values, not just ones where AUTOREV has been used",
             action="store_true", dest="reportall")
     parser.add_option("-f", "--forcevariable",
-            help = "Use forcevariable override for all output lines",
+            help="Use forcevariable override for all output lines",
             action="store_true", dest="forcevariable")
     parser.add_option("-p", "--buildhistory-dir",
-            help = "Specify path to buildhistory directory (defaults to buildhistory/ under cwd)",
+            help="Specify path to buildhistory directory (defaults to buildhistory/ under cwd)",
             action="store", dest="buildhistory_dir", default='buildhistory/')
 
     options, args = parser.parse_args(sys.argv)
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 3bd40a2a1e..f176857fdd 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -63,7 +63,7 @@ def get_args_parser():
                         default="auto",
                         help="Whether to colourise (defaults to auto)")
     parser.add_argument('revisions',
-                        default = ['build-minus-1', 'HEAD'],
+                        default=['build-minus-1', 'HEAD'],
                         nargs='*',
                         help=argparse.SUPPRESS)
     return parser
diff --git a/scripts/combo-layer b/scripts/combo-layer
index d0ed701e91..5aea6971c7 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -746,7 +746,7 @@ def conf_commit_msg(conf, components):
 
     # expand the template with known values
     template = Template(conf.commit_msg_template)
-    msg = template.substitute(components = component_str)
+    msg = template.substitute(components=component_str)
     return msg
 
 def commit_conf_file(conf, components, commit=True):
@@ -1307,8 +1307,8 @@ actions = {
 
 def main():
     parser = optparse.OptionParser(
-        version = "Combo Layer Repo Tool version %s" % __version__,
-        usage = """%prog [options] action
+        version="Combo Layer Repo Tool version %s" % __version__,
+        usage="""%prog [options] action
 
 Create and update a combination layer repository from multiple component repositories.
 
@@ -1318,24 +1318,24 @@ Action:
   pull [components]    just pull component repos only
   splitpatch [commit]  generate commit patch and split per component, default commit is HEAD""")
 
-    parser.add_option("-c", "--conf", help = "specify the config file (conf/combo-layer.conf is the default).",
-               action = "store", dest = "conffile", default = "conf/combo-layer.conf")
+    parser.add_option("-c", "--conf", help="specify the config file (conf/combo-layer.conf is the default).",
+               action="store", dest="conffile", default="conf/combo-layer.conf")
 
-    parser.add_option("-i", "--interactive", help = "interactive mode, user can edit the patch list and patches",
-               action = "store_true", dest = "interactive", default = False)
+    parser.add_option("-i", "--interactive", help="interactive mode, user can edit the patch list and patches",
+               action="store_true", dest="interactive", default=False)
 
-    parser.add_option("-D", "--debug", help = "output debug information",
-               action = "store_true", dest = "debug", default = False)
+    parser.add_option("-D", "--debug", help="output debug information",
+               action="store_true", dest="debug", default=False)
 
-    parser.add_option("-n", "--no-pull", help = "skip pulling component repos during update",
-               action = "store_true", dest = "nopull", default = False)
+    parser.add_option("-n", "--no-pull", help="skip pulling component repos during update",
+               action="store_true", dest="nopull", default=False)
 
     parser.add_option("--hard-reset",
-               help = "instead of pull do fetch and hard-reset in component repos",
-               action = "store_true", dest = "hard_reset", default = False)
+               help="instead of pull do fetch and hard-reset in component repos",
+               action="store_true", dest="hard_reset", default=False)
 
-    parser.add_option("-H", "--history", help = "import full history of components during init",
-                      action = "store_true", default = False)
+    parser.add_option("-H", "--history", help="import full history of components during init",
+                      action="store_true", default=False)
 
     options, args = parser.parse_args(sys.argv)
 
diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index bb288e9099..d88de43bd2 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -132,18 +132,18 @@ def main():
 
     # Collect and validate input
     parser = optparse.OptionParser(
-        description = "Lists recipes and PACKAGECONFIG flags. Without -a or -f, recipes and their available PACKAGECONFIG flags are listed.",
-        usage = """
+        description="Lists recipes and PACKAGECONFIG flags. Without -a or -f, recipes and their available PACKAGECONFIG flags are listed.",
+        usage="""
     %prog [options]""")
 
     parser.add_option("-f", "--flags",
-            help = "list available PACKAGECONFIG flags and affected recipes",
+            help="list available PACKAGECONFIG flags and affected recipes",
             action="store_const", dest="listtype", const="flags", default="recipes")
     parser.add_option("-a", "--all",
-            help = "list all recipes and PACKAGECONFIG information",
+            help="list all recipes and PACKAGECONFIG information",
             action="store_const", dest="listtype", const="all")
     parser.add_option("-p", "--preferred-only",
-            help = "where multiple recipe versions are available, list only the preferred version",
+            help="where multiple recipe versions are available, list only the preferred version",
             action="store_true", dest="preferred", default=False)
 
     options, args = parser.parse_args(sys.argv)
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 7bffa78e23..9991b35395 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -27,7 +27,7 @@ import bb.tinfoil
 logger = scriptutils.logger_create('verify_homepage')
 
 def wgetHomepage(pn, homepage):
-    result = subprocess.call('wget ' + '-q -T 5 -t 1 --spider ' + homepage, shell = True)
+    result = subprocess.call('wget ' + '-q -T 5 -t 1 --spider ' + homepage, shell=True)
     if result:
         logger.warning("%s: failed to verify HOMEPAGE: %s " % (pn, homepage))
         return 1
diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index f526111be5..b849843154 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -157,7 +157,7 @@ def _find_layer_depends(depend, layers):
     return None
 
 def add_layer_dependencies(bblayersconf, layer, layers, logger):
-    def recurse_dependencies(depends, layer, layers, logger, ret = []):
+    def recurse_dependencies(depends, layer, layers, logger, ret=[]):
         logger.debug('Processing dependencies %s for layer %s.' %
                     (depends, layer['name']))
 
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index f92255d8dc..b3a51c7553 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -37,7 +37,7 @@ class KeepAliveStreamHandler(logging.StreamHandler):
                         self.emit(logging.LogRecord("keepalive", logging.INFO,
                             None, None, "Keepalive message", None, None))
 
-        self._thread = threading.Thread(target = thread, daemon = True)
+        self._thread = threading.Thread(target=thread, daemon=True)
         self._thread.start()
 
     def close(self):
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 8968b2f651..03c3d71594 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -169,7 +169,7 @@ class KickStart():
         part.add_argument('--part-type')
         part.add_argument('--rootfs-dir')
         part.add_argument('--type', default='primary',
-                choices = ('primary', 'logical'))
+                choices=('primary', 'logical'))
 
         # --size and --fixed-size cannot be specified together; options
         # ----extra-space and --overhead-factor should also raise a parser
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index e0b2c5bdf2..d4ca39a09e 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -199,7 +199,7 @@ class Partition():
                            (self.mountpoint, self.size, self.fixed_size))
 
     def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
-                       native_sysroot, real_rootfs = True, pseudo_dir = None):
+                       native_sysroot, real_rootfs=True, pseudo_dir=None):
         """
         Prepare content for a rootfs partition i.e. create a partition
         and fill it from a /rootfs dir.
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 96d940a91d..03b642f4fa 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -230,4 +230,4 @@ class RootfsPlugin(SourcePlugin):
 
         part.prepare_rootfs(cr_workdir, oe_builddir,
                             new_rootfs or part.rootfs_dir, native_sysroot,
-                            pseudo_dir = new_pseudo or pseudo_dir)
+                            pseudo_dir=new_pseudo or pseudo_dir)
diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
index 5eb3e12769..14ad54008b 100755
--- a/scripts/oe-depends-dot
+++ b/scripts/oe-depends-dot
@@ -17,18 +17,18 @@ class Dot(object):
             description="Analyse recipe-depends.dot generated by bitbake -g",
             epilog="Use %(prog)s --help to get help")
         parser.add_argument("dotfile",
-            help = "Specify the dotfile", nargs = 1, action='store', default='')
+            help="Specify the dotfile", nargs=1, action='store', default='')
         parser.add_argument("-k", "--key",
-            help = "Specify the key, e.g., recipe name",
+            help="Specify the key, e.g., recipe name",
             action="store", default='')
         parser.add_argument("-d", "--depends",
-            help = "Print the key's dependencies",
+            help="Print the key's dependencies",
             action="store_true", default=False)
         parser.add_argument("-w", "--why",
-            help = "Print why the key is built",
+            help="Print why the key is built",
             action="store_true", default=False)
         parser.add_argument("-r", "--remove",
-            help = "Remove duplicated dependencies to reduce the size of the dot files."
+            help="Remove duplicated dependencies to reduce the size of the dot files."
                     " For example, A->B, B->C, A->C, then A->C can be removed.",
             action="store_true", default=False)
 
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 1dc9bd02a6..802ca7d5a9 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -395,7 +395,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
                     proc_tree, None)
 
         # render disk throughput
-        max_sample = max (trace.disk_stats, key = lambda s: s.tput)
+        max_sample = max (trace.disk_stats, key=lambda s: s.tput)
         if clip_visible (clip, chart_rect):
             draw_chart (ctx, DISK_TPUT_COLOR, False, chart_rect,
                     [(sample.time, sample.tput) for sample in trace.disk_stats],
@@ -782,7 +782,7 @@ class CumlSample:
 
     def merge_samples(self, proc):
         self.samples.extend (proc.samples)
-        self.samples.sort (key = lambda p: p.time)
+        self.samples.sort (key=lambda p: p.time)
 
     def next(self):
         global palette_idx
diff --git a/scripts/pybootchartgui/pybootchartgui/process_tree.py b/scripts/pybootchartgui/pybootchartgui/process_tree.py
index cf88110b1c..5572c5d19c 100644
--- a/scripts/pybootchartgui/pybootchartgui/process_tree.py
+++ b/scripts/pybootchartgui/pybootchartgui/process_tree.py
@@ -39,7 +39,7 @@ class ProcessTree:
 
     def __init__(self, writer, kernel, psstats, sample_period,
                  monitoredApp, prune, idle, taskstats,
-                 accurate_parentage, for_testing = False):
+                 accurate_parentage, for_testing=False):
         self.writer = writer
         self.process_tree = []
         self.taskstats = taskstats
@@ -49,7 +49,7 @@ class ProcessTree:
             process_list = psstats.process_map.values()
         else:
             process_list = list(kernel) + list(psstats.process_map.values())
-        self.process_list = sorted(process_list, key = lambda p: p.pid)
+        self.process_list = sorted(process_list, key=lambda p: p.pid)
         self.sample_period = sample_period
 
         self.build()
@@ -94,7 +94,7 @@ class ProcessTree:
     def sort(self, process_subtree):
         """Sort process tree."""
         for p in process_subtree:
-            p.child_list.sort(key = lambda p: p.pid)
+            p.child_list.sort(key=lambda p: p.pid)
             self.sort(p.child_list)
 
     def num_nodes(self, process_list):
@@ -284,7 +284,7 @@ class ProcessTree:
     def merge_processes(self, p1, p2):
         """Merges two process' samples."""
         p1.samples.extend(p2.samples)
-        p1.samples.sort( key = lambda p: p.time )
+        p1.samples.sort( key=lambda p: p.time )
         p1time = p1.start_time
         p2time = p2.start_time
         p1.start_time = min(p1time, p2time)
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index ab573329f2..69299fbd21 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -22,7 +22,7 @@ class DiskStatSample:
         self.diskdata = [ a + b for a, b in zip(self.diskdata, new_diskdata) ]
 
 class CPUSample:
-    def __init__(self, time, user, sys, io = 0.0, swap = 0.0):
+    def __init__(self, time, user, sys, io=0.0, swap=0.0):
         self.time = time
         self.user = user
         self.sys = sys
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py b/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
index 47249056fd..a30e13ca06 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
@@ -25,7 +25,7 @@ class TestProcessTree(unittest.TestCase):
         parsing.parse_file(writer, trace, self.mk_fname('proc_ps.log'))
         trace.compile(writer)
         self.processtree = process_tree.ProcessTree(writer, None, trace.ps_stats,
-            trace.ps_stats.sample_period, None, options.prune, None, None, False, for_testing = True)
+            trace.ps_stats.sample_period, None, options.prune, None, None, False, for_testing=True)
 
     def mk_fname(self,f):
         return os.path.join(self.rootdir, f)
-- 
2.32.0

