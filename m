Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.7549.1624859967948243871
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 22:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mwWrbGLp;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id g24so9379131pji.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 22:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wbUJTE/FsKAokSc6kTIPXkkBR6oaQ4mp3pNHjtQOZYg=;
        b=mwWrbGLpC4MaXq/KyqasR0F9P2nkoUtmKafXQ4wiYy5ZBPYP6K/cPvoclDb9LQmBmW
         +Z4bqjEDWTln7hgqzVyNJYfl+iuF/c7vso41aPB+6QzVourCOhbm1HaFaLznw+aq+pN2
         oRLL5iQS34IHtFhVZMQRiayLnpMrDVLD8kcKPD3I5Ov9spsHESZDzGKNSrmQJE8HUOiy
         pQ3dNQ3TRLhfPqu0gBA8cBFqVwV0IlPrD05pK7iMvuyOmkJrci3lYnpVth4oWiakc++K
         eIu1Gn4muUP1PcmHXLzxtnzZtKebAY8nB+OXpqtqIhCIMWwwoXlLh7dDJfRiIZ+XfRxW
         LMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wbUJTE/FsKAokSc6kTIPXkkBR6oaQ4mp3pNHjtQOZYg=;
        b=Ye3IIekctcZ3KljjSGLN4uALzJLbqTpEU2D2dNzeHed/dysb1mCOBdbJCmk8iQRAXd
         /ECsZ4Mf+yKzCftRGTEw4x1apBRDpbM9oABKnwWym1Rkwuy2e4Ab2fQk6qSwJno41p0a
         OGiMUod9jQqlJpUYUthISXA9/N2Cv56Bhjl8TUPMg/2nkEwqyJK3FYoZfSub8+cJVfK7
         Mhs7IZLW2stOw37FgDdoTivoLLDqpqcsjh4K+nfq6+ZxRhLD/wnx3pCXR5zA+AhSdth8
         pFvG5L540k3iULYL/AGM0ssJzb4zDHcRu4FMUnPhOhof6kezmZIxxRmImbA+kKeuhLek
         idgg==
X-Gm-Message-State: AOAM531Xbd6X9rm3I3vn4YvlgE5smammHqe3xg10+kHsuyuye0njWknF
	xzgWYF4cw/6IGkfZOBN0QsgjTrNV9xagTQ==
X-Google-Smtp-Source: ABdhPJxlO9eNyYW7B2rBE4JT+h3q5CMsdxwF0yAY/0sKdKM1oBsEkCuMonpdfrTmrNrmeqf1Cm4bHA==
X-Received: by 2002:a17:902:ff0c:b029:11d:3e9e:41ec with SMTP id f12-20020a170902ff0cb029011d3e9e41ecmr21193553plj.1.1624859966823;
        Sun, 27 Jun 2021 22:59:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b522])
        by smtp.gmail.com with ESMTPSA id c18sm12768912pgf.66.2021.06.27.22.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 22:59:26 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 8/8] PEP8 double aggressive W291 ~ W293 and W391
Date: Sun, 27 Jun 2021 22:59:15 -0700
Message-Id: <20210628055915.1107-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628055915.1107-1-raj.khem@gmail.com>
References: <20210628055915.1107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 contrib/git-hooks/sendemail-validate.sample   |  1 -
 meta/lib/bblayers/create.py                   |  1 -
 meta/lib/oe/cachedpath.py                     |  4 ++--
 meta/lib/oe/elf.py                            |  8 ++++----
 meta/lib/oe/license.py                        |  2 +-
 meta/lib/oe/package.py                        |  2 +-
 meta/lib/oe/patch.py                          |  3 +--
 meta/lib/oe/path.py                           |  4 ++--
 meta/lib/oe/recipeutils.py                    |  2 +-
 meta/lib/oe/reproducible.py                   |  1 -
 meta/lib/oe/sdk.py                            |  2 +-
 meta/lib/oe/sstatesig.py                      |  2 --
 meta/lib/oe/utils.py                          |  2 +-
 meta/lib/oeqa/controllers/testtargetloader.py |  8 ++++----
 meta/lib/oeqa/core/case.py                    |  1 -
 meta/lib/oeqa/core/decorator/__init__.py      |  1 -
 meta/lib/oeqa/core/decorator/data.py          |  1 -
 meta/lib/oeqa/core/loader.py                  |  2 +-
 meta/lib/oeqa/core/target/qemu.py             |  2 +-
 meta/lib/oeqa/core/tests/cases/oetag.py       |  1 -
 meta/lib/oeqa/core/utils/concurrencytest.py   |  1 -
 meta/lib/oeqa/core/utils/path.py              |  1 -
 meta/lib/oeqa/runtime/cases/buildlzip.py      |  1 -
 .../oeqa/runtime/cases/ethernet_ip_connman.py | 20 +++++++++----------
 meta/lib/oeqa/runtime/cases/logrotate.py      | 10 ++++------
 meta/lib/oeqa/runtime/cases/ltp.py            |  6 +++---
 meta/lib/oeqa/runtime/cases/ltp_compliance.py |  6 +++---
 meta/lib/oeqa/runtime/cases/ltp_stress.py     |  4 ++--
 meta/lib/oeqa/runtime/cases/opkg.py           |  4 ++--
 meta/lib/oeqa/runtime/cases/rpm.py            |  2 --
 meta/lib/oeqa/runtime/cases/rtc.py            |  5 ++---
 meta/lib/oeqa/runtime/cases/runlevel.py       |  6 +++---
 meta/lib/oeqa/runtime/cases/storage.py        |  6 +++---
 meta/lib/oeqa/runtime/cases/suspend.py        | 14 ++++++-------
 meta/lib/oeqa/runtime/cases/terminal.py       |  4 ++--
 meta/lib/oeqa/runtime/cases/usb_hid.py        | 10 +++++-----
 meta/lib/oeqa/sdk/cases/gcc.py                |  2 +-
 meta/lib/oeqa/sdk/context.py                  |  2 +-
 meta/lib/oeqa/sdk/testsdk.py                  |  2 --
 meta/lib/oeqa/sdkext/testsdk.py               |  1 -
 meta/lib/oeqa/selftest/cases/binutils.py      |  1 -
 meta/lib/oeqa/selftest/cases/eSDK.py          |  1 -
 meta/lib/oeqa/selftest/cases/gcc.py           |  1 -
 meta/lib/oeqa/selftest/cases/glibc.py         |  1 -
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  2 +-
 .../oeqa/selftest/cases/incompatible_lic.py   |  1 -
 meta/lib/oeqa/selftest/cases/meta_ide.py      |  2 +-
 .../oeqa/selftest/cases/oelib/buildhistory.py |  1 -
 meta/lib/oeqa/selftest/cases/oescripts.py     |  5 ++---
 meta/lib/oeqa/selftest/cases/prservice.py     |  1 -
 meta/lib/oeqa/selftest/cases/recipeutils.py   | 16 +++++++--------
 meta/lib/oeqa/selftest/cases/reproducible.py  |  1 -
 .../oeqa/selftest/cases/resulttooltests.py    |  1 -
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  3 +--
 meta/lib/oeqa/selftest/cases/selftest.py      |  1 -
 meta/lib/oeqa/selftest/cases/signing.py       |  2 +-
 meta/lib/oeqa/selftest/cases/sysroot.py       |  2 +-
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  4 ++--
 meta/lib/oeqa/selftest/cases/wic.py           |  2 +-
 meta/lib/oeqa/selftest/context.py             |  4 ++--
 meta/lib/oeqa/utils/__init__.py               |  4 ++--
 meta/lib/oeqa/utils/commands.py               |  2 +-
 meta/lib/oeqa/utils/git.py                    |  2 --
 meta/lib/oeqa/utils/gitarchive.py             |  1 -
 meta/lib/oeqa/utils/httpserver.py             |  3 +--
 meta/lib/oeqa/utils/nfs.py                    |  1 -
 meta/lib/oeqa/utils/qemurunner.py             |  4 ++--
 meta/lib/oeqa/utils/testexport.py             |  3 +--
 .../glibc/glibc/check-test-wrapper            |  1 -
 .../systemd/systemd-systemctl/systemctl       |  2 +-
 .../python-numpy/files/run-ptest              |  1 -
 .../python3/check_build_completeness.py       |  1 -
 .../python/python3/create_manifest3.py        | 13 ++++++------
 .../python/python3/get_module_deps3.py        | 10 +++++-----
 .../python/python3/reformat_sysconfig.py      |  1 -
 .../perf/perf/sort-pmuevents.py               |  7 +++----
 scripts/cp-noerror                            |  2 +-
 scripts/lib/build_perf/__init__.py            |  1 -
 scripts/lib/build_perf/report.py              |  1 -
 scripts/lib/checklayer/cases/bsp.py           |  2 +-
 scripts/lib/checklayer/cases/distro.py        |  2 +-
 scripts/lib/recipetool/create.py              |  1 -
 scripts/lib/resulttool/log.py                 |  1 -
 scripts/lib/resulttool/regression.py          |  1 -
 scripts/lib/resulttool/resultutils.py         |  1 -
 scripts/lib/wic/partition.py                  |  1 -
 scripts/oe-build-perf-test                    |  1 -
 scripts/oe-trim-schemas                       |  1 -
 scripts/oepydevshell-internal.py              |  2 +-
 scripts/opkg-query-helper.py                  |  1 -
 .../pybootchartgui/pybootchartgui/batch.py    |  1 -
 scripts/pybootchartgui/pybootchartgui/gui.py  |  2 +-
 .../pybootchartgui/pybootchartgui/main.py.in  | 10 +++++-----
 .../pybootchartgui/tests/parser_test.py       | 11 +++++-----
 scripts/relocate_sdk.py                       |  1 -
 95 files changed, 125 insertions(+), 183 deletions(-)

diff --git a/contrib/git-hooks/sendemail-validate.sample b/contrib/git-hooks/sendemail-validate.sample
index af5d55cb00..f1a956736f 100755
--- a/contrib/git-hooks/sendemail-validate.sample
+++ b/contrib/git-hooks/sendemail-validate.sample
@@ -75,4 +75,3 @@ def main():
 
 if __name__ == "__main__":
     sys.exit(main())
-
diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index f5af56f215..4de31211a1 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -79,4 +79,3 @@ class CreatePlugin(LayerPlugin):
         parser_create_layer.add_argument('--priority', '-p', default=6, help='Priority of recipes in layer')
         parser_create_layer.add_argument('--example-recipe-name', '-e', dest='examplerecipe', default='example', help='Filename of the example recipe')
         parser_create_layer.add_argument('--example-recipe-version', '-v', dest='version', default='0.1', help='Version number for the example recipe')
-
diff --git a/meta/lib/oe/cachedpath.py b/meta/lib/oe/cachedpath.py
index a94b03f6d2..89cf479ce2 100644
--- a/meta/lib/oe/cachedpath.py
+++ b/meta/lib/oe/cachedpath.py
@@ -43,7 +43,7 @@ class CachedPath(object):
             self.statcache[path] = False
             return False
 
-    # We might as well call lstat and then only 
+    # We might as well call lstat and then only
     # call stat as well in the symbolic link case
     # since this turns out to be much more optimal
     # in real world usage of this cache
@@ -183,7 +183,7 @@ class CachedPath(object):
 
             loop_cnt -= 1
             target = os.path.normpath(os.readlink(file))
-    
+
             if not os.path.isabs(target):
                 tdir = os.path.dirname(file)
                 assert(self.__is_path_below(tdir, root))
diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index 5e8be92592..039d348118 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -6,7 +6,7 @@
 def machine_dict(d):
 #           TARGET_OS  TARGET_ARCH   MACHINE, OSABI, ABIVERSION, Little Endian, 32bit?
     machdata = {
-            "darwin9": { 
+            "darwin9": {
                         "arm": (40, 0, 0, True, 32),
                       },
             "eabi": {
@@ -28,7 +28,7 @@ def machine_dict(d):
                         "riscv32": (243, 0, 0, True, 32),
                         "riscv64": (243, 0, 0, True, 64),
                       },
-            "linux": { 
+            "linux": {
                         "aarch64": (183, 0, 0, True, 64),
                         "aarch64_be": (183, 0, 0, False, 64),
                         "arm": (40, 97, 0, True, 32),
@@ -62,7 +62,7 @@ def machine_dict(d):
                         "microblaze": (189, 0, 0, False, 32),
                         "microblazeel": (189, 0, 0, True, 32),
                       },
-            "linux-musl": { 
+            "linux-musl": {
                         "aarch64": (183, 0, 0, True, 64),
                         "aarch64_be": (183, 0, 0, False, 64),
                         "arm": (40, 97, 0, True, 32),
@@ -87,7 +87,7 @@ def machine_dict(d):
                       },
             "uclinux-uclibc": {
                         "bfin": (106, 0, 0, True, 32),
-                      }, 
+                      },
             "linux-gnueabi": {
                         "arm": (40, 0, 0, True, 32),
                         "armeb": (40, 0, 0, False, 32),
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 98e65c32be..393b50e201 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -190,7 +190,7 @@ class ManifestVisitor(LicenseVisitor):
                             elif ops[-1] in ['[', ']']:
                                 ops.append(op)
                             else:
-                                ops[-1] = op 
+                                ops[-1] = op
 
                     for op in ops:
                         if op == '[' or op == ']':
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 0113f97b83..92456a4b52 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -27,7 +27,7 @@ def runstrip(arg):
 
     stripcmd = [strip]
     skip_strip = False
-    # kernel module    
+    # kernel module
     if elftype & 16:
         if is_kernel_module_signed(file):
             bb.debug(1, "Skip strip on signed module %s" % file)
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 2bf13ec34b..cfa6a6884d 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -218,7 +218,7 @@ class PatchTree(PatchSet):
         with open(self.seriespath, 'w') as f:
             for p in patches:
                 f.write(p)
-         
+
     def Import(self, patch, force=None):
         """"""
         PatchSet.Import(self, patch, force)
@@ -905,4 +905,3 @@ def should_apply(parm, d):
             return False, "applies to later version"
 
     return True, None
-
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 1ac9c2cfcf..50c09d227a 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -91,7 +91,7 @@ def format_display(path, metadata):
 
 def copytree(src, dst):
     # We could use something like shutil.copytree here but it turns out to
-    # to be slow. It takes twice as long copying to an empty directory. 
+    # to be slow. It takes twice as long copying to an empty directory.
     # If dst already has contents performance can be 15 time slower
     # This way we also preserve hardlinks between files in the tree.
 
@@ -122,7 +122,7 @@ def copyhardlinktree(src, dst):
             bb.debug(2, "Hardlink test failed with " + str(e))
 
     if (canhard):
-        # Need to copy directories only with tar first since cp will error if two 
+        # Need to copy directories only with tar first since cp will error if two
         # writers try and create a directory at the same time
         cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 610500b6a0..406aea9def 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1038,7 +1038,7 @@ def get_recipe_upstream_version(rd):
             revision = ud.method.latest_revision(ud, rd, 'default')
             upversion = pv
             if revision != rd.getVar("SRCREV"):
-                upversion = upversion + "-new-commits-available" 
+                upversion = upversion + "-new-commits-available"
         else:
             pupver = ud.method.latest_versionstring(ud, rd)
             (upversion, revision) = pupver
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index fd9f9354fd..0f9e673a5a 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -111,4 +111,3 @@ def get_source_date_epoch(d, sourcedir):
         get_source_date_epoch_from_youngest_file(d, sourcedir) or
         fixed_source_date_epoch(d)       # Last resort
     )
-
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 7dca15b65c..fb719a9b82 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -139,7 +139,7 @@ def get_extra_sdkinfo(sstate_dir):
     This function is going to be used for generating the target and host manifest files packages of eSDK.
     """
     import math
-    
+
     extra_info = {}
     extra_info['tasksizes'] = {}
     extra_info['filesizes'] = {}
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 588332042d..96843413d3 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -630,5 +630,3 @@ def OEOuthashBasic(path, sigfile, task, d):
         os.chdir(prev_dir)
 
     return h.hexdigest()
-
-
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 60cd4cb446..feadf946b6 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -284,7 +284,7 @@ def execute_pre_post_process(d, cmds):
             bb.note("Executing %s ..." % cmd)
             bb.build.exec_func(cmd, d)
 
-# For each item in items, call the function 'target' with item as the first 
+# For each item in items, call the function 'target' with item as the first
 # argument, extraargs as the other arguments and handle any exceptions in the
 # parent thread
 
diff --git a/meta/lib/oeqa/controllers/testtargetloader.py b/meta/lib/oeqa/controllers/testtargetloader.py
index 038d29bd39..6be0614ee5 100644
--- a/meta/lib/oeqa/controllers/testtargetloader.py
+++ b/meta/lib/oeqa/controllers/testtargetloader.py
@@ -11,8 +11,8 @@ import os
 
 class TestTargetLoader:
 
-    # Search oeqa.controllers module directory for and return a controller  
-    # corresponding to the given target name. 
+    # Search oeqa.controllers module directory for and return a controller
+    # corresponding to the given target name.
     # AttributeError raised if not found.
     # ImportError raised if a provided module can not be imported.
     def get_controller_module(self, target, bbpath):
@@ -46,7 +46,7 @@ class TestTargetLoader:
         return controllerslist
 
     # Search for and return a controller from given target name and
-    # set of module names. 
+    # set of module names.
     # Raise AttributeError if not found.
     # Raise ImportError if a provided module can not be imported
     def load_controller_from_name(self, target, modulenames):
@@ -65,7 +65,7 @@ class TestTargetLoader:
         # is valid that a module may not have the target class.
         try:
             obj = getattr(module, target)
-            if obj: 
+            if obj:
                 from oeqa.targetcontrol import BaseTarget
                 if(not issubclass(obj, BaseTarget)):
                     bb.warn("Target {0} found, but subclass is not BaseTarget".format(target))
diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index afb34a35cf..eac01d8693 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -105,4 +105,3 @@ class OEPTestResultTestCase:
             sections[section] = {}
         resultname = "ptestresult.{}.{}".format(section, test)
         self.extraresults[resultname] = {"status": result}
-
diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/core/decorator/__init__.py
index d581597aba..016bf3fe3b 100644
--- a/meta/lib/oeqa/core/decorator/__init__.py
+++ b/meta/lib/oeqa/core/decorator/__init__.py
@@ -81,4 +81,3 @@ def OETestTag(*tags):
             item.__oeqa_testtags = expandedtags
         return item
     return decorator
-
diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 82aac0b873..3fd3009a98 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -235,4 +235,3 @@ class skipIfQemu(OETestDecorator):
         self.logger.debug(msg)
         if is_qemu(self.case.td, self.value):
              self.case.skipTest(self.msg)
-
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 3cc1d6b669..7f6ee74d09 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -201,7 +201,7 @@ class OETestLoader(unittest.TestLoader):
             # a setUpDecorators/tearDownDecorators that methods
             # will call setUp/tearDown original methods.
             setattr(testCaseClass, 'setUpMethod',
-                    getattr(testCaseClass, 'setUp')) 
+                    getattr(testCaseClass, 'setUp'))
             setattr(testCaseClass, 'tearDownMethod',
                     getattr(testCaseClass, 'tearDown'))
             setattr(testCaseClass, 'setUp', testCaseClass._oeSetUp)
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 6d6561333b..7cb4aac572 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -47,7 +47,7 @@ class OEQemuTarget(OESSHTarget):
                                  logfile=bootlog, boottime=boottime,
                                  use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir,
                                  dump_host_cmds=dump_host_cmds, logger=logger,
-                                 serial_ports=serial_ports, boot_patterns=boot_patterns, 
+                                 serial_ports=serial_ports, boot_patterns=boot_patterns,
                                  use_ovmf=ovmf, tmpfsdir=tmpfsdir)
         dump_monitor_cmds = kwargs.get("testimage_dump_monitor")
         self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
diff --git a/meta/lib/oeqa/core/tests/cases/oetag.py b/meta/lib/oeqa/core/tests/cases/oetag.py
index 6b89e011e6..725a5ece00 100644
--- a/meta/lib/oeqa/core/tests/cases/oetag.py
+++ b/meta/lib/oeqa/core/tests/cases/oetag.py
@@ -37,4 +37,3 @@ class TagClassTest(OETestCase):
 
     def testTagNone(self):
         self.assertTrue(True, msg='How is this possible?')
-
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 089ee8e665..726dedff40 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -346,4 +346,3 @@ def partition_tests(suite, count):
 
     # No point in empty threads so drop them
     return [p for p in partitions if p]
-
diff --git a/meta/lib/oeqa/core/utils/path.py b/meta/lib/oeqa/core/utils/path.py
index 803601ddf7..3464d333c2 100644
--- a/meta/lib/oeqa/core/utils/path.py
+++ b/meta/lib/oeqa/core/utils/path.py
@@ -21,4 +21,3 @@ def findFile(file_name, directory):
 def remove_safe(path):
     if os.path.exists(path):
         os.remove(path)
-
diff --git a/meta/lib/oeqa/runtime/cases/buildlzip.py b/meta/lib/oeqa/runtime/cases/buildlzip.py
index 78c1661968..e8ec3121e4 100644
--- a/meta/lib/oeqa/runtime/cases/buildlzip.py
+++ b/meta/lib/oeqa/runtime/cases/buildlzip.py
@@ -32,4 +32,3 @@ class BuildLzipTest(OERuntimeTestCase):
         self.project.run_configure()
         self.project.run_make()
         self.project.run_install()
-
diff --git a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
index 3c71a7c600..e55533e6c3 100644
--- a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
+++ b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
@@ -5,30 +5,30 @@ from oeqa.core.decorator.data import skipIfQemu
 
 class Ethernet_Test(OERuntimeTestCase):
 
-    def set_ip(self, x): 
+    def set_ip(self, x):
         x = x.split(".")
-        sample_host_address = '150'        
+        sample_host_address = '150'
         x[3] = sample_host_address
         x = '.'.join(x)
         return x
-    
-    @skipIfQemu('qemuall', 'Test only runs on real hardware')    
+
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_set_virtual_ip(self):
         (status, output) = self.target.run("ifconfig eth0 | grep 'inet ' | awk '{print $2}'")
         self.assertEqual(status, 0, msg='Failed to get ip address. Make sure you have an ethernet connection on your device, output: %s' % output)
-        original_ip = output 
+        original_ip = output
         virtual_ip = self.set_ip(original_ip)
-        
+
         (status, output) = self.target.run("ifconfig eth0:1 %s netmask 255.255.255.0 && sleep 2 && ping -c 5 %s && ifconfig eth0:1 down" % (virtual_ip, virtual_ip))
         self.assertEqual(status, 0, msg='Failed to create virtual ip address, output: %s' % output)
-        
-    @OETestDepends(['ethernet_ip_connman.Ethernet_Test.test_set_virtual_ip'])  
-    def test_get_ip_from_dhcp(self): 
+
+    @OETestDepends(['ethernet_ip_connman.Ethernet_Test.test_set_virtual_ip'])
+    def test_get_ip_from_dhcp(self):
         (status, output) = self.target.run("connmanctl services | grep -E '*AO Wired|*AR Wired' | awk '{print $3}'")
         self.assertEqual(status, 0, msg='No wired interfaces are detected, output: %s' % output)
         wired_interfaces = output
-        
+
         (status, output) = self.target.run("ip route | grep default | awk '{print $3}'")
         self.assertEqual(status, 0, msg='Failed to retrieve the default gateway, output: %s' % output)
         default_gateway = output
diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 9f88f2dbc0..0e5623e3c0 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -37,20 +37,20 @@ class LogrotateTest(OERuntimeTestCase):
         status, output = self.target.run('echo "create \n olddir $HOME/logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
         msg = ('Could not write to /tmp/logrotate-test.conf')
         self.assertEqual(status, 0, msg=msg)
-        
+
         # If logrotate fails to rotate the log, view the verbose output of logrotate to see what prevented it
         _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test.conf')
         status, _ = self.target.run('find $HOME/logrotate_dir -type f | grep wtmp.1')
         msg = ("logrotate did not successfully rotate the wtmp log. Output from logrotate -vf: \n%s" % (logrotate_output))
         self.assertEqual(status, 0, msg=msg)
-       
+
     @OETestDepends(['logrotate.LogrotateTest.test_logrotate_wtmp'])
     def test_logrotate_newlog(self):
-        
+
         status, output = self.target.run('echo "oeqa logrotate test file" > /var/log/logrotate_testfile')
         msg = ('Could not create logrotate test file in /var/log')
         self.assertEqual(status, 0, msg=msg)
-        
+
         status, output = self.target.run('echo "/var/log/logrotate_testfile {\n missingok \n monthly \n rotate 1" > /etc/logrotate.d/logrotate_testfile')
         msg = ('Could not write to /etc/logrotate.d/logrotate_testfile')
         self.assertEqual(status, 0, msg=msg)
@@ -68,5 +68,3 @@ class LogrotateTest(OERuntimeTestCase):
         status, _ = self.target.run('find $HOME/logrotate_dir -type f | grep logrotate_testfile.1')
         msg = ('logrotate did not successfully rotate the logrotate_test log. Output from logrotate -vf: \n%s' % (logrotate_output))
         self.assertEqual(status, 0, msg=msg)
-
-
diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 4bf2f11a19..765e66ab5f 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -78,7 +78,7 @@ class LtpTest(LtpTestBase):
 
             # copy nice log from DUT
             dst = os.path.join(self.ltptest_log_dir, "%s" % ltp_group)
-            remote_src = "/opt/ltp/results/%s" % ltp_group 
+            remote_src = "/opt/ltp/results/%s" % ltp_group
             (status, output) = self.target.copyFrom(remote_src, dst, True)
             msg = 'File could not be copied. Output: %s' % output
             if status:
@@ -97,7 +97,7 @@ class LtpTest(LtpTestBase):
                 testname = ("ltpresult." + ltp_group + "." + test)
                 self.extras[testname] = {'status': result}
                 if result == 'FAILED':
-                    failed_tests[ltp_group] = test 
+                    failed_tests[ltp_group] = test
 
             if failed_tests:
                 self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
@@ -112,7 +112,7 @@ class LtpTest(LtpTestBase):
 
     @OETestDepends(['ltp.LtpTest.test_ltp_help'])
     def test_ltp_groups(self):
-        for ltp_group in self.ltp_groups: 
+        for ltp_group in self.ltp_groups:
             self.runltp(ltp_group)
 
     @OETestDepends(['ltp.LtpTest.test_ltp_groups'])
diff --git a/meta/lib/oeqa/runtime/cases/ltp_compliance.py b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
index 8b0f8a2cdd..eab42afc39 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_compliance.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
@@ -77,14 +77,14 @@ class LtpPosixTest(LtpPosixBase):
             runtime = int(endtime - starttime)
             sections['duration'] = runtime
             self.sections[posix_group] = sections
- 
+
             failed_tests = {}
             for test in results:
                 result = results[test]
                 testname = ("ltpposixresult." + posix_group + "." + test)
                 self.extras[testname] = {'status': result}
                 if result == 'FAILED':
-                    failed_tests[posix_group] = test 
+                    failed_tests[posix_group] = test
 
             if failed_tests:
                 self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
@@ -94,5 +94,5 @@ class LtpPosixTest(LtpPosixBase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(["ltp"])
     def test_posix_groups(self):
-        for posix_group in self.posix_groups: 
+        for posix_group in self.posix_groups:
             self.runltp(posix_group)
diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runtime/cases/ltp_stress.py
index beb47710e4..dd1a7138b2 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -76,14 +76,14 @@ class LtpStressTest(LtpStressBase):
             runtime = int(endtime - starttime)
             sections['duration'] = runtime
             self.sections[stress_group] = sections
- 
+
             failed_tests = {}
             for test in results:
                 result = results[test]
                 testname = ("ltpstressresult." + stress_group + "." + test)
                 self.extras[testname] = {'status': result}
                 if result == 'FAILED':
-                    failed_tests[stress_group] = test 
+                    failed_tests[stress_group] = test
 
             if failed_tests:
                 self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/cases/opkg.py
index c810575180..b203b62c8c 100644
--- a/meta/lib/oeqa/runtime/cases/opkg.py
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -40,11 +40,11 @@ class OpkgRepoTest(OpkgTest):
         apt_get_source_server = 'http://%s:%s/' % (self.tc.target.server_ip, self.repo_server.port)
         apt_get_sourceslist_dir = '/etc/opkg/'
         self.target.run('cd %s; echo src/gz all %s >> opkg.conf' % (apt_get_sourceslist_dir, apt_get_source_server))
-        
+
     def cleanup_source_config_for_package_install(self):
         apt_get_sourceslist_dir = '/etc/opkg/'
         self.target.run('cd %s; sed -i "/^src/d" opkg.conf' % (apt_get_sourceslist_dir))
-        
+
     @skipIfNotFeature('package-management',
                       'Test requires package-management to be in IMAGE_FEATURES')
     @skipIfNotDataVar('IMAGE_PKGTYPE', 'ipk',
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 9c7a50c567..d98c34250f 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -141,5 +141,3 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
             self.assertEqual(0, status, msg=msg)
 
         self.tc.target.run('rm -f %s' % self.dst)
-
-
diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
index 43de30a23f..3b0e32ee14 100644
--- a/meta/lib/oeqa/runtime/cases/rtc.py
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -22,7 +22,7 @@ class RTCTest(OERuntimeTestCase):
     def test_rtc(self):
         (status, output) = self.target.run('hwclock -r')
         self.assertEqual(status, 0, msg='Failed to get RTC time, output: %s' % output)
-        
+
         (status, current_datetime) = self.target.run('date +"%m%d%H%M%Y"')
         self.assertEqual(status, 0, msg='Failed to get system current date & time, output: %s' % current_datetime)
 
@@ -33,7 +33,6 @@ class RTCTest(OERuntimeTestCase):
 
         (status, output) = self.target.run('date %s' % current_datetime)
         self.assertEqual(status, 0, msg='Failed to reset system date & time, output: %s' % output)
-        
+
         (status, output) = self.target.run('hwclock -w')
         self.assertEqual(status, 0, msg='Failed to reset RTC time, output: %s' % output)
-        
diff --git a/meta/lib/oeqa/runtime/cases/runlevel.py b/meta/lib/oeqa/runtime/cases/runlevel.py
index 8dbb2e4f13..b5802bf37a 100644
--- a/meta/lib/oeqa/runtime/cases/runlevel.py
+++ b/meta/lib/oeqa/runtime/cases/runlevel.py
@@ -5,7 +5,7 @@ import time
 
 
 class RunLevel_Test(OERuntimeTestCase):
-    
+
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_runlevel_3(self):
         (status, output) = self.target.run("init 3 && sleep 5 && runlevel")
@@ -13,8 +13,8 @@ class RunLevel_Test(OERuntimeTestCase):
         self.assertEqual(output, runlevel, msg='Failed to set current runlevel to runlevel 3, current runlevel : %s' % output[-1])
         (status, output) = self.target.run("uname -a")
         self.assertEqual(status, 0, msg='Failed to run uname command, output: %s' % output)
-        
-    @OETestDepends(['runlevel.RunLevel_Test.test_runlevel_3']) 
+
+    @OETestDepends(['runlevel.RunLevel_Test.test_runlevel_3'])
     def test_runlevel_5(self):
         (status, output) = self.target.run("init 5 && sleep 5 && runlevel")
         runlevel = '3 5'
diff --git a/meta/lib/oeqa/runtime/cases/storage.py b/meta/lib/oeqa/runtime/cases/storage.py
index cd640e214e..c7ff552283 100644
--- a/meta/lib/oeqa/runtime/cases/storage.py
+++ b/meta/lib/oeqa/runtime/cases/storage.py
@@ -36,7 +36,7 @@ class StorageBase(OERuntimeTestCase):
         msg = ('File %s not created on %s' % (cls.test_file, cls.device))
         cls.assertFalse(status, msg=msg)
         # move file
-        (status, output) = cls.target.run('mv %s/%s %s/%s1' %  
+        (status, output) = cls.target.run('mv %s/%s %s/%s1' %
                 (cls.test_dir, cls.test_file, cls.test_dir, cls.test_file))
         msg = ('File %s not moved to %s' % (cls.test_file, cls.device))
         cls.assertFalse(status, msg=msg)
@@ -47,7 +47,7 @@ class StorageBase(OERuntimeTestCase):
 
     def storage_read(cls):
         # check if message is in file
-        (status, output) = cls.target.run('cat  %s/%s' % 
+        (status, output) = cls.target.run('cat  %s/%s' %
                 (cls.test_dir, cls.test_file))
 
         match = re.search('%s' % cls.test_msg, output)
@@ -56,7 +56,7 @@ class StorageBase(OERuntimeTestCase):
 
     def storage_write(cls):
         # create test message in file on device
-        (status, output) = cls.target.run('echo "%s" >  %s/%s' % 
+        (status, output) = cls.target.run('echo "%s" >  %s/%s' %
                 (cls.test_msg, cls.test_dir, cls.test_file))
         msg = ('File %s not create test message on %s' % (cls.test_file, cls.device))
         cls.assertEqual(status, 0, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/suspend.py b/meta/lib/oeqa/runtime/cases/suspend.py
index 84e2e3f710..bf63489732 100644
--- a/meta/lib/oeqa/runtime/cases/suspend.py
+++ b/meta/lib/oeqa/runtime/cases/suspend.py
@@ -7,23 +7,23 @@ import time
 
 class Suspend_Test(OERuntimeTestCase):
 
-    def test_date(self): 
+    def test_date(self):
         (status, output) = self.target.run('date')
         self.assertEqual(status, 0, msg='Failed to run date command, output : %s' % output)
-        
+
     def test_ping(self):
         t_thread = threading.Thread(target=self.target.run, args=("ping 8.8.8.8",))
         t_thread.start()
         time.sleep(2)
-        
+
         status, output = self.target.run('pidof ping')
         self.target.run('kill -9 %s' % output)
-        self.assertEqual(status, 0, msg='Not able to find process that runs ping, output : %s' % output)  
-        
-    def set_suspend(self): 
+        self.assertEqual(status, 0, msg='Not able to find process that runs ping, output : %s' % output)
+
+    def set_suspend(self):
         (status, output) = self.target.run('sudo rtcwake -m mem -s 10')
         self.assertEqual(status, 0, msg='Failed to suspends your system to RAM, output : %s' % output)
-    
+
     @skipIfQemu('qemuall', 'Test only runs on real hardware')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_suspend(self):
diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
index fe1cd68118..77328ab928 100644
--- a/meta/lib/oeqa/runtime/cases/terminal.py
+++ b/meta/lib/oeqa/runtime/cases/terminal.py
@@ -14,9 +14,9 @@ class TerminalTest(OERuntimeTestCase):
         t_thread = threading.Thread(target=self.target.run, args=("export DISPLAY=:0 && matchbox-terminal -e 'sh -c \"uname -a && exec sh\"'",))
         t_thread.start()
         time.sleep(2)
-        
+
         status, output = self.target.run('pidof matchbox-terminal')
         number_of_terminal = len(output.split())
         self.assertEqual(number_of_terminal, 1, msg='There should be only one terminal being launched. Number of terminal launched : %s' % number_of_terminal)
         self.target.run('kill -9 %s' % output)
-        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')     
+        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')
diff --git a/meta/lib/oeqa/runtime/cases/usb_hid.py b/meta/lib/oeqa/runtime/cases/usb_hid.py
index e8451b4658..6f7f0e2aa5 100644
--- a/meta/lib/oeqa/runtime/cases/usb_hid.py
+++ b/meta/lib/oeqa/runtime/cases/usb_hid.py
@@ -6,18 +6,18 @@ from oeqa.runtime.decorator.package import OEHasPackage
 
 class USB_HID_Test(OERuntimeTestCase):
 
-    def keyboard_mouse_simulation(self): 
+    def keyboard_mouse_simulation(self):
         (status, output) = self.target.run('export DISPLAY=:0 && xdotool key F2 && xdotool mousemove 100 100')
         return self.assertEqual(status, 0, msg='Failed to simulate keyboard/mouse input event, output : %s' % output)
-             
-    def set_suspend(self): 
+
+    def set_suspend(self):
         (status, output) = self.target.run('sudo rtcwake -m mem -s 10')
         return self.assertEqual(status, 0, msg='Failed to suspends your system to RAM, output : %s' % output)
-    
+
     @OEHasPackage(['xdotool'])
     @skipIfQemu('qemuall', 'Test only runs on real hardware')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_USB_Hid_input(self):
         self.keyboard_mouse_simulation()
         self.set_suspend()
-        self.keyboard_mouse_simulation()  
+        self.keyboard_mouse_simulation()
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index f943cd3fe3..f2da2637b8 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -19,7 +19,7 @@ class GccCompileTest(OESDKTestCase):
     @classmethod
     def setUpClass(self):
         files = {'test.c': self.tc.files_dir, 'test.cpp': self.tc.files_dir,
-                'testsdkmakefile': self.tc.sdk_files_dir} 
+                'testsdkmakefile': self.tc.sdk_files_dir}
         for f in files:
             shutil.copyfile(os.path.join(files[f], f),
                     os.path.join(self.tc.sdk_dir, f))
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 4e4eb8e5fa..67da429c51 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -80,7 +80,7 @@ class OESDKTestContextExecutor(OETestContextExecutor):
         # required options, seems that don't keep track of already parsed
         # options
         sdk_rgroup = self.parser.add_argument_group('sdk required options')
-        sdk_rgroup.add_argument('--sdk-dir', required=False, action='store', 
+        sdk_rgroup.add_argument('--sdk-dir', required=False, action='store',
             help='sdk installed directory')
 
         self.parser.add_argument('-j', '--num-processes', dest='processes', action='store',
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 80c2002ecd..05363c36df 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -144,5 +144,3 @@ class TestSDK(TestSDKBase):
 
         if fail:
             bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
-
-
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 6d552a8edf..8631a9e6d1 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -105,4 +105,3 @@ class TestSDKExt(TestSDKBase):
 
         if fail:
             bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
-
diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index 87b0e8b438..9c9538de85 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -49,4 +49,3 @@ class BinutilsCrossSelfTest(OESelftestTestCase, OEPTestResultTestCase):
         with open(sumspath, "r") as f:
             for test, result in parse_values(f):
                 self.ptest_result(ptestsuite, test, result)
-
diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index d40ff86c4a..10518d4cf9 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -118,4 +118,3 @@ SSTATE_MIRRORS =  "file://.* file://%s/PATH"
         image = 'core-image-minimal'
         cmd = "devtool build-image %s" % image
         oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
-
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 843746418f..070b01b645 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -165,4 +165,3 @@ class GccLibItmSelfTestSystemEmulated(GccSelfTestBase):
     def test_libitm(self):
         self.check_skip("libitm")
         self.run_check_emulated("libitm")
-
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 842b663bdc..d41dd49ab3 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -90,4 +90,3 @@ class GlibcSelfTest(GlibcSelfTestBase):
 class GlibcSelfTestSystemEmulated(GlibcSelfTestBase):
     def test_glibc(self):
         self.run_check_emulated()
-
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 6f982b52c2..dbd3ccc517 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -262,7 +262,7 @@ PNBLACKLIST[busybox] = "Don't build this"
         Author:      Humberto Ibarra <humberto.ibarra.lopez@intel.com>
                      Yeoh Ee Peng <ee.peng.yeoh@intel.com>
         """
-      
+
         image_name = 'core-image-minimal'
         features = 'IMAGE_GEN_DEBUGFS = "1"\n'
         features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"\n'
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 22a38a3f1a..d85ef5e59c 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -135,4 +135,3 @@ RDEPENDS_packagegroup-core-full-cmdline-multiuser_remove = "gzip"\n
 """)
         bitbake('core-image-full-cmdline')
         bitbake('-c testimage core-image-full-cmdline')
-
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index cf111fa781..4685683e3c 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -23,7 +23,7 @@ class MetaIDE(OESelftestTestCase):
         cls.environment_script_path = '%s/%s' % (cls.tmpdir, cls.environment_script)
         cls.corebasedir = bb_vars['COREBASE']
         cls.tmpdir_metaideQA = tempfile.mkdtemp(prefix='metaide')
-        
+
     @classmethod
     def tearDownClass(cls):
         shutil.rmtree(cls.tmpdir_metaideQA, ignore_errors=True)
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 18a877ee72..02ed94b1ef 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -144,4 +144,3 @@ class TestFileListCompare(OESelftestTestCase):
 
         self.maxDiff = None
         self.assertCountEqual(rendered, expectedResult)
-
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index cf432d9d35..e7571aac34 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -109,7 +109,7 @@ class OEGitproxyTests(OESelftestTestCase):
         res = runCmd('%s%s/oe-git-proxy 127.1.2.3 9418' %
                      (prefix, self.scripts_dir))
         self.assertIn('TCP:', res.output)
-        
+
         # test that * globbering is off
         os.environ['NO_PROXY'] = "*"
         res = runCmd('%s%s/oe-git-proxy host.example.com 9418' %
@@ -135,7 +135,7 @@ class OeRunNativeTest(OESelftestTestCase):
 
 class OEListPackageconfigTests(OEScriptTests):
     #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
-    def check_endlines(self, results, expected_endlines): 
+    def check_endlines(self, results, expected_endlines):
         for line in results.output.splitlines():
             for el in expected_endlines:
                 if line.split() == el.split():
@@ -188,4 +188,3 @@ class OEListPackageconfigTests(OEScriptTests):
         expected_endlines.append("pinentry                     gtk2 libcap ncurses qt secret")
 
         self.check_endlines(results, expected_endlines)
-
diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 0b248addda..90426889a4 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -123,4 +123,3 @@ class BitbakePrTests(OESelftestTestCase):
         ret = runCmd('bitbake-prserv --host localhost --port %s --loglevel=DEBUG --stop' % port)
 
         self.assertEqual(ret.status, 0)
-
diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/selftest/cases/recipeutils.py
index 4883d15b51..50fea291e2 100644
--- a/meta/lib/oeqa/selftest/cases/recipeutils.py
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -43,15 +43,15 @@ class RecipeUtilsTests(OESelftestTestCase):
 -LICENSE = "BSD"
 +LICENSE = "something"
  LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
- 
+
  inherit pypi
- 
+
  PYPI_PACKAGE = "async"
- 
+
 -SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
 +SRC_URI[md5sum] = "aaaaaa"
  SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
- 
+
  RDEPENDS_${PN} += "${PYTHON_PN}-threading"
 """
         patchlines = []
@@ -74,9 +74,9 @@ class RecipeUtilsTests(OESelftestTestCase):
 --- a/recipes-test/recipeutils/recipeutils-test_1.2.bb
 +++ b/recipes-test/recipeutils/recipeutils-test_1.2.bb
 @@ -8,6 +8,4 @@
- 
+
  BBCLASSEXTEND = "native nativesdk"
- 
+
 -SRC_URI += "file://somefile"
 -
  SRC_URI_append = " file://anotherfile"
@@ -98,9 +98,9 @@ class RecipeUtilsTests(OESelftestTestCase):
 --- a/recipes-test/recipeutils/recipeutils-test_1.2.bb
 +++ b/recipes-test/recipeutils/recipeutils-test_1.2.bb
 @@ -8,6 +8,3 @@
- 
+
  BBCLASSEXTEND = "native nativesdk"
- 
+
 -SRC_URI += "file://somefile"
 -
 -SRC_URI_append = " file://anotherfile"
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index d2053b1473..d6c924a300 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -334,4 +334,3 @@ class ReproducibleTests(OESelftestTestCase):
 
         if fails:
             self.fail('\n'.join(fails))
-
diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index aa3b87c031..fe560fc064 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -96,4 +96,3 @@ class ResultToolTests(OESelftestTestCase):
         resultutils.append_resultsdata(results, ResultToolTests.base_results_data, configmap=resultutils.flatten_map)
         resultutils.append_resultsdata(results, ResultToolTests.target_results_data, configmap=resultutils.flatten_map)
         self.assertEqual(len(results[''].keys()), 5, msg="Flattened results not correct %s" % str(results))
-
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 95c37e2ec9..a2d806256f 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -388,7 +388,7 @@ IMAGE_INSTALL_append = " systemtap-runtime"
             bitbake(self.image)
 
             with runqemu(self.image) as qemu:
-                cmd = "crosstap -r root@192.168.7.2 -s %s/general/helloworld.stp " % systemtap_examples 
+                cmd = "crosstap -r root@192.168.7.2 -s %s/general/helloworld.stp " % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap helloworld returned a non 0 status:%s' % result.output)
 
@@ -427,4 +427,3 @@ IMAGE_INSTALL_append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
-
diff --git a/meta/lib/oeqa/selftest/cases/selftest.py b/meta/lib/oeqa/selftest/cases/selftest.py
index a5d9a06d36..c9c2c267b0 100644
--- a/meta/lib/oeqa/selftest/cases/selftest.py
+++ b/meta/lib/oeqa/selftest/cases/selftest.py
@@ -53,4 +53,3 @@ def search_method(module, method):
                 if m == method:
                     return True
     return False
-
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 865a71e93e..9074f71ace 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -130,7 +130,7 @@ class Signing(OESelftestTestCase):
 
         test_recipe = 'ed'
 
-        # Since we need gpg but we can't use gpg-native for sstate signatures, we 
+        # Since we need gpg but we can't use gpg-native for sstate signatures, we
         # build gpg-native in our original builddir then run the tests in a second one.
         builddir = os.environ.get('BUILDDIR') + "-testsign"
         sstatedir = os.path.join(builddir, 'test-sstate')
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
index 937bc49af6..b4232f7f4e 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -16,7 +16,7 @@ class SysrootTests(OESelftestTestCase):
         sysroot is correctly cleaned up. The files in the two providers overlap
         so can cause errors if the sysroot code doesn't function correctly.
         Yes, sysroot-test should be machine specific really to avoid this, however
-        the sysroot cleanup should also work [YOCTO #13702]. 
+        the sysroot cleanup should also work [YOCTO #13702].
         """
 
         uuid1 = uuid.uuid4()
diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 01c2ffe5ee..85cc542df1 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -103,9 +103,9 @@ class TinfoilTests(OESelftestTestCase):
             start = time.time()
             # Wait for maximum 60s in total so we'd detect spurious heartbeat events for example
             # The test is IO load sensitive too
-            while (not (eventreceived == True and commandcomplete == True) 
+            while (not (eventreceived == True and commandcomplete == True)
                     and (time.time() - start < 60)):
-                # if we received both events (on let's say a good day), we are done  
+                # if we received both events (on let's say a good day), we are done
                 event = tinfoil.wait_event(1)
                 if event:
                     if isinstance(event, bb.command.CommandCompleted):
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 36ab91c4f2..f1f63ddcd9 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -247,7 +247,7 @@ class Wic(WicTestCase):
         runCmd(cmd)
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
         images = glob(self.resultdir + "mkefidisk-*.direct")
-        result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))       
+        result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
         self.assertIn("kernel", result.output)
 
     def test_sdimage_bootpart(self):
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index e4d3d88b54..7bfbe97f7a 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -199,14 +199,14 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         machines = []
 
         bbpath = self.tc_kwargs['init']['td']['BBPATH'].split(':')
-    
+
         for path in bbpath:
             found_machines = glob.glob(os.path.join(path, 'conf', 'machine', '*.conf'))
             if found_machines:
                 for i in found_machines:
                     # eg: '/home/<user>/poky/meta-intel/conf/machine/intel-core2-32.conf'
                     machines.append(os.path.splitext(os.path.basename(i))[0])
-    
+
         return machines
 
     def _get_cases_paths(self, bbpath):
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index 40af6e73f8..03f0fc8ad9 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -46,8 +46,8 @@ def avoid_paths_in_environ(paths):
 def make_logger_bitbake_compatible(logger):
     import logging
 
-    """ 
-    We need to raise the log level of the info output so unittest 
+    """
+    We need to raise the log level of the info output so unittest
     messages are visible on the console.
     """
     def _bitbake_log_info(msg, *args, **kwargs):
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 1b13c5df22..60314f08d0 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -117,7 +117,7 @@ class Command(object):
             else:
                 deadline = time.time() + self.timeout
                 for thread in self.threads:
-                    timeout = deadline - time.time() 
+                    timeout = deadline - time.time()
                     if timeout < 0:
                         timeout = 0
                     thread.join(timeout)
diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
index b3d96d1562..dd56f0b69b 100644
--- a/meta/lib/oeqa/utils/git.py
+++ b/meta/lib/oeqa/utils/git.py
@@ -78,5 +78,3 @@ class GitRepo(object):
             return self.run_cmd(['symbolic-ref', 'HEAD'])[11:]
         except GitError:
             return None
-
-
diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 13713d9eca..1a40c640fb 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -241,4 +241,3 @@ def rev_find(revs, attr, val):
         if getattr(rev, attr) == val:
             return i
     raise ValueError("Unable to find '{}' value '{}'".format(attr, val))
-
diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index 3bdccbf2ed..5f0d894b36 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -42,7 +42,7 @@ class HTTPService(object):
         self.process = multiprocessing.Process(target=self.server.server_start, args=[self.root_dir, self.logger])
 
         # The signal handler from testimage.bbclass can cause deadlocks here
-        # if the HTTPServer is terminated before it can restore the standard 
+        # if the HTTPServer is terminated before it can restore the standard
         #signal behaviour
         orig = signal.getsignal(signal.SIGTERM)
         signal.signal(signal.SIGTERM, signal.SIG_DFL)
@@ -60,4 +60,3 @@ class HTTPService(object):
             self.process.join()
         if self.logger:
             self.logger.info("Stopped HTTPService on %s:%s" % (self.host, self.port))
-
diff --git a/meta/lib/oeqa/utils/nfs.py b/meta/lib/oeqa/utils/nfs.py
index 745168985f..e0e5dcc9a3 100644
--- a/meta/lib/oeqa/utils/nfs.py
+++ b/meta/lib/oeqa/utils/nfs.py
@@ -37,4 +37,3 @@ def unfs_server(directory, logger=None):
         if exports is not None:
             # clean up exports file
             os.unlink(exports.name)
-
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 59caf5b1fc..096ca4d0a8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -192,7 +192,7 @@ class QemuRunner:
         qmp_file = "." + next(tempfile._get_candidate_names())
         qmp_param = ' -S -qmp unix:./%s,server,wait' % (qmp_file)
         qmp_port = self.tmpdir + "/" + qmp_file
-        # Create a second socket connection for debugging use, 
+        # Create a second socket connection for debugging use,
         # note this will NOT cause qemu to block waiting for the connection
         qmp_file2 = "." + next(tempfile._get_candidate_names())
         qmp_param += ' -qmp unix:./%s,server,nowait' % (qmp_file2)
@@ -354,7 +354,7 @@ class QemuRunner:
             os.chdir(origpath)
 
         # We worry that mmap'd libraries may cause page faults which hang the qemu VM for periods
-        # causing failures. Before we "start" qemu, read through it's mapped files to try and 
+        # causing failures. Before we "start" qemu, read through it's mapped files to try and
         # ensure we don't hit page faults later
         mapdir = "/proc/" + str(self.qemupid) + "/map_files/"
         try:
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index ae95ecd34a..8817e15965 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -34,7 +34,7 @@ except ImportError:
             if msg:
                 print("FATAL:" + msg)
                 sys.exit(1)
-    bb = my_log()    
+    bb = my_log()
 
 
 def determine_if_poky_env():
@@ -271,4 +271,3 @@ def rm_bin(removal_list): # need to know both if the binary is sent archived and
         if status != 0:
             bb.warn("Failed to remove: %s. Please ensure connection with the target device is up and running and "
                      "you have the needed rights." % item)
-
diff --git a/meta/recipes-core/glibc/glibc/check-test-wrapper b/meta/recipes-core/glibc/glibc/check-test-wrapper
index d1c328d318..30a9e6b14e 100644
--- a/meta/recipes-core/glibc/glibc/check-test-wrapper
+++ b/meta/recipes-core/glibc/glibc/check-test-wrapper
@@ -77,4 +77,3 @@ try:
     sys.exit(r.returncode)
 except subprocess.TimeoutExpired:
     sys.exit(-1)
-
diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 00ccbcd1b8..0cdd95f598 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -31,7 +31,7 @@ class SystemdFile():
         self._parse(root, path)
         dirname = os.path.basename(path.name) + ".d"
         for location in locations:
-            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):                
+            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):
                 self._parse(root, path2)
 
     def _parse(self, root, path):
diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python-numpy/files/run-ptest
index 9a1c72aeb1..7a205817f9 100644
--- a/meta/recipes-devtools/python-numpy/files/run-ptest
+++ b/meta/recipes-devtools/python-numpy/files/run-ptest
@@ -2,4 +2,3 @@
 
 import numpy
 numpy.test(label='full', verbose=2)
-
diff --git a/meta/recipes-devtools/python/python3/check_build_completeness.py b/meta/recipes-devtools/python/python3/check_build_completeness.py
index 0f7da37d25..0bdc7b224f 100755
--- a/meta/recipes-devtools/python/python3/check_build_completeness.py
+++ b/meta/recipes-devtools/python/python3/check_build_completeness.py
@@ -14,4 +14,3 @@ if failed_to_build != -1:
 
 if necessary_bits != -1 or failed_to_build != -1:
     sys.exit(1)
-
diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index b936d8406e..0d0b27400d 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -5,7 +5,7 @@
 # packages only when the user needs them, hence why we split upstream python
 # into several packages.
 #
-# In a very simplistic way what this does is: 
+# In a very simplistic way what this does is:
 # Launch python and see specifically what is required for it to run at a minimum
 #
 # Go through the python-manifest file and launch a separate task for every single
@@ -136,9 +136,9 @@ for coredep in output.split():
 
 
 # The second step is to loop through the existing files contained in the core package
-# according to the old manifest, identify if they are  modules, or some other type 
+# according to the old manifest, identify if they are  modules, or some other type
 # of file that we cant import (directories, binaries, configs) in which case we
-# can only assume they were added correctly (manually) so we ignore those and 
+# can only assume they were added correctly (manually) so we ignore those and
 # pass them to the manifest directly.
 
 for filedep in old_manifest['core']['files']:
@@ -216,7 +216,7 @@ for pypkg in old_manifest:
 # each of them by launching a separate task.
 # The output of that task is then parsed and the manifest is updated
 # accordingly, wether it should add the module on FILES for the current package
-# or if that module already belongs to another package then the current one 
+# or if that module already belongs to another package then the current one
 # will RDEPEND on it
 
 for pypkg in old_manifest:
@@ -237,7 +237,7 @@ for pypkg in old_manifest:
     print('Handling package %s' % pypkg)
     print('--------------------------')
 
-    # Handle special cases, we assume that when they were manually added 
+    # Handle special cases, we assume that when they were manually added
     # to the manifest we knew what we were doing.
     special_packages = ['misc', 'modules', 'dev', 'tests']
     if pypkg in special_packages or 'staticdev' in pypkg:
@@ -315,7 +315,7 @@ for pypkg in old_manifest:
             #
             # 2 - We do it the other way around, checking if the folder is contained in the path
             #   e.g. path/folder1/folder2/filename  folder_string= path/folder1/folder2
-            #   is folder_string inside path/folder1/folder2/filename?, 
+            #   is folder_string inside path/folder1/folder2/filename?,
             #   Yes, it works, but we waste a couple of milliseconds.
 
             pymodule_dep = pymodule_dep.replace(pyversion, '${PYTHON_MAJMIN}')
@@ -438,4 +438,3 @@ if (repeated):
     error_msg += '\n'.join(repeated)
     error_msg += '\n'
     sys.exit(error_msg)
-
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index b9cf5068df..60e8cfaed8 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -1,5 +1,5 @@
 # This script is launched on separate task for each python module
-# It checks for dependencies for that specific module and prints 
+# It checks for dependencies for that specific module and prints
 # them out, the output of this execution will have all dependencies
 # for a specific module, which will be parsed an dealt on create_manifest.py
 #
@@ -106,8 +106,8 @@ for item in dif:
         # Deals with NameError: name 'dep_path' is not defined
         # because module is not found (wasn't compiled?), e.g. bddsm
         if debug == True:
-            log.write(item + ' ') 
-            log.write(str(e))                                              
+            log.write(item + ' ')
+            log.write(str(e))
         pass
 
     if dep_path == '':
@@ -158,8 +158,8 @@ for item in dif:
     except NameError as e:
         # Deals with NameError: name 'cached' is not defined
         if debug == True:
-            log.write(item + ' ') 
-            log.write(str(e))                                              
+            log.write(item + ' ')
+            log.write(str(e))
         pass
     if cached is not None:
         if debug == True:
diff --git a/meta/recipes-devtools/python/python3/reformat_sysconfig.py b/meta/recipes-devtools/python/python3/reformat_sysconfig.py
index c4164313e8..65afdcab2e 100644
--- a/meta/recipes-devtools/python/python3/reformat_sysconfig.py
+++ b/meta/recipes-devtools/python/python3/reformat_sysconfig.py
@@ -18,4 +18,3 @@ with open(sys.argv[1], 'w') as f:
         f.write('%s = ' % k)
         pprint.pprint(l[k], stream=f, width=sys.maxsize)
         f.write('\n')
-
diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index 5e29fab2ce..95fa98fa11 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -55,12 +55,12 @@ for struct in re.findall(struct_block_regex, data):
         if cpuid:
             #print( "    cpuid found: %s" % cpuid.group(1) )
             entry_dict[struct[1]]['fields'][cpuid.group(1)] = entry
-            
+
         name = re.search(name_regex, entry)
         if name:
             #print( "    name found: %s" % name.group(1) )
             entry_dict[struct[1]]['fields'][name.group(1)] = entry
-        
+
 
 # created ordered dictionaries from the captured values. These are ordered by
 # a sorted() iteration of the keys. We don't care about the order we read
@@ -75,7 +75,7 @@ for i in sorted(entry_dict.keys()):
     entry_dict_sorted[i]['type'] = entry_dict[i]['type']
     entry_dict_sorted[i]['fields'] = {}
     for f in sorted(entry_dict[i]['fields'].keys()):
-        entry_dict_sorted[i]['fields'][f] = entry_dict[i]['fields'][f] 
+        entry_dict_sorted[i]['fields'][f] = entry_dict[i]['fields'][f]
 
 # dump the sorted elements to the outfile
 outf = open(outfile, 'w')
@@ -90,4 +90,3 @@ for d in entry_dict_sorted:
     outf.write("};\n")
 
 outf.close()
-    
diff --git a/scripts/cp-noerror b/scripts/cp-noerror
index 99fce16a10..e93760726c 100755
--- a/scripts/cp-noerror
+++ b/scripts/cp-noerror
@@ -17,7 +17,7 @@ def copytree(src, dst, symlinks=False, ignore=None):
     names = os.listdir(src)
     try:
         os.makedirs(dst)
-    except OSError: 
+    except OSError:
         # Already exists
         pass
     errors = []
diff --git a/scripts/lib/build_perf/__init__.py b/scripts/lib/build_perf/__init__.py
index 0bc0d74206..addabff281 100644
--- a/scripts/lib/build_perf/__init__.py
+++ b/scripts/lib/build_perf/__init__.py
@@ -22,4 +22,3 @@ def print_table(rows, row_fmt=None):
 
     for row in rows:
         print(*[row_fmt[i].format(col, wid=col_widths[i]) for i, col in enumerate(row)])
-
diff --git a/scripts/lib/build_perf/report.py b/scripts/lib/build_perf/report.py
index fc8bba7cd7..087cbef8a5 100644
--- a/scripts/lib/build_perf/report.py
+++ b/scripts/lib/build_perf/report.py
@@ -336,4 +336,3 @@ def measurement_stats(meas, prefix=''):
     stats[prefix + 'plus'] = val_cls(max_val - mean_val)
 
     return stats
-
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index c80200426d..da1e5e76e0 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -17,7 +17,7 @@ class BSPCheckLayer(OECheckLayerTestCase):
                 self.tc.layer['name'])
 
     def test_bsp_defines_machines(self):
-        self.assertTrue(self.tc.layer['conf']['machines'], 
+        self.assertTrue(self.tc.layer['conf']['machines'],
                 "Layer is BSP but doesn't defines machines.")
 
     def test_bsp_no_set_machine(self):
diff --git a/scripts/lib/checklayer/cases/distro.py b/scripts/lib/checklayer/cases/distro.py
index decac32ffd..ec0714e751 100644
--- a/scripts/lib/checklayer/cases/distro.py
+++ b/scripts/lib/checklayer/cases/distro.py
@@ -17,7 +17,7 @@ class DistroCheckLayer(OECheckLayerTestCase):
                 self.tc.layer['name'])
 
     def test_distro_defines_distros(self):
-        self.assertTrue(self.tc.layer['conf']['distros'], 
+        self.assertTrue(self.tc.layer['conf']['distros'],
                 "Layer is BSP but doesn't defines machines.")
 
     def test_distro_no_set_distros(self):
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index cd8ac24af4..138524a80f 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1335,4 +1335,3 @@ def register_commands(subparsers):
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
     parser_create.add_argument('--mirrors', action="store_true", help='Enable PREMIRRORS and MIRRORS for source tree fetching (disabled by default).')
     parser_create.set_defaults(func=create_recipe)
-
diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
index c46d5b4b5c..6cba8cd2f0 100644
--- a/scripts/lib/resulttool/log.py
+++ b/scripts/lib/resulttool/log.py
@@ -105,4 +105,3 @@ def register_commands(subparsers):
             help='show raw ptest log')
     parser.add_argument('--raw-reproducible', action='store_true',
             help='show raw reproducible build logs')
-
diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index c1f9460f2e..9ea1bf9ad1 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -189,4 +189,3 @@ def register_commands(subparsers):
     parser_build.add_argument('--commit-number', help="Revision number to search for, redundant if --commit is specified")
     parser_build.add_argument('--commit2', help="Revision to compare with")
     parser_build.add_argument('--commit-number2', help="Revision number to compare with, redundant if --commit2 is specified")
-
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index d882b6d322..a23611a2f4 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -237,4 +237,3 @@ def test_run_results(results):
             if not 'result' in test_run:
                 continue
             yield path, run_name, test_run, test_run['result']
-
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 5f5af5f70c..d569cc2657 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -493,4 +493,3 @@ class Partition():
                     logger.warn("%s Inodes (of size %d) are too small." %
                                 (get_err_str(self), size))
                 break
-
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 280eef261d..6e2ab26f13 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -214,4 +214,3 @@ def main(argv=None):
 
 if __name__ == '__main__':
     sys.exit(main())
-
diff --git a/scripts/oe-trim-schemas b/scripts/oe-trim-schemas
index 7bf5b7bdeb..5d3be8fb80 100755
--- a/scripts/oe-trim-schemas
+++ b/scripts/oe-trim-schemas
@@ -61,4 +61,3 @@ for schema in child(xml.getroot(), "schemalist").getchildren():
                 locale.remove(e)
 
 xml.write(sys.stdout, "UTF-8")
-
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index e54d84982b..821a970a83 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -74,7 +74,7 @@ try:
                     if readdata:
                         i = i + readdata.decode('utf-8')
                 if i:
-                    # Write a page at a time to avoid overflowing output 
+                    # Write a page at a time to avoid overflowing output
                     # d.keys() is a good way to do that
                     sys.stdout.write(i[:4096])
                     sys.stdout.flush()
diff --git a/scripts/opkg-query-helper.py b/scripts/opkg-query-helper.py
index 9e50f30962..270bac0c2a 100755
--- a/scripts/opkg-query-helper.py
+++ b/scripts/opkg-query-helper.py
@@ -69,4 +69,3 @@ for line in fileinput.input(args):
                     for rec in recs:
                         rec = verregex.sub('', rec)
                         print("%s|%s [REC]" % (pkg, rec))
-
diff --git a/scripts/pybootchartgui/pybootchartgui/batch.py b/scripts/pybootchartgui/pybootchartgui/batch.py
index 6d9fbce830..9b5a7512b2 100644
--- a/scripts/pybootchartgui/pybootchartgui/batch.py
+++ b/scripts/pybootchartgui/pybootchartgui/batch.py
@@ -44,4 +44,3 @@ def render(writer, trace, app_options, filename):
     draw.render(ctx, options, 1.0, trace)
     write_surface(surface)
     writer.status("bootchart written to '%s'" % filename)
-
diff --git a/scripts/pybootchartgui/pybootchartgui/gui.py b/scripts/pybootchartgui/pybootchartgui/gui.py
index 6a59b2f222..c2136f0551 100644
--- a/scripts/pybootchartgui/pybootchartgui/gui.py
+++ b/scripts/pybootchartgui/pybootchartgui/gui.py
@@ -14,7 +14,7 @@
 #  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
 
 import gi
-gi.require_version('Gtk', '3.0') 
+gi.require_version('Gtk', '3.0')
 from gi.repository import Gtk as gtk
 from gi.repository import Gtk
 from gi.repository import Gdk
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
index cc9471dc21..2e110e272a 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py.in
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -29,7 +29,7 @@ def _mk_options_parser():
 	usage = "%prog [options] /path/to/tmp/buildstats/<recipe-machine>/<BUILDNAME>/"
 	version = "%prog v1.0.0"
 	parser = optparse.OptionParser(usage, version=version)
-	parser.add_option("-i", "--interactive", action="store_true", dest="interactive", default=False, 
+	parser.add_option("-i", "--interactive", action="store_true", dest="interactive", default=False,
 			  help="start in active mode")
 	parser.add_option("-f", "--format", dest="format", default="png", choices=["png", "svg", "pdf"],
 			  help="image format (png, svg, pdf); default format png")
@@ -46,7 +46,7 @@ def _mk_options_parser():
 	parser.add_option("-q", "--quiet", action="store_true", dest="quiet", default=False,
 			  help="suppress informational messages")
 #	parser.add_option("-t", "--boot-time", action="store_true", dest="boottime", default=False,
-#			  help="only display the boot time of the boot in text format (stdout)")	
+#			  help="only display the boot time of the boot in text format (stdout)")
 	parser.add_option("--very-quiet", action="store_true", dest="veryquiet", default=False,
 			  help="suppress all messages except errors")
 	parser.add_option("--verbose", action="store_true", dest="verbose", default=False,
@@ -73,7 +73,7 @@ class Writer:
 	def __init__(self, write, options):
 		self.write = write
 		self.options = options
-		
+
 	def error(self, msg):
 		self.write(msg)
 
@@ -94,7 +94,7 @@ def _mk_writer(options):
 	def write(s):
 		print(s)
 	return Writer(write, options)
-	
+
 
 def _get_filename(path):
 	"""Construct a usable filename for outputs"""
@@ -112,7 +112,7 @@ def main(argv=None):
 	try:
 		if argv is None:
 			argv = sys.argv[1:]
-	
+
 		parser = _mk_options_parser()
 		options, args = parser.parse_args(argv)
 
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
index 2890091488..748ddf9f27 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
@@ -26,7 +26,7 @@ writer = main._mk_writer(options)
 
 
 class TestBCParser(unittest.TestCase):
-    
+
 	def setUp(self):
 		self.name = "My first unittest"
 		self.rootdir = bootchart_dir
@@ -43,7 +43,7 @@ class TestBCParser(unittest.TestCase):
 	def test_parseTimedBlocks(self):
 		trace = parsing.Trace(writer, args, options)
 		state = parsing.parse_file(writer, trace, self.mk_fname('proc_diskstats.log'))
-		self.assertEqual(141, len(state.disk_stats))		
+		self.assertEqual(141, len(state.disk_stats))
 
 	def testParseProcPsLog(self):
 		trace = parsing.Trace(writer, args, options)
@@ -78,17 +78,17 @@ class TestBCParser(unittest.TestCase):
 		for index, line in enumerate(diskstats_data):
 			tokens = line.split('\t')
 			sample = samples[index]
-			if debug:		
+			if debug:
 				print(line.rstrip())
 				print(sample)
 				print('-------------------')
-			
+
 			self.assertEqual(tokens[0], str(sample.time))
 			self.assert_(floatEq(float(tokens[1]), sample.read))
 			self.assert_(floatEq(float(tokens[2]), sample.write))
 			self.assert_(floatEq(float(tokens[3]), sample.util))
 		diskstats_data.close()
-	
+
 	def testparseProcStatLog(self):
 		trace = parsing.Trace(writer, args, options)
 		samples = parsing.parse_file(writer, trace, self.mk_fname('proc_stat.log')).cpu_stats
@@ -111,4 +111,3 @@ class TestBCParser(unittest.TestCase):
 
 if __name__ == '__main__':
     unittest.main()
-
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index b4a46a8d51..12f8f52d2b 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -257,4 +257,3 @@ for e in executables_list:
     if old_size != os.path.getsize(e):
         print("New file size for %s is different. Looks like a relocation error!", e)
         sys.exit(-1)
-
-- 
2.32.0

