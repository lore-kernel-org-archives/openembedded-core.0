Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.7570.1624859964378094813
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 22:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VYPX9CMv;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id c5so13219540pfv.8
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 22:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V8NzKemUp9XounWWcFAxKNXhNnBCnmLd3grWIdoykaw=;
        b=VYPX9CMvHymHyIDvrMBjgX+f5ADu9bkOqJ9703IVmeS4YPiGWI71YYrZSa2lKq2ZJF
         aS8YrCEkEcTfD6E98EkDjnO264jsY+3kejRFehDJgF8XuwLz7zGEuH2sCEqn1HPzwsHY
         cCTP9WibFOn2S/twAypj/OrixGl5M+VLkI3bcGcWzbxSN9co4jVj1ZRW5wdVVB4HD1nT
         YKICGuwD33QUe/tlD4I250GtYxqREMitaz9YSLZs7Z1VC1SJtlbACx1wbCKTxgIyzUmM
         0w6USaOG8M5xwTzuEHS/RXjN3usF4fOLJTKqodY0wG7KKQGgVPLom0o4s0Zc3Xm2JeuJ
         K65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V8NzKemUp9XounWWcFAxKNXhNnBCnmLd3grWIdoykaw=;
        b=kaO2VeK9TkoIL6Z7VeEERTMdyIQk/McTYOWaVvz9UErGvtSMjMv6n25ne3eTNXpLCZ
         tOOnw+V+6DNUXUwCrmBuGZjczdn2OHaNx2DQAkdAsTBCWWUxqyJ/pIqTY9f2s9juLiRq
         tdBuLLFHhWSv8QUy4Dya+yhQuPs9JMJDIM8DcrA8XLPnUJIHf41Ct5oyr4ttG9Vweyjb
         KTO6xcIva7EiVzz8a2Y+tDf3SweIA8b/q8O/3mTaKX5jOa6b3dItGuGOy1o8Aeddpgyo
         BjfbHNXeQkutqtJAl5cbsQK4N+wU2SJlv7gH9URWmEjrVnK0bwX0Nxx2WfjC+h+I9CJe
         z1oQ==
X-Gm-Message-State: AOAM5318FI2tfUX2eXVVo6ObJBbOwzTd9Wr2/T+pkzKU7UD8u9LZk9Co
	jJbWJSkh6d3RwoavJ6XUpf5OtTxaIHj2zw==
X-Google-Smtp-Source: ABdhPJxRDihKTCv5ufbaTanH7IQn8WiSaJUsHACOgLyDo8wiBbGFN2gGSuErUtV160qhmmCPZZtsWQ==
X-Received: by 2002:a62:2fc1:0:b029:305:fd1e:e3f4 with SMTP id v184-20020a622fc10000b0290305fd1ee3f4mr20424170pfv.17.1624859962688;
        Sun, 27 Jun 2021 22:59:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b522])
        by smtp.gmail.com with ESMTPSA id c18sm12768912pgf.66.2021.06.27.22.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 22:59:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/8] PEP8 double aggressive E22, E224, E241, E242 and E27
Date: Sun, 27 Jun 2021 22:59:12 -0700
Message-Id: <20210628055915.1107-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628055915.1107-1-raj.khem@gmail.com>
References: <20210628055915.1107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lib/oeqa/runtime/cases/dnf_runtime.py     |   8 +-
 meta-selftest/lib/oeqa/runtime/cases/virgl.py |   6 +-
 meta/lib/bblayers/create.py                   |   2 +-
 meta/lib/buildstats.py                        |   2 +-
 meta/lib/oe/buildhistory_analysis.py          |  18 +-
 meta/lib/oe/classextend.py                    |   4 +-
 meta/lib/oe/copy_buildsystem.py               |   2 +-
 meta/lib/oe/cve_check.py                      |   6 +-
 meta/lib/oe/distro_check.py                   |   4 +-
 meta/lib/oe/elf.py                            | 180 +++++++++---------
 meta/lib/oe/gpg_sign.py                       |   2 +-
 meta/lib/oe/license.py                        |   2 +-
 meta/lib/oe/package_manager/__init__.py       |   4 +-
 meta/lib/oe/package_manager/deb/__init__.py   |   2 +-
 meta/lib/oe/package_manager/ipk/__init__.py   |   2 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |  18 +-
 meta/lib/oe/patch.py                          |   2 +-
 meta/lib/oe/path.py                           |   2 +-
 meta/lib/oe/qa.py                             |  22 +--
 meta/lib/oe/recipeutils.py                    |  10 +-
 meta/lib/oe/sdk.py                            |   8 +-
 meta/lib/oe/terminal.py                       |   2 +-
 meta/lib/oe/utils.py                          |   6 +-
 meta/lib/oeqa/core/context.py                 |   4 +-
 meta/lib/oeqa/core/runner.py                  |   2 +-
 meta/lib/oeqa/core/target/ssh.py              |   2 +-
 meta/lib/oeqa/core/tests/test_decorators.py   |   6 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |   2 +-
 meta/lib/oeqa/oetest.py                       |   2 +-
 meta/lib/oeqa/runexported.py                  |   2 +-
 meta/lib/oeqa/runtime/cases/df.py             |   2 +-
 meta/lib/oeqa/runtime/cases/dnf.py            |  18 +-
 meta/lib/oeqa/runtime/cases/ksample.py        |   2 +-
 meta/lib/oeqa/runtime/cases/ltp.py            |  10 +-
 meta/lib/oeqa/runtime/cases/ltp_compliance.py |  10 +-
 meta/lib/oeqa/runtime/cases/ltp_stress.py     |   8 +-
 meta/lib/oeqa/runtime/cases/oe_syslog.py      |   8 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |  10 +-
 meta/lib/oeqa/runtime/cases/rpm.py            |   2 +-
 meta/lib/oeqa/runtime/cases/runlevel.py       |   2 +-
 meta/lib/oeqa/runtime/cases/scp.py            |   2 +-
 meta/lib/oeqa/runtime/cases/skeletoninit.py   |   2 +-
 meta/lib/oeqa/runtime/cases/storage.py        |   6 +-
 meta/lib/oeqa/runtime/cases/suspend.py        |   4 +-
 meta/lib/oeqa/runtime/cases/systemd.py        |   8 +-
 meta/lib/oeqa/runtime/cases/usb_hid.py        |   4 +-
 meta/lib/oeqa/runtime/cases/weston.py         |   4 +-
 meta/lib/oeqa/runtime/cases/xorg.py           |   2 +-
 meta/lib/oeqa/sdk/context.py                  |   2 +-
 meta/lib/oeqa/sdkext/cases/devtool.py         |   2 +-
 meta/lib/oeqa/sdkext/testsdk.py               |   2 +-
 meta/lib/oeqa/selftest/case.py                |   2 +-
 meta/lib/oeqa/selftest/cases/archiver.py      |   4 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |   2 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py  |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   4 +-
 meta/lib/oeqa/selftest/cases/eSDK.py          |   4 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |  10 +-
 meta/lib/oeqa/selftest/cases/gotoolchain.py   |   2 +-
 meta/lib/oeqa/selftest/cases/image_typedep.py |   2 +-
 meta/lib/oeqa/selftest/cases/manifest.py      |   6 +-
 .../oeqa/selftest/cases/oelib/buildhistory.py |   2 +-
 meta/lib/oeqa/selftest/cases/oelib/path.py    |  38 ++--
 meta/lib/oeqa/selftest/cases/oescripts.py     |   2 +-
 meta/lib/oeqa/selftest/cases/pkgdata.py       |  56 +++---
 meta/lib/oeqa/selftest/cases/runqemu.py       |   6 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   4 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  18 +-
 meta/lib/oeqa/selftest/cases/sysroot.py       |   2 +-
 meta/lib/oeqa/selftest/cases/wic.py           |   4 +-
 meta/lib/oeqa/selftest/context.py             |   2 +-
 meta/lib/oeqa/targetcontrol.py                |   6 +-
 meta/lib/oeqa/utils/decorators.py             |  16 +-
 meta/lib/oeqa/utils/gitarchive.py             |   2 +-
 meta/lib/oeqa/utils/qemurunner.py             |  10 +-
 meta/lib/oeqa/utils/qemutinyrunner.py         |   6 +-
 meta/lib/oeqa/utils/testexport.py             |   6 +-
 .../glibc/glibc/check-test-wrapper            |   2 +-
 .../python3/check_build_completeness.py       |   4 +-
 .../python/python3/create_manifest3.py        |   6 +-
 .../python/python3/get_module_deps3.py        |  14 +-
 .../perf/perf/sort-pmuevents.py               |   2 +-
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |  50 ++---
 scripts/buildhistory-diff                     |   2 +-
 scripts/buildstats-diff                       |   4 +-
 scripts/combo-layer                           |  28 +--
 scripts/contrib/image-manifest                |   2 +-
 scripts/contrib/patchreview.py                |   2 +-
 scripts/contrib/verify-homepage.py            |   2 +-
 scripts/crosstap                              |   4 +-
 scripts/lib/build_perf/report.py              |   2 +-
 scripts/lib/buildstats.py                     |   4 +-
 scripts/lib/devtool/deploy.py                 |   2 +-
 scripts/lib/devtool/standard.py               |  14 +-
 scripts/lib/devtool/upgrade.py                |   6 +-
 scripts/lib/recipetool/create.py              |   2 +-
 scripts/lib/recipetool/create_buildsys.py     |   2 +-
 .../lib/recipetool/create_buildsys_python.py  |   2 +-
 scripts/lib/recipetool/create_npm.py          |   2 +-
 scripts/lib/resulttool/manualexecution.py     |   2 +-
 scripts/lib/resulttool/report.py              |   2 +-
 scripts/lib/resulttool/store.py               |   4 +-
 scripts/lib/wic/engine.py                     |   6 +-
 scripts/lib/wic/filemap.py                    |   2 +-
 scripts/lib/wic/ksparser.py                   |   2 +-
 scripts/lib/wic/misc.py                       |   2 +-
 scripts/lib/wic/plugins/imager/direct.py      |   2 +-
 scripts/oe-depends-dot                        |   8 +-
 scripts/oe-pkgdata-browser                    |   2 +-
 scripts/oepydevshell-internal.py              |   2 +-
 scripts/pybootchartgui/pybootchartgui/draw.py |  86 ++++-----
 scripts/pybootchartgui/pybootchartgui/gui.py  |  14 +-
 .../pybootchartgui/pybootchartgui/main.py.in  |   2 +-
 .../pybootchartgui/pybootchartgui/parsing.py  |  20 +-
 .../pybootchartgui/process_tree.py            |   6 +-
 .../pybootchartgui/pybootchartgui/samples.py  |   2 +-
 .../pybootchartgui/tests/parser_test.py       |   2 +-
 scripts/pythondeps                            |   4 +-
 scripts/relocate_sdk.py                       |   6 +-
 scripts/runqemu                               |  24 +--
 scripts/send-error-report                     |  12 +-
 scripts/sysroot-relativelinks.py              |   4 +-
 scripts/task-time                             |  14 +-
 scripts/tiny/ksize.py                         |  10 +-
 scripts/verify-bashisms                       |   2 +-
 scripts/wic                                   |  30 +--
 scripts/yocto-check-layer                     |   2 +-
 127 files changed, 547 insertions(+), 547 deletions(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 837a15730a..fcd6ae313c 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -41,10 +41,10 @@ class DnfSelftest(DnfTest):
         import re
         # Use '-y' for non-interactive mode: automatically import the feed signing key
         output_makecache = self.dnf('-vy makecache')
-        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg="dnf makecache failed to synchronize repo: %s" %(output_makecache))
-        self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg="dnf makecache failed: %s" %(output_makecache))
+        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg="dnf makecache failed to synchronize repo: %s" % (output_makecache))
+        self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg="dnf makecache failed: %s" % (output_makecache))
 
         output_repoinfo = self.dnf('-v repoinfo')
         matchobj = re.match(r".*Repo-pkgs\s*:\s*(?P<n_pkgs>[0-9]+)", output_repoinfo, re.DOTALL)
-        self.assertTrue(matchobj is not None, msg="Could not find the amount of packages in dnf repoinfo output: %s" %(output_repoinfo))
-        self.assertTrue(int(matchobj.group('n_pkgs')) > 0, msg="Amount of remote packages is not more than zero: %s\n" %(output_repoinfo))
+        self.assertTrue(matchobj is not None, msg="Could not find the amount of packages in dnf repoinfo output: %s" % (output_repoinfo))
+        self.assertTrue(int(matchobj.group('n_pkgs')) > 0, msg="Amount of remote packages is not more than zero: %s\n" % (output_repoinfo))
diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
index 144decdd6b..e3b6fe1d80 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/virgl.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -9,10 +9,10 @@ class VirglTest(OERuntimeTestCase):
     def test_kernel_driver(self):
         status, output = self.target.run('dmesg|grep virgl')
         self.assertEqual(status, 0, "Checking for virgl driver in dmesg returned non-zero: %d\n%s" % (status, output))
-        self.assertIn("features: +virgl", output, "virgl acceleration seems to be disabled:\n%s" %(output))
+        self.assertIn("features: +virgl", output, "virgl acceleration seems to be disabled:\n%s" % (output))
 
     @OETestDepends(['virgl.VirglTest.test_kernel_driver'])
     def test_kmscube(self):
         status, output = self.target.run('kmscube')
-        self.assertEqual(status, 0, "kmscube exited with non-zero status %d and output:\n%s" %(status, output))
-        self.assertIn('renderer: "virgl"', output, "kmscube does not seem to use virgl:\n%s" %(output))
+        self.assertEqual(status, 0, "kmscube exited with non-zero status %d and output:\n%s" % (status, output))
+        self.assertIn('renderer: "virgl"', output, "kmscube does not seem to use virgl:\n%s" % (output))
diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index 7ddb777dc7..06e1f6d342 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -38,7 +38,7 @@ class CreatePlugin(LayerPlugin):
         layerid = args.layerid if args.layerid is not None else layername
 
         # Create the README from templates/README
-        readme_template =  read_template('README').format(layername=layername)
+        readme_template = read_template('README').format(layername=layername)
         readme = os.path.join(layerdir, 'README')
         with open(readme, 'w') as fd:
             fd.write(readme_template)
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 051daf7a5d..27bff9dda6 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -121,7 +121,7 @@ class SystemStats:
             iowait = float(times[4] - self.stat_ltimes[4])
 
             aSum = max(user + system + idle + iowait, 1)
-            reduced = (time, (user/aSum, system/aSum, iowait/aSum))
+            reduced = (time, (user / aSum, system / aSum, iowait / aSum))
 
         self.stat_ltimes = times
         return reduced
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 5a50eef711..a54c09ca56 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -37,8 +37,8 @@ img_monitor_files = ['installed-package-names.txt', 'files-in-image.txt']
 
 colours = {
     'colour_default': '',
-    'colour_add':     '',
-    'colour_remove':  '',
+    'colour_add': '',
+    'colour_remove': '',
 }
 
 def init_colours(use_colours):
@@ -46,14 +46,14 @@ def init_colours(use_colours):
     if use_colours:
         colours = {
             'colour_default': '\033[0m',
-            'colour_add':     '\033[1;32m',
-            'colour_remove':  '\033[1;31m',
+            'colour_add': '\033[1;32m',
+            'colour_remove': '\033[1;31m',
         }
     else:
         colours = {
             'colour_default': '',
-            'colour_add':     '',
-            'colour_remove':  '',
+            'colour_add': '',
+            'colour_remove': '',
         }
 
 class ChangeRecord:
@@ -358,8 +358,8 @@ def compare_file_lists(alines, blines, compare_ownership=True):
                 if commondir[i] != commondir2[i]:
                     idx = i
                     break
-            commondir = "/".join(commondir[:i+1])
-            commondir2 = "/".join(commondir2[:i+1])
+            commondir = "/".join(commondir[:i + 1])
+            commondir2 = "/".join(commondir2[:i + 1])
             # If the common parent is in one dict and not the other its likely a rename
             # so iterate through those files and process as such
             if commondir2 not in bdict and commondir not in adict:
@@ -593,7 +593,7 @@ def compare_siglists(a_blob, b_blob, taskdiff=False):
             elif len(tasks) == 2:
                 desc = '%s and %s' % (tasks[0], tasks[1])
             else:
-                desc = '%s and %d others' % (tasks[-1], len(tasks)-1)
+                desc = '%s and %d others' % (tasks[-1], len(tasks) - 1)
             out.append('%s: %s' % (desc, line))
     else:
         for key in keys:
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 20366f78be..d5f252c63e 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -48,7 +48,7 @@ class ClassExtender(object):
         newvar = []
         for v in var:
             newvar.append(self.extend_name(v))
-        newdata =  " ".join(newvar)
+        newdata = " ".join(newvar)
         if setvar:
             self.d.setVar(varname, newdata)
         return newdata
@@ -66,7 +66,7 @@ class ClassExtender(object):
                 newvar.append("^" + self.extname + "-" + v[1:])
             else:
                 newvar.append(self.extend_name(v))
-        newdata =  " ".join(newvar)
+        newdata = " ".join(newvar)
         if setvar:
             self.d.setVar(varname, newdata)
         return newdata
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 4998afa60f..5bd087060c 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -76,7 +76,7 @@ class BuildSystem(object):
                 workspace_newname = '%s-%d' % (workspace_name, extranum)
 
         corebase_files = self.d.getVar('COREBASE_FILES').split()
-        corebase_files = [corebase + '/' +x for x in corebase_files]
+        corebase_files = [corebase + '/' + x for x in corebase_files]
         # Make sure bitbake goes in
         bitbake_dir = bb.__file__.rsplit('/', 3)[0]
         corebase_files.append(bitbake_dir)
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index a1d7c292af..6db988d5d0 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -15,11 +15,11 @@ class Version():
         suffixes = ["alphabetical", "patch"]
 
         if str(suffix) == "alphabetical":
-            version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<patch>[-_\.]?(?P<patch_l>[a-z]))?(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
+            version_pattern = r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<patch>[-_\.]?(?P<patch_l>[a-z]))?(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
         elif str(suffix) == "patch":
-            version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<patch>[-_\.]?(p|patch)(?P<patch_l>[0-9]+))?(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
+            version_pattern = r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<patch>[-_\.]?(p|patch)(?P<patch_l>[0-9]+))?(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
         else:
-            version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
+            version_pattern = r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
         regex = re.compile(r"^\s*" + version_pattern + r"\s*$", re.VERBOSE | re.IGNORECASE)
 
         match = regex.search(version)
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 508dcdb7d4..0a9f4d162c 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -22,8 +22,8 @@ def get_links_from_url(url, d):
 
 def find_latest_numeric_release(url, d):
     "Find the latest listed numeric release on the given url"
-    max=0
-    maxstr=""
+    max = 0
+    maxstr = ""
     for link in get_links_from_url(url, d):
         try:
             # TODO use LooseVersion
diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index 6549e8f09b..acc4185544 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -6,119 +6,119 @@ def machine_dict(d):
 #           TARGET_OS  TARGET_ARCH   MACHINE, OSABI, ABIVERSION, Little Endian, 32bit?
     machdata = {
             "darwin9": { 
-                        "arm":       (40,     0,    0,          True,          32),
+                        "arm": (40, 0, 0, True, 32),
                       },
             "eabi": {
-                        "arm":       (40,     0,    0,          True,          32),
+                        "arm": (40, 0, 0, True, 32),
                       },
             "elf": {
-                        "aarch64":   (183,    0,    0,          True,          64),
-                        "aarch64_be":(183,    0,    0,          False,         64),
-                        "i586":      (3,      0,    0,          True,          32),
-                        "i686":      (3,      0,    0,          True,          32),
-                        "x86_64":     (62,     0,    0,          True,          64),
-                        "epiphany":   (4643,   0,    0,          True,          32),
-                        "lm32":       (138,    0,    0,          False,         32),
-                        "mips":       (8,     0,    0,          False,         32),
-                        "mipsel":     (8,     0,    0,          True,          32),
-                        "microblaze":  (189,   0,    0,          False,         32),
-                        "microblazeel":(189,   0,    0,          True,          32),
-                        "powerpc":    (20,     0,    0,          False,         32),
-                        "riscv32":    (243,    0,    0,          True,          32),
-                        "riscv64":    (243,    0,    0,          True,          64),
+                        "aarch64": (183, 0, 0, True, 64),
+                        "aarch64_be":(183, 0, 0, False, 64),
+                        "i586": (3, 0, 0, True, 32),
+                        "i686": (3, 0, 0, True, 32),
+                        "x86_64": (62, 0, 0, True, 64),
+                        "epiphany": (4643, 0, 0, True, 32),
+                        "lm32": (138, 0, 0, False, 32),
+                        "mips": (8, 0, 0, False, 32),
+                        "mipsel": (8, 0, 0, True, 32),
+                        "microblaze": (189, 0, 0, False, 32),
+                        "microblazeel":(189, 0, 0, True, 32),
+                        "powerpc": (20, 0, 0, False, 32),
+                        "riscv32": (243, 0, 0, True, 32),
+                        "riscv64": (243, 0, 0, True, 64),
                       },
             "linux": { 
-                        "aarch64":   (183,    0,    0,          True,          64),
-                        "aarch64_be":(183,    0,    0,          False,         64),
-                        "arm":       (40,    97,    0,          True,          32),
-                        "armeb":      (40,    97,    0,          False,         32),
-                        "powerpc":    (20,     0,    0,          False,         32),
-                        "powerpc64":  (21,     0,    0,          False,         64),
-                        "powerpc64le":  (21,     0,    0,          True,         64),
-                        "i386":       (3,     0,    0,          True,          32),
-                        "i486":       (3,     0,    0,          True,          32),
-                        "i586":       (3,     0,    0,          True,          32),
-                        "i686":       (3,     0,    0,          True,          32),
-                        "x86_64":     (62,     0,    0,          True,          64),
-                        "ia64":       (50,     0,    0,          True,          64),
-                        "alpha":      (36902,  0,    0,          True,          64),
-                        "hppa":       (15,     3,    0,          False,         32),
-                        "m68k":       (4,     0,    0,          False,         32),
-                        "mips":       (8,     0,    0,          False,         32),
-                        "mipsel":     (8,     0,    0,          True,          32),
-                        "mips64":     (8,     0,    0,          False,         64),
-                        "mips64el":   (8,     0,    0,          True,          64),
-                        "mipsisa32r6":   (8,  0,    0,          False,         32),
-                        "mipsisa32r6el": (8,  0,    0,          True,          32),
-                        "mipsisa64r6":   (8,  0,    0,          False,         64),
-                        "mipsisa64r6el": (8,  0,    0,          True,          64),
-                        "nios2":      (113,    0,    0,          True,          32),
-                        "riscv32":    (243,    0,    0,          True,          32),
-                        "riscv64":    (243,    0,    0,          True,          64),
-                        "s390":       (22,     0,    0,          False,         32),
-                        "sh4":        (42,     0,    0,          True,          32),
-                        "sparc":      (2,     0,    0,          False,         32),
-                        "microblaze":  (189,   0,    0,          False,         32),
-                        "microblazeel":(189,   0,    0,          True,          32),
+                        "aarch64": (183, 0, 0, True, 64),
+                        "aarch64_be":(183, 0, 0, False, 64),
+                        "arm": (40, 97, 0, True, 32),
+                        "armeb": (40, 97, 0, False, 32),
+                        "powerpc": (20, 0, 0, False, 32),
+                        "powerpc64": (21, 0, 0, False, 64),
+                        "powerpc64le": (21, 0, 0, True, 64),
+                        "i386": (3, 0, 0, True, 32),
+                        "i486": (3, 0, 0, True, 32),
+                        "i586": (3, 0, 0, True, 32),
+                        "i686": (3, 0, 0, True, 32),
+                        "x86_64": (62, 0, 0, True, 64),
+                        "ia64": (50, 0, 0, True, 64),
+                        "alpha": (36902, 0, 0, True, 64),
+                        "hppa": (15, 3, 0, False, 32),
+                        "m68k": (4, 0, 0, False, 32),
+                        "mips": (8, 0, 0, False, 32),
+                        "mipsel": (8, 0, 0, True, 32),
+                        "mips64": (8, 0, 0, False, 64),
+                        "mips64el": (8, 0, 0, True, 64),
+                        "mipsisa32r6": (8, 0, 0, False, 32),
+                        "mipsisa32r6el": (8, 0, 0, True, 32),
+                        "mipsisa64r6": (8, 0, 0, False, 64),
+                        "mipsisa64r6el": (8, 0, 0, True, 64),
+                        "nios2": (113, 0, 0, True, 32),
+                        "riscv32": (243, 0, 0, True, 32),
+                        "riscv64": (243, 0, 0, True, 64),
+                        "s390": (22, 0, 0, False, 32),
+                        "sh4": (42, 0, 0, True, 32),
+                        "sparc": (2, 0, 0, False, 32),
+                        "microblaze": (189, 0, 0, False, 32),
+                        "microblazeel":(189, 0, 0, True, 32),
                       },
             "linux-musl": { 
-                        "aarch64":   (183,    0,    0,            True,          64),
-                        "aarch64_be":(183,    0,    0,            False,         64),
-                        "arm":       (40,    97,    0,          True,          32),
-                        "armeb":      (40,    97,    0,          False,         32),
-                        "powerpc":    (20,     0,    0,          False,         32),
-                        "powerpc64":  (21,     0,    0,          False,         64),
-                        "powerpc64le":  (21,     0,    0,          True,         64),
-                        "i386":       (3,     0,    0,          True,          32),
-                        "i486":       (3,     0,    0,          True,          32),
-                        "i586":       (3,     0,    0,          True,          32),
-                        "i686":       (3,     0,    0,          True,          32),
-                        "x86_64":     (62,     0,    0,          True,          64),
-                        "mips":       (8,     0,    0,          False,         32),
-                        "mipsel":     (8,     0,    0,          True,          32),
-                        "mips64":     (8,     0,    0,          False,         64),
-                        "mips64el":   (8,     0,    0,          True,          64),
-                        "microblaze":  (189,     0,    0,          False,         32),
-                        "microblazeel":(189,     0,    0,          True,          32),
-                        "riscv32":    (243,      0,    0,          True,          32),
-                        "riscv64":    (243,      0,    0,          True,          64),
-                        "sh4":        (42,     0,    0,          True,          32),
+                        "aarch64": (183, 0, 0, True, 64),
+                        "aarch64_be":(183, 0, 0, False, 64),
+                        "arm": (40, 97, 0, True, 32),
+                        "armeb": (40, 97, 0, False, 32),
+                        "powerpc": (20, 0, 0, False, 32),
+                        "powerpc64": (21, 0, 0, False, 64),
+                        "powerpc64le": (21, 0, 0, True, 64),
+                        "i386": (3, 0, 0, True, 32),
+                        "i486": (3, 0, 0, True, 32),
+                        "i586": (3, 0, 0, True, 32),
+                        "i686": (3, 0, 0, True, 32),
+                        "x86_64": (62, 0, 0, True, 64),
+                        "mips": (8, 0, 0, False, 32),
+                        "mipsel": (8, 0, 0, True, 32),
+                        "mips64": (8, 0, 0, False, 64),
+                        "mips64el": (8, 0, 0, True, 64),
+                        "microblaze": (189, 0, 0, False, 32),
+                        "microblazeel":(189, 0, 0, True, 32),
+                        "riscv32": (243, 0, 0, True, 32),
+                        "riscv64": (243, 0, 0, True, 64),
+                        "sh4": (42, 0, 0, True, 32),
                       },
             "uclinux-uclibc": {
-                        "bfin":       (106,     0,    0,          True,         32),
+                        "bfin": (106, 0, 0, True, 32),
                       }, 
             "linux-gnueabi": {
-                        "arm":       (40,     0,    0,          True,          32),
-                        "armeb":     (40,     0,    0,          False,         32),
+                        "arm": (40, 0, 0, True, 32),
+                        "armeb": (40, 0, 0, False, 32),
                       },
             "linux-musleabi": {
-                        "arm":       (40,     0,    0,          True,          32),
-                        "armeb":     (40,     0,    0,          False,         32),
+                        "arm": (40, 0, 0, True, 32),
+                        "armeb": (40, 0, 0, False, 32),
                       },
             "linux-gnuspe": {
-                        "powerpc":    (20,     0,    0,          False,         32),
+                        "powerpc": (20, 0, 0, False, 32),
                       },
             "linux-muslspe": {
-                        "powerpc":    (20,     0,    0,          False,         32),
+                        "powerpc": (20, 0, 0, False, 32),
                       },
-            "linux-gnu":       {
-                        "powerpc":    (20,     0,    0,          False,         32),
-                        "sh4":        (42,     0,    0,          True,          32),
+            "linux-gnu": {
+                        "powerpc": (20, 0, 0, False, 32),
+                        "sh4": (42, 0, 0, True, 32),
                       },
-            "linux-gnu_ilp32":     {
-                        "aarch64":   (183,    0,    0,          True,          32),
+            "linux-gnu_ilp32": {
+                        "aarch64": (183, 0, 0, True, 32),
                       },
-            "linux-gnux32":       {
-                        "x86_64":     (62,     0,    0,          True,          32),
+            "linux-gnux32": {
+                        "x86_64": (62, 0, 0, True, 32),
                       },
-            "linux-muslx32":       {
-                        "x86_64":     (62,     0,    0,          True,          32),
+            "linux-muslx32": {
+                        "x86_64": (62, 0, 0, True, 32),
                       },
-            "linux-gnun32":       {
-                        "mips64":       (8,     0,    0,          False,         32),
-                        "mips64el":     (8,     0,    0,          True,          32),
-                        "mipsisa64r6":  (8,     0,    0,          False,         32),
-                        "mipsisa64r6el":(8,     0,    0,          True,          32),
+            "linux-gnun32": {
+                        "mips64": (8, 0, 0, False, 32),
+                        "mips64el": (8, 0, 0, True, 32),
+                        "mipsisa64r6": (8, 0, 0, False, 32),
+                        "mipsisa64r6el":(8, 0, 0, True, 32),
                       },
         }
 
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index d9045ecd94..7686596ac8 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -56,7 +56,7 @@ class LocalSigner(object):
 
         # Sign in chunks
         for i in range(0, len(files), sign_chunk):
-            subprocess.check_output(shlex.split(cmd + ' '.join(files[i:i+sign_chunk])), stderr=subprocess.STDOUT)
+            subprocess.check_output(shlex.split(cmd + ' '.join(files[i:i + sign_chunk])), stderr=subprocess.STDOUT)
 
     def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True):
         """Create a detached signature of a file"""
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 665d32ecbb..7aefeaaae0 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -45,7 +45,7 @@ class LicenseVisitor(ast.NodeVisitor):
         elements = list([x for x in license_operator.split(licensestr) if x.strip()])
         for pos, element in enumerate(elements):
             if license_pattern.match(element):
-                if pos > 0 and license_pattern.match(elements[pos-1]):
+                if pos > 0 and license_pattern.match(elements[pos - 1]):
                     new_elements.append('&')
                 element = '"' + element + '"'
             elif not license_operator.match(element):
diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 1a039edda4..5fac51aea7 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -42,7 +42,7 @@ def opkg_query(cmd_output):
     dep = []
     prov = []
     pkgarch = ""
-    for line in cmd_output.splitlines()+['']:
+    for line in cmd_output.splitlines() + ['']:
         line = line.rstrip()
         if ':' in line:
             if line.startswith("Package: "):
@@ -92,7 +92,7 @@ def failed_postinsts_abort(pkgs, log_path):
     bb.fatal("""Postinstall scriptlets of %s have failed. If the intention is to defer them to first boot,
 then please place them into pkg_postinst_ontarget_${PN} ().
 Deferring to first boot via 'exit 1' is no longer supported.
-Details of the failure are in %s.""" %(pkgs, log_path))
+Details of the failure are in %s.""" % (pkgs, log_path))
 
 def generate_locale_archive(d, rootfs, target_arch, localedir):
     # Pretty sure we don't need this for locale archive generation but
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index f877e6ea9a..457e936862 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -495,7 +495,7 @@ class DpkgPM(OpkgDpkgPM):
         pkg_info = self.package_info(pkg)
         if not pkg_info:
             bb.fatal("Unable to get information for package '%s' while "
-                     "trying to extract the package."  % pkg)
+                     "trying to extract the package." % pkg)
 
         tmp_dir = super(DpkgPM, self).extract(pkg, pkg_info)
         bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 8e2086a6f3..965d542e08 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -495,7 +495,7 @@ class OpkgPM(OpkgDpkgPM):
         pkg_info = self.package_info(pkg)
         if not pkg_info:
             bb.fatal("Unable to get information for package '%s' while "
-                     "trying to extract the package."  % pkg)
+                     "trying to extract the package." % pkg)
 
         tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
         bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 9acb2b2ea3..f7cf436f61 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -32,7 +32,7 @@ class RpmIndexer(Indexer):
 
 class RpmSubdirIndexer(RpmIndexer):
     def write_index(self):
-        bb.note("Generating package index for %s" %(self.deploy_dir))
+        bb.note("Generating package index for %s" % (self.deploy_dir))
         # Remove the existing repodata to ensure that we re-generate it no matter what
         bb.utils.remove(os.path.join(self.deploy_dir, "repodata"), recurse=True)
 
@@ -42,7 +42,7 @@ class RpmSubdirIndexer(RpmIndexer):
                 for dir in entry[1]:
                     if dir != 'repodata':
                         dir_path = oe.path.join(self.deploy_dir, dir)
-                        bb.note("Generating package index for %s" %(dir_path))
+                        bb.note("Generating package index for %s" % (dir_path))
                         self.do_write_index(dir_path)
 
 
@@ -94,7 +94,7 @@ class RpmPM(PackageManager):
             archs = archs + ["bogusarch"]
         # This architecture needs to be upfront so that packages using it are properly prioritized
         archs = ["sdk_provides_dummy_target"] + archs
-        confdir = "%s/%s" %(self.target_rootfs, "etc/dnf/vars/")
+        confdir = "%s/%s" % (self.target_rootfs, "etc/dnf/vars/")
         bb.utils.mkdirhier(confdir)
         open(confdir + "arch", 'w').write(":".join(archs))
         distro_codename = self.d.getVar('DISTRO_CODENAME')
@@ -107,8 +107,8 @@ class RpmPM(PackageManager):
         # We need to configure rpm to use our primary package architecture as the installation architecture,
         # and to make it compatible with other package architectures that we use.
         # Otherwise it will refuse to proceed with packages installation.
-        platformconfdir = "%s/%s" %(self.target_rootfs, "etc/rpm/")
-        rpmrcconfdir = "%s/%s" %(self.target_rootfs, "etc/")
+        platformconfdir = "%s/%s" % (self.target_rootfs, "etc/rpm/")
+        rpmrcconfdir = "%s/%s" % (self.target_rootfs, "etc/")
         bb.utils.mkdirhier(platformconfdir)
         open(platformconfdir + "platform", 'w').write("%s-pc-linux" % self.primary_arch)
         with open(rpmrcconfdir + "rpmrc", 'w') as f:
@@ -162,7 +162,7 @@ class RpmPM(PackageManager):
             if feed_archs is not None:
                 for arch in feed_archs.split():
                     repo_uri = uri + "/" + arch
-                    repo_id   = "oe-remote-repo"  + "-".join(urlparse(repo_uri).path.split("/"))
+                    repo_id = "oe-remote-repo" + "-".join(urlparse(repo_uri).path.split("/"))
                     repo_name = "OE Remote Repo:" + " ".join(urlparse(repo_uri).path.split("/"))
                     open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'a').write(
                              "[%s]\nname=%s\nbaseurl=%s\n%s\n" % (repo_id, repo_name, repo_uri, gpg_opts))
@@ -218,7 +218,7 @@ class RpmPM(PackageManager):
             self._invoke_dnf(["remove"] + pkgs)
         else:
             cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-            args = ["-e", "-v", "--nodeps", "--root=%s" %self.target_rootfs]
+            args = ["-e", "-v", "--nodeps", "--root=%s" % self.target_rootfs]
 
             try:
                 bb.note("Running %s" % ' '.join([cmd] + args + pkgs))
@@ -306,7 +306,7 @@ class RpmPM(PackageManager):
         dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
         standard_dnf_args = ["-v", "--rpmverbosity=info", "-y",
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
-                             "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
+                             "--setopt=reposdir=%s" % (oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
                              "--installroot=%s" % (self.target_rootfs),
                              "--setopt=logdir=%s" % (self.d.getVar('T'))
                             ]
@@ -378,7 +378,7 @@ class RpmPM(PackageManager):
         output = self._invoke_dnf(["repoquery", "--queryformat", "%{location}", pkg])
         pkg_name = output.splitlines()[-1]
         if not pkg_name.endswith(".rpm"):
-            bb.fatal("dnf could not find package %s in repository: %s" %(pkg, output))
+            bb.fatal("dnf could not find package %s in repository: %s" % (pkg, output))
         pkg_path = oe.path.join(self.rpm_repo_dir, pkg_name)
 
         cpio_cmd = bb.utils.which(os.getenv("PATH"), "cpio")
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index a191a613bd..e0f767bf65 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -323,7 +323,7 @@ class GitApplyTree(PatchTree):
     def decodeAuthor(line):
         from email.header import decode_header
         authorval = line.split(':', 1)[1].strip().replace('"', '')
-        result =  decode_header(authorval)[0][0]
+        result = decode_header(authorval)[0][0]
         if hasattr(result, 'decode'):
             result = result.decode('utf-8')
         return result
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index c92a4f98cd..101ee2d029 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -314,7 +314,7 @@ def which_wild(pathname, path=None, mode=os.F_OK, *, reverse=False, candidates=F
                 if rel not in seen:
                     seen.add(rel)
                     if candidates:
-                        files.append((found_path, [os.path.join(p, rel) for p in paths[:index+1]]))
+                        files.append((found_path, [os.path.join(p, rel) for p in paths[:index + 1]]))
                     else:
                         files.append(found_path)
 
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 38c2e0cc1c..c6aaa0af06 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -12,26 +12,26 @@ class NotELFFileError(Exception):
 class ELFFile:
     EI_NIDENT = 16
 
-    EI_CLASS      = 4
-    EI_DATA       = 5
-    EI_VERSION    = 6
-    EI_OSABI      = 7
+    EI_CLASS = 4
+    EI_DATA = 5
+    EI_VERSION = 6
+    EI_OSABI = 7
     EI_ABIVERSION = 8
 
-    E_MACHINE    = 0x12
+    E_MACHINE = 0x12
 
     # possible values for EI_CLASS
     ELFCLASSNONE = 0
-    ELFCLASS32   = 1
-    ELFCLASS64   = 2
+    ELFCLASS32 = 1
+    ELFCLASS64 = 2
 
     # possible value for EI_VERSION
-    EV_CURRENT   = 1
+    EV_CURRENT = 1
 
     # possible values for EI_DATA
-    EI_DATA_NONE  = 0
-    EI_DATA_LSB  = 1
-    EI_DATA_MSB  = 2
+    EI_DATA_NONE = 0
+    EI_DATA_LSB = 1
+    EI_DATA_MSB = 2
 
     PT_INTERP = 3
 
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 407d168894..646cbdfa13 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -133,8 +133,8 @@ def split_var_value(value, assignment=True):
                 assigfound = True
             if assigfound:
                 if '"' in item or "'" in item:
-                    outlist = [' '.join(out[:idx+1])]
-                    outlist.extend(out[idx+1:])
+                    outlist = [' '.join(out[:idx + 1])]
+                    outlist.extend(out[idx + 1:])
                     break
     return outlist
 
@@ -224,7 +224,7 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
             # (that we'd want to ensure remain leading the next value)
             for i, ln in reversed(list(enumerate(lines))):
                 if not ln.startswith('#'):
-                    lines[i+1:i+1] = addlines
+                    lines[i + 1:i + 1] = addlines
                     break
             else:
                 lines.extend(addlines)
@@ -1003,7 +1003,7 @@ def get_recipe_upstream_version(rd):
 
     # XXX: we suppose that the first entry points to the upstream sources
     src_uri = src_uris.split()[0]
-    uri_type, _, _, _, _, _ =  decodeurl(src_uri)
+    uri_type, _, _, _, _, _ = decodeurl(src_uri)
 
     (pv, pfx, sfx) = get_recipe_pv_without_srcpv(rd.getVar('PV'), uri_type)
     ru['current_version'] = pv
@@ -1023,7 +1023,7 @@ def get_recipe_upstream_version(rd):
 
     elif uri_type == "file":
         # files are always up-to-date
-        ru['version'] =  pv
+        ru['version'] = pv
         ru['type'] = 'A'
         ru['datetime'] = datetime.now()
     else:
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 5e854b7c62..190010691b 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -64,17 +64,17 @@ class Sdk(object, metaclass=ABCMeta):
             # something goes wrong
             if (bb.utils.movefile(sourcefile, destdir) == None):
                 raise OSError("moving %s to %s failed"
-                        %(sourcefile, destdir))
+                        % (sourcefile, destdir))
         #FIXME: using umbrella exc catching because bb.utils method raises it
         except Exception as e:
-            bb.debug(1, "printing the stack trace\n %s" %traceback.format_exc())
+            bb.debug(1, "printing the stack trace\n %s" % traceback.format_exc())
             bb.error("unable to place %s in final SDK location" % sourcefile)
 
     def mkdirhier(self, dirpath):
         try:
             bb.utils.mkdirhier(dirpath)
         except OSError as e:
-            bb.debug(1, "printing the stack trace\n %s" %traceback.format_exc())
+            bb.debug(1, "printing the stack trace\n %s" % traceback.format_exc())
             bb.fatal("cannot make dir for SDK: %s" % dirpath)
 
     def remove(self, path, recurse=False):
@@ -82,7 +82,7 @@ class Sdk(object, metaclass=ABCMeta):
             bb.utils.remove(path, recurse)
         #FIXME: using umbrella exc catching because bb.utils method raises it
         except Exception as e:
-            bb.debug(1, "printing the stack trace\n %s" %traceback.format_exc())
+            bb.debug(1, "printing the stack trace\n %s" % traceback.format_exc())
             bb.warn("cannot remove SDK dir: %s" % path)
 
     def install_locales(self, pm):
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 04585afd42..2d6a4ac792 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -284,7 +284,7 @@ def check_tmux_pane_size(tmux):
         else:
             raise
 
-    return size/2 >= 19
+    return size / 2 >= 19
 
 def check_terminal_version(terminalName):
     import subprocess as sub
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 123ad07fe4..ea78b2b0e0 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -117,8 +117,8 @@ def features_backfill(var,d):
     # Distributions wanting to elide a value in DISTRO_FEATURES_BACKFILL should
     # add the feature to DISTRO_FEATURES_BACKFILL_CONSIDERED
     features = (d.getVar(var) or "").split()
-    backfill = (d.getVar(var+"_BACKFILL") or "").split()
-    considered = (d.getVar(var+"_BACKFILL_CONSIDERED") or "").split()
+    backfill = (d.getVar(var + "_BACKFILL") or "").split()
+    considered = (d.getVar(var + "_BACKFILL_CONSIDERED") or "").split()
 
     addfeatures = []
     for feature in backfill:
@@ -526,7 +526,7 @@ class ImageQAFailed(Exception):
     def __init__(self, description, name=None, logfile=None):
         self.description = description
         self.name = name
-        self.logfile=logfile
+        self.logfile = logfile
 
     def __str__(self):
         msg = 'Function failed: %s' % self.name
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index cb460f7496..5e647d11c8 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -58,7 +58,7 @@ class OETestContext(object):
             if test.__class__ not in class_ids:
                 class_ids[test.__class__] = '.'.join(test.id().split('.')[:-1])
             for skip in skips:
-                if (test.id()+'.').startswith(skip+'.'):
+                if (test.id() + '.').startswith(skip + '.'):
                     setattr(test, 'setUp', skipfuncgen('Skip by the command line argument "%s"' % skip))
         for tclass in class_ids:
             cid = class_ids[tclass]
@@ -170,7 +170,7 @@ class OETestContextExecutor(object):
         self.tc_kwargs['init'] = {}
         self.tc_kwargs['load'] = {}
         self.tc_kwargs['list'] = {}
-        self.tc_kwargs['run']  = {}
+        self.tc_kwargs['run'] = {}
 
         self.tc_kwargs['init']['logger'] = self._setup_logger(logger, args)
         if args.test_data_file:
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 72078eb8bd..d2e7ab5462 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -284,7 +284,7 @@ class OETestRunner(_TestRunner):
                 curr['module'] = case.__module__
                 logger.info(curr['module'])
 
-            if not 'class' in curr  or curr['class'] != \
+            if not 'class' in curr or curr['class'] != \
                     case.__class__.__name__:
                 curr['class'] = case.__class__.__name__
                 logger.info(" -- %s" % curr['class'])
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 9493e186b3..67bbe639d9 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -91,7 +91,7 @@ class OESSHTarget(OETarget):
 
         if timeout:
             processTimeout = timeout
-        elif timeout==0:
+        elif timeout == 0:
             processTimeout = None
         else:
             processTimeout = self.timeout
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index 39e5e2164f..5853aa0027 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -71,7 +71,7 @@ class TestDependsDecorator(TestBase):
     modules = ['depends']
 
     def test_depends_order(self):
-        tests =  ['depends.DependsTest.testDependsFirst',
+        tests = ['depends.DependsTest.testDependsFirst',
                   'depends.DependsTest.testDependsSecond',
                   'depends.DependsTest.testDependsThird',
                   'depends.DependsTest.testDependsFourth',
@@ -88,7 +88,7 @@ class TestDependsDecorator(TestBase):
     def test_depends_fail_missing_dependency(self):
         expect = "TestCase depends.DependsTest.testDependsSecond depends on "\
                  "depends.DependsTest.testDependsFirst and isn't available"
-        tests =  ['depends.DependsTest.testDependsSecond']
+        tests = ['depends.DependsTest.testDependsSecond']
         try:
             # Must throw OEQADependency because missing 'testDependsFirst'
             tc = self._testLoader(modules=self.modules, tests=tests)
@@ -100,7 +100,7 @@ class TestDependsDecorator(TestBase):
 
     def test_depends_fail_circular_dependency(self):
         expect = 'have a circular dependency'
-        tests =  ['depends.DependsTest.testDependsCircular1',
+        tests = ['depends.DependsTest.testDependsCircular1',
                   'depends.DependsTest.testDependsCircular2',
                   'depends.DependsTest.testDependsCircular3']
         try:
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index e82acbd368..98067c0e8c 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -71,7 +71,7 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
                     self.totalinprocess,
                     totalprogress,
                     self.totaltests,
-                    "{0:.2f}".format(time.time()-self._test_start.timestamp()),
+                    "{0:.2f}".format(time.time() - self._test_start.timestamp()),
                     test.id())
         finally:
             self.semaphore.release()
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index e1c74958bd..bd602637dc 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -118,7 +118,7 @@ class oeRuntimeTest(oeTest):
         # for QemuTarget only
         if (type(self.target).__name__ == "QemuTarget" and
                 (self.id() in res.getErrorList() or
-                self.id() in  res.getFailList())):
+                self.id() in res.getFailList())):
             self.tc.host_dumper.create_dir(self._testMethodName)
             self.tc.host_dumper.dump_host()
             self.target.target_dumper.dump_target(
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 1e994bc655..d11171bf45 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -52,7 +52,7 @@ class FakeTarget(object):
         if os.path.lexists(sshloglink):
             os.remove(sshloglink)
         os.symlink(self.sshlog, sshloglink)
-        print("SSH log file: %s" %  self.sshlog)
+        print("SSH log file: %s" % self.sshlog)
         self.connection = SSHControl(self.ip, logfile=self.sshlog)
 
     def run(self, cmd, timeout=None):
diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index bb155c9cf9..26752fb4bc 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -16,4 +16,4 @@ class DfTest(OERuntimeTestCase):
         cmd = "df -P / | sed -n '2p' | awk '{print $4}'"
         (status,output) = self.target.run(cmd)
         msg = 'Not enough space on image. Current size is %s' % output
-        self.assertTrue(int(output)>5120, msg=msg)
+        self.assertTrue(int(output) > 5120, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 51f46cc4ba..777dbe6bf1 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -63,8 +63,8 @@ class DnfRepoTest(DnfTest):
 
     def dnf_with_repo(self, command):
         pkgarchs = os.listdir(os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo'))
-        deploy_url = 'http://%s:%s/' %(self.target.server_ip, self.repo_server.port)
-        cmdlinerepoopts = ["--repofrompath=oe-testimage-repo-%s,%s%s" %(arch, deploy_url, arch) for arch in pkgarchs]
+        deploy_url = 'http://%s:%s/' % (self.target.server_ip, self.repo_server.port)
+        cmdlinerepoopts = ["--repofrompath=oe-testimage-repo-%s,%s%s" % (arch, deploy_url, arch) for arch in pkgarchs]
 
         output = self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck " + command)
         return output
@@ -108,7 +108,7 @@ class DnfRepoTest(DnfTest):
         output = subprocess.check_output('%s %s -name run-postinsts-dev*' % (bb.utils.which(os.getenv('PATH'), "find"),
                                                                            os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo')), shell=True).decode("utf-8")
         rpm_path = output.split("/")[-2] + "/" + output.split("/")[-1]
-        url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, rpm_path)
+        url = 'http://%s:%s/%s' % (self.target.server_ip, self.repo_server.port, rpm_path)
         self.dnf_with_repo('remove -y run-postinsts-dev')
         self.dnf_with_repo('install -y %s' % url)
 
@@ -152,8 +152,8 @@ class DnfRepoTest(DnfTest):
         #installroot directory.
         self.target.run('mkdir -p %s/etc' % rootpath, 1500)
         self.target.run('mkdir -p %s/usr/bin %s/usr/sbin' % (rootpath, rootpath), 1500)
-        self.target.run('ln -sf -r %s/usr/bin %s/bin'  % (rootpath, rootpath), 1500)
-        self.target.run('ln -sf -r %s/usr/sbin %s/sbin'  % (rootpath, rootpath), 1500)
+        self.target.run('ln -sf -r %s/usr/bin %s/bin' % (rootpath, rootpath), 1500)
+        self.target.run('ln -sf -r %s/usr/sbin %s/sbin' % (rootpath, rootpath), 1500)
         self.target.run('mkdir -p %s/dev' % rootpath, 1500)
         #Handle different architectures lib dirs
         self.target.run('mkdir -p %s/usr/lib' % rootpath, 1500)
@@ -183,9 +183,9 @@ class DnfRepoTest(DnfTest):
         #Avoid remove dependencies to skip some errors on different archs and images
         self.dnf_with_repo('remove --setopt=clean_requirements_on_remove=0 -y curl*')
         #check curl-dev is not installed adter removing all curl occurrences
-        status, output = self.target.run('dnf list --installed | grep %s'% excludepkg, 1500)
-        self.assertEqual(1, status, "%s was not removed,  is listed as installed"%excludepkg)
+        status, output = self.target.run('dnf list --installed | grep %s' % excludepkg, 1500)
+        self.assertEqual(1, status, "%s was not removed,  is listed as installed" % excludepkg)
         self.dnf_with_repo('install -y --exclude=%s --exclude=curl-staticdev curl*' % excludepkg)
         #check curl-dev is not installed after being excluded
-        status, output = self.target.run('dnf list --installed | grep %s'% excludepkg, 1500)
-        self.assertEqual(1, status, "%s was not excluded, is listed as installed"%excludepkg)
+        status, output = self.target.run('dnf list --installed | grep %s' % excludepkg, 1500)
+        self.assertEqual(1, status, "%s was not excluded, is listed as installed" % excludepkg)
diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index a9a1620ebd..1ad6ba8fc8 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -60,7 +60,7 @@ class KSample(OERuntimeTestCase):
         # check result
         self.cmd_and_check("dmesg | grep \"test passed\" ", "test passed")
         # rmmod
-        self.cmd_and_check("rmmod %s" %  module_prename)
+        self.cmd_and_check("rmmod %s" % module_prename)
 
     def kprobe_func(self, name=''):
         # check config
diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index a1d59c39d2..16fde55ccf 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -45,7 +45,7 @@ class LtpTestBase(OERuntimeTestCase):
  
     @classmethod
     def ltp_finishup(cls):
-        cls.extras['ltpresult.sections'] =  cls.sections
+        cls.extras['ltpresult.sections'] = cls.sections
 
         # update symlink to ltp_log
         if os.path.exists(cls.ltptest_log_dir_link):
@@ -76,7 +76,7 @@ class LtpTest(LtpTestBase):
             self.extras['ltpresult.rawlogs']['log'] = self.extras['ltpresult.rawlogs']['log'] + output
 
             # copy nice log from DUT
-            dst = os.path.join(self.ltptest_log_dir, "%s" %  ltp_group)
+            dst = os.path.join(self.ltptest_log_dir, "%s" % ltp_group)
             remote_src = "/opt/ltp/results/%s" % ltp_group 
             (status, output) = self.target.copyFrom(remote_src, dst, True)
             msg = 'File could not be copied. Output: %s' % output
@@ -84,11 +84,11 @@ class LtpTest(LtpTestBase):
                 self.target.logger.warning(msg)
 
             parser = LtpParser()
-            results, sections  = parser.parse(dst)
+            results, sections = parser.parse(dst)
 
-            runtime = int(endtime-starttime)
+            runtime = int(endtime - starttime)
             sections['duration'] = runtime
-            self.sections[ltp_group] =  sections
+            self.sections[ltp_group] = sections
 
             failed_tests = {}
             for test in results:
diff --git a/meta/lib/oeqa/runtime/cases/ltp_compliance.py b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
index ba47c78fd4..c56c3e6fcf 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_compliance.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
@@ -45,7 +45,7 @@ class LtpPosixBase(OERuntimeTestCase):
  
     @classmethod
     def ltp_finishup(cls):
-        cls.extras['ltpposixresult.sections'] =  cls.sections
+        cls.extras['ltpposixresult.sections'] = cls.sections
 
         # update symlink to ltp_log
         if os.path.exists(cls.ltptest_log_dir_link):
@@ -57,7 +57,7 @@ class LtpPosixBase(OERuntimeTestCase):
             cls.fail(cls.failmsg)
 
 class LtpPosixTest(LtpPosixBase):
-    posix_groups = ["AIO", "MEM", "MSG", "SEM", "SIG",  "THR", "TMR", "TPS"]
+    posix_groups = ["AIO", "MEM", "MSG", "SEM", "SIG", "THR", "TMR", "TPS"]
 
     def runltp(self, posix_group):
             cmd = "/opt/ltp/bin/run-posix-option-group-test.sh %s 2>@1 | tee /opt/ltp/results/%s" % (posix_group, posix_group)
@@ -71,11 +71,11 @@ class LtpPosixTest(LtpPosixBase):
             self.extras['ltpposixresult.rawlogs']['log'] = self.extras['ltpposixresult.rawlogs']['log'] + output
 
             parser = LtpComplianceParser()
-            results, sections  = parser.parse(os.path.join(self.ltptest_log_dir, "%s" % posix_group))
+            results, sections = parser.parse(os.path.join(self.ltptest_log_dir, "%s" % posix_group))
 
-            runtime = int(endtime-starttime)
+            runtime = int(endtime - starttime)
             sections['duration'] = runtime
-            self.sections[posix_group] =  sections
+            self.sections[posix_group] = sections
  
             failed_tests = {}
             for test in results:
diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runtime/cases/ltp_stress.py
index 2445ffbc93..d97595e94e 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -46,7 +46,7 @@ class LtpStressBase(OERuntimeTestCase):
  
     @classmethod
     def ltp_finishup(cls):
-        cls.extras['ltpstressresult.sections'] =  cls.sections
+        cls.extras['ltpstressresult.sections'] = cls.sections
 
         # update symlink to ltp_log
         if os.path.exists(cls.ltptest_log_dir_link):
@@ -70,11 +70,11 @@ class LtpStressTest(LtpStressBase):
             self.extras['ltpstressresult.rawlogs']['log'] = self.extras['ltpstressresult.rawlogs']['log'] + output
 
             parser = LtpParser()
-            results, sections  = parser.parse(os.path.join(self.ltptest_log_dir, "%s" % stress_group))
+            results, sections = parser.parse(os.path.join(self.ltptest_log_dir, "%s" % stress_group))
 
-            runtime = int(endtime-starttime)
+            runtime = int(endtime - starttime)
             sections['duration'] = runtime
-            self.sections[stress_group] =  sections
+            self.sections[stress_group] = sections
  
             failed_tests = {}
             for test in results:
diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index f3c2bedbaf..dbb49b6895 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -24,17 +24,17 @@ class SyslogTestConfig(OERuntimeTestCase):
 
     def verif_not_running(self, pids):
         for pid in pids:
-            status, err_output = self.target.run('kill -0 %s' %pid)
+            status, err_output = self.target.run('kill -0 %s' % pid)
             if not status:
-                self.logger.debug("previous %s is still running" %pid)
+                self.logger.debug("previous %s is still running" % pid)
                 return 1
 
     def verify_running(self, names):
         pids = []
         for name in names:
-            status, pid = self.target.run('pidof %s' %name)
+            status, pid = self.target.run('pidof %s' % name)
             if status:
-                self.logger.debug("%s is not running" %name)
+                self.logger.debug("%s is not running" % name)
                 return 1, pids
             pids.append(pid)
         return 0, pids
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 3638ed529f..345901d00d 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -249,7 +249,7 @@ class ParseLogsTest(OERuntimeTestCase):
         hwi += '*******************************\n'
         hwi += 'Machine name: ' + self.getMachine() + '\n'
         hwi += 'CPU: ' + str(cpu_name) + '\n'
-        hwi += 'Arch: ' + str(cpu_arch)+ '\n'
+        hwi += 'Arch: ' + str(cpu_arch) + '\n'
         hwi += 'Physical cores: ' + str(cpu_physical_cores) + '\n'
         hwi += 'Logical cores: ' + str(cpu_logical_cores) + '\n'
         hwi += '*******************************\n'
@@ -353,7 +353,7 @@ class ParseLogsTest(OERuntimeTestCase):
                         grep_output = check_output(cmd).decode('utf-8')
                     except:
                         pass
-                    results[log][xrez]=grep_output
+                    results[log][xrez] = grep_output
 
         return results
 
@@ -375,8 +375,8 @@ class ParseLogsTest(OERuntimeTestCase):
             for error in result[log]:
                 errcount += 1
                 self.msg += 'Central error: ' + str(error) + '\n'
-                self.msg +=  '***********************\n'
-                self.msg +=  result[str(log)][str(error)] + '\n'
-                self.msg +=  '***********************\n'
+                self.msg += '***********************\n'
+                self.msg += result[str(log)][str(error)] + '\n'
+                self.msg += '***********************\n'
         self.msg += '%s errors found in logs.' % errcount
         self.assertEqual(errcount, 0, msg=self.msg)
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 7a9d62c003..cfaa729f30 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -121,7 +121,7 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
 
         # Make sure that some database files are under /var/lib/rpm as '__db.xxx'
         status, output = self.target.run(db_files_cmd)
-        msg =  'Failed to find database files under /var/lib/rpm/ as __db.xxx'
+        msg = 'Failed to find database files under /var/lib/rpm/ as __db.xxx'
         self.assertEqual(0, status, msg=msg)
 
         self.tc.target.copyTo(self.test_file, self.dst)
diff --git a/meta/lib/oeqa/runtime/cases/runlevel.py b/meta/lib/oeqa/runtime/cases/runlevel.py
index 3a4df8ace1..aa31adf0b7 100644
--- a/meta/lib/oeqa/runtime/cases/runlevel.py
+++ b/meta/lib/oeqa/runtime/cases/runlevel.py
@@ -8,7 +8,7 @@ class RunLevel_Test(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_runlevel_3(self):
         (status, output) = self.target.run("init 3 && sleep 5 && runlevel")
-        runlevel= '5 3'
+        runlevel = '5 3'
         self.assertEqual(output, runlevel, msg='Failed to set current runlevel to runlevel 3, current runlevel : %s' % output[-1])
         (status, output) = self.target.run("uname -a")
         self.assertEqual(status, 0, msg='Failed to run uname command, output: %s' % output)
diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index aca9bd673a..fdf058d948 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -15,7 +15,7 @@ class ScpTest(OERuntimeTestCase):
     def setUpClass(cls):
         cls.tmp_fd, cls.tmp_path = mkstemp()
         with os.fdopen(cls.tmp_fd, 'w') as f:
-            f.seek(2 ** 22 -1)
+            f.seek(2 ** 22 - 1)
             f.write(os.linesep)
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/skeletoninit.py b/meta/lib/oeqa/runtime/cases/skeletoninit.py
index 4779cd6bb4..5f3b6b353a 100644
--- a/meta/lib/oeqa/runtime/cases/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/cases/skeletoninit.py
@@ -21,7 +21,7 @@ class SkeletonBasicTest(OERuntimeTestCase):
         msg = 'skeleton init script not found. Output:\n%s' % output
         self.assertEqual(status, 0, msg=msg)
 
-        status, output =  self.target.run('ls /usr/sbin/skeleton-test')
+        status, output = self.target.run('ls /usr/sbin/skeleton-test')
         msg = 'skeleton-test not found. Output:\n%s' % output
         self.assertEqual(status, 0, msg=msg)
 
diff --git a/meta/lib/oeqa/runtime/cases/storage.py b/meta/lib/oeqa/runtime/cases/storage.py
index 1d037ef2e0..f6f9130d20 100644
--- a/meta/lib/oeqa/runtime/cases/storage.py
+++ b/meta/lib/oeqa/runtime/cases/storage.py
@@ -52,14 +52,14 @@ class StorageBase(OERuntimeTestCase):
 
         match = re.search('%s' % cls.test_msg, output)
         msg = ('Test message %s not in file %s.' % (cls.test_msg, cls.test_file))
-        cls.assertEqual(status, 0,  msg=msg)
+        cls.assertEqual(status, 0, msg=msg)
 
     def storage_write(cls):
         # create test message in file on device
         (status, output) = cls.target.run('echo "%s" >  %s/%s' % 
                 (cls.test_msg, cls.test_dir, cls.test_file))
         msg = ('File %s not create test message on %s' % (cls.test_file, cls.device))
-        cls.assertEqual(status, 0,  msg=msg)
+        cls.assertEqual(status, 0, msg=msg)
 
     def storage_umount(cls, tmo=1):
         time.sleep(tmo)
@@ -70,7 +70,7 @@ class StorageBase(OERuntimeTestCase):
             return
         else:
             msg = ('Device not unmount %s' % cls.mount_point)
-            cls.assertEqual(status, 0,  msg=msg)
+            cls.assertEqual(status, 0, msg=msg)
 
         (status, output) = cls.target.run('cat /proc/mounts')
         match = re.search('%s' % cls.device, output)
diff --git a/meta/lib/oeqa/runtime/cases/suspend.py b/meta/lib/oeqa/runtime/cases/suspend.py
index 9aa1cf6f5d..708e6ac7e5 100644
--- a/meta/lib/oeqa/runtime/cases/suspend.py
+++ b/meta/lib/oeqa/runtime/cases/suspend.py
@@ -8,7 +8,7 @@ class Suspend_Test(OERuntimeTestCase):
 
     def test_date(self): 
         (status, output) = self.target.run('date')
-        self.assertEqual(status, 0,  msg='Failed to run date command, output : %s' % output)
+        self.assertEqual(status, 0, msg='Failed to run date command, output : %s' % output)
         
     def test_ping(self):
         t_thread = threading.Thread(target=self.target.run, args=("ping 8.8.8.8",))
@@ -21,7 +21,7 @@ class Suspend_Test(OERuntimeTestCase):
         
     def set_suspend(self): 
         (status, output) = self.target.run('sudo rtcwake -m mem -s 10')
-        self.assertEqual(status, 0,  msg='Failed to suspends your system to RAM, output : %s' % output)
+        self.assertEqual(status, 0, msg='Failed to suspends your system to RAM, output : %s' % output)
     
     @skipIfQemu('qemuall', 'Test only runs on real hardware')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 7c44abe8ed..668fc2a70e 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -39,11 +39,11 @@ class SystemdTest(OERuntimeTestCase):
         returned no entries
         """
 
-        query_units=''
+        query_units = ''
         if l_match_units:
-            query_units = ['_SYSTEMD_UNIT='+unit for unit in l_match_units]
+            query_units = ['_SYSTEMD_UNIT=' + unit for unit in l_match_units]
             query_units = ' '.join(query_units)
-        command = 'journalctl %s %s' %(args, query_units)
+        command = 'journalctl %s %s' % (args, query_units)
         status, output = self.target.run(command)
         if status:
             raise AssertionError("Command '%s' returned non-zero exit "
@@ -152,7 +152,7 @@ class SystemdJournalTests(SystemdTest):
         """
 
         # The expression chain that uniquely identifies the time boot message.
-        expr_items=['Startup finished', 'kernel', 'userspace','\.$']
+        expr_items = ['Startup finished', 'kernel', 'userspace','\.$']
         try:
             output = self.journalctl(args='-o cat --reverse')
         except AssertionError:
diff --git a/meta/lib/oeqa/runtime/cases/usb_hid.py b/meta/lib/oeqa/runtime/cases/usb_hid.py
index dbc8eada74..a42c856f6a 100644
--- a/meta/lib/oeqa/runtime/cases/usb_hid.py
+++ b/meta/lib/oeqa/runtime/cases/usb_hid.py
@@ -7,11 +7,11 @@ class USB_HID_Test(OERuntimeTestCase):
 
     def keyboard_mouse_simulation(self): 
         (status, output) = self.target.run('export DISPLAY=:0 && xdotool key F2 && xdotool mousemove 100 100')
-        return self.assertEqual(status, 0,  msg='Failed to simulate keyboard/mouse input event, output : %s' % output)
+        return self.assertEqual(status, 0, msg='Failed to simulate keyboard/mouse input event, output : %s' % output)
              
     def set_suspend(self): 
         (status, output) = self.target.run('sudo rtcwake -m mem -s 10')
-        return self.assertEqual(status, 0,  msg='Failed to suspends your system to RAM, output : %s' % output)
+        return self.assertEqual(status, 0, msg='Failed to suspends your system to RAM, output : %s' % output)
     
     @OEHasPackage(['xdotool'])
     @skipIfQemu('qemuall', 'Test only runs on real hardware')
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index b3a7c2776d..3456803adb 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -19,7 +19,7 @@ class WestonTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['weston'])
     def test_weston_running(self):
-        cmd ='%s | grep [w]eston-desktop-shell' % self.tc.target_cmds['ps']
+        cmd = '%s | grep [w]eston-desktop-shell' % self.tc.target_cmds['ps']
         status, output = self.target.run(cmd)
         msg = ('Weston does not appear to be running %s' %
               self.target.run(self.tc.target_cmds['ps'])[1])
@@ -42,7 +42,7 @@ class WestonTest(OERuntimeTestCase):
     def get_new_wayland_processes(self, existing_wl_processes):
         try_cnt = 0
         while try_cnt < 5:
-            time.sleep(5 + 5*try_cnt)
+            time.sleep(5 + 5 * try_cnt)
             try_cnt += 1
             wl_processes = self.get_processes_of('weston-desktop-shell', 'existing and new')
             new_wl_processes = [x for x in wl_processes if x not in existing_wl_processes]
diff --git a/meta/lib/oeqa/runtime/cases/xorg.py b/meta/lib/oeqa/runtime/cases/xorg.py
index d6845587c2..0bbef023d9 100644
--- a/meta/lib/oeqa/runtime/cases/xorg.py
+++ b/meta/lib/oeqa/runtime/cases/xorg.py
@@ -14,7 +14,7 @@ class XorgTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['xserver-nodm-init'])
     def test_xorg_running(self):
-        cmd ='%s | grep -v xinit | grep [X]org' % self.tc.target_cmds['ps']
+        cmd = '%s | grep -v xinit | grep [X]org' % self.tc.target_cmds['ps']
         status, output = self.target.run(cmd)
         msg = ('Xorg does not appear to be running %s' %
               self.target.run(self.tc.target_cmds['ps'])[1])
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index b1a705c776..b3cd7d0a5b 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -44,7 +44,7 @@ class OESDKTestContext(OETestContext):
             # match multilib according to sdk_env
             mls = self.td.get('MULTILIB_VARIANTS', '').split()
             for ml in mls:
-                if ('ml'+ml) in self.sdk_env:
+                if ('ml' + ml) in self.sdk_env:
                     pkg = ml + '-' + pkg
         return self._hasPackage(self.target_pkg_manifest, pkg, regex=regex)
 
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index 8c07d5e3b3..4567795027 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -93,7 +93,7 @@ class DevtoolTest(OESDKExtTestCase):
         try:
             self._run('devtool build %s ' % package_nodejs)
         finally:
-            self._run('devtool reset %s '% package_nodejs)
+            self._run('devtool reset %s ' % package_nodejs)
 
 class SdkUpdateTest(OESDKExtTestCase):
     @classmethod
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index ae4f55970c..963531dfc6 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -100,7 +100,7 @@ class TestSDKExt(TestSDKBase):
                 fail = True
 
             # Clean the workspace/sources to avoid `devtool add' failure because of non-empty source directory
-            bb.utils.remove(sdk_dir+'workspace/sources', True)
+            bb.utils.remove(sdk_dir + 'workspace/sources', True)
 
         if fail:
             bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 4ff187ff8c..3d30618b97 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -134,7 +134,7 @@ class OESelftestTestCase(OETestCase):
             failed_extra_commands = []
             for command in self._extra_tear_down_commands:
                 result = runCmd(command, ignore_status=True)
-                if not result.status ==  0:
+                if not result.status == 0:
                     failed_extra_commands.append(command)
             if failed_extra_commands:
                 self.logger.warning("tearDown commands have failed: %s" % ', '.join(map(str, failed_extra_commands)))
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 35b3ddb5fb..dce77281c9 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -135,7 +135,7 @@ class Archiver(OESelftestTestCase):
         target = 'selftest-ed-native'
 
         features = 'INHERIT += "archiver"\n'
-        features +=  'ARCHIVER_MODE[src] = "%s"\n' % (mode)
+        features += 'ARCHIVER_MODE[src] = "%s"\n' % (mode)
         if extra_config:
             features += extra_config
         self.write_config(features)
@@ -212,7 +212,7 @@ class Archiver(OESelftestTestCase):
         `ARCHIVER_MIRROR_EXCLUDE`.
         """
 
-        target='selftest-ed'
+        target = 'selftest-ed'
         target_file_name = 'ed-1.14.1.tar.lz'
 
         features = 'INHERIT += "archiver"\n'
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 524d7b6828..30afc962c9 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -42,7 +42,7 @@ class BitbakeTests(OESelftestTestCase):
         result = bitbake('m4-native')
         find_build_started = re.search(r"NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Executing.*Tasks", result.output)
         find_build_completed = re.search(r"Tasks Summary:.*(\n.*)*NOTE: Test for bb\.event\.BuildCompleted", result.output)
-        self.assertTrue(find_build_started, msg="Match failed in:\n%s"  % result.output)
+        self.assertTrue(find_build_started, msg="Match failed in:\n%s" % result.output)
         self.assertTrue(find_build_completed, msg="Match failed in:\n%s" % result.output)
         self.assertNotIn('Test for bb.event.InvalidEvent', result.output)
 
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 6621287696..dcc95e38ff 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -68,7 +68,7 @@ class DiskMonTest(OESelftestTestCase):
         self.assertEqual(res.status, 1, msg="bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"\nBB_HEARTBEAT_EVENT = "1"')
         res = bitbake("delay -c delay")
-        self.assertTrue('WARNING: The free space' in res.output, msg="A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
+        self.assertTrue('WARNING: The free space' in res.output, msg="A warning should have been displayed for disk monitor is set to WARN: %s" % res.output)
 
 class SanityOptionsTest(OESelftestTestCase):
     def getline(self, res, line):
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 95142aeaa7..6c3b3cbb3e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -88,7 +88,7 @@ class DevtoolBase(OESelftestTestCase):
         bb_vars = get_bb_vars(['TOPDIR', 'SSTATE_DIR'])
         cls.original_sstate = bb_vars['SSTATE_DIR']
         cls.devtool_sstate = os.path.join(bb_vars['TOPDIR'], 'sstate_devtool')
-        cls.sstate_conf  = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
+        cls.sstate_conf = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
         cls.sstate_conf += ('SSTATE_MIRRORS += "file://.* file:///%s/PATH"\n'
                             % cls.original_sstate)
 
@@ -667,7 +667,7 @@ class DevtoolModifyTests(DevtoolBase):
             self.assertIn('ERROR: ', result.output, 'devtool extract on %s should have given an ERROR' % testrecipe)
             # devtool modify should fail
             result = runCmd('devtool modify %s -x %s' % (testrecipe, os.path.join(tempdir, testrecipe)), ignore_status=True)
-            self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed. devtool output: %s' %  (testrecipe, result.output))
+            self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed. devtool output: %s' % (testrecipe, result.output))
             self.assertIn('ERROR: ', result.output, 'devtool modify on %s should have given an ERROR' % testrecipe)
 
     def test_devtool_modify_native(self):
diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index 862849af35..1d185935e4 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -62,7 +62,7 @@ class oeSDKExtSelfTest(OESelftestTestCase):
 
         cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
 
-        sstate_config="""
+        sstate_config = """
 SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 SSTATE_MIRRORS =  "file://.* file://%s/PATH"
 CORE_IMAGE_EXTRA_INSTALL = "perl"
@@ -90,7 +90,7 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
         cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
 
         # Configure eSDK to use sstate mirror from poky
-        sstate_config="""
+        sstate_config = """
 SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 SSTATE_MIRRORS =  "file://.* file://%s/PATH"
             """ % bb_vars["SSTATE_DIR"]
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 67cae977d9..f485593f1d 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -80,7 +80,7 @@ FIT_DESC = "A model description"
                 if field_index == len(its_field_check):
                     break
                 if its_field_check[field_index] in line:
-                    field_index +=1
+                    field_index += 1
 
         if field_index != len(its_field_check): # if its equal, the test passed
             self.assertTrue(field_index == len(its_field_check),
@@ -307,7 +307,7 @@ FIT_SIGN_INDIVIDUAL = "1"
                 if field_index == len(its_field_check):
                     break
                 if its_field_check[field_index] in line:
-                    field_index +=1
+                    field_index += 1
 
         if field_index != len(its_field_check): # if its equal, the test passed
             self.assertTrue(field_index == len(its_field_check),
@@ -390,7 +390,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
                 if field_index == len(its_field_check):
                     break
                 if its_field_check[field_index] in line:
-                    field_index +=1
+                    field_index += 1
 
         if field_index != len(its_field_check): # if its equal, the test passed
             self.assertTrue(field_index == len(its_field_check),
@@ -776,7 +776,7 @@ FIT_HASH_ALG = "sha256"
             'load = <' + kernel_load + '>;',
             'entry = <' + kernel_entry + '>;',
             'hash-1 {',
-            'algo = "' + fit_hash_alg +'";',
+            'algo = "' + fit_hash_alg + '";',
             '};',
             '};'
         ]
@@ -803,7 +803,7 @@ FIT_HASH_ALG = "sha256"
             line_idx = cfg_start_idx + 2
             node_end = False
             while node_end == False:
-                if its_lines[line_idx] == "};" and its_lines[line_idx-1] == "};":
+                if its_lines[line_idx] == "};" and its_lines[line_idx - 1] == "};":
                     node_end = True
                 line_idx = line_idx + 1
 
diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index 4fc3605f42..388363bfb8 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -61,7 +61,7 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
         url = "https://%s/%s/archive/%s%s" % (proj, name, ver, archive)
 
         runCmd("cd %s; wget %s" % (self.tmpdir_SDKQA, url))
-        runCmd("cd %s; tar -xf %s" % (self.tmpdir_SDKQA, ver+archive))
+        runCmd("cd %s; tar -xf %s" % (self.tmpdir_SDKQA, ver + archive))
         runCmd("mkdir -p %s/src/%s" % (self.go_path, proj))
         runCmd("mv %s/direnv-2.27.0 %s/src/%s/%s"
                % (self.tmpdir_SDKQA, self.go_path, proj, name))
diff --git a/meta/lib/oeqa/selftest/cases/image_typedep.py b/meta/lib/oeqa/selftest/cases/image_typedep.py
index 52e1080f13..269fd556b7 100644
--- a/meta/lib/oeqa/selftest/cases/image_typedep.py
+++ b/meta/lib/oeqa/selftest/cases/image_typedep.py
@@ -44,7 +44,7 @@ inherit image
         bitbake('-g emptytest')
 
         taskdependsfile = os.path.join(self.builddir, 'task-depends.dot')
-        dep =  dep + ".do_populate_sysroot"
+        dep = dep + ".do_populate_sysroot"
         depfound = False
         expectedline = '"emptytest.do_rootfs" -> "{}"'.format(dep)
 
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index b5505fa60e..56c8129a06 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -81,7 +81,7 @@ class VerifyManifest(OESelftestTestCase):
         pkgdata_dir = reverse_dir = {}
         mfilename = mpath = m_entry = {}
         # get manifest location based on target to query about
-        d_target= dict(target=self.buildtarget,
+        d_target = dict(target=self.buildtarget,
                          host='nativesdk-packagegroup-sdk-host')
         try:
             mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
@@ -120,7 +120,7 @@ class VerifyManifest(OESelftestTestCase):
             if m_entry[k].missing:
                 msg = '{}: {} Error has the following missing entries'\
                         .format(self.classname, m_entry[k].file)
-                logmsg = msg+':\n'+'\n'.join(m_entry[k].missing)
+                logmsg = msg + ':\n' + '\n'.join(m_entry[k].missing)
                 self.logger.debug(logmsg)
                 self.logger.info(msg)
                 self.fail(logmsg)
@@ -160,7 +160,7 @@ class VerifyManifest(OESelftestTestCase):
         if m_entry.missing:
             msg = '{}: {} Error has the following missing entries'\
                     .format(self.classname, m_entry.file)
-            logmsg = msg+':\n'+'\n'.join(m_entry.missing)
+            logmsg = msg + ':\n' + '\n'.join(m_entry.missing)
             self.logger.debug(logmsg)
             self.logger.info(msg)
             self.fail(logmsg)
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index e0bfd44f4e..05c3268f3e 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -81,7 +81,7 @@ class TestBlobParsing(OESelftestTestCase):
         Test default values for comparisson of git blob dictionaries
         """
         from oe.buildhistory_analysis import compare_dict_blobs
-        defaultmap = {x: ("default", "1")  for x in ["PKG", "PKGE", "PKGV", "PKGR"]}
+        defaultmap = {x: ("default", "1") for x in ["PKG", "PKGE", "PKGV", "PKGR"]}
 
         self.commit_vars(to_add={"foo": "1"})
         blob1 = self.repo.heads.master.commit.tree.blobs[0]
diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index e5d36513fb..5cfacfbd35 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -14,32 +14,32 @@ class TestRealPath(TestCase):
     DIRS = ["a", "b", "etc", "sbin", "usr", "usr/bin", "usr/binX", "usr/sbin", "usr/include", "usr/include/gdbm"]
     FILES = ["etc/passwd", "b/file"]
     LINKS = [
-        ("bin",             "/usr/bin",             "/usr/bin"),
-        ("binX",            "usr/binX",             "/usr/binX"),
-        ("c",               "broken",               "/broken"),
-        ("etc/passwd-1",    "passwd",               "/etc/passwd"),
-        ("etc/passwd-2",    "passwd-1",             "/etc/passwd"),
-        ("etc/passwd-3",    "/etc/passwd-1",        "/etc/passwd"),
-        ("etc/shadow-1",    "/etc/shadow",          "/etc/shadow"),
-        ("etc/shadow-2",    "/etc/shadow-1",        "/etc/shadow"),
-        ("prog-A",          "bin/prog-A",           "/usr/bin/prog-A"),
-        ("prog-B",          "/bin/prog-B",          "/usr/bin/prog-B"),
-        ("usr/bin/prog-C",  "../../sbin/prog-C",    "/sbin/prog-C"),
-        ("usr/bin/prog-D",  "/sbin/prog-D",         "/sbin/prog-D"),
-        ("usr/binX/prog-E", "../sbin/prog-E",       None),
-        ("usr/bin/prog-F",  "../../../sbin/prog-F", "/sbin/prog-F"),
-        ("loop",            "a/loop",               None),
-        ("a/loop",          "../loop",              None),
-        ("b/test",          "file/foo",             "/b/file/foo"),
+        ("bin", "/usr/bin", "/usr/bin"),
+        ("binX", "usr/binX", "/usr/binX"),
+        ("c", "broken", "/broken"),
+        ("etc/passwd-1", "passwd", "/etc/passwd"),
+        ("etc/passwd-2", "passwd-1", "/etc/passwd"),
+        ("etc/passwd-3", "/etc/passwd-1", "/etc/passwd"),
+        ("etc/shadow-1", "/etc/shadow", "/etc/shadow"),
+        ("etc/shadow-2", "/etc/shadow-1", "/etc/shadow"),
+        ("prog-A", "bin/prog-A", "/usr/bin/prog-A"),
+        ("prog-B", "/bin/prog-B", "/usr/bin/prog-B"),
+        ("usr/bin/prog-C", "../../sbin/prog-C", "/sbin/prog-C"),
+        ("usr/bin/prog-D", "/sbin/prog-D", "/sbin/prog-D"),
+        ("usr/binX/prog-E", "../sbin/prog-E", None),
+        ("usr/bin/prog-F", "../../../sbin/prog-F", "/sbin/prog-F"),
+        ("loop", "a/loop", None),
+        ("a/loop", "../loop", None),
+        ("b/test", "file/foo", "/b/file/foo"),
     ]
 
     LINKS_PHYS = [
-        ("./",          "/",                ""),
+        ("./", "/", ""),
         ("binX/prog-E", "/usr/sbin/prog-E", "/sbin/prog-E"),
     ]
 
     EXCEPTIONS = [
-        ("loop",   errno.ELOOP),
+        ("loop", errno.ELOOP),
         ("b/test", errno.ENOENT),
     ]
 
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 8a10ff357b..59784bbc67 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -130,7 +130,7 @@ class OeRunNativeTest(OESelftestTestCase):
 
 class OEListPackageconfigTests(OEScriptTests):
     #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
-    def check_endlines(self, results,  expected_endlines): 
+    def check_endlines(self, results, expected_endlines): 
         for line in results.output.splitlines():
             for el in expected_endlines:
                 if line.split() == el.split():
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index e837daf8b1..fb8b412848 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -128,15 +128,15 @@ class OePkgdataUtilTests(OESelftestTestCase):
         # Test recipe-space package name
         result = runCmd('oe-pkgdata-util list-pkg-files zlib-dev zlib-doc')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" % result.output)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         # Test runtime package name
         result = runCmd('oe-pkgdata-util list-pkg-files -r libz1 libz-dev')
         files = splitoutput(result.output)
-        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" % result.output)
         self.assertGreater(len(files['libz1']), 1)
         libspec = os.path.join(base_libdir, 'libz.so.1.*')
         found = False
@@ -149,12 +149,12 @@ class OePkgdataUtilTests(OESelftestTestCase):
         # Test recipe
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertNotIn('zlib-locale', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('zlib-staticdev', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('zlib', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertNotIn('zlib-locale', list(files.keys()), "listed pkgs. files: %s" % result.output)
         # (ignore ptest, might not be there depending on config)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
@@ -162,36 +162,36 @@ class OePkgdataUtilTests(OESelftestTestCase):
         # Test recipe, runtime
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r')
         files = splitoutput(result.output)
-        self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertNotIn('libz-locale', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('libz-staticdev', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertNotIn('libz-locale', list(files.keys()), "listed pkgs. files: %s" % result.output)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
         # Test recipe, unpackaged
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -u')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-locale', list(files.keys()), "listed pkgs. files: %s" %result.output) # this is the key one
+        self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('zlib-staticdev', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('zlib', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('zlib-locale', list(files.keys()), "listed pkgs. files: %s" % result.output) # this is the key one
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['zlib-staticdev'])
         # Test recipe, runtime, unpackaged
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r -u')
         files = splitoutput(result.output)
-        self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-locale', list(files.keys()), "listed pkgs. files: %s" %result.output) # this is the key one
+        self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('libz-staticdev', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" % result.output)
+        self.assertIn('libz-locale', list(files.keys()), "listed pkgs. files: %s" % result.output) # this is the key one
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index da22f77b27..b7656296f2 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -21,7 +21,7 @@ class RunqemuTests(OESelftestTestCase):
     def setUpLocal(self):
         super(RunqemuTests, self).setUpLocal()
         self.recipe = 'core-image-minimal'
-        self.machine =  'qemux86-64'
+        self.machine = 'qemux86-64'
         self.fstypes = "ext4 iso hddimg wic.vmdk wic.qcow2 wic.vdi"
         self.cmd_common = "runqemu nographic"
 
@@ -155,8 +155,8 @@ class QemuTest(OESelftestTestCase):
     def setUpClass(cls):
         super(QemuTest, cls).setUpClass()
         cls.recipe = 'core-image-minimal'
-        cls.machine =  get_bb_var('MACHINE')
-        cls.deploy_dir_image =  get_bb_var('DEPLOY_DIR_IMAGE')
+        cls.machine = get_bb_var('MACHINE')
+        cls.deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
         cls.cmd_common = "runqemu nographic"
         cls.qemuboot_conf = "%s-%s.qemuboot.conf" % (cls.recipe, cls.machine)
         cls.qemuboot_conf = os.path.join(cls.deploy_dir_image, cls.qemuboot_conf)
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 54a80dfdc0..332e0de41f 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -216,7 +216,7 @@ class TestImage(OESelftestTestCase):
         try:
             content = os.listdir("/dev/dri")
             if len([i for i in content if i.startswith('render')]) == 0:
-                self.skipTest("No render nodes found in /dev/dri: %s" %(content))
+                self.skipTest("No render nodes found in /dev/dri: %s" % (content))
         except FileNotFoundError:
             self.skipTest("/dev/dri directory does not exist; no render nodes available on this machine.")
         try:
@@ -345,7 +345,7 @@ class Postinst(OESelftestTestCase):
                 self.write_config(features)
                 bb_result = bitbake('core-image-minimal', ignore_status=True)
                 self.assertGreaterEqual(bb_result.output.find("Postinstall scriptlets of ['postinst-rootfs-failing'] have failed."), 0,
-                    "Warning about a failed scriptlet not found in bitbake output: %s" %(bb_result.output))
+                    "Warning about a failed scriptlet not found in bitbake output: %s" % (bb_result.output))
 
                 self.assertTrue(os.path.isfile(os.path.join(hosttestdir, "rootfs-before-failure")),
                                     "rootfs-before-failure file was not created")
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 3159eb3a3c..d428462e9c 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -58,7 +58,7 @@ class SStateTests(SStateBase):
     def run_test_sstate_creation(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True, should_pass=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
 
-        if  self.temp_sstate_location:
+        if self.temp_sstate_location:
             bitbake(['-cclean'] + targets)
         else:
             bitbake(['-ccleansstate'] + targets)
@@ -80,10 +80,10 @@ class SStateTests(SStateBase):
             self.assertTrue(not file_tracker, msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(file_tracker)))
 
     def test_sstate_creation_distro_specific_pass(self):
-        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
+        self.run_test_sstate_creation(['binutils-cross-' + self.tune_arch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
     def test_sstate_creation_distro_specific_fail(self):
-        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
+        self.run_test_sstate_creation(['binutils-cross-' + self.tune_arch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
 
     def test_sstate_creation_distro_nonspecific_pass(self):
         self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
@@ -109,7 +109,7 @@ class SStateTests(SStateBase):
         self.assertTrue(not tgz_removed, msg="do_cleansstate didn't remove .tgz sstate files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_removed)))
 
     def test_cleansstate_task_distro_specific_nonspecific(self):
-        targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
+        targets = ['binutils-cross-' + self.tune_arch, 'binutils-native']
         targets.append('linux-libc-headers')
         self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
 
@@ -117,7 +117,7 @@ class SStateTests(SStateBase):
         self.run_test_cleansstate_task(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
     def test_cleansstate_task_distro_specific(self):
-        targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
+        targets = ['binutils-cross-' + self.tune_arch, 'binutils-native']
         targets.append('linux-libc-headers')
         self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
@@ -211,7 +211,7 @@ class SStateTests(SStateBase):
         target_config = []
         global_config.append('')
         target_config.append('PR = "0"')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
+        self.run_test_sstate_cache_management_script('m4', global_config, target_config, ignore_patterns=['populate_lic'])
 
     def test_sstate_cache_management_script_using_pr_2(self):
         global_config = []
@@ -220,7 +220,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "0"')
         global_config.append('')
         target_config.append('PR = "1"')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
+        self.run_test_sstate_cache_management_script('m4', global_config, target_config, ignore_patterns=['populate_lic'])
 
     def test_sstate_cache_management_script_using_pr_3(self):
         global_config = []
@@ -231,7 +231,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "1"')
         global_config.append('MACHINE = "qemux86"')
         target_config.append('PR = "1"')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
+        self.run_test_sstate_cache_management_script('m4', global_config, target_config, ignore_patterns=['populate_lic'])
 
     def test_sstate_cache_management_script_using_machine(self):
         global_config = []
@@ -240,7 +240,7 @@ class SStateTests(SStateBase):
         target_config.append('')
         global_config.append('MACHINE = "qemux86"')
         target_config.append('')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
+        self.run_test_sstate_cache_management_script('m4', global_config, target_config, ignore_patterns=['populate_lic'])
 
     def test_sstate_32_64_same_hash(self):
         """
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
index 6e34927c90..c884488025 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -5,7 +5,7 @@
 import uuid
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import  bitbake
+from oeqa.utils.commands import bitbake
 
 class SysrootTests(OESelftestTestCase):
     def test_sysroot_cleanup(self):
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 9be2d2c39c..72c25c634f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -424,7 +424,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 
             for part in [1, 2, 3]:
                 part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
-                partln = partlns[part-1].split(":")
+                partln = partlns[part - 1].split(":")
                 self.assertEqual(7, len(partln))
                 start = int(partln[1].rstrip("B")) / 512
                 length = int(partln[3].rstrip("B")) / 512
@@ -1133,7 +1133,7 @@ class Wic2(WicTestCase):
         """Test sparse_copy with FIEMAP and SEEK_HOLE filemap APIs"""
         libpath = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib', 'wic')
         sys.path.insert(0, libpath)
-        from  filemap import FilemapFiemap, FilemapSeek, sparse_copy, ErrorNotSupp
+        from filemap import FilemapFiemap, FilemapSeek, sparse_copy, ErrorNotSupp
         with NamedTemporaryFile("w", suffix=".wic-sparse") as sparse:
             src_name = sparse.name
             src_size = 1024 * 10
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 1b5546d273..21c5004ad7 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -279,7 +279,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 meta_selftestdir = os.path.join(
                     self.tc.td["BBLAYERS_FETCH_DIR"], 'meta-selftest')
                 if os.path.isdir(meta_selftestdir):
-                    runCmd("bitbake-layers add-layer %s" %meta_selftestdir)
+                    runCmd("bitbake-layers add-layer %s" % meta_selftestdir)
                     # reload data is needed because a meta-selftest layer was add
                     self.tc.td = get_bb_vars()
                     self.tc.config_paths['testlayer_path'] = get_test_layer()
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 047f5d16c7..49c9f5ad92 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -42,7 +42,7 @@ class BaseTarget(object, metaclass=ABCMeta):
         if os.path.islink(sshloglink):
             os.unlink(sshloglink)
         os.symlink(self.sshlog, sshloglink)
-        self.logger.info("SSH log file: %s" %  self.sshlog)
+        self.logger.info("SSH log file: %s" % self.sshlog)
 
     @abstractmethod
     def start(self, params=None, ssh=True, extra_bootparams=None):
@@ -104,7 +104,7 @@ class QemuTarget(BaseTarget):
 
         if d.getVar('FIND_ROOTFS') == '1':
             self.image_fstype = image_fstype or self.get_image_fstype(d)
-            self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),  d.getVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
+            self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
             self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
         dump_target_cmds = d.getVar("testimage_dump_target")
@@ -161,7 +161,7 @@ class QemuTarget(BaseTarget):
             os.unlink(qemuloglink)
         os.symlink(self.qemulog, qemuloglink)
 
-        self.logger.info("rootfs file: %s" %  self.rootfs)
+        self.logger.info("rootfs file: %s" % self.rootfs)
         self.logger.info("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index aabf4110cb..d97faefcab 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -125,8 +125,8 @@ def LogResults(original_class):
     from time import strftime, gmtime
     caller = os.path.basename(sys.argv[0])
     timestamp = strftime('%Y%m%d%H%M%S',gmtime())
-    logfile = os.path.join(os.getcwd(),'results-'+caller+'.'+timestamp+'.log')
-    linkfile = os.path.join(os.getcwd(),'results-'+caller+'.log')
+    logfile = os.path.join(os.getcwd(),'results-' + caller + '.' + timestamp + '.log')
+    linkfile = os.path.join(os.getcwd(),'results-' + caller + '.log')
 
     def get_class_that_defined_method(meth):
         if inspect.ismethod(meth):
@@ -177,20 +177,20 @@ def LogResults(original_class):
         tcid = self.id()
         for (name, msg) in result.errors:
             if tcid == name.id():
-                local_log.results("Testcase "+str(test_case)+": ERROR")
-                local_log.results("Testcase "+str(test_case)+":\n"+msg)
+                local_log.results("Testcase " + str(test_case) + ": ERROR")
+                local_log.results("Testcase " + str(test_case) + ":\n" + msg)
                 passed = False
         for (name, msg) in result.failures:
             if tcid == name.id():
-                local_log.results("Testcase "+str(test_case)+": FAILED")
-                local_log.results("Testcase "+str(test_case)+":\n"+msg)
+                local_log.results("Testcase " + str(test_case) + ": FAILED")
+                local_log.results("Testcase " + str(test_case) + ":\n" + msg)
                 passed = False
         for (name, msg) in result.skipped:
             if tcid == name.id():
-                local_log.results("Testcase "+str(test_case)+": SKIPPED")
+                local_log.results("Testcase " + str(test_case) + ": SKIPPED")
                 passed = False
         if passed:
-            local_log.results("Testcase "+str(test_case)+": PASSED")
+            local_log.results("Testcase " + str(test_case) + ": PASSED")
 
         # XXX: In order to avoid race condition when test if exists the linkfile
         # use bb.utils.lock, the best solution is to create a unique name for the
diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 6e8040eb5c..271f42770c 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -123,7 +123,7 @@ def expand_tag_strings(repo, name_pattern, msg_subj_pattern, msg_body_pattern,
                 keyws['tag_number'] = int(match.group('tag_number')) + 1
 
     tag_name = format_str(name_pattern, keyws)
-    msg_subj= format_str(msg_subj_pattern.strip(), keyws)
+    msg_subj = format_str(msg_subj_pattern.strip(), keyws)
     msg_body = format_str(msg_body_pattern, keyws)
     return tag_name, msg_subj + '\n\n' + msg_body
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 96355fbfc3..2d7b1122d4 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -26,7 +26,7 @@ from collections import defaultdict
 import importlib
 
 # Get Unicode non printable control chars
-control_range = list(range(0,32))+list(range(127,160))
+control_range = list(range(0,32)) + list(range(127,160))
 control_chars = [chr(x) for x in control_range
                 if chr(x) not in string.printable]
 re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
@@ -228,7 +228,7 @@ class QemuRunner:
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
 
-        self.logger.debug('launchcmd=%s'%(launch_cmd))
+        self.logger.debug('launchcmd=%s' % (launch_cmd))
 
         # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
         # blocking at the end of the runqemu script when using this within
@@ -402,7 +402,7 @@ class QemuRunner:
             except (IndexError, ValueError):
                 # Try to get network configuration from runqemu output
                 match = re.match(r'.*Network configuration: (?:ip=)*([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
-                                 out, re.MULTILINE|re.DOTALL)
+                                 out, re.MULTILINE | re.DOTALL)
                 if match:
                     self.ip, self.server_ip, self.netmask = match.groups()
                     # network configuration is required as we couldn't get it
@@ -641,13 +641,13 @@ class QemuRunner:
                 status = 1
             else:
                 # Remove first line (command line) and last line (prompt)
-                data = data[data.find('$?\r\n')+4:data.rfind('\r\n')]
+                data = data[data.find('$?\r\n') + 4:data.rfind('\r\n')]
                 index = data.rfind('\r\n')
                 if index == -1:
                     status_cmd = data
                     data = ""
                 else:
-                    status_cmd = data[index+2:]
+                    status_cmd = data[index + 2:]
                     data = data[:index]
                 if (status_cmd == "0"):
                     status = 1
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index be82a7947a..1807f92320 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -115,12 +115,12 @@ class QemuTinyRunner(QemuRunner):
         return self.is_alive()
 
     def run_serial(self, command, timeout=60):
-        self.server_socket.sendall(command+'\n')
+        self.server_socket.sendall(command + '\n')
         data = ''
         status = 0
         stopread = False
-        endtime = time.time()+timeout
-        while time.time()<endtime and not stopread:
+        endtime = time.time() + timeout
+        while time.time() < endtime and not stopread:
                 try:
                         sread, _, _ = select.select([self.server_socket],[],[],1)
                 except InterruptedError:
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index 8fc6748e23..0221bbee67 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -104,7 +104,7 @@ def process_binaries(d, params):
             else: # nothing to do here; running tests under bitbake, so we asume native binaries are in sysroots dir.
                 if param_list[1] or param_list[4]:
                     bb.warn("Native binary %s %s%s. Running tests under bitbake environment. Version can't be checked except when the test itself does it"
-                            " and binary can't be removed."%(param_list[0],"has assigned ver. " + param_list[1] if param_list[1] else "",
+                            " and binary can't be removed." % (param_list[0],"has assigned ver. " + param_list[1] if param_list[1] else "",
                             ", is marked for removal" if param_list[4] else ""))
         else:# the package is target aka DUT intended and it is either required to be delivered in an extracted form or in a packaged version
             target_rpm_file_list = [item for item in os.listdir(arch_rpm_dir) if re.search(param_list[0] + "-([0-9]+\.*)", item)]
@@ -237,7 +237,7 @@ def send_bin_to_DUT(d,params):
     def send_rpm(remote_path): # if it is not required to have an extracted binary, but to send an .rpm file
         rpm_to_send = ""
         for item in os.listdir(arch_rpms_dir):
-            if param_list[1] and re.match("%s-%s-.*rpm"%(param_list[0], param_list[1]), item):
+            if param_list[1] and re.match("%s-%s-.*rpm" % (param_list[0], param_list[1]), item):
                 rpm_to_send = item
                 break
             elif re.match("%s-[0-9]+\.[0-9]+-.*rpm" % param_list[0], item):
@@ -249,7 +249,7 @@ def send_bin_to_DUT(d,params):
             return
         (status, output) = oeRuntimeTest.tc.target.copy_to(os.path.join(arch_rpms_dir, rpm_to_send), remote_path)
         if status != 0:
-                bb.warn("Failed to copy %s on the remote target: %s" %(param_list[0], d.getVar("MACHINE")))
+                bb.warn("Failed to copy %s on the remote target: %s" % (param_list[0], d.getVar("MACHINE")))
                 return
         if param_list[4] == "rm":
             cleanup_list.append(os.path.join(remote_path, rpm_to_send))
diff --git a/meta/recipes-core/glibc/glibc/check-test-wrapper b/meta/recipes-core/glibc/glibc/check-test-wrapper
index 820d4732da..d1c328d318 100644
--- a/meta/recipes-core/glibc/glibc/check-test-wrapper
+++ b/meta/recipes-core/glibc/glibc/check-test-wrapper
@@ -50,7 +50,7 @@ if targettype == "user":
     # tests e.g. nptl/tst-pthread-timedlock-lockloop
     # Cap at 8GB since no test should need more than that
     # (5GB adds 7 failures for qemuarm glibc test run)
-    limit = 8*1024*1024*1024
+    limit = 8 * 1024 * 1024 * 1024
     resource.setrlimit(resource.RLIMIT_AS, (limit, limit))
 
 elif targettype == "ssh":
diff --git a/meta/recipes-devtools/python/python3/check_build_completeness.py b/meta/recipes-devtools/python/python3/check_build_completeness.py
index a1eace3f57..0f7da37d25 100755
--- a/meta/recipes-devtools/python/python3/check_build_completeness.py
+++ b/meta/recipes-devtools/python/python3/check_build_completeness.py
@@ -5,12 +5,12 @@ logfile = open(sys.argv[1]).read()
 necessary_bits = logfile.find("The necessary bits to build these optional modules were not found")
 to_find_bits = logfile.find("To find the necessary bits, look in setup.py in detect_modules() for the module's name.")
 if necessary_bits != -1:
-    print("%s" %(logfile[necessary_bits:to_find_bits]))
+    print("%s" % (logfile[necessary_bits:to_find_bits]))
 
 failed_to_build = logfile.find("Failed to build these modules:")
 if failed_to_build != -1:
     failed_to_build_end = logfile.find("\n\n", failed_to_build)
-    print("%s" %(logfile[failed_to_build:failed_to_build_end]))
+    print("%s" % (logfile[failed_to_build:failed_to_build_end]))
 
 if necessary_bits != -1 or failed_to_build != -1:
     sys.exit(1)
diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 3dee1f71b7..f172555504 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -57,7 +57,7 @@ pyversion = str(sys.argv[1])
 pivot = 'recipe-sysroot-native'
 for p in sys.path:
     if pivot in p:
-        nativelibfolder = p[:p.find(pivot)+len(pivot)]
+        nativelibfolder = p[:p.find(pivot) + len(pivot)]
 
 # Empty dict to hold the whole manifest
 new_manifest = collections.OrderedDict()
@@ -72,7 +72,7 @@ allfolders = []
 
 def isFolder(value):
     value = value.replace('${PYTHON_MAJMIN}',pyversion)
-    if os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
+    if os.path.isdir(value.replace('${libdir}',nativelibfolder + '/usr/lib')) or os.path.isdir(value.replace('${libdir}',nativelibfolder + '/usr/lib64')) or os.path.isdir(value.replace('${libdir}',nativelibfolder + '/usr/lib32')):
         return True
     else:
         return False
@@ -98,7 +98,7 @@ def print_indent(msg, offset):
 # Read existing JSON manifest
 with open('python3-manifest.json') as manifest:
     # The JSON format doesn't allow comments so we hack the call to keep the comments using a marker
-    manifest_str =  manifest.read()
+    manifest_str = manifest.read()
     json_start = manifest_str.find('# EOC') + 6 # EOC + \n
     manifest.seek(0)
     comments = manifest.read(json_start)
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index 53acc8cd71..2a6e7f7bd9 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -29,7 +29,7 @@ def fix_path(dep_path):
     import os
     # We DONT want the path on our HOST system
     pivot = 'recipe-sysroot-native'
-    dep_path = dep_path[dep_path.find(pivot)+len(pivot):]
+    dep_path = dep_path[dep_path.find(pivot) + len(pivot):]
 
     if '/usr/bin' in dep_path:
         dep_path = dep_path.replace('/usr/bin''${bindir}')
@@ -44,12 +44,12 @@ def fix_path(dep_path):
     if '/usr/include' in dep_path:
         dep_path = dep_path.replace('/usr/include','${includedir}')
     if '__init__.' in dep_path:
-        dep_path =  os.path.split(dep_path)[0]
+        dep_path = os.path.split(dep_path)[0]
     return dep_path
 
 
 # Module to import was passed as an argument
-current_module =  str(sys.argv[1]).rstrip()
+current_module = str(sys.argv[1]).rstrip()
 if debug == True:
     log = open('temp/log_%s' % current_module.strip('.*'),'w')
     log.write('Module %s generated the following dependencies:\n' % current_module)
@@ -80,7 +80,7 @@ if current_module == 'python-core-package':
     dif = core_deps
 else:
     # We know this is not the core package, so there must be a difference.
-    dif = module_deps-core_deps
+    dif = module_deps - core_deps
 
 
 # Check where each dependency came from
@@ -105,7 +105,7 @@ for item in dif:
         # Deals with NameError: name 'dep_path' is not defined
         # because module is not found (wasn't compiled?), e.g. bddsm
         if debug == True:
-            log.write(item+' ') 
+            log.write(item + ' ') 
             log.write(str(e))                                              
         pass
 
@@ -136,7 +136,7 @@ for item in dif:
         dep_path = dep_path.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
 
     if debug == True:
-        log.write(dep_path+'\n')
+        log.write(dep_path + '\n')
     # Prints out result, which is what will be used by create_manifest
     print(dep_path)
 
@@ -158,7 +158,7 @@ for item in dif:
     except NameError as e:
         # Deals with NameError: name 'cached' is not defined
         if debug == True:
-            log.write(item+' ') 
+            log.write(item + ' ') 
             log.write(str(e))                                              
         pass
     if cached is not None:
diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index c4d25e7f9f..be25d4982d 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -37,7 +37,7 @@ preamble_regex = re.compile('^(.*?)^struct', re.MULTILINE | re.DOTALL)
 
 preamble = re.search(preamble_regex, data)
 struct_block_regex = re.compile('^struct.*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL)
-field_regex =  re.compile('{.*?},', re.MULTILINE | re.DOTALL)
+field_regex = re.compile('{.*?},', re.MULTILINE | re.DOTALL)
 cpuid_regex = re.compile('\.cpuid = (.*?),', re.MULTILINE | re.DOTALL)
 name_regex = re.compile('\.name = (.*?),', re.MULTILINE | re.DOTALL)
 
diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index b29a48dca7..65d7e3fd86 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -130,10 +130,10 @@ def log_test_header(seq_no, nr_of_tests, name):
 #-------------------------------------------------------------------------------
 
 def start_stress(*args):
-        stress_cmd         = ["stress-ng"]
+        stress_cmd = ["stress-ng"]
         added_stress_types = []
-        req_stress_types   = set(args)
-        cpu_cnt            = str(multiprocessing.cpu_count())
+        req_stress_types = set(args)
+        cpu_cnt = str(multiprocessing.cpu_count())
 
         # The function cond_add_stress appends the options to the stress
         # command if the stress type is in the set of requested stress types
@@ -146,10 +146,10 @@ def start_stress(*args):
 
         #----------
 
-        cond_add_stress("io",  ["-i", cpu_cnt])
+        cond_add_stress("io", ["-i", cpu_cnt])
         cond_add_stress("cpu", ["-c", cpu_cnt])
         cond_add_stress("hdd", ["-d", cpu_cnt, "--hdd-bytes", "20M"])
-        cond_add_stress("vm",  ["-m", cpu_cnt, "--vm-bytes", "10M"])
+        cond_add_stress("vm", ["-m", cpu_cnt, "--vm-bytes", "10M"])
 
         unknown = ", ".join(req_stress_types)
         if unknown != "":
@@ -159,7 +159,7 @@ def start_stress(*args):
                 log("No stress requested")
                 return None
 
-        added          = "+".join(added_stress_types)
+        added = "+".join(added_stress_types)
         stress_cmd_str = " ".join(stress_cmd)
 
         log("Starting stress(", added, ")")
@@ -191,11 +191,11 @@ def end_stress(p):
 #-------------------------------------------------------------------------------
 
 def us2hms_str(us):
-        s = (us+500000) // 1000000 # Round microseconds to s
-        m = s//60
-        s -= 60*m
-        h = m//60
-        m -= 60*h
+        s = (us + 500000) // 1000000 # Round microseconds to s
+        m = s // 60
+        s -= 60 * m
+        h = m // 60
+        m -= 60 * h
 
         return "%d:%02d:%02d" % (h, m, s)
 
@@ -254,8 +254,8 @@ def gen_minmax_list(max_list):
 #         of cpus
 
 interval_core_0 = 100     # Timer interval on core 0 [us]
-interval_delta  = 20      # Interval increment for each core [us]
-loop_count      = 30000   # Number of loops (on core 0).
+interval_delta = 20      # Interval increment for each core [us]
+loop_count = 30000   # Number of loops (on core 0).
 
 cmd = ("cyclictest",
        "-S",             # Standard SMP testing. See below
@@ -298,16 +298,16 @@ def run_cyclictest_once():
 # A precondition for the tracking of min-max values is that
 # the suite size os a power of 2.
 
-N          = 5
+N = 5
 suite_size = 2**N
 
-est_exec_time_once  = interval_core_0 * loop_count
+est_exec_time_once = interval_core_0 * loop_count
 est_exec_time_suite = suite_size * est_exec_time_once
 
 def run_cyclictest_suite():
         log("Starting cyclictest")
         log("  Command          : ", " ".join(cmd))
-        log("  Number of cycles : ", loop_count*suite_size,
+        log("  Number of cycles : ", loop_count * suite_size,
             " (", suite_size, " sets of ", loop_count, " cycles)")
         log("  Exec. time (est) : ", us2hms_str(est_exec_time_suite))
         log()
@@ -327,9 +327,9 @@ def run_cyclictest_suite():
         for i in range(0, suite_size):
                 tmp_min, tmp_avg, tmp_max = run_cyclictest_once()
 
-                msg = "%2d/%2d:" % (i+1, suite_size)
+                msg = "%2d/%2d:" % (i + 1, suite_size)
                 msg += " min: %4d" % tmp_min
-                msg += " avg: %5.1f" % (float(tmp_avg[0])/tmp_avg[1])
+                msg += " avg: %5.1f" % (float(tmp_avg[0]) / tmp_avg[1])
                 msg += " max: %4d" % tmp_max
                 log_ts(msg)
 
@@ -343,13 +343,13 @@ def run_cyclictest_suite():
                 ack_avg[0] += tmp_avg[0]
                 ack_avg[1] += tmp_avg[1]
 
-        t = time.time()-t
+        t = time.time() - t
         log_ts("Cyclictest completed. Actual execution time:",
-               us2hms_str(t*1000000))
+               us2hms_str(t * 1000000))
         log()
         set_hung_tmo(orig_tmo)
 
-        return ack_min, float(ack_avg[0])/ack_avg[1], gen_minmax_list(max_list)
+        return ack_min, float(ack_avg[0]) / ack_avg[1], gen_minmax_list(max_list)
 
 #-------------------------------------------------------------------------------
 
@@ -400,10 +400,10 @@ class cyclictest_runner:
 runner = cyclictest_runner()
 
 tests = (("no_stress", []),
-         ("cpu",  ["cpu"]),
-         ("hdd",  ["hdd"]),
-         ("io",   ["io"]),
-         ("vm",   ["vm"]),
+         ("cpu", ["cpu"]),
+         ("hdd", ["hdd"]),
+         ("io", ["io"]),
+         ("vm", ["vm"]),
          ("full", ["io", "cpu", "hdd", "vm"]),
          )
 
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index f176857fdd..025243ea6e 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -104,7 +104,7 @@ def main():
         sys.exit(1)
 
     if len(args.revisions) == 1:
-        if '..'  in args.revisions[0]:
+        if '..' in args.revisions[0]:
             fromrev, torev = args.revisions[0].split('..')
         else:
             fromrev, torev = args.revisions[0], 'HEAD'
diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index aed4f49923..bef1cf9cd7 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -203,14 +203,14 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
     total2 = sum_vals(bs2)
     print("\nCumulative {}:".format(val_type))
     print("  {}    {:+.1f}%    {} ({}) -> {} ({})".format(
-                val_to_str(total2 - total1), 100 * (total2-total1) / total1,
+                val_to_str(total2 - total1), 100 * (total2 - total1) / total1,
                 val_to_str(total1, True), val_to_str(total1),
                 val_to_str(total2, True), val_to_str(total2)))
 
 
 def parse_args(argv):
     """Parse cmdline arguments"""
-    description="""
+    description = """
 Script for comparing buildstats of two separate builds."""
     parser = argparse.ArgumentParser(
             formatter_class=argparse.ArgumentDefaultsHelpFormatter,
diff --git a/scripts/combo-layer b/scripts/combo-layer
index e42f428cc3..2c2568fc19 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -142,7 +142,7 @@ class Configuration(object):
         self.repos[repo][option] = value
 
     def sanity_check(self, initmode=False):
-        required_options=["src_uri", "local_repo_dir", "dest_dir", "last_revision"]
+        required_options = ["src_uri", "local_repo_dir", "dest_dir", "last_revision"]
         if initmode:
             required_options.remove("last_revision")
         msg = ""
@@ -150,7 +150,7 @@ class Configuration(object):
         for name in self.repos:
             for option in required_options:
                 if option not in self.repos[name]:
-                    msg = "%s\nOption %s is not defined for component %s" %(msg, option, name)
+                    msg = "%s\nOption %s is not defined for component %s" % (msg, option, name)
                     missing_options.append(option)
             # Sanitize dest_dir so that we do not have to deal with edge cases
             # (unset, empty string, double slashes) in the rest of the code.
@@ -201,7 +201,7 @@ def action_init(conf, args):
     for name in conf.repos:
         ldir = conf.repos[name]['local_repo_dir']
         if not os.path.exists(ldir):
-            logger.info("cloning %s to %s" %(conf.repos[name]['src_uri'], ldir))
+            logger.info("cloning %s to %s" % (conf.repos[name]['src_uri'], ldir))
             subprocess.check_call("git clone %s %s" % (conf.repos[name]['src_uri'], ldir), shell=True)
     if not os.path.exists(".git"):
         runcmd("git init")
@@ -269,7 +269,7 @@ def action_init(conf, args):
                 # directory and optionally tell tar to strip the path
                 # prefix when the files were already moved.
                 subdir_components = len(subdir.split(os.path.sep)) if subdir else 0
-                strip=('--strip-components=%d' % subdir_components) if subdir else ''
+                strip = ('--strip-components=%d' % subdir_components) if subdir else ''
                 # TODO: file_filter wild cards do not work (and haven't worked before either), because
                 # a) GNU tar requires a --wildcards parameter before turning on wild card matching.
                 # b) The semantic is not as intendend (src/*.c also matches src/foo/bar.c,
@@ -467,7 +467,7 @@ def check_repo_clean(repodir):
         check if the repo is clean
         exit if repo is dirty
     """
-    output=runcmd("git status --porcelain", repodir)
+    output = runcmd("git status --porcelain", repodir)
     r = re.compile('\?\? patch-.*/')
     dirtyout = [item for item in output.splitlines() if not r.match(item)]
     if dirtyout:
@@ -591,15 +591,15 @@ def action_pull(conf, args):
             try:
                 runcmd("git checkout %s" % branch, ldir, printerr=False)
             except subprocess.CalledProcessError:
-                output=runcmd("git fetch", ldir)
+                output = runcmd("git fetch", ldir)
                 logger.info(output)
                 runcmd("git checkout %s" % branch, ldir)
                 runcmd("git pull --ff-only", ldir)
             else:
-                output=runcmd("git pull --ff-only", ldir)
+                output = runcmd("git pull --ff-only", ldir)
                 logger.info(output)
         else:
-            output=runcmd("git fetch", ldir)
+            output = runcmd("git fetch", ldir)
             logger.info(output)
             runcmd("git checkout %s" % branch, ldir)
             runcmd("git reset --hard FETCH_HEAD", ldir)
@@ -707,20 +707,20 @@ def update_with_patches(conf, components, revisions, repos):
         # Step 3: Call repo specific hook to adjust patch
         if 'hook' in repo:
             # hook parameter is: ./hook patchpath revision reponame
-            count=len(revlist)-1
+            count = len(revlist) - 1
             for patch in patchlist:
                 runcmd("%s %s %s %s" % (repo['hook'], patch, revlist[count], name))
-                count=count-1
+                count = count - 1
 
         # Step 4: write patch list and revision list to file, for user to edit later
         patchlist_file = os.path.join(os.getcwd(), patch_dir, "patchlist-%s" % name)
         repo['patchlist'] = patchlist_file
         f = open(patchlist_file, 'w')
-        count=len(revlist)-1
+        count = len(revlist) - 1
         for patch in patchlist:
             f.write("%s %s\n" % (patch, revlist[count]))
             check_patch(os.path.join(patch_dir, patch))
-            count=count-1
+            count = count - 1
         f.close()
 
     # Step 5: invoke bash for user to edit patch and patch list
@@ -1206,7 +1206,7 @@ def find_revs(old2new, head):
     num_known = len(old2new)
     log = runcmd("git log --grep='From .* rev: [a-fA-F0-9][a-fA-F0-9]*' --pretty=format:%H%x00%B%x00 " + head).split(chr(0))
     regex = re.compile(r'From .* rev: ([a-fA-F0-9]+)')
-    for new_rev, body in zip(*[iter(log)]* 2):
+    for new_rev, body in zip(*[iter(log)] * 2):
         # Use the last one, in the unlikely case there are more than one.
         rev = regex.findall(body)[-1]
         if rev not in old2new:
@@ -1232,7 +1232,7 @@ def apply_commit(parent, rev, largs, wargs, dest_dir, file_filter=None):
     if parent:
         # Apply delta.
         changes = runcmd("git diff-tree --no-commit-id --no-renames --name-status -r --raw -z %s %s" % (parent, rev), **largs).split(chr(0))
-        for status, name in zip(*[iter(changes)]*2):
+        for status, name in zip(*[iter(changes)] * 2):
             if status[0] in "ACMRT":
                 update.append(name)
             elif status[0] in "D":
diff --git a/scripts/contrib/image-manifest b/scripts/contrib/image-manifest
index 3c07a73a4e..ebca44a365 100755
--- a/scripts/contrib/image-manifest
+++ b/scripts/contrib/image-manifest
@@ -320,7 +320,7 @@ def export_manifest_info(args):
         json.dump(config, sys.stdout, indent=2)
         print('')
 
-    tmpoutdir = tempfile.mkdtemp(prefix=os.path.basename(__file__)+'-')
+    tmpoutdir = tempfile.mkdtemp(prefix=os.path.basename(__file__) + '-')
     logger.debug('tmp dir: %s' % tmpoutdir)
 
     # export manifest
diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index 744dcfb49e..b987374d57 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -129,7 +129,7 @@ def analyse(results, want_blame=False, verbose=True):
         if r.malformed_upstream_status or r.unknown_upstream_status:
             malformed_status += 1
             # Count patches with no status as pending
-            pending_patches +=1
+            pending_patches += 1
         if r.missing_cve:
             missing_cve += 1
         if r.upstream_status == "pending":
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 9991b35395..84503b84d1 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -55,7 +55,7 @@ def verifyHomepage(bbhandler):
             checked.append(realfn)
     return count
 
-if __name__=='__main__':
+if __name__ == '__main__':
     with bb.tinfoil.Tinfoil() as bbhandler:
         bbhandler.prepare()
         logger.info("Start verifying HOMEPAGE:")
diff --git a/scripts/crosstap b/scripts/crosstap
index 40856bc208..b8c3923793 100755
--- a/scripts/crosstap
+++ b/scripts/crosstap
@@ -116,7 +116,7 @@ class BitbakeEnvInvocationException(Exception):
         self.message = message
 
 class BitbakeEnv(object):
-    BITBAKE="bitbake"
+    BITBAKE = "bitbake"
 
     def __init__(self, package):
         self.package = package
@@ -292,7 +292,7 @@ with --sysroot option.
     def __map_systemtap_arch(self):
         a = self.target_arch
         ret = a
-        if   re.match('(athlon|x86.64)$', a):
+        if re.match('(athlon|x86.64)$', a):
             ret = 'x86_64'
         elif re.match('i.86$', a):
             ret = 'i386'
diff --git a/scripts/lib/build_perf/report.py b/scripts/lib/build_perf/report.py
index 4e8e2a8a93..dde4616974 100644
--- a/scripts/lib/build_perf/report.py
+++ b/scripts/lib/build_perf/report.py
@@ -268,7 +268,7 @@ class TimeVal(MeasurementVal):
         if self != self:
             return "null"
         hh, mm, ss = self.hms()
-        return [hh, mm, int(ss), int(ss*1000) % 1000]
+        return [hh, mm, int(ss), int(ss * 1000) % 1000]
 
 
 class SizeVal(MeasurementVal):
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index c69b5bf4d7..56f5bb24d2 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -303,10 +303,10 @@ def diff_buildstats(bs1, bs2, stat_attr, min_val=None, min_absdiff=None, only_ta
                 continue
             if min_absdiff and abs(val2 - val1) < min_absdiff:
                 log.debug("Filtering out %s:%s (difference of %s)", pkg, task,
-                          val2-val1)
+                          val2 - val1)
                 continue
             tasks_diff.append(TaskDiff(pkg, pkg_op, task, task_op, val1, val2,
-                                       val2-val1, reldiff))
+                                       val2 - val1, reldiff))
     return tasks_diff
 
 
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index e5af2c95ae..31b029eaf8 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -188,7 +188,7 @@ def deploy(args, config, basepath, workspace):
                 if fstat.st_ino in inodes:
                     fsize = 0
                 else:
-                    fsize = int(math.ceil(float(fstat.st_size)/1024))
+                    fsize = int(math.ceil(float(fstat.st_size) / 1024))
                 inodes.add(fstat.st_ino)
                 ftotalsize += fsize
                 # The path as it would appear on the target
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5eba2191d9..2bf65ad072 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -751,7 +751,7 @@ def _check_preserve(config, recipename):
 def get_staging_kver(srcdir):
     # Kernel version from work-shared
     kerver = []
-    staging_kerVer=""
+    staging_kerVer = ""
     if os.path.exists(srcdir) and os.listdir(srcdir):
         with open(os.path.join(srcdir,"Makefile")) as f:
             version = [next(f) for x in range(5)][1:4]
@@ -846,7 +846,7 @@ def modify(args, config, basepath, workspace):
 
                 # Ignore local files with subdir={BP}
                 srcabspath = os.path.abspath(srcsubdir)
-                local_files = [fname for fname in local_files if os.path.exists(os.path.join(workdir, fname)) and  (srcabspath == workdir or not  os.path.join(workdir, fname).startswith(srcabspath + os.sep))]
+                local_files = [fname for fname in local_files if os.path.exists(os.path.join(workdir, fname)) and (srcabspath == workdir or not os.path.join(workdir, fname).startswith(srcabspath + os.sep))]
                 if local_files:
                     for fname in local_files:
                         _move_file(os.path.join(workdir, fname), os.path.join(srctree, 'oe-local-files', fname))
@@ -1079,7 +1079,7 @@ def rename(args, config, basepath, workspace):
 
     if newver:
         newappend = '%s_%s.bbappend' % (newname, newver)
-        newfile =  '%s_%s.bb' % (newname, newver)
+        newfile = '%s_%s.bb' % (newname, newver)
     else:
         newappend = '%s.bbappend' % newname
         newfile = '%s.bb' % newname
@@ -1555,7 +1555,7 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
                           key, val in list(upd_f.items()) + list(new_f.items()))
             removevalues = {}
             if update_srcuri:
-                removevalues  = {'SRC_URI': removedentries}
+                removevalues = {'SRC_URI': removedentries}
                 patchfields['SRC_URI'] = '\\\n    '.join(srcuri)
             if dry_run_outdir:
                 logger.info('Creating bbappend (dry-run)')
@@ -1575,7 +1575,7 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
                 else:
                     _move_file(os.path.join(local_files_dir, basepath), path,
                                dry_run_outdir=dry_run_outdir, base_outdir=recipedir)
-                update_srcuri= True
+                update_srcuri = True
             for basepath, path in new_f.items():
                 logger.info('Adding new file %s%s' % (basepath, dry_run_suffix))
                 _move_file(os.path.join(local_files_dir, basepath),
@@ -1960,7 +1960,7 @@ def _reset(recipes, no_clean, remove_work, config, basepath, workspace):
             if os.listdir(srctreebase):
                     if remove_work:
                         logger.info('-r argument used on %s, removing source tree.'
-                                    ' You will lose any unsaved work' %pn)
+                                    ' You will lose any unsaved work' % pn)
                         shutil.rmtree(srctreebase)
                     else:
                         # We don't want to risk wiping out any work in progress
@@ -2046,7 +2046,7 @@ def finish(args, config, basepath, workspace):
             raise DevtoolError('Source tree is not clean:\n\n%s\nEnsure you have committed your changes or use -f/--force if you are sure there\'s nothing that needs to be committed' % dirty)
 
     no_clean = args.no_clean
-    remove_work=args.remove_work
+    remove_work = args.remove_work
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
         rd = parse_recipe(config, tinfoil, args.recipename, True)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 0c85d8c13f..1a75252321 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -242,7 +242,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
         pbar.start()
         batchsize = 100
         for i in range(0, len(filelist), batchsize):
-            batch = filelist[i:i+batchsize]
+            batch = filelist[i:i + batchsize]
             __run('git add -f -A %s' % ' '.join(['"%s"' % item for item in batch]))
             pbar.update(i)
         pbar.finish()
@@ -610,7 +610,7 @@ def check_upgrade_status(args, config, basepath, workspace):
                                                                result[1] if result[1] != 'UPDATE' else (result[3] if not result[3].endswith("new-commits-available") else "new commits"),
                                                                result[4],
                                                                result[5] if result[5] != 'N/A' else "",
-                                                               "cannot be updated due to: %s" %(result[6]) if result[6] else ""))
+                                                               "cannot be updated due to: %s" % (result[6]) if result[6] else ""))
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
@@ -621,7 +621,7 @@ def register_commands(subparsers, context):
                                            description='Upgrades an existing recipe to a new upstream version. Puts the upgraded recipe file into the workspace along with any associated files, and extracts the source tree to a specified location (in case patches need rebasing or adding to as a result of the upgrade).',
                                            group='starting')
     parser_upgrade.add_argument('recipename', help='Name of recipe to upgrade (just name - no version, path or extension)')
-    parser_upgrade.add_argument('srctree',  nargs='?', help='Path to where to extract the source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
+    parser_upgrade.add_argument('srctree', nargs='?', help='Path to where to extract the source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
     parser_upgrade.add_argument('--version', '-V', help='Version to upgrade to (PV). If omitted, latest upstream version will be determined and used, if possible.')
     parser_upgrade.add_argument('--srcrev', '-S', help='Source revision to upgrade to (useful when fetching from an SCM such as git)')
     parser_upgrade.add_argument('--srcbranch', '-B', help='Branch in source repository containing the revision to use (if fetching from an SCM such as git)')
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 566c75369a..67f3f4980a 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -997,7 +997,7 @@ def handle_license_vars(srctree, lines_before, handled, extravalues, d):
     if pos == -1:
         lines_before.extend(lines)
     else:
-        lines_before[pos:pos+1] = lines
+        lines_before[pos:pos + 1] = lines
 
     handled.append(('license', licvalues))
     return licvalues
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 35a97c9345..b9bfa936fa 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -446,7 +446,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
         def process_value(value):
             value = value.replace('[', '').replace(']', '')
             if value.startswith('m4_esyscmd(') or value.startswith('m4_esyscmd_s('):
-                cmd = subst_defines(value[value.index('(')+1:-1])
+                cmd = subst_defines(value[value.index('(') + 1:-1])
                 try:
                     if '|' in cmd:
                         cmd = 'set -o pipefail; ' + cmd
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index adfa377956..382a9a50cf 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -607,7 +607,7 @@ def gather_setup_info(fileobj):
         if key == 'ext_modules':
             if isinstance(value, list):
                 for ext in value:
-                    if  (isinstance(ext, ast.Call) and
+                    if (isinstance(ext, ast.Call) and
                          isinstance(ext.func, ast.Name) and
                          ext.func.id == 'Extension' and
                          not has_non_literals(ext.args)):
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 2bcae91dfa..4f24d621a7 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -217,7 +217,7 @@ class NpmRecipeHandler(RecipeHandler):
         extravalues["extrafiles"]["npm-shrinkwrap.json"] = shrinkwrap_copy
 
         url_local = "npmsw://%s" % shrinkwrap_file
-        url_recipe= "npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json"
+        url_recipe = "npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json"
 
         if dev:
             url_local += ";dev=1"
diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index c5283c514e..a847dd9caf 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -182,7 +182,7 @@ class ManualTestRunner(object):
         logger.info('Configuration option file created at %s' % config_options_file)
 
     def make_testcase_config_file(self, logger, case_file, testcase_config_file):
-        if  testcase_config_file:
+        if testcase_config_file:
             if os.path.exists(testcase_config_file):
                 print('\nTest configuration file with name %s already exists. Please provide a unique file name' % (testcase_config_file))
                 return 0
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 7aa2b5aefe..0c56b64cb2 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -271,7 +271,7 @@ class ResultsTextReport(object):
                     testtype = str(key).split('.')[0]
                     if ((machine in self.ltptests and testtype == "ltpiresult" and self.ltptests[machine]) or
                         (machine in self.ltpposixtests and testtype == "ltpposixresult" and self.ltpposixtests[machine])):
-                        print("Already have test results for %s on %s, skipping %s" %(str(key).split('.')[0], machine, resultid))
+                        print("Already have test results for %s on %s, skipping %s" % (str(key).split('.')[0], machine, resultid))
                         skip = True
                         break
                 if skip:
diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index e0951f0a8f..baec9e27f9 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -31,7 +31,7 @@ def store(args, logger):
         if resultutils.is_url(args.source) or os.path.isfile(args.source):
             resultutils.append_resultsdata(results, args.source, configvars=configvars)
         else:
-            for root, dirs,  files in os.walk(args.source):
+            for root, dirs, files in os.walk(args.source):
                 for name in files:
                     f = os.path.join(root, name)
                     if name == "testresults.json":
@@ -78,7 +78,7 @@ def store(args, logger):
                                   [], [], False, keywords, logger)
 
     finally:
-        subprocess.check_call(["rm", "-rf",  tempdir])
+        subprocess.check_call(["rm", "-rf", tempdir])
 
     return 0
 
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 46e4d0f028..174bd27f2f 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -263,7 +263,7 @@ class Disk:
             splitted = out.splitlines()
             # skip over possible errors in exec_cmd output
             try:
-                idx =splitted.index("BYT;")
+                idx = splitted.index("BYT;")
             except ValueError:
                 raise WicError("Error getting partition information from %s" % (self.parted))
             lsector_size, psector_size, self._ptable_format = splitted[idx + 1].split(":")[3:6]
@@ -328,7 +328,7 @@ class Disk:
 
     def copy(self, src, dest):
         """Copy partition image into wic image."""
-        pnum =  dest.part if isinstance(src, str) else src.part
+        pnum = dest.part if isinstance(src, str) else src.part
 
         if self.partitions[pnum].fstype.startswith('ext'):
             if isinstance(src, str):
@@ -543,7 +543,7 @@ class Disk:
                         label = part.get("name")
                         label_str = "-L {}".format(label) if label else ''
                         out = exec_cmd("{} --probe {}".format(self.blkid, self._get_part_image(pnum)))
-                        uuid = out[out.index("UUID=\"")+6:out.index("UUID=\"")+42]
+                        uuid = out[out.index("UUID=\"") + 6:out.index("UUID=\"") + 42]
                         uuid_str = "-U {}".format(uuid) if uuid else ''
                         with open(partfname, 'w') as sparse:
                             os.ftruncate(sparse.fileno(), part['size'] * self._lsector_size)
diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index b7de950c7c..6f733d5365 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -490,7 +490,7 @@ class FilemapNobmap(_FilemapBase):
         """Refer the '_FilemapBase' class for the documentation."""
         self._log.debug("FilemapNobmap: get_mapped_ranges(%d,  %d(%d))"
                         % (start, count, start + count - 1))
-        yield (start, start + count -1)
+        yield (start, start + count - 1)
 
 def filemap(image, log=None):
     """
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 03c3d71594..b644e68da3 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -132,7 +132,7 @@ def systemidtype(arg):
 class KickStart():
     """Kickstart parser implementation."""
 
-    DEFAULT_EXTRA_SPACE = 10*1024
+    DEFAULT_EXTRA_SPACE = 10 * 1024
     DEFAULT_OVERHEAD_FACTOR = 1.3
 
     def __init__(self, confpath):
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index bb362b64a8..92d289fbf6 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -117,7 +117,7 @@ def exec_cmd(cmd_and_args, as_shell=False):
 def find_executable(cmd, paths):
     recipe = cmd
     if recipe in NATIVE_RECIPES:
-        recipe =  NATIVE_RECIPES[recipe]
+        recipe = NATIVE_RECIPES[recipe]
     provided = get_bitbake_var("ASSUME_PROVIDED")
     if provided and "%s-native" % recipe in provided:
         return True
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 54ca5f87b3..5f9a1f64bf 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -133,7 +133,7 @@ class DirectPlugin(ImagerPlugin):
                 device_name = "LABEL=%s" % part.label
             else:
                 # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-                prefix = 'p' if  part.disk.startswith('mmcblk') else ''
+                prefix = 'p' if part.disk.startswith('mmcblk') else ''
                 device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
 
             opts = part.fsopts if part.fsopts else "defaults"
diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
index 14ad54008b..15620240c4 100755
--- a/scripts/oe-depends-dot
+++ b/scripts/oe-depends-dot
@@ -51,9 +51,9 @@ class Dot(object):
             if rdep in chain:
                 continue
             else:
-                for i in range(0, len(chain)-1):
-                    if chain[i] in alldeps[rdep] and rdep in alldeps[chain[i+1]]:
-                        chain.insert(i+1, rdep)
+                for i in range(0, len(chain) - 1):
+                    if chain[i] in alldeps[rdep] and rdep in alldeps[chain[i + 1]]:
+                        chain.insert(i + 1, rdep)
                         inserted_elements.append(rdep)
                         break
                 if chain[-1] in alldeps[rdep] and rdep not in chain:
@@ -120,7 +120,7 @@ class Dot(object):
                         child_deps |= depends[dep]
 
                 reduced_depends[k] = deps - child_deps
-                outfile= '%s-reduced%s' % (self.args.dotfile[0][:-4], self.args.dotfile[0][-4:])
+                outfile = '%s-reduced%s' % (self.args.dotfile[0][:-4], self.args.dotfile[0][-4:])
             with open(outfile, 'w') as f:
                 print('Saving reduced dot file to %s' % outfile)
                 f.write('digraph depends {\n')
diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 3715282262..dc6178beb4 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -32,7 +32,7 @@ def timeit(f):
         result = f(*args, **kw)
         te = time.time()
         print('func:%r args:[%r, %r] took: %2.4f sec' %
-          (f.__name__, args, kw, te-ts))
+          (f.__name__, args, kw, te - ts))
         return result
     return timed
 
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index 51e425eff8..7fcc4043d2 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -22,7 +22,7 @@ def echonocbreak(fd):
 
 def cbreaknoecho(fd):
     old = termios.tcgetattr(fd)
-    old[3] = old[3] &~ termios.ECHO &~ termios.ICANON
+    old[3] = old[3] & ~ termios.ECHO & ~ termios.ICANON
     termios.tcsetattr(fd, termios.TCSADRAIN, old)
 
 if len(sys.argv) != 3 or sys.argv[1] in ('-h', '--help'):
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index e6198e1c79..b6e49567f1 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -146,11 +146,11 @@ VOLUME_COLORS = [
 
 # Process states
 STATE_UNDEFINED = 0
-STATE_RUNNING   = 1
-STATE_SLEEPING  = 2
-STATE_WAITING   = 3
-STATE_STOPPED   = 4
-STATE_ZOMBIE    = 5
+STATE_RUNNING = 1
+STATE_SLEEPING = 2
+STATE_WAITING = 3
+STATE_STOPPED = 4
+STATE_ZOMBIE = 5
 
 STATE_COLORS = [(0, 0, 0, 0), PROC_COLOR_R, PROC_COLOR_S, PROC_COLOR_D,
         PROC_COLOR_T, PROC_COLOR_Z, PROC_COLOR_X, PROC_COLOR_W]
@@ -184,8 +184,8 @@ def draw_legend_box(ctx, label, fill_color, x, y, s):
     draw_text(ctx, label, TEXT_COLOR, x + s + 5, y)
 
 def draw_legend_line(ctx, label, fill_color, x, y, s):
-    draw_fill_rect(ctx, fill_color, (x, y - s/2, s + 1, 3))
-    ctx.arc(x + (s + 1)/2.0, y - (s - 3)/2.0, 2.5, 0, 2.0 * math.pi)
+    draw_fill_rect(ctx, fill_color, (x, y - s / 2, s + 1, 3))
+    ctx.arc(x + (s + 1) / 2.0, y - (s - 3) / 2.0, 2.5, 0, 2.0 * math.pi)
     ctx.fill()
     draw_text(ctx, label, TEXT_COLOR, x + s + 5, y)
 
@@ -208,7 +208,7 @@ def draw_sec_labels(ctx, options, rect, sec_w, nsecs):
             else:
                 label = "%d" % (i / sec_w)
             label_w = ctx.text_extents(label)[2]
-            x = rect[0] + i - label_w/2
+            x = rect[0] + i - label_w / 2
             if x >= prev_x:
                 draw_text(ctx, label, TEXT_COLOR, x, rect[1] - 2)
                 prev_x = x + label_w
@@ -280,7 +280,7 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
 
     first = transform_point_coords(data[0], x_shift, ybase, xscale, yscale,
                         chart_bounds[0], chart_bounds[1])
-    last =  transform_point_coords(data[-1], x_shift, ybase, xscale, yscale,
+    last = transform_point_coords(data[-1], x_shift, ybase, xscale, yscale,
                         chart_bounds[0], chart_bounds[1])
 
     ctx.set_source_rgba(*color)
@@ -291,8 +291,8 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
         ctx.line_to(x, y)
     if fill:
         ctx.stroke_preserve()
-        ctx.line_to(last[0], chart_bounds[1]+chart_bounds[3])
-        ctx.line_to(first[0], chart_bounds[1]+chart_bounds[3])
+        ctx.line_to(last[0], chart_bounds[1] + chart_bounds[3])
+        ctx.line_to(first[0], chart_bounds[1] + chart_bounds[3])
         ctx.line_to(first[0], first[1])
         ctx.fill()
     else:
@@ -362,11 +362,11 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
     if trace.cpu_stats:
         ctx.set_font_size(LEGEND_FONT_SIZE)
 
-        draw_legend_box(ctx, "CPU (user+sys)", CPU_COLOR, off_x, curr_y+20, leg_s)
-        draw_legend_box(ctx, "I/O (wait)", IO_COLOR, off_x + 120, curr_y+20, leg_s)
+        draw_legend_box(ctx, "CPU (user+sys)", CPU_COLOR, off_x, curr_y + 20, leg_s)
+        draw_legend_box(ctx, "I/O (wait)", IO_COLOR, off_x + 120, curr_y + 20, leg_s)
 
         # render I/O wait
-        chart_rect = (off_x, curr_y+30, w, bar_h)
+        chart_rect = (off_x, curr_y + 30, w, bar_h)
         if clip_visible(clip, chart_rect):
             draw_box_ticks(ctx, chart_rect, sec_w)
             draw_annotations(ctx, proc_tree, trace.times, chart_rect)
@@ -382,11 +382,11 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 
     # render second chart
     if trace.disk_stats:
-        draw_legend_line(ctx, "Disk throughput", DISK_TPUT_COLOR, off_x, curr_y+20, leg_s)
-        draw_legend_box(ctx, "Disk utilization", IO_COLOR, off_x + 120, curr_y+20, leg_s)
+        draw_legend_line(ctx, "Disk throughput", DISK_TPUT_COLOR, off_x, curr_y + 20, leg_s)
+        draw_legend_box(ctx, "Disk utilization", IO_COLOR, off_x + 120, curr_y + 20, leg_s)
 
         # render I/O utilization
-        chart_rect = (off_x, curr_y+30, w, bar_h)
+        chart_rect = (off_x, curr_y + 30, w, bar_h)
         if clip_visible(clip, chart_rect):
             draw_box_ticks(ctx, chart_rect, sec_w)
             draw_annotations(ctx, proc_tree, trace.times, chart_rect)
@@ -441,11 +441,11 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
             # works okay in practice.
             draw_legend_box(ctx, '%s (max: %u MiB)' % (volume, volume_scale / 1024 / 1024),
                             VOLUME_COLORS[i % len(VOLUME_COLORS)],
-                            off_x + i * 250, curr_y+20, leg_s)
+                            off_x + i * 250, curr_y + 20, leg_s)
             disk_scale += volume_scale
 
         # render used amount of disk space
-        chart_rect = (off_x, curr_y+30, w, bar_h)
+        chart_rect = (off_x, curr_y + 30, w, bar_h)
         if clip_visible(clip, chart_rect):
             draw_box_ticks(ctx, chart_rect, sec_w)
             draw_annotations(ctx, proc_tree, trace.times, chart_rect)
@@ -454,7 +454,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
                             [(sample.time,
                               # Sum up used space of all volumes including the current one
                               # so that the graphs appear as stacked on top of each other.
-                              functools.reduce(lambda x,y: x+y,
+                              functools.reduce(lambda x,y: x + y,
                                      [sample.records[volume] - min_used[volume]
                                       for volume in volumes[0:i]
                                       if volume in sample.records],
@@ -465,15 +465,15 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
         curr_y = curr_y + 30 + bar_h
 
     # render mem usage
-    chart_rect = (off_x, curr_y+30, w, meminfo_bar_h)
+    chart_rect = (off_x, curr_y + 30, w, meminfo_bar_h)
     mem_stats = trace.mem_stats
     if mem_stats and clip_visible(clip, chart_rect):
         mem_scale = max(sample.buffers for sample in mem_stats)
-        draw_legend_box(ctx, "Mem cached (scale: %u MiB)" % (float(mem_scale) / 1024), MEM_CACHED_COLOR, off_x, curr_y+20, leg_s)
-        draw_legend_box(ctx, "Used", MEM_USED_COLOR, off_x + 240, curr_y+20, leg_s)
-        draw_legend_box(ctx, "Buffers", MEM_BUFFERS_COLOR, off_x + 360, curr_y+20, leg_s)
-        draw_legend_line(ctx, "Swap (scale: %u MiB)" % max([(sample.swap)/1024 for sample in mem_stats]),
-                 MEM_SWAP_COLOR, off_x + 480, curr_y+20, leg_s)
+        draw_legend_box(ctx, "Mem cached (scale: %u MiB)" % (float(mem_scale) / 1024), MEM_CACHED_COLOR, off_x, curr_y + 20, leg_s)
+        draw_legend_box(ctx, "Used", MEM_USED_COLOR, off_x + 240, curr_y + 20, leg_s)
+        draw_legend_box(ctx, "Buffers", MEM_BUFFERS_COLOR, off_x + 360, curr_y + 20, leg_s)
+        draw_legend_line(ctx, "Swap (scale: %u MiB)" % max([(sample.swap) / 1024 for sample in mem_stats]),
+                 MEM_SWAP_COLOR, off_x + 480, curr_y + 20, leg_s)
         draw_box_ticks(ctx, chart_rect, sec_w)
         draw_annotations(ctx, proc_tree, trace.times, chart_rect)
         draw_chart(ctx, MEM_BUFFERS_COLOR, True, chart_rect,
@@ -494,27 +494,27 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
     return curr_y
 
 def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
-    chart_rect = [off_x, curr_y+header_h, w, h - curr_y - 1 * off_y - header_h]
+    chart_rect = [off_x, curr_y + header_h, w, h - curr_y - 1 * off_y - header_h]
 
     draw_legend_box(ctx, "Configure",
              TASK_COLOR_CONFIGURE, off_x, curr_y + 45, leg_s)
     draw_legend_box(ctx, "Compile",
-             TASK_COLOR_COMPILE, off_x+120, curr_y + 45, leg_s)
+             TASK_COLOR_COMPILE, off_x + 120, curr_y + 45, leg_s)
     draw_legend_box(ctx, "Install",
-             TASK_COLOR_INSTALL, off_x+240, curr_y + 45, leg_s)
+             TASK_COLOR_INSTALL, off_x + 240, curr_y + 45, leg_s)
     draw_legend_box(ctx, "Populate Sysroot",
-             TASK_COLOR_SYSROOT, off_x+360, curr_y + 45, leg_s)
+             TASK_COLOR_SYSROOT, off_x + 360, curr_y + 45, leg_s)
     draw_legend_box(ctx, "Package",
-             TASK_COLOR_PACKAGE, off_x+480, curr_y + 45, leg_s)
+             TASK_COLOR_PACKAGE, off_x + 480, curr_y + 45, leg_s)
     draw_legend_box(ctx, "Package Write",
-             TASK_COLOR_PACKAGE_WRITE, off_x+600, curr_y + 45, leg_s)
+             TASK_COLOR_PACKAGE_WRITE, off_x + 600, curr_y + 45, leg_s)
 
     ctx.set_font_size(PROC_TEXT_FONT_SIZE)
 
     draw_box_ticks(ctx, chart_rect, sec_w)
     draw_sec_labels(ctx, options, chart_rect, sec_w, 30)
 
-    y = curr_y+header_h
+    y = curr_y + header_h
 
     offset = trace.min or min(trace.start.keys())
     for start in sorted(trace.start.keys()):
@@ -574,7 +574,7 @@ def render(ctx, options, xscale, trace):
     ctx.set_line_width(1.0)
     ctx.select_font_face(FONT_NAME)
     draw_fill_rect(ctx, WHITE, (0, 0, max(w, MIN_IMG_W), h))
-    w -= 2*off_x
+    w -= 2 * off_x
     curr_y = off_y
 
     if options.charts:
@@ -611,13 +611,13 @@ def render(ctx, options, xscale, trace):
 
     # draw a cumulative CPU-time-per-process graph
     if proc_tree.taskstats and options.cumulative:
-        cuml_rect = (off_x, curr_y + off_y, w, CUML_HEIGHT/2 - off_y * 2)
+        cuml_rect = (off_x, curr_y + off_y, w, CUML_HEIGHT / 2 - off_y * 2)
         if clip_visible(clip, cuml_rect):
             draw_cuml_graph(ctx, proc_tree, cuml_rect, duration, sec_w, STAT_TYPE_CPU)
 
     # draw a cumulative I/O-time-per-process graph
     if proc_tree.taskstats and options.cumulative:
-        cuml_rect = (off_x, curr_y + off_y * 100, w, CUML_HEIGHT/2 - off_y * 2)
+        cuml_rect = (off_x, curr_y + off_y * 100, w, CUML_HEIGHT / 2 - off_y * 2)
         if clip_visible(clip, cuml_rect):
             draw_cuml_graph(ctx, proc_tree, cuml_rect, duration, sec_w, STAT_TYPE_IO)
 
@@ -627,11 +627,11 @@ def draw_process_bar_chart(ctx, clip, options, proc_tree, times, curr_y, w, h, s
         draw_legend_box(ctx, "Running (%cpu)",
                  PROC_COLOR_R, off_x, curr_y + 45, leg_s)
         draw_legend_box(ctx, "Unint.sleep (I/O)",
-                 PROC_COLOR_D, off_x+120, curr_y + 45, leg_s)
+                 PROC_COLOR_D, off_x + 120, curr_y + 45, leg_s)
         draw_legend_box(ctx, "Sleeping",
-                 PROC_COLOR_S, off_x+240, curr_y + 45, leg_s)
+                 PROC_COLOR_S, off_x + 240, curr_y + 45, leg_s)
         draw_legend_box(ctx, "Zombie",
-                 PROC_COLOR_Z, off_x+360, curr_y + 45, leg_s)
+                 PROC_COLOR_Z, off_x + 360, curr_y + 45, leg_s)
         header_size = 45
 
     chart_rect = [off_x, curr_y + header_size + 15,
@@ -675,7 +675,7 @@ def draw_header(ctx, headers, duration):
         draw_text(ctx, txt, TEXT_COLOR, off_x, header_y)
 
     dur = duration / 100.0
-    txt = 'time : %02d:%05.2f' % (math.floor(dur/60), dur - 60 * math.floor(dur/60))
+    txt = 'time : %02d:%05.2f' % (math.floor(dur / 60), dur - 60 * math.floor(dur / 60))
     if headers.get('system.maxpid') is not None:
         txt = txt + '      max pid: %s' % (headers.get('system.maxpid'))
 
@@ -685,7 +685,7 @@ def draw_header(ctx, headers, duration):
     return header_y
 
 def draw_processes_recursively(ctx, proc, proc_tree, y, proc_h, rect, clip):
-    x = rect[0] +  ((proc.start_time - proc_tree.start_time) * rect[2] / proc_tree.duration)
+    x = rect[0] + ((proc.start_time - proc_tree.start_time) * rect[2] / proc_tree.duration)
     w = ((proc.duration) * rect[2] / proc_tree.duration)
 
     draw_process_activity_colors(ctx, proc, proc_tree, x, y, w, proc_h, rect, clip)
@@ -966,9 +966,9 @@ def draw_cuml_graph(ctx, proc_tree, chart_bounds, duration, sec_w, stat_type):
     for t in legends:
         cs = t[0]
         time = t[1]
-        x = chart_bounds[0] + off_x + int(i/LEGENDS_PER_COL) * label_width
+        x = chart_bounds[0] + off_x + int(i / LEGENDS_PER_COL) * label_width
         y = chart_bounds[1] + font_height * ((i % LEGENDS_PER_COL) + 2)
-        str = "%s - %.0f(ms) (%2.2f%%)" % (cs.cmd, time/1000000, (time/total_time) * 100.0)
+        str = "%s - %.0f(ms) (%2.2f%%)" % (cs.cmd, time / 1000000, (time / total_time) * 100.0)
         draw_legend_box(ctx, str, cs.color, x, y, leg_s)
         i = i + 1
         if i >= LEGENDS_TOTAL:
diff --git a/scripts/pybootchartgui/pybootchartgui/gui.py b/scripts/pybootchartgui/pybootchartgui/gui.py
index 99e5914405..b1a399240a 100644
--- a/scripts/pybootchartgui/pybootchartgui/gui.py
+++ b/scripts/pybootchartgui/pybootchartgui/gui.py
@@ -107,7 +107,7 @@ class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
         self.queue_draw()
 
     def zoom_to_rect(self, rect):
-        zoom_ratio = float(rect.width)/float(self.chart_width)
+        zoom_ratio = float(rect.width) / float(self.chart_width)
         self.zoom_image(zoom_ratio)
         self.x = 0
         self.position_changed()
@@ -148,13 +148,13 @@ class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
 
     def on_key_press_event(self, widget, event):
         if event.keyval == Gdk.keyval_from_name("Left"):
-            self.x -= self.POS_INCREMENT/self.zoom_ratio
+            self.x -= self.POS_INCREMENT / self.zoom_ratio
         elif event.keyval == Gdk.keyval_from_name("Right"):
-            self.x += self.POS_INCREMENT/self.zoom_ratio
+            self.x += self.POS_INCREMENT / self.zoom_ratio
         elif event.keyval == Gdk.keyval_from_name("Up"):
-            self.y -= self.POS_INCREMENT/self.zoom_ratio
+            self.y -= self.POS_INCREMENT / self.zoom_ratio
         elif event.keyval == Gdk.keyval_from_name("Down"):
-            self.y += self.POS_INCREMENT/self.zoom_ratio
+            self.y += self.POS_INCREMENT / self.zoom_ratio
         else:
             return False
         self.bound_vals()
@@ -196,8 +196,8 @@ class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
         if state & Gdk.ModifierType.BUTTON2_MASK or state & Gdk.ModifierType.BUTTON1_MASK:
             x, y = int(event.x), int(event.y)
             # pan the image
-            self.x += (self.prevmousex - x)/self.zoom_ratio
-            self.y += (self.prevmousey - y)/self.zoom_ratio
+            self.x += (self.prevmousex - x) / self.zoom_ratio
+            self.y += (self.prevmousey - y) / self.zoom_ratio
             self.bound_vals()
             self.queue_draw()
             self.prevmousex = x
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
index cd64a716c7..c905205c8e 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py.in
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -139,7 +139,7 @@ def main(argv=None):
 			else:
 			    duration = proc_tree.duration
 			dur = duration / 100.0
-			print('%02d:%05.2f' % (math.floor(dur/60), dur - 60 * math.floor(dur/60)))
+			print('%02d:%05.2f' % (math.floor(dur / 60), dur - 60 * math.floor(dur / 60)))
 		else:
 			if options.annotate_file:
 				f = open(options.annotate_file, "w")
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 43c8cf65ad..3dc5da081b 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -38,7 +38,7 @@ class Trace:
         self.min = None
         self.max = None
         self.headers = None
-        self.disk_stats =  []
+        self.disk_stats = []
         self.ps_stats = None
         self.taskstats = None
         self.cpu_stats = []
@@ -177,12 +177,12 @@ class Trace:
             k = j + 1
             while k < len(util) and util[k][0] < start + 300:
                 k += 1
-            k = min(k, len(util)-1)
+            k = min(k, len(util) - 1)
 
             if util[j][1] >= 0.25:
                 return False
 
-            avgload = sum(u[1] for u in util[j:k+1]) / (k-j+1)
+            avgload = sum(u[1] for u in util[j:k + 1]) / (k - j + 1)
             if avgload < 0.25:
                 return True
             else:
@@ -304,8 +304,8 @@ def _parse_proc_ps_log(writer, file):
                 continue
 
             offset = [index for index, token in enumerate(tokens[1:]) if token[-1] == ')'][0]
-            pid, cmd, state, ppid = int(tokens[0]), ' '.join(tokens[1:2+offset]), tokens[2+offset], int(tokens[3+offset])
-            userCpu, sysCpu, stime = int(tokens[13+offset]), int(tokens[14+offset]), int(tokens[21+offset])
+            pid, cmd, state, ppid = int(tokens[0]), ' '.join(tokens[1:2 + offset]), tokens[2 + offset], int(tokens[3 + offset])
+            userCpu, sysCpu, stime = int(tokens[13 + offset]), int(tokens[14 + offset]), int(tokens[21 + offset])
 
             # magic fixed point-ness ...
             pid *= 1000
@@ -330,7 +330,7 @@ def _parse_proc_ps_log(writer, file):
         return None
 
     startTime = timed_blocks[0][0]
-    avgSampleLength = (ltime - startTime)/(len(timed_blocks) - 1)
+    avgSampleLength = (ltime - startTime) / (len(timed_blocks) - 1)
 
     return ProcessStats(writer, processMap, len(timed_blocks), avgSampleLength, startTime, ltime)
 
@@ -417,7 +417,7 @@ def _parse_taskstats_log(writer, file):
         return None
 
     startTime = timed_blocks[0][0]
-    avgSampleLength = (ltime - startTime)/(len(timed_blocks)-1)
+    avgSampleLength = (ltime - startTime) / (len(timed_blocks) - 1)
 
     return ProcessStats(writer, processMap, len(timed_blocks), avgSampleLength, startTime, ltime)
 
@@ -438,7 +438,7 @@ def _parse_proc_stat_log(file):
             iowait = float(times[4] - ltimes[4])
 
             aSum = max(user + system + idle + iowait, 1)
-            samples.append(CPUSample(time, user/aSum, system/aSum, iowait/aSum))
+            samples.append(CPUSample(time, user / aSum, system / aSum, iowait / aSum))
 
         ltimes = times
         # skip the rest of statistics lines
@@ -644,7 +644,7 @@ def _parse_pacct(writer, file):
     # read LE int32
     def _read_le_int32(file):
         byts = file.read(4)
-        return (ord(byts[0]))       | (ord(byts[1]) << 8) | \
+        return (ord(byts[0])) | (ord(byts[1]) << 8) | \
                (ord(byts[2]) << 16) | (ord(byts[3]) << 24)
 
     parent_map = {}
@@ -746,7 +746,7 @@ def _do_parse(writer, state, filename, file):
     elif not filename.endswith('.log'):
         _parse_bitbake_buildstats(writer, state, filename, file)
     t2 = time.process_time()
-    writer.info("  %s seconds" % str(t2-t1))
+    writer.info("  %s seconds" % str(t2 - t1))
     return state
 
 def parse_file(writer, state, filename):
diff --git a/scripts/pybootchartgui/pybootchartgui/process_tree.py b/scripts/pybootchartgui/pybootchartgui/process_tree.py
index b429e4b9ba..3e94db3f3a 100644
--- a/scripts/pybootchartgui/pybootchartgui/process_tree.py
+++ b/scripts/pybootchartgui/pybootchartgui/process_tree.py
@@ -246,11 +246,11 @@ class ProcessTree:
         """
         num_removed = 0
         idx = 0
-        while idx < len(process_subtree)-1:
+        while idx < len(process_subtree) - 1:
             p = process_subtree[idx]
-            nextp = process_subtree[idx+1]
+            nextp = process_subtree[idx + 1]
             if nextp.cmd == p.cmd:
-                process_subtree.pop(idx+1)
+                process_subtree.pop(idx + 1)
                 idx -= 1
                 num_removed += 1
                 p.child_list.extend(nextp.child_list)
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index 0b46c1491c..4a55427655 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -143,7 +143,7 @@ class Process:
 
         activeCount = sum([1 for sample in self.samples if sample.cpu_sample and sample.cpu_sample.sys + sample.cpu_sample.user + sample.cpu_sample.io > 0.0])
         activeCount = activeCount + sum([1 for sample in self.samples if sample.state == 'D'])
-        self.active = (activeCount>2)
+        self.active = (activeCount > 2)
 
     def calc_load(self, userCpu, sysCpu, interval):
         userCpuLoad = float(userCpu - self.last_user_cpu_time) / interval
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
index 18943f3037..1f66027a6e 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
@@ -15,7 +15,7 @@ import pybootchartgui.main as main
 debug = False
 
 def floatEq(f1, f2):
-	return math.fabs(f1-f2) < 0.00001
+	return math.fabs(f1 - f2) < 0.00001
 
 bootchart_dir = os.path.join(os.path.dirname(sys.argv[0]), '../../examples/1/')
 parser = main._mk_options_parser()
diff --git a/scripts/pythondeps b/scripts/pythondeps
index be21dd84eb..7b41c336a1 100755
--- a/scripts/pythondeps
+++ b/scripts/pythondeps
@@ -80,7 +80,7 @@ def get_provides(path):
     else:
         libdir = ''
 
-    package_relpath = pkg_path[len(libdir)+1:]
+    package_relpath = pkg_path[len(libdir) + 1:]
     package = '.'.join(package_relpath.split(os.sep))
     if not isdir:
         yield package, path
@@ -89,7 +89,7 @@ def get_provides(path):
             yield package, path
 
         for dirpath, dirnames, filenames in os.walk(path):
-            relpath = dirpath[len(path)+1:]
+            relpath = dirpath[len(path) + 1:]
             if relpath:
                 if '__init__.py' not in filenames:
                     dirnames[:] = []
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 692a9d5ed6..b919e0167d 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -31,7 +31,7 @@ old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
 
 def get_arch():
     f.seek(0)
-    e_ident =f.read(16)
+    e_ident = f.read(16)
     ei_mag0,ei_mag1_3,ei_class = struct.unpack("<B3sB11x", e_ident)
 
     if (ei_mag0 != 0x7f and ei_mag1_3 != "ELF") or ei_class == 0:
@@ -217,10 +217,10 @@ executables_list = sys.argv[3:]
 
 for e in executables_list:
     perms = os.stat(e)[stat.ST_MODE]
-    if os.access(e, os.W_OK|os.R_OK):
+    if os.access(e, os.W_OK | os.R_OK):
         perms = None
     else:
-        os.chmod(e, perms|stat.S_IRWXU)
+        os.chmod(e, perms | stat.S_IRWXU)
 
     try:
         f = open(e, "r+b")
diff --git a/scripts/runqemu b/scripts/runqemu
index 2f2ef17fa1..fceebfce4c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -217,7 +217,7 @@ class BaseConfig(object):
         logger.debug("Acquiring lockfile %s..." % self.taplock)
         try:
             self.taplock_descriptor = open(self.taplock, 'w')
-            fcntl.flock(self.taplock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
+            fcntl.flock(self.taplock_descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
         except Exception as e:
             msg = "Acquiring lockfile %s failed: %s" % (self.taplock, e)
             if error:
@@ -261,7 +261,7 @@ class BaseConfig(object):
         try:
             portlock_descriptor = open(lockfile, 'w')
             self.portlocks.update({lockfile: portlock_descriptor})
-            fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_EX|fcntl.LOCK_NB)
+            fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_EX | fcntl.LOCK_NB)
         except Exception as e:
             msg = "Acquiring lockfile %s failed: %s" % (lockfile, e)
             logger.info(msg)
@@ -352,7 +352,7 @@ class BaseConfig(object):
         elif re.search('\.bin$', p) or re.search('bzImage', p) or \
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
-            self.kernel =  p
+            self.kernel = p
         elif os.path.exists(p) and (not os.path.isdir(p)) and '-image-' in os.path.basename(p):
             self.rootfs = p
             # Check filename against self.fstypes can hanlde <file>.cpio.gz,
@@ -365,7 +365,7 @@ class BaseConfig(object):
             if not fst:
                 m = re.search('.*\.(.*)$', self.rootfs)
                 if m:
-                    fst =  m.group(1)
+                    fst = m.group(1)
             if fst:
                 self.check_arg_fstype(fst)
                 qb = re.sub('\.' + fst + "$", '', self.rootfs)
@@ -565,7 +565,7 @@ class BaseConfig(object):
             logger.error("For further help see:")
             raise RunQemuError(yocto_kvm_wiki)
 
-        if os.access(dev_kvm, os.W_OK|os.R_OK):
+        if os.access(dev_kvm, os.W_OK | os.R_OK):
             self.qemu_opt_script += ' -enable-kvm'
             if self.get('MACHINE') == "qemux86":
                 # Workaround for broken APIC window on pre 4.15 host kernels which causes boot hangs
@@ -583,7 +583,7 @@ class BaseConfig(object):
                 logger.error("For further help see:")
                 raise RunQemuError(yocto_paravirt_kvm_wiki)
 
-            if not os.access(dev_vhost, os.W_OK|os.R_OK):
+            if not os.access(dev_vhost, os.W_OK | os.R_OK):
                 logger.error("You have no read or write permission on /dev/vhost-net.")
                 logger.error("Please change the ownership of this file as described at:")
                 raise RunQemuError(yocto_paravirt_kvm_wiki)
@@ -856,7 +856,7 @@ class BaseConfig(object):
                 self.qemuboot = "%s/%s-%s.qemuboot.conf" % (deploy_dir_image,
                         self.rootfs, machine)
             else:
-                cmd = 'ls -t %s/*.qemuboot.conf' %  deploy_dir_image
+                cmd = 'ls -t %s/*.qemuboot.conf' % deploy_dir_image
                 logger.debug('Running %s...' % cmd)
                 try:
                     qbs = subprocess.check_output(cmd, shell=True).decode('utf-8')
@@ -958,7 +958,7 @@ class BaseConfig(object):
         except KeyError:
             fstype_flags = ''
         logoutput.append('FSTYPE: [%s%s]' % (self.fstype, fstype_flags))
-        if self.fstype  == 'nfs':
+        if self.fstype == 'nfs':
             logoutput.append('NFS_DIR: [%s]' % self.rootfs)
         else:
             logoutput.append('ROOTFS: [%s]' % self.rootfs)
@@ -998,7 +998,7 @@ class BaseConfig(object):
             # Use '%s' since they are integers
             os.putenv(k, '%s' % v)
 
-        self.unfs_opts="nfsvers=3,port=%s,tcp,mountport=%s" % (nfsd_port, mountd_port)
+        self.unfs_opts = "nfsvers=3,port=%s,tcp,mountport=%s" % (nfsd_port, mountd_port)
 
         # Extract .tar.bz2 or .tar.bz if no nfs dir
         if not (self.rootfs and os.path.isdir(self.rootfs)):
@@ -1127,7 +1127,7 @@ class BaseConfig(object):
             if self.acquire_taplock(error=False):
                 tap = p
                 logger.info("Using preconfigured tap device %s" % tap)
-                logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
+                logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." % (lockfile, tap))
                 break
 
         if not tap:
@@ -1354,13 +1354,13 @@ class BaseConfig(object):
                     self.qemu_opt += 'gl=es,'
             self.qemu_opt += 'show-cursor=on'
 
-        self.qemu_opt += ' %s' %self.get('QB_GRAPHICS')
+        self.qemu_opt += ' %s' % self.get('QB_GRAPHICS')
 
     def setup_serial(self):
         # Setup correct kernel command line for serial
         if self.serialstdio == True or self.serialconsole == True or self.nographic == True or self.tcpserial_portnum:
             for entry in self.get('SERIAL_CONSOLES').split(' '):
-                self.kernel_cmdline_script += ' console=%s' %entry.split(';')[1]
+                self.kernel_cmdline_script += ' console=%s' % entry.split(';')[1]
 
         if self.serialstdio == True or self.nographic == True:
             self.qemu_opt += " -serial mon:stdio"
diff --git a/scripts/send-error-report b/scripts/send-error-report
index ffa0a199b1..3fa03af2cf 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -66,7 +66,7 @@ def edit_content(json_file_path):
 
 def prepare_data(args):
     # attempt to get the max_log_size from the server's settings
-    max_log_size = getPayloadLimit(args.protocol+args.server+"/ClientPost/JSON")
+    max_log_size = getPayloadLimit(args.protocol + args.server + "/ClientPost/JSON")
 
     if not os.path.isfile(args.error_file):
         log.error("No data file found.")
@@ -89,7 +89,7 @@ def prepare_data(args):
         pass
 
     if args.assume_yes == True and len(args.name) == 0:
-        log.error("Name needs to be provided either via "+userfile+" or as an argument (-n).")
+        log.error("Name needs to be provided either via " + userfile + " or as an argument (-n).")
         sys.exit(1)
 
     while len(args.name) <= 0 or len(args.name) > 50:
@@ -133,12 +133,12 @@ def prepare_data(args):
 
 
 def send_data(data, args):
-    headers={'Content-type': 'application/json', 'User-Agent': "send-error-report/"+version}
+    headers = {'Content-type': 'application/json', 'User-Agent': "send-error-report/" + version}
 
     if args.json:
-        url = args.protocol+args.server+"/ClientPost/JSON/"
+        url = args.protocol + args.server + "/ClientPost/JSON/"
     else:
-        url = args.protocol+args.server+"/ClientPost/"
+        url = args.protocol + args.server + "/ClientPost/"
 
     req = urllib.request.Request(url, data=data, headers=headers)
     try:
@@ -201,7 +201,7 @@ if __name__ == '__main__':
     args = arg_parse.parse_args()
 
     if (args.json == False):
-        print("Preparing to send errors to: "+args.server)
+        print("Preparing to send errors to: " + args.server)
 
     data = prepare_data(args)
     send_data(data, args)
diff --git a/scripts/sysroot-relativelinks.py b/scripts/sysroot-relativelinks.py
index 56e36f3ad5..667d95404b 100755
--- a/scripts/sysroot-relativelinks.py
+++ b/scripts/sysroot-relativelinks.py
@@ -23,9 +23,9 @@ def handlelink(filep, subdir):
     if link.startswith(topdir):
         return
     #print("Replacing %s with %s for %s" % (link, topdir+link, filep))
-    print("Replacing %s with %s for %s" % (link, os.path.relpath(topdir+link, subdir), filep))
+    print("Replacing %s with %s for %s" % (link, os.path.relpath(topdir + link, subdir), filep))
     os.unlink(filep)
-    os.symlink(os.path.relpath(topdir+link, subdir), filep)
+    os.symlink(os.path.relpath(topdir + link, subdir), filep)
 
 for subdir, dirs, files in os.walk(topdir):
     for f in dirs + files:
diff --git a/scripts/task-time b/scripts/task-time
index bcd1e25817..a008a0ea3d 100755
--- a/scripts/task-time
+++ b/scripts/task-time
@@ -41,11 +41,11 @@ sorted in descending order from the highest value.
 args = arg_parser.parse_args()
 
 # Field names and regexes for parsing out their values from buildstat files
-field_regexes = (("elapsed",    ".*Elapsed time: ([0-9.]+)"),
-                 ("user",       "rusage ru_utime: ([0-9.]+)"),
-                 ("sys",        "rusage ru_stime: ([0-9.]+)"),
+field_regexes = (("elapsed", ".*Elapsed time: ([0-9.]+)"),
+                 ("user", "rusage ru_utime: ([0-9.]+)"),
+                 ("sys", "rusage ru_stime: ([0-9.]+)"),
                  ("child user", "Child rusage ru_utime: ([0-9.]+)"),
-                 ("child sys",  "Child rusage ru_stime: ([0-9.]+)"))
+                 ("child sys", "Child rusage ru_stime: ([0-9.]+)"))
 
 # A list of (<path>, <dict>) tuples, where <path> is the path of a do_* task
 # buildstat file and <dict> maps fields from the file to their values
@@ -127,9 +127,9 @@ try:
               "user\t{}m{:.3f}s\n"
               "sys\t{}m{:.3f}s"
               .format(task_info[0],
-                      int(real//60), real%60,
-                      int(user//60), user%60,
-                      int(sys//60), sys%60))
+                      int(real // 60), real % 60,
+                      int(user // 60), user % 60,
+                      int(sys // 60), sys % 60))
 
 except BrokenPipeError:
     pass
diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index 01c561b9a9..b9c1c42f41 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -40,7 +40,7 @@ class Sizes:
 
     def show(self, indent=""):
         print("%-32s %10d | %10d %10d %10d" %
-              (indent+self.title, self.total, self.text, self.data, self.bss))
+              (indent + self.title, self.total, self.text, self.data, self.bss))
 
 
 class Report:
@@ -86,7 +86,7 @@ class Report:
     def show(self, indent=""):
         rule = str.ljust(indent, 80, '-')
         print("%-32s %10s | %10s %10s %10s" %
-              (indent+self.title, "total", "text", "data", "bss"))
+              (indent + self.title, "total", "text", "data", "bss"))
         print(rule)
         self.sizes.show(indent)
         print(rule)
@@ -95,10 +95,10 @@ class Report:
                 p.sizes.show(indent)
         print(rule)
         print("%-32s %10d | %10d %10d %10d" %
-              (indent+"sum", self.totals["total"], self.totals["text"],
+              (indent + "sum", self.totals["total"], self.totals["text"],
                self.totals["data"], self.totals["bss"]))
         print("%-32s %10d | %10d %10d %10d" %
-              (indent+"delta", self.deltas["total"], self.deltas["text"],
+              (indent + "delta", self.deltas["total"], self.deltas["text"],
                self.deltas["data"], self.deltas["bss"]))
         print("\n")
 
@@ -140,7 +140,7 @@ def main():
             assert False, "unhandled option"
 
     glob = "arch/*/built-in.[o,a] */built-in.[o,a]"
-    vmlinux = Report.create("vmlinux",  "Linux Kernel", glob)
+    vmlinux = Report.create("vmlinux", "Linux Kernel", glob)
 
     vmlinux.show()
     for b in vmlinux.parts:
diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index a63f6c8115..7e44af3410 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -95,7 +95,7 @@ def get_tinfoil():
     # tinfoil.logger.setLevel(logging.WARNING)
     return tinfoil
 
-if __name__=='__main__':
+if __name__ == '__main__':
     import argparse
     import shutil
 
diff --git a/scripts/wic b/scripts/wic
index 9fd2551b6f..17ed688bf4 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -277,31 +277,31 @@ wic_help_topic_usage = """
 """
 
 helptopics = {
-    "plugins":   [wic_help_topic_subcommand,
+    "plugins": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_plugins_help],
-    "overview":  [wic_help_topic_subcommand,
+    "overview": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_overview_help],
     "kickstart": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_kickstart_help],
-    "create":    [wic_help_topic_subcommand,
+    "create": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_create_help],
-    "ls":        [wic_help_topic_subcommand,
+    "ls": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_ls_help],
-    "cp":        [wic_help_topic_subcommand,
+    "cp": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_cp_help],
-    "rm":        [wic_help_topic_subcommand,
+    "rm": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_rm_help],
-    "write":     [wic_help_topic_subcommand,
+    "write": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_write_help],
-    "list":      [wic_help_topic_subcommand,
+    "list": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_list_help]
 }
@@ -458,31 +458,31 @@ def wic_init_parser_help(subparser):
 
 
 subcommands = {
-    "create":    [wic_create_subcommand,
+    "create": [wic_create_subcommand,
                   hlp.wic_create_usage,
                   hlp.wic_create_help,
                   wic_init_parser_create],
-    "list":      [wic_list_subcommand,
+    "list": [wic_list_subcommand,
                   hlp.wic_list_usage,
                   hlp.wic_list_help,
                   wic_init_parser_list],
-    "ls":        [wic_ls_subcommand,
+    "ls": [wic_ls_subcommand,
                   hlp.wic_ls_usage,
                   hlp.wic_ls_help,
                   wic_init_parser_ls],
-    "cp":        [wic_cp_subcommand,
+    "cp": [wic_cp_subcommand,
                   hlp.wic_cp_usage,
                   hlp.wic_cp_help,
                   wic_init_parser_cp],
-    "rm":        [wic_rm_subcommand,
+    "rm": [wic_rm_subcommand,
                   hlp.wic_rm_usage,
                   hlp.wic_rm_help,
                   wic_init_parser_rm],
-    "write":     [wic_write_subcommand,
+    "write": [wic_write_subcommand,
                   hlp.wic_write_usage,
                   hlp.wic_write_help,
                   wic_init_parser_write],
-    "help":      [wic_help_subcommand,
+    "help": [wic_help_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_help_help,
                   wic_init_parser_help]
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index c345ca5674..58f180e889 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -219,7 +219,7 @@ def main():
 
 if __name__ == '__main__':
     try:
-        ret =  main()
+        ret = main()
     except Exception:
         ret = 1
         import traceback
-- 
2.32.0

