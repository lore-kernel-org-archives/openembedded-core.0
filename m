Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.7569.1624859960291652780
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 22:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AOOdPg1T;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id c5so13219398pfv.8
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 22:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YKSw4BoBbKm1ZC8TgFIzIMoJDT1BYYf6nzPli0RCv7I=;
        b=AOOdPg1TZTX1BzqmZsLVntia7zkvO1aLvZAsyuk9EfiF3GAreJHivsgXs+Rw4JNpr+
         qSSvVM3XxecFXW3U4xsbCBS1fEPXDJeZrx4w1Vyy+evdVkGrhl1oie6xkFBhbJAQCsNc
         8UD+VOz4MNDKizS4s7hXhK0GeNc3jFFdCozRt9+5dadrLkMzOa87LA+nffFQ7187rc9n
         xcwc5IpzMd+NvlZMCuUFvmCsIjLkMmi6cWswRkUwTmkv0pXh/kCs4h+nzSBRzcZrNRc9
         vkRAgKgPKpwCRivi9ZQAgDRh6hizOjNSjxNUD0PxSYvbTjVS2nhtYKv/AGQBWxNdqla2
         BumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YKSw4BoBbKm1ZC8TgFIzIMoJDT1BYYf6nzPli0RCv7I=;
        b=ugg+085XwOfEPdM3XBEZXcgjwdoOSuctfTGATP8NZd/fEV/jhKgT/lr6irUeFDMc/d
         vF5WnqtRJRQFGeEWkXXT57QRa6fMOkMZvkci9iIMLUBeRYofSwS3IhAJw1FXQfG+CZ5p
         LyQ9rB+zTSr1L/zDvr/ohqKtC1YdInwq3YKEh4QfK/JmCNYOLjeOYUR4JF75JJCcAitW
         2ENmKVNAluoSo/eqMafAgBHhGoGzmz7Z6a4YPiibNstQ2TXqfFHlFEUPsw5SSsJZZzLg
         FHYxWYTraU8ACAClNobIIXIC+tUWJ4yeqUVYagX7AftF9kCFche1+rLV3rkUjBfImPyz
         Ffdw==
X-Gm-Message-State: AOAM532XnxeEXoBjqp9BboBtYT7gybZ+piyMRs2XmIFZgNCKlsMXNn4P
	8HW5gf/F37TbBRLPYgAR849MMhoJynmaFw==
X-Google-Smtp-Source: ABdhPJwDSTJaqUx4I6hvVUugrAfCpnsLQs7MGpjB0Vx82xhH++8l1k8r/VHQ/J8AcpJSRrgqwTQe9Q==
X-Received: by 2002:a63:2503:: with SMTP id l3mr21618978pgl.237.1624859958970;
        Sun, 27 Jun 2021 22:59:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b522])
        by smtp.gmail.com with ESMTPSA id c18sm12768912pgf.66.2021.06.27.22.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 22:59:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/8] PEP8 double aggressive E701, E70 and E502
Date: Sun, 27 Jun 2021 22:59:09 -0700
Message-Id: <20210628055915.1107-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628055915.1107-1-raj.khem@gmail.com>
References: <20210628055915.1107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/buildhistory_analysis.py          |  4 +-
 meta/lib/oe/distro_check.py                   |  3 +-
 meta/lib/oe/gpg_sign.py                       |  2 +-
 meta/lib/oe/package_manager/__init__.py       | 11 +--
 meta/lib/oe/package_manager/deb/__init__.py   |  4 +-
 meta/lib/oe/package_manager/deb/rootfs.py     |  4 +-
 meta/lib/oe/package_manager/ipk/rootfs.py     |  4 +-
 meta/lib/oe/prservice.py                      |  2 +-
 meta/lib/oe/sdk.py                            |  2 +-
 meta/lib/oe/terminal.py                       |  3 +-
 meta/lib/oe/utils.py                          |  4 +-
 meta/lib/oeqa/core/case.py                    |  2 +-
 meta/lib/oeqa/core/context.py                 |  4 +-
 meta/lib/oeqa/core/decorator/data.py          |  2 +-
 meta/lib/oeqa/core/decorator/depends.py       |  6 +-
 meta/lib/oeqa/core/loader.py                  | 18 ++---
 meta/lib/oeqa/oetest.py                       |  4 +-
 meta/lib/oeqa/runtime/context.py              | 10 +--
 meta/lib/oeqa/sdk/case.py                     |  2 +-
 meta/lib/oeqa/sdk/cases/buildgalculator.py    |  2 +-
 meta/lib/oeqa/sdk/cases/gcc.py                |  2 +-
 meta/lib/oeqa/sdk/context.py                  |  8 +--
 meta/lib/oeqa/sdkext/case.py                  |  2 +-
 meta/lib/oeqa/sdkext/cases/devtool.py         |  2 +-
 meta/lib/oeqa/sdkext/testsdk.py               |  4 +-
 meta/lib/oeqa/selftest/case.py                |  8 +--
 meta/lib/oeqa/selftest/cases/manifest.py      | 38 ++++++-----
 meta/lib/oeqa/selftest/cases/wic.py           | 68 +++++++++----------
 meta/lib/oeqa/selftest/context.py             |  4 +-
 meta/lib/oeqa/utils/__init__.py               |  8 +--
 meta/lib/oeqa/utils/testexport.py             |  6 +-
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |  2 +-
 scripts/bitbake-whatchanged                   |  4 +-
 scripts/combo-layer                           | 12 ++--
 scripts/lib/checklayer/__init__.py            |  4 +-
 scripts/lib/checklayer/cases/bsp.py           |  4 +-
 scripts/lib/checklayer/cases/common.py        |  4 +-
 scripts/lib/checklayer/cases/distro.py        |  4 +-
 scripts/lib/devtool/sdk.py                    |  4 +-
 scripts/lib/wic/engine.py                     |  6 +-
 scripts/lib/wic/filemap.py                    |  2 +-
 scripts/lib/wic/ksparser.py                   |  4 +-
 scripts/lib/wic/misc.py                       |  2 +-
 scripts/lib/wic/plugins/imager/direct.py      | 18 ++---
 scripts/lib/wic/plugins/source/bootimg-efi.py |  2 +-
 .../wic/plugins/source/bootimg-partition.py   |  2 +-
 .../wic/plugins/source/isoimage-isohybrid.py  | 10 +--
 scripts/oe-pkgdata-browser                    |  2 +-
 .../pybootchartgui/pybootchartgui/batch.py    |  2 +-
 scripts/pybootchartgui/pybootchartgui/draw.py | 62 ++++++++---------
 .../pybootchartgui/pybootchartgui/parsing.py  |  8 ++-
 .../pybootchartgui/pybootchartgui/samples.py  |  2 +-
 .../pybootchartgui/tests/parser_test.py       |  2 +-
 .../pybootchartgui/tests/process_tree_test.py |  2 +-
 scripts/relocate_sdk.py                       | 10 +--
 scripts/runqemu                               |  4 +-
 scripts/tiny/dirsize.py                       |  2 +-
 scripts/tiny/ksize.py                         |  8 +--
 scripts/tiny/ksum.py                          | 12 ++--
 scripts/yocto-check-layer                     |  6 +-
 60 files changed, 230 insertions(+), 219 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index b1856846b6..9869564e7f 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -89,9 +89,9 @@ class ChangeRecord:
         def detect_renamed_dirs(aitems, bitems):
             adirs = set(map(os.path.dirname, aitems))
             bdirs = set(map(os.path.dirname, bitems))
-            files_ab = [(name, sorted(os.path.basename(item) for item in aitems if os.path.dirname(item) == name)) \
+            files_ab = [(name, sorted(os.path.basename(item) for item in aitems if os.path.dirname(item) == name))
                                 for name in adirs - bdirs]
-            files_ba = [(name, sorted(os.path.basename(item) for item in bitems if os.path.dirname(item) == name)) \
+            files_ba = [(name, sorted(os.path.basename(item) for item in bitems if os.path.dirname(item) == name))
                                 for name in bdirs - adirs]
             renamed_dirs = []
             for dir1, files1 in files_ab:
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 88e46c354d..3daff5f547 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -69,7 +69,8 @@ def get_source_package_list_from_url_by_letter(url, section, d):
         try:
             packages |= get_source_package_list_from_url(url + "/" + letter, section, d)
         except HTTPError as e:
-            if e.code != 404: raise
+            if e.code != 404:
+                raise
     return packages
 
 def get_latest_released_fedora_source_package_list(d):
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 492f096eaa..d9045ecd94 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -82,7 +82,7 @@ class LocalSigner(object):
         try:
             if passphrase_file:
                 with open(passphrase_file) as fobj:
-                    passphrase = fobj.readline();
+                    passphrase = fobj.readline()
 
             job = subprocess.Popen(cmd, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
             (_, stderr) = job.communicate(passphrase.encode("utf-8"))
diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 4d22bc0296..1a039edda4 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -97,7 +97,7 @@ Details of the failure are in %s.""" %(pkgs, log_path))
 def generate_locale_archive(d, rootfs, target_arch, localedir):
     # Pretty sure we don't need this for locale archive generation but
     # keeping it to be safe...
-    locale_arch_options = { \
+    locale_arch_options = {
         "arc": ["--uint32-align=4", "--little-endian"],
         "arceb": ["--uint32-align=4", "--big-endian"],
         "arm": ["--uint32-align=4", "--little-endian"],
@@ -239,7 +239,8 @@ class PackageManager(object, metaclass=ABCMeta):
 
             try:
                 output = subprocess.check_output(script_full, stderr=subprocess.STDOUT)
-                if output: bb.note(output.decode("utf-8"))
+                if output:
+                    bb.note(output.decode("utf-8"))
             except subprocess.CalledProcessError as e:
                 bb.note("Exit code %d. Output:\n%s" % (e.returncode, e.output.decode("utf-8")))
                 if populate_sdk == 'host':
@@ -331,7 +332,8 @@ class PackageManager(object, metaclass=ABCMeta):
             bb.note('Running %s' % cmd)
             proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             stdout, stderr = proc.communicate()
-            if stderr: bb.note(stderr.decode("utf-8"))
+            if stderr:
+                bb.note(stderr.decode("utf-8"))
             pkgs = stdout.decode("utf-8")
             self.install(pkgs.split(), attempt_only=True)
         except subprocess.CalledProcessError as e:
@@ -390,7 +392,8 @@ class PackageManager(object, metaclass=ABCMeta):
                 bb.note('Running %s' % cmd)
                 proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                 stdout, stderr = proc.communicate()
-                if stderr: bb.note(stderr.decode("utf-8"))
+                if stderr:
+                    bb.note(stderr.decode("utf-8"))
                 complementary_pkgs = stdout.decode("utf-8")
                 complementary_pkgs = set(complementary_pkgs.split())
                 skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index a4b6b6f647..f877e6ea9a 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -419,7 +419,7 @@ class DpkgPM(OpkgDpkgPM):
                                    os.path.join(self.deploy_dir, arch))
 
         base_arch_list = base_archs.split()
-        multilib_variants = self.d.getVar("MULTILIB_VARIANTS");
+        multilib_variants = self.d.getVar("MULTILIB_VARIANTS")
         for variant in multilib_variants.split():
             localdata = bb.data.createCopy(self.d)
             variant_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + variant, False)
@@ -437,7 +437,7 @@ class DpkgPM(OpkgDpkgPM):
                     if match_arch:
                         for base_arch in base_arch_list:
                             architectures += "\"%s\";" % base_arch
-                        apt_conf.write("  Architectures {%s};\n" % architectures);
+                        apt_conf.write("  Architectures {%s};\n" % architectures)
                         apt_conf.write("  Architecture \"%s\";\n" % base_archs)
                     else:
                         line = re.sub(r"#ROOTFS#", self.target_rootfs, line)
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index 8fbaca11d6..56ed7e2359 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -81,8 +81,8 @@ class DpkgOpkgRootfs(Rootfs):
             for edge in graph[node]:
                 if edge not in resolved:
                     if edge in seen:
-                        raise RuntimeError("Packages %s and %s have " \
-                                "a circular dependency in postinsts scripts." \
+                        raise RuntimeError("Packages %s and %s have "
+                                "a circular dependency in postinsts scripts."
                                 % (node, edge))
                     _dep_resolve(graph, edge, resolved, seen)
 
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index 26dbee6f6a..077c061c91 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -82,8 +82,8 @@ class DpkgOpkgRootfs(Rootfs):
             for edge in graph[node]:
                 if edge not in resolved:
                     if edge in seen:
-                        raise RuntimeError("Packages %s and %s have " \
-                                "a circular dependency in postinsts scripts." \
+                        raise RuntimeError("Packages %s and %s have "
+                                "a circular dependency in postinsts scripts."
                                 % (node, edge))
                     _dep_resolve(graph, edge, resolved, seen)
 
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 15ce060ff6..a8d82783c4 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -82,7 +82,7 @@ def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
     with open(df, "a") as f:
         if metainfo:
             #dump column info
-            f.write("#PR_core_ver = \"%s\"\n\n" % metainfo['core_ver']);
+            f.write("#PR_core_ver = \"%s\"\n\n" % metainfo['core_ver'])
             f.write("#Table: %s\n" % metainfo['tbl_name'])
             f.write("#Columns:\n")
             f.write("#name      \t type    \t notn    \t dflt    \t pk\n")
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 37b59afd1a..5e854b7c62 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -93,7 +93,7 @@ class Sdk(object, metaclass=ABCMeta):
             if linguas == "all":
                 pm.install_glob("nativesdk-glibc-binary-localedata-*.utf-8", sdk=True)
             else:
-                pm.install(["nativesdk-glibc-binary-localedata-%s.utf-8" % \
+                pm.install(["nativesdk-glibc-binary-localedata-%s.utf-8" %
                            lang for lang in linguas.split()])
             # Generate a locale archive of them
             target_arch = self.d.getVar('SDK_ARCH')
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 59aa80de66..80e76adc21 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -63,7 +63,8 @@ class Gnome(XTerminal):
         # https://bugzilla.gnome.org/show_bug.cgi?id=732127; as a workaround,
         # clearing the LC_ALL environment variable so it uses the locale.
         # Once fixed on the gnome-terminal project, this should be removed.
-        if os.getenv('LC_ALL'): os.putenv('LC_ALL','')
+        if os.getenv('LC_ALL'):
+            os.putenv('LC_ALL','')
 
         XTerminal.__init__(self, sh_cmd, title, env, d)
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 789bad33f6..c9b2be9dc3 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -391,7 +391,7 @@ def get_host_compiler_version(d, taskcontextonly=False):
         # datastore PATH does not contain session PATH as set by environment-setup-...
         # this breaks the install-buildtools use-case
         # env["PATH"] = d.getVar("PATH")
-        output = subprocess.check_output("%s --version" % compiler, \
+        output = subprocess.check_output("%s --version" % compiler,
                     shell=True, env=env, stderr=subprocess.STDOUT).decode("utf-8")
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
@@ -418,7 +418,7 @@ def host_gcc_version(d, taskcontextonly=False):
     try:
         env = os.environ.copy()
         env["PATH"] = d.getVar("PATH")
-        output = subprocess.check_output("%s --version" % compiler, \
+        output = subprocess.check_output("%s --version" % compiler,
                     shell=True, env=env, stderr=subprocess.STDOUT).decode("utf-8")
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index bc4446a938..0a8aff182e 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -14,7 +14,7 @@ def _validate_td_vars(td, td_vars, type_msg):
     if td_vars:
         for v in td_vars:
             if not v in td:
-                raise OEQAMissingVariable("Test %s need %s variable but"\
+                raise OEQAMissingVariable("Test %s need %s variable but"
                         " isn't into td" % (type_msg, v))
 
 class OETestCase(unittest.TestCase):
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 2abe353d27..cb460f7496 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -144,7 +144,7 @@ class OETestContextExecutor(object):
         if self.default_cases:
             self.parser.add_argument('CASES_PATHS', action='store',
                     default=self.default_cases, nargs='*',
-                    help="paths to directories with test cases, default: %s"\
+                    help="paths to directories with test cases, default: %s"
                             % self.default_cases)
         else:
             self.parser.add_argument('CASES_PATHS', action='store',
@@ -153,7 +153,7 @@ class OETestContextExecutor(object):
         self.parser.set_defaults(func=self.run)
 
     def _setup_logger(self, logger, args):
-        formatter = logging.Formatter('%(asctime)s - ' + self.name + \
+        formatter = logging.Formatter('%(asctime)s - ' + self.name +
                 ' - %(levelname)s - %(message)s')
         sh = logger.handlers[0]
         sh.setFormatter(formatter)
diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index bc4939e87c..23555bc8d3 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -113,7 +113,7 @@ class OETestDataDepends(OETestDecorator):
             try:
                 value = self.case.td[v]
             except KeyError:
-                raise OEQAMissingVariable("Test case need %s variable but"\
+                raise OEQAMissingVariable("Test case need %s variable but"
                         " isn't into td" % v)
 
 @registerDecorator
diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index 33f0841cab..eef5c8f7ab 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -37,7 +37,7 @@ def _validate_test_case_depends(cases, depends):
             continue
         for dep in depends[case]:
             if not dep in cases:
-                raise OEQADependency("TestCase %s depends on %s and isn't available"\
+                raise OEQADependency("TestCase %s depends on %s and isn't available"
                        ", cases available %s." % (case, dep, str(cases.keys())))
 
 def _order_test_case_by_depends(cases, depends):
@@ -46,7 +46,7 @@ def _order_test_case_by_depends(cases, depends):
         for edge in graph[node]:
             if edge not in resolved:
                 if edge in seen:
-                    raise OEQADependency("Test cases %s and %s have a circular" \
+                    raise OEQADependency("Test cases %s and %s have a circular"
                                        " dependency." % (node, edge))
                 _dep_resolve(graph, edge, resolved, seen)
         resolved.append(node)
@@ -73,7 +73,7 @@ def _skipTestDependency(case, depends):
                 found = True
                 break
         if not found:
-            raise SkipTest("Test case %s depends on %s but it didn't pass/run." \
+            raise SkipTest("Test case %s depends on %s but it didn't pass/run."
                         % (case.id(), dep))
 
 @registerDecorator
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 11978213b8..df7cd5ecc2 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -106,7 +106,7 @@ class OETestLoader(unittest.TestLoader):
         def _handle(obj):
             if isinstance(obj, OETestDecorator):
                 if not obj.__class__ in decoratorClasses:
-                    raise Exception("Decorator %s isn't registered" \
+                    raise Exception("Decorator %s isn't registered"
                             " in decoratorClasses." % obj.__name__)
                 obj.bind(self.tc._registry, case)
 
@@ -217,11 +217,11 @@ class OETestLoader(unittest.TestLoader):
             Returns a suite of all tests cases contained in testCaseClass.
         """
         if issubclass(testCaseClass, unittest.suite.TestSuite):
-            raise TypeError("Test cases should not be derived from TestSuite." \
-                                " Maybe you meant to derive %s from TestCase?" \
+            raise TypeError("Test cases should not be derived from TestSuite."
+                                " Maybe you meant to derive %s from TestCase?"
                                 % testCaseClass.__name__)
         if not issubclass(testCaseClass, unittest.case.TestCase):
-            raise TypeError("Test %s is not derived from %s" % \
+            raise TypeError("Test %s is not derived from %s" %
                     (testCaseClass.__name__, unittest.case.TestCase.__name__))
 
         testCaseNames = self.getTestCaseNames(testCaseClass)
@@ -262,7 +262,7 @@ class OETestLoader(unittest.TestLoader):
                     break
 
             if not found:
-                raise OEQATestNotFound("Not found %s in loaded test cases" % \
+                raise OEQATestNotFound("Not found %s in loaded test cases" %
                         module)
 
     def discover(self):
@@ -300,14 +300,14 @@ class OETestLoader(unittest.TestLoader):
         # module list.
         # Underscore modules are loaded only if specified in module list.
         load_module = True if not module_name.startswith('_') \
-                              and (not self.modules \
-                                   or module_name in self.modules \
-                                   or module_name_small in self.modules \
+                              and (not self.modules
+                                   or module_name in self.modules
+                                   or module_name_small in self.modules
                                    or 'auto' in self.modules) \
                            else False
 
         load_underscore = True if module_name.startswith('_') \
-                                  and (module_name in self.modules or \
+                                  and (module_name in self.modules or
                                   module_name_small in self.modules) \
                                else False
 
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 3136ac2ce5..1f4993c9d5 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -145,8 +145,8 @@ def skipModule(reason, pos=2):
     if modname not in oeTest.tc.testsrequired:
         raise unittest.SkipTest("%s: %s" % (modname, reason))
     else:
-        raise Exception("\nTest %s wants to be skipped.\nReason is: %s" \
-                "\nTest was required in TEST_SUITES, so either the condition for skipping is wrong" \
+        raise Exception("\nTest %s wants to be skipped.\nReason is: %s"
+                "\nTest was required in TEST_SUITES, so either the condition for skipping is wrong"
                 "\nor the image really doesn't have the required feature/package when it should." % (modname, reason))
 
 def skipModuleIf(cond, reason):
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 3826f27642..0ea67bee2f 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -62,15 +62,15 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         runtime_group.add_argument('--target-type', action='store',
                 default=self.default_target_type, choices=['simpleremote', 'qemu'],
-                help="Target type of device under test, default: %s" \
+                help="Target type of device under test, default: %s"
                 % self.default_target_type)
         runtime_group.add_argument('--target-ip', action='store',
                 default=self.default_target_ip,
-                help="IP address of device under test, default: %s" \
+                help="IP address of device under test, default: %s"
                 % self.default_target_ip)
         runtime_group.add_argument('--server-ip', action='store',
                 default=self.default_target_ip,
-                help="IP address of device under test, default: %s" \
+                help="IP address of device under test, default: %s"
                 % self.default_server_ip)
 
         runtime_group.add_argument('--host-dumper-dir', action='store',
@@ -78,12 +78,12 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         runtime_group.add_argument('--packages-manifest', action='store',
                 default=self.default_manifest,
-                help="Package manifest of the image under test, default: %s" \
+                help="Package manifest of the image under test, default: %s"
                 % self.default_manifest)
 
         runtime_group.add_argument('--extract-dir', action='store',
                 default=self.default_extract_dir,
-                help='Directory where extracted packages reside, default: %s' \
+                help='Directory where extracted packages reside, default: %s'
                 % self.default_extract_dir)
 
         runtime_group.add_argument('--qemu-boot', action='store',
diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index 86ac199197..6b8eab3258 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -11,7 +11,7 @@ from oeqa.core.case import OETestCase
 
 class OESDKTestCase(OETestCase):
     def _run(self, cmd):
-        return subprocess.check_output(". %s > /dev/null; %s;" % \
+        return subprocess.check_output(". %s > /dev/null; %s;" %
                 (self.tc.sdk_env, cmd), shell=True, executable="/bin/bash",
                 stderr=subprocess.STDOUT, universal_newlines=True)
 
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index eb3c8ddf39..c6de032b29 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -16,7 +16,7 @@ class GalculatorTest(OESDKTestCase):
     Test that autotools and GTK+ 3 compiles correctly.
     """
     def setUp(self):
-        if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or \
+        if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or
                 self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
         if not (self.tc.hasHostPackage("nativesdk-gettext-dev")):
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index eb08eadd28..71e71dee0a 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -43,7 +43,7 @@ class GccCompileTest(OESDKTestCase):
 
     @classmethod
     def tearDownClass(self):
-        files = [os.path.join(self.tc.sdk_dir, f) \
+        files = [os.path.join(self.tc.sdk_dir, f)
                 for f in ['test.c', 'test.cpp', 'test.o', 'test',
                     'testsdkmakefile']]
         for f in files:
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 01c38c24e6..b1a705c776 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -120,7 +120,7 @@ class OESDKTestContextExecutor(OETestContextExecutor):
         return sdk_env
 
     def _display_sdk_envs(self, log, args, sdk_envs):
-        log("Available SDK environments at directory %s:" \
+        log("Available SDK environments at directory %s:"
                 % args.sdk_dir)
         log("")
         for env in sdk_envs:
@@ -130,12 +130,12 @@ class OESDKTestContextExecutor(OETestContextExecutor):
         import argparse_oe
 
         if not args.sdk_dir:
-            raise argparse_oe.ArgumentUsageError("No SDK directory "\
+            raise argparse_oe.ArgumentUsageError("No SDK directory "
                    "specified please do, --sdk-dir SDK_DIR", self.name)
 
         sdk_envs = OESDKTestContextExecutor._get_sdk_environs(args.sdk_dir)
         if not sdk_envs:
-            raise argparse_oe.ArgumentUsageError("No available SDK "\
+            raise argparse_oe.ArgumentUsageError("No available SDK "
                    "environments found at %s" % args.sdk_dir, self.name)
 
         if args.list_sdk_env:
@@ -144,7 +144,7 @@ class OESDKTestContextExecutor(OETestContextExecutor):
 
         if not args.sdk_env in sdk_envs:
             self._display_sdk_envs(logger.error, args, sdk_envs)
-            raise argparse_oe.ArgumentUsageError("No valid SDK "\
+            raise argparse_oe.ArgumentUsageError("No valid SDK "
                    "environment (%s) specified" % args.sdk_env, self.name)
 
         self.sdk_env = sdk_envs[args.sdk_env]
diff --git a/meta/lib/oeqa/sdkext/case.py b/meta/lib/oeqa/sdkext/case.py
index 668faec9b9..8a36c1f8ce 100644
--- a/meta/lib/oeqa/sdkext/case.py
+++ b/meta/lib/oeqa/sdkext/case.py
@@ -19,6 +19,6 @@ class OESDKExtTestCase(OESDKTestCase):
         paths_to_avoid = ['bitbake/bin', 'poky/scripts']
         env['PATH'] = avoid_paths_in_environ(paths_to_avoid)
 
-        return subprocess.check_output(". %s > /dev/null;"\
+        return subprocess.check_output(". %s > /dev/null;"
             " %s;" % (self.tc.sdk_env, cmd), stderr=subprocess.STDOUT,
             shell=True, env=env, universal_newlines=True)
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index a5c6a76e02..ef5dea1f47 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -52,7 +52,7 @@ class DevtoolTest(OESDKExtTestCase):
 
     def test_devtool_location(self):
         output = self._run('which devtool')
-        self.assertEqual(output.startswith(self.tc.sdk_dir), True, \
+        self.assertEqual(output.startswith(self.tc.sdk_dir), True,
             msg="Seems that devtool isn't the eSDK one: %s" % output)
 
     def test_devtool_add_reset(self):
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index ffd185ec55..ae4f55970c 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -30,7 +30,7 @@ class TestSDKExt(TestSDKBase):
 
         tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
         if not os.path.exists(tcname):
-            bb.fatal("The toolchain ext %s is not built. Build it before running the" \
+            bb.fatal("The toolchain ext %s is not built. Build it before running the"
                     " tests: 'bitbake <image> -c populate_sdk_ext' ." % tcname)
 
         tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.testdata.json")
@@ -73,7 +73,7 @@ class TestSDKExt(TestSDKBase):
                 f.write('PREMIRRORS_prepend = " git://git.yoctoproject.org/.* git://%s/git2/git.yoctoproject.org.BASENAME \\n "\n' % test_data.get('DL_DIR'))
 
             # We need to do this in case we have a minimal SDK
-            subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" % \
+            subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" %
                     sdk_env, cwd=sdk_dir, shell=True, stderr=subprocess.STDOUT)
 
             tc = OESDKExtTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index dcad4f76ec..4ff187ff8c 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -55,13 +55,13 @@ class OESelftestTestCase(OETestCase):
         if "#include added by oe-selftest" \
             not in ftools.read_file(os.path.join(cls.builddir, "conf/local.conf")):
                 cls.logger.info("Adding: \"include selftest.inc\" in %s" % os.path.join(cls.builddir, "conf/local.conf"))
-                ftools.append_file(os.path.join(cls.builddir, "conf/local.conf"), \
+                ftools.append_file(os.path.join(cls.builddir, "conf/local.conf"),
                         "\n#include added by oe-selftest\ninclude machine.inc\ninclude selftest.inc")
 
         if "#include added by oe-selftest" \
             not in ftools.read_file(os.path.join(cls.builddir, "conf/bblayers.conf")):
                 cls.logger.info("Adding: \"include bblayers.inc\" in bblayers.conf")
-                ftools.append_file(os.path.join(cls.builddir, "conf/bblayers.conf"), \
+                ftools.append_file(os.path.join(cls.builddir, "conf/bblayers.conf"),
                         "\n#include added by oe-selftest\ninclude bblayers.inc")
 
     @classmethod
@@ -69,13 +69,13 @@ class OESelftestTestCase(OETestCase):
         if "#include added by oe-selftest.py" \
             in ftools.read_file(os.path.join(cls.builddir, "conf/local.conf")):
                 cls.logger.info("Removing the include from local.conf")
-                ftools.remove_from_file(os.path.join(cls.builddir, "conf/local.conf"), \
+                ftools.remove_from_file(os.path.join(cls.builddir, "conf/local.conf"),
                         "\n#include added by oe-selftest.py\ninclude machine.inc\ninclude selftest.inc")
 
         if "#include added by oe-selftest.py" \
             in ftools.read_file(os.path.join(cls.builddir, "conf/bblayers.conf")):
                 cls.logger.info("Removing the include from bblayers.conf")
-                ftools.remove_from_file(os.path.join(cls.builddir, "conf/bblayers.conf"), \
+                ftools.remove_from_file(os.path.join(cls.builddir, "conf/bblayers.conf"),
                         "\n#include added by oe-selftest.py\ninclude bblayers.inc")
 
     @classmethod
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 5d13f35468..e4755c595b 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -23,14 +23,14 @@ class VerifyManifest(OESelftestTestCase):
             with open(manifest, "r") as mfile:
                 for line in mfile:
                     manifest_entry = os.path.join(path, line.split()[0])
-                    self.logger.debug("{}: looking for {}"\
+                    self.logger.debug("{}: looking for {}"
                                     .format(self.classname, manifest_entry))
                     if not os.path.isfile(manifest_entry):
                         manifest_errors.append(manifest_entry)
-                        self.logger.debug("{}: {} not found"\
+                        self.logger.debug("{}: {} not found"
                                     .format(self.classname, manifest_entry))
         except OSError as e:
-            self.logger.debug("{}: checking of {} failed"\
+            self.logger.debug("{}: checking of {} failed"
                     .format(self.classname, manifest))
             raise e
 
@@ -40,9 +40,9 @@ class VerifyManifest(OESelftestTestCase):
     @classmethod
     def get_dir_from_bb_var(self, bb_var, target = None):
         target == self.buildtarget if target == None else target
-        directory = get_bb_var(bb_var, target);
+        directory = get_bb_var(bb_var, target)
         if not directory or not os.path.isdir(directory):
-            self.logger.debug("{}: {} points to {} when target = {}"\
+            self.logger.debug("{}: {} points to {} when target = {}"
                     .format(self.classname, bb_var, directory, target))
             raise OSError
         return directory
@@ -54,12 +54,12 @@ class VerifyManifest(OESelftestTestCase):
         self.buildtarget = 'core-image-minimal'
         self.classname = 'VerifyManifest'
 
-        self.logger.info("{}: doing bitbake {} as a prerequisite of the test"\
+        self.logger.info("{}: doing bitbake {} as a prerequisite of the test"
                 .format(self.classname, self.buildtarget))
         if bitbake(self.buildtarget).status:
-            self.logger.debug("{} Failed to setup {}"\
+            self.logger.debug("{} Failed to setup {}"
                     .format(self.classname, self.buildtarget))
-            self.skipTest("{}: Cannot setup testing scenario"\
+            self.skipTest("{}: Cannot setup testing scenario"
                     .format(self.classname))
 
     def test_SDK_manifest_entries(self):
@@ -69,12 +69,12 @@ class VerifyManifest(OESelftestTestCase):
         # to do an additional setup for the sdk
         sdktask = '-c populate_sdk'
         bbargs = sdktask + ' ' + self.buildtarget
-        self.logger.debug("{}: doing bitbake {} as a prerequisite of the test"\
+        self.logger.debug("{}: doing bitbake {} as a prerequisite of the test"
                 .format(self.classname, bbargs))
         if bitbake(bbargs).status:
-            self.logger.debug("{} Failed to bitbake {}"\
+            self.logger.debug("{} Failed to bitbake {}"
                     .format(self.classname, bbargs))
-            self.skipTest("{}: Cannot setup testing scenario"\
+            self.skipTest("{}: Cannot setup testing scenario"
                     .format(self.classname))
 
 
@@ -104,7 +104,7 @@ class VerifyManifest(OESelftestTestCase):
                         self.classname, reverse_dir[k]))
                     raise IOError
         except OSError:
-            raise self.skipTest("{}: Error in obtaining manifest dirs"\
+            raise self.skipTest("{}: Error in obtaining manifest dirs"
                 .format(self.classname))
         except IOError:
             msg = "{}: Error cannot find manifests in the specified dir:\n{}"\
@@ -115,7 +115,7 @@ class VerifyManifest(OESelftestTestCase):
             self.logger.debug("{}: Check manifest {}".format(
                 self.classname, m_entry[k].file))
 
-            m_entry[k].missing = self.check_manifest_entries(\
+            m_entry[k].missing = self.check_manifest_entries(
                                                m_entry[k].file,reverse_dir[k])
             if m_entry[k].missing:
                 msg = '{}: {} Error has the following missing entries'\
@@ -135,25 +135,27 @@ class VerifyManifest(OESelftestTestCase):
             mfilename = get_bb_var("IMAGE_LINK_NAME", self.buildtarget)\
                     + ".manifest"
             mpath = os.path.join(mdir, mfilename)
-            if not os.path.isfile(mpath): raise IOError
+            if not os.path.isfile(mpath):
+                raise IOError
             m_entry = ManifestEntry(mpath)
 
             pkgdata_dir = {}
             pkgdata_dir = self.get_dir_from_bb_var('PKGDATA_DIR',
                                                 self.buildtarget)
             revdir = os.path.join(pkgdata_dir, 'runtime-reverse')
-            if not os.path.exists(revdir): raise IOError
+            if not os.path.exists(revdir):
+                raise IOError
         except OSError:
-            raise self.skipTest("{}: Error in obtaining manifest dirs"\
+            raise self.skipTest("{}: Error in obtaining manifest dirs"
                 .format(self.classname))
         except IOError:
             msg = "{}: Error cannot find manifests in dir:\n{}"\
                     .format(self.classname, mdir)
             self.fail(msg)
 
-        self.logger.debug("{}: Check manifest {}"\
+        self.logger.debug("{}: Check manifest {}"
                             .format(self.classname, m_entry.file))
-        m_entry.missing = self.check_manifest_entries(\
+        m_entry.missing = self.check_manifest_entries(
                                                     m_entry.file, revdir)
         if m_entry.missing:
             msg = '{}: {} Error has the following missing entries'\
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index a11e2d0781..ad1c1fbe67 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -59,7 +59,7 @@ def extract_files(debugfs_output):
      /92/040755/1002/1002/tmp//\n
     """
     # NOTE the occasional ^M in file names
-    return [line.split('/')[5].strip() for line in \
+    return [line.split('/')[5].strip() for line in
             debugfs_output.strip().split('/\n')]
 
 def files_own_by_root(debugfs_output):
@@ -402,7 +402,7 @@ part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
 part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
 part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr"""
                           % (rootfs_dir, rootfs_dir))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
+            runCmd("wic create %s -e core-image-minimal -o %s"
                                        % (wks_file, self.resultdir))
 
             os.remove(wks_file)
@@ -433,7 +433,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 
             # Test partition 1, should contain the normal root directories, except
             # /usr.
-            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" %
                              os.path.join(self.resultdir, "selftest_img.part1"))
             files = extract_files(res.output)
             self.assertIn("etc", files)
@@ -441,7 +441,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 
             # Partition 2, should contain common directories for /usr, not root
             # directories.
-            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" %
                              os.path.join(self.resultdir, "selftest_img.part2"))
             files = extract_files(res.output)
             self.assertNotIn("etc", files)
@@ -450,14 +450,14 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 
             # Partition 3, should contain the same as partition 2, including the bin
             # directory, but not the files inside it.
-            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" %
                              os.path.join(self.resultdir, "selftest_img.part3"))
             files = extract_files(res.output)
             self.assertNotIn("etc", files)
             self.assertNotIn("usr", files)
             self.assertIn("share", files)
             self.assertIn("bin", files)
-            res = runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" % \
+            res = runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" %
                              os.path.join(self.resultdir, "selftest_img.part3"))
             files = extract_files(res.output)
             self.assertIn(".", files)
@@ -489,7 +489,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 part /part1 --source rootfs --ondisk mmcblk0 --fstype=ext4
 part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
                           % (include_path))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
+            runCmd("wic create %s -e core-image-minimal -o %s"
                                        % (wks_file, self.resultdir))
 
             part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
@@ -526,7 +526,7 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
                 wks.write("""
 part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-image-minimal-mtdutils export/"""
                           % (include_path))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
+            runCmd("wic create %s -e core-image-minimal -o %s"
                                        % (wks_file, self.resultdir))
 
             part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
@@ -551,21 +551,21 @@ part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-imag
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils /export")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s"
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils ././..")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s"
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
         # 3 Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils export/ dummy")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s"
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
@@ -576,14 +576,14 @@ part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-imag
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path /usr")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s"
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path ././..")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s"
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
@@ -619,7 +619,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                 wks_file = os.path.join(include_path, 'temp.wks')
                 with open(wks_file, 'w') as wks:
                     wks.write(test)
-                runCmd("wic create %s -e core-image-minimal -o %s" \
+                runCmd("wic create %s -e core-image-minimal -o %s"
                                        % (wks_file, self.resultdir))
 
                 for part in glob(os.path.join(self.resultdir, 'temp-*.direct.p*')):
@@ -656,7 +656,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
             wks_file = os.path.join(include_path, 'temp.wks')
             with open(wks_file, 'w') as wks:
                 wks.write("part /etc --source rootfs --fstype=ext4 --change-directory=etc")
-            runCmd("wic create %s -e core-image-minimal -o %s" \
+            runCmd("wic create %s -e core-image-minimal -o %s"
                                        % (wks_file, self.resultdir))
 
             part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
@@ -675,14 +675,14 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --change-directory /usr")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s"
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --change-directory ././..")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s"
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
@@ -816,7 +816,7 @@ class Wic2(WicTestCase):
         """
         with NamedTemporaryFile("w", suffix=".wks", delete=False) as tempf:
             wkspath = tempf.name
-            tempf.write("part " \
+            tempf.write("part "
                      "--source rootfs --ondisk hda --align 4 --fixed-size %d "
                      "--fstype=ext4\n" % size)
 
@@ -881,8 +881,8 @@ class Wic2(WicTestCase):
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that partitions are placed at the correct offsets, default KB
-            tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n" \
+            tempf.write("bootloader --ptable gpt\n"
+                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n"
                         "part /bar                 --ondisk hda --offset 102432 --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
@@ -894,8 +894,8 @@ class Wic2(WicTestCase):
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that partitions are placed at the correct offsets, same with explicit KB
-            tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 32K     --fixed-size 100M --fstype=ext4\n" \
+            tempf.write("bootloader --ptable gpt\n"
+                        "part /    --source rootfs --ondisk hda --offset 32K     --fixed-size 100M --fstype=ext4\n"
                         "part /bar                 --ondisk hda --offset 102432K --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
@@ -907,8 +907,8 @@ class Wic2(WicTestCase):
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that partitions are placed at the correct offsets using MB
-            tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 32K  --fixed-size 100M --fstype=ext4\n" \
+            tempf.write("bootloader --ptable gpt\n"
+                        "part /    --source rootfs --ondisk hda --offset 32K  --fixed-size 100M --fstype=ext4\n"
                         "part /bar                 --ondisk hda --offset 101M --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
@@ -920,8 +920,8 @@ class Wic2(WicTestCase):
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that partitions can be placed on a 512 byte sector boundary
-            tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 65s --fixed-size 99M --fstype=ext4\n" \
+            tempf.write("bootloader --ptable gpt\n"
+                        "part /    --source rootfs --ondisk hda --offset 65s --fixed-size 99M --fstype=ext4\n"
                         "part /bar                 --ondisk hda --offset 102432 --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
@@ -933,7 +933,7 @@ class Wic2(WicTestCase):
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that a partition can be placed immediately after a MSDOS partition table
-            tempf.write("bootloader --ptable msdos\n" \
+            tempf.write("bootloader --ptable msdos\n"
                         "part /    --source rootfs --ondisk hda --offset 1s --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
@@ -944,8 +944,8 @@ class Wic2(WicTestCase):
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that image creation fails if the partitions would overlap
-            tempf.write("bootloader --ptable gpt\n" \
-                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n" \
+            tempf.write("bootloader --ptable gpt\n"
+                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n"
                         "part /bar                 --ondisk hda --offset 102431 --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
@@ -954,7 +954,7 @@ class Wic2(WicTestCase):
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
             # Test that partitions are not allowed to overlap with the booloader
-            tempf.write("bootloader --ptable gpt\n" \
+            tempf.write("bootloader --ptable gpt\n"
                         "part /    --source rootfs --ondisk hda --offset 8 --fixed-size 100M --fstype=ext4\n")
             tempf.flush()
 
@@ -965,7 +965,7 @@ class Wic2(WicTestCase):
         native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
         with NamedTemporaryFile("w", suffix=".wks") as tempf:
-            tempf.write("bootloader --ptable gpt\n" \
+            tempf.write("bootloader --ptable gpt\n"
                         "part /     --source rootfs --ondisk hda --extra-space 200M --fstype=ext4\n")
             tempf.flush()
 
@@ -1002,7 +1002,7 @@ class Wic2(WicTestCase):
         machine = get_bb_var('MACHINE', img)
         with NamedTemporaryFile("w", suffix=".wks") as wks:
             wks.writelines(['part /boot --active --source bootimg-pcbios\n',
-                            'part / --source rawcopy --sourceparams="file=%s-%s.ext4" --use-uuid\n'\
+                            'part / --source rawcopy --sourceparams="file=%s-%s.ext4" --use-uuid\n'
                              % (img, machine),
                             'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
             wks.flush()
@@ -1080,7 +1080,7 @@ class Wic2(WicTestCase):
         img = 'core-image-minimal'
         with NamedTemporaryFile("w", suffix=".wks") as wks:
             wks.writelines(['part /boot --active --source bootimg-biosplusefi --sourceparams="loader=grub-efi"\n',
-                            'part / --source rootfs --fstype=ext4 --align 1024 --use-uuid\n'\
+                            'part / --source rootfs --fstype=ext4 --align 1024 --use-uuid\n'
                             'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
             wks.flush()
             cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
@@ -1111,7 +1111,7 @@ class Wic2(WicTestCase):
     def test_kickstart_parser(self):
         """Test wks parser options"""
         with NamedTemporaryFile("w", suffix=".wks") as wks:
-            wks.writelines(['part / --fstype ext3 --source rootfs --system-id 0xFF '\
+            wks.writelines(['part / --fstype ext3 --source rootfs --system-id 0xFF '
                             '--overhead-factor 1.2 --size 100k\n'])
             wks.flush()
             cmd = "wic create %s -e core-image-minimal -o %s" % (wks.name, self.resultdir)
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 1659926975..1b5546d273 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -133,7 +133,7 @@ class OESelftestTestContext(OETestContext):
             self.custommachine = machine
             if machine == 'random':
                 self.custommachine = choice(self.machines)
-            self.logger.info('Run tests with custom MACHINE set to: %s' % \
+            self.logger.info('Run tests with custom MACHINE set to: %s' %
                     self.custommachine)
         return super(OESelftestTestContext, self).runTests(processes, skips)
 
@@ -289,7 +289,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         def _add_layer_libs():
             bbpath = self.tc.td['BBPATH'].split(':')
-            layer_libdirs = [p for p in (os.path.join(l, 'lib') \
+            layer_libdirs = [p for p in (os.path.join(l, 'lib')
                     for l in bbpath) if os.path.exists(p)]
             if layer_libdirs:
                 self.tc.logger.info("Adding layer libraries:")
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index 6d1ec4cb99..96926746cc 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -69,13 +69,13 @@ def load_test_components(logger, executor):
                 comp_name = file
                 comp_context = os.path.join(base_dir, file, 'context.py')
                 if os.path.exists(comp_context):
-                    comp_plugin = importlib.import_module('oeqa.%s.%s' % \
+                    comp_plugin = importlib.import_module('oeqa.%s.%s' %
                             (comp_name, 'context'))
                     try:
                         if not issubclass(comp_plugin._executor_class,
                                 OETestContextExecutor):
-                            raise TypeError("Component %s in %s, _executor_class "\
-                                "isn't derived from OETestContextExecutor."\
+                            raise TypeError("Component %s in %s, _executor_class "
+                                "isn't derived from OETestContextExecutor."
                                 % (comp_name, comp_context))
 
                         if comp_plugin._executor_class._script_executor \
@@ -84,7 +84,7 @@ def load_test_components(logger, executor):
 
                         components[comp_name] = comp_plugin._executor_class()
                     except AttributeError:
-                        raise AttributeError("Component %s in %s don't have "\
+                        raise AttributeError("Component %s in %s don't have "
                                 "_executor_class defined." % (comp_name, comp_context))
 
     return components
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index 383e57a6b2..e90462d127 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -86,8 +86,10 @@ def process_binaries(d, params):
         packaged_bin_dir = os.path.join(exportpath,"binaries", arch, "packaged_binaries")
         # creating necessary directory structure in case testing is done in poky env.
         if export_env == "0":
-            if not os.path.exists(extracted_bin_dir): bb.utils.mkdirhier(extracted_bin_dir)
-            if not os.path.exists(packaged_bin_dir): bb.utils.mkdirhier(packaged_bin_dir)
+            if not os.path.exists(extracted_bin_dir):
+                bb.utils.mkdirhier(extracted_bin_dir)
+            if not os.path.exists(packaged_bin_dir):
+                bb.utils.mkdirhier(packaged_bin_dir)
 
         if param_list[3] == "native":
             if export_env == "1": #this is a native package and we only need to copy it. no need for extraction
diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 3b84447a0f..7c87a14758 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -193,7 +193,7 @@ def end_stress(p):
 def us2hms_str(us):
         s = (us+500000) // 1000000 # Round microseconds to s
         m = s//60
-        s -= 60*m;
+        s -= 60*m
         h = m//60
         m -= 60*h
 
diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index 6f4b268119..674d690450 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -302,10 +302,10 @@ Note:
 
         print("\n=== Summary: (%s changed, %s unchanged)" % (total_changed, cnt_unchanged))
         if args.verbose:
-            print("Newly added: %s\nDependencies changed: %s\n" % \
+            print("Newly added: %s\nDependencies changed: %s\n" %
                 (cnt_added, cnt_dep))
         else:
-            print("Newly added: %s\nPV changed: %s\nPR changed: %s\nDependencies changed: %s\n" % \
+            print("Newly added: %s\nPV changed: %s\nPR changed: %s\nDependencies changed: %s\n" %
                 (cnt_added, cnt_rv.get('pv') or 0, cnt_rv.get('pr') or 0, cnt_dep))
     except:
         print("ERROR occurred!")
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 835a6bcd09..d0ed701e91 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -517,10 +517,10 @@ def drop_to_shell(workdir=None):
         return False
 
     shell = os.environ.get('SHELL', 'bash')
-    print('Dropping to shell "%s"\n' \
-          'When you are finished, run the following to continue:\n' \
-          '       exit    -- continue to apply the patches\n' \
-          '       exit 1  -- abort\n' % shell);
+    print('Dropping to shell "%s"\n'
+          'When you are finished, run the following to continue:\n'
+          '       exit    -- continue to apply the patches\n'
+          '       exit 1  -- abort\n' % shell)
     ret = subprocess.call([shell], cwd=workdir)
     if ret != 0:
         print("Aborting")
@@ -725,8 +725,8 @@ def update_with_patches(conf, components, revisions, repos):
 
     # Step 5: invoke bash for user to edit patch and patch list
     if conf.interactive:
-        print('You may now edit the patch and patch list in %s\n' \
-              'For example, you can remove unwanted patch entries from patchlist-*, so that they will be not applied later' % patch_dir);
+        print('You may now edit the patch and patch list in %s\n'
+              'For example, you can remove unwanted patch entries from patchlist-*, so that they will be not applied later' % patch_dir)
         if not drop_to_shell(patch_dir):
             sys.exit(1)
 
diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index fe545607bb..f526111be5 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -158,7 +158,7 @@ def _find_layer_depends(depend, layers):
 
 def add_layer_dependencies(bblayersconf, layer, layers, logger):
     def recurse_dependencies(depends, layer, layers, logger, ret = []):
-        logger.debug('Processing dependencies %s for layer %s.' % \
+        logger.debug('Processing dependencies %s for layer %s.' %
                     (depends, layer['name']))
 
         for depend in depends.split():
@@ -168,7 +168,7 @@ def add_layer_dependencies(bblayersconf, layer, layers, logger):
 
             layer_depend = _find_layer_depends(depend, layers)
             if not layer_depend:
-                logger.error('Layer %s depends on %s and isn\'t found.' % \
+                logger.error('Layer %s depends on %s and isn\'t found.' %
                         (layer['name'], depend))
                 ret = None
                 continue
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index 7fd56f5d36..f019d88f17 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -12,7 +12,7 @@ class BSPCheckLayer(OECheckLayerTestCase):
     @classmethod
     def setUpClass(self):
         if self.tc.layer['type'] != LayerType.BSP:
-            raise unittest.SkipTest("BSPCheckLayer: Layer %s isn't BSP one." %\
+            raise unittest.SkipTest("BSPCheckLayer: Layer %s isn't BSP one." %
                 self.tc.layer['name'])
 
     def test_bsp_defines_machines(self):
@@ -24,7 +24,7 @@ class BSPCheckLayer(OECheckLayerTestCase):
 
         machine = get_bb_var('MACHINE')
         self.assertEqual(self.td['bbvars']['MACHINE'], machine,
-                msg="Layer %s modified machine %s -> %s" % \
+                msg="Layer %s modified machine %s -> %s" %
                     (self.tc.layer['name'], self.td['bbvars']['MACHINE'], machine))
 
 
diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index b82304e361..3c3562c931 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -46,7 +46,7 @@ class CommonCheckLayer(OECheckLayerTestCase):
     def test_signatures(self):
         if self.tc.layer['type'] == LayerType.SOFTWARE and \
            not self.tc.test_software_layer_signatures:
-            raise unittest.SkipTest("Not testing for signature changes in a software layer %s." \
+            raise unittest.SkipTest("Not testing for signature changes in a software layer %s."
                      % self.tc.layer['name'])
 
         curr_sigs, _ = get_signatures(self.td['builddir'], failsafe=True)
@@ -56,5 +56,5 @@ class CommonCheckLayer(OECheckLayerTestCase):
 
     def test_layerseries_compat(self):
         for collection_name, collection_data in self.tc.layer['collections'].items():
-            self.assertTrue(collection_data['compat'], "Collection %s from layer %s does not set compatible oe-core versions via LAYERSERIES_COMPAT_collection." \
+            self.assertTrue(collection_data['compat'], "Collection %s from layer %s does not set compatible oe-core versions via LAYERSERIES_COMPAT_collection."
                  % (collection_name, self.tc.layer['name']))
diff --git a/scripts/lib/checklayer/cases/distro.py b/scripts/lib/checklayer/cases/distro.py
index f0bee5493c..4efde4b44a 100644
--- a/scripts/lib/checklayer/cases/distro.py
+++ b/scripts/lib/checklayer/cases/distro.py
@@ -12,7 +12,7 @@ class DistroCheckLayer(OECheckLayerTestCase):
     @classmethod
     def setUpClass(self):
         if self.tc.layer['type'] != LayerType.DISTRO:
-            raise unittest.SkipTest("DistroCheckLayer: Layer %s isn't Distro one." %\
+            raise unittest.SkipTest("DistroCheckLayer: Layer %s isn't Distro one." %
                 self.tc.layer['name'])
 
     def test_distro_defines_distros(self):
@@ -24,5 +24,5 @@ class DistroCheckLayer(OECheckLayerTestCase):
 
         distro = get_bb_var('DISTRO')
         self.assertEqual(self.td['bbvars']['DISTRO'], distro,
-                msg="Layer %s modified distro %s -> %s" % \
+                msg="Layer %s modified distro %s -> %s" %
                     (self.tc.layer['name'], self.td['bbvars']['DISTRO'], distro))
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 3aa42a1466..5e22f91507 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -150,8 +150,8 @@ def sdk_update(args, config, basepath, workspace):
             if not out:
                 ret = subprocess.call("git fetch --all; git reset --hard @{u}", shell=True, cwd=layers_dir)
             else:
-                logger.error("Failed to update metadata as there have been changes made to it. Aborting.");
-                logger.error("Changed files:\n%s" % out);
+                logger.error("Failed to update metadata as there have been changes made to it. Aborting.")
+                logger.error("Changed files:\n%s" % out)
                 return -1
         else:
             ret = -1
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 018815b966..bee6b391e7 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -76,7 +76,7 @@ def find_canned_image(scripts_path, wks_file):
             for fname in files:
                 if fname.endswith("~") or fname.endswith("#"):
                     continue
-                if ((fname.endswith(".wks") and wks_file + ".wks" == fname) or \
+                if ((fname.endswith(".wks") and wks_file + ".wks" == fname) or
                    (fname.endswith(".wks.in") and wks_file + ".wks.in" == fname)):
                     fullpath = os.path.join(canned_wks_dir, fname)
                     return fullpath
@@ -519,7 +519,7 @@ class Disk:
                         partimg = self._get_part_image(pnum)
                         sparse_copy(partimg, partfname)
                         exec_cmd("{} -pf {}".format(self.e2fsck, partfname))
-                        exec_cmd("{} {} {}s".format(\
+                        exec_cmd("{} {} {}s".format(
                                  self.resize2fs, partfname, part['size']))
                     elif fstype.startswith('fat'):
                         logger.info("copying content of the fat partition {}".format(pnum))
@@ -561,7 +561,7 @@ def wic_ls(args, native_sysroot):
         if disk.partitions:
             print('Num     Start        End          Size      Fstype')
             for part in disk.partitions.values():
-                print("{:2d}  {:12d} {:12d} {:12d}  {}".format(\
+                print("{:2d}  {:12d} {:12d} {:12d}  {}".format(
                           part.pnum, part.start, part.end,
                           part.size, part.fstype))
     else:
diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 4d9da28172..65987d4c94 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -215,7 +215,7 @@ class FilemapSeek(_FilemapBase):
         try:
             tmp_obj = tempfile.TemporaryFile("w+", dir=directory)
         except IOError as err:
-            raise ErrorNotSupp("cannot create a temporary in \"%s\": %s" \
+            raise ErrorNotSupp("cannot create a temporary in \"%s\": %s"
                               % (directory, err))
 
         try:
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7a4cc83af5..8968b2f651 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -217,7 +217,7 @@ class KickStart():
                         line_args = shlex.split(line)
                         parsed = parser.parse_args(line_args)
                     except ArgumentError as err:
-                        raise KickStartError('%s:%d: %s' % \
+                        raise KickStartError('%s:%d: %s' %
                                              (confpath, lineno, err))
                     if line.startswith('part'):
                         # SquashFS does not support filesystem UUID
@@ -286,7 +286,7 @@ class KickStart():
                             # Concatenate the strings set in APPEND
                             append_var = get_bitbake_var("APPEND")
                             if append_var:
-                                self.bootloader.append = ' '.join(filter(None, \
+                                self.bootloader.append = ' '.join(filter(None,
                                                          (self.bootloader.append, append_var)))
                         else:
                             err = "%s:%d: more than one bootloader specified" \
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 57c042c503..767b34dd24 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -99,7 +99,7 @@ def _exec_cmd(cmd_and_args, as_shell=False):
         ret, out = runtool(args)
     out = out.strip()
     if ret != 0:
-        raise WicError("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
+        raise WicError("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" %
                        (cmd_and_args, ret, out))
 
     logger.debug("_exec_cmd: output for %s (rc = %d): %s",
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 96168aadb4..54ca5f87b3 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -209,7 +209,7 @@ class DirectPlugin(ImagerPlugin):
             logger.debug("Generating bmap file for %s", disk_name)
             python = os.path.join(self.native_sysroot, 'usr/bin/python3-native/python3')
             bmaptool = os.path.join(self.native_sysroot, 'usr/bin/bmaptool')
-            exec_native_cmd("%s %s create %s -o %s.bmap" % \
+            exec_native_cmd("%s %s create %s -o %s.bmap" %
                             (python, bmaptool, full_path, full_path), self.native_sysroot)
         # Compress the image
         if self.compressor:
@@ -377,14 +377,14 @@ class PartitionedImage():
             part = self.partitions[num]
 
             if self.ptable_format == 'msdos' and part.part_name:
-                raise WicError("setting custom partition name is not " \
+                raise WicError("setting custom partition name is not "
                                "implemented for msdos partitions")
 
             if self.ptable_format == 'msdos' and part.part_type:
                 # The --part-type can also be implemented for MBR partitions,
                 # in which case it would map to the 1-byte "partition type"
                 # filed at offset 3 of the partition entry.
-                raise WicError("setting custom partition type is not " \
+                raise WicError("setting custom partition type is not "
                                "implemented for msdos partitions")
 
             # Get the disk where the partition is located
@@ -562,28 +562,28 @@ class PartitionedImage():
             if part.part_name:
                 logger.debug("partition %d: set name to %s",
                              part.num, part.part_name)
-                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
+                exec_native_cmd("sgdisk --change-name=%d:%s %s" %
                                          (part.num, part.part_name,
                                           self.path), self.native_sysroot)
 
             if part.part_type:
                 logger.debug("partition %d: set type UID to %s",
                              part.num, part.part_type)
-                exec_native_cmd("sgdisk --typecode=%d:%s %s" % \
+                exec_native_cmd("sgdisk --typecode=%d:%s %s" %
                                          (part.num, part.part_type,
                                           self.path), self.native_sysroot)
 
             if part.uuid and self.ptable_format == "gpt":
                 logger.debug("partition %d: set UUID to %s",
                              part.num, part.uuid)
-                exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
+                exec_native_cmd("sgdisk --partition-guid=%d:%s %s" %
                                 (part.num, part.uuid, self.path),
                                 self.native_sysroot)
 
             if part.label and self.ptable_format == "gpt":
                 logger.debug("partition %d: set name to %s",
                              part.num, part.label)
-                exec_native_cmd("parted -s %s name %d %s" % \
+                exec_native_cmd("parted -s %s name %d %s" %
                                 (self.path, part.num, part.label),
                                 self.native_sysroot)
 
@@ -591,11 +591,11 @@ class PartitionedImage():
                 flag_name = "legacy_boot" if self.ptable_format == 'gpt' else "boot"
                 logger.debug("Set '%s' flag for partition '%s' on disk '%s'",
                              flag_name, part.num, self.path)
-                exec_native_cmd("parted -s %s set %d %s on" % \
+                exec_native_cmd("parted -s %s set %d %s on" %
                                 (self.path, part.num, flag_name),
                                 self.native_sysroot)
             if part.system_id:
-                exec_native_cmd("sfdisk --part-type %s %s %s" % \
+                exec_native_cmd("sfdisk --part-type %s %s %s" %
                                 (self.path, part.num, part.system_id),
                                 self.native_sysroot)
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index cdc72543c2..d4f2f928d9 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -241,7 +241,7 @@ class BootimgEFIPlugin(SourcePlugin):
                 logger.debug('Destination entry: %r', dst_entry)
                 deploy_files.append(dst_entry)
 
-            cls.install_task = [];
+            cls.install_task = []
             for deploy_entry in deploy_files:
                 src, dst = deploy_entry
                 if '*' in src:
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 5dbe2558d2..c59b476661 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -76,7 +76,7 @@ class BootimgPartitionPlugin(SourcePlugin):
             logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
-        cls.install_task = [];
+        cls.install_task = []
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
             if '*' in src:
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index afc9ea0f8f..3645d07990 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -170,24 +170,24 @@ class IsoImagePlugin(SourcePlugin):
             # Create initrd from rootfs directory
             initrd = "%s/initrd.cpio.gz" % cr_workdir
             initrd_dir = "%s/INITRD" % cr_workdir
-            shutil.copytree("%s" % rootfs_dir, \
+            shutil.copytree("%s" % rootfs_dir,
                             "%s" % initrd_dir, symlinks=True)
 
             if os.path.isfile("%s/init" % rootfs_dir):
                 shutil.copy2("%s/init" % rootfs_dir, "%s/init" % initrd_dir)
             elif os.path.lexists("%s/init" % rootfs_dir):
-                os.symlink(os.readlink("%s/init" % rootfs_dir), \
+                os.symlink(os.readlink("%s/init" % rootfs_dir),
                             "%s/init" % initrd_dir)
             elif os.path.isfile("%s/sbin/init" % rootfs_dir):
-                shutil.copy2("%s/sbin/init" % rootfs_dir, \
+                shutil.copy2("%s/sbin/init" % rootfs_dir,
                             "%s" % initrd_dir)
             elif os.path.lexists("%s/sbin/init" % rootfs_dir):
-                os.symlink(os.readlink("%s/sbin/init" % rootfs_dir), \
+                os.symlink(os.readlink("%s/sbin/init" % rootfs_dir),
                             "%s/init" % initrd_dir)
             else:
                 raise WicError("Couldn't find or build initrd, exiting.")
 
-            exec_cmd("cd %s && find . | cpio -o -H newc -R root:root >%s/initrd.cpio " \
+            exec_cmd("cd %s && find . | cpio -o -H newc -R root:root >%s/initrd.cpio "
                      % (initrd_dir, cr_workdir), as_shell=True)
             exec_cmd("gzip -f -9 %s/initrd.cpio" % cr_workdir, as_shell=True)
             shutil.rmtree(initrd_dir)
diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 5834f59845..ade13e244b 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -31,7 +31,7 @@ def timeit(f):
         print ("func:%r calling" % f.__name__)
         result = f(*args, **kw)
         te = time.time()
-        print ('func:%r args:[%r, %r] took: %2.4f sec' % \
+        print ('func:%r args:[%r, %r] took: %2.4f sec' %
           (f.__name__, args, kw, te-ts))
         return result
     return timed
diff --git a/scripts/pybootchartgui/pybootchartgui/batch.py b/scripts/pybootchartgui/pybootchartgui/batch.py
index 05c714e95e..1fc2b9b882 100644
--- a/scripts/pybootchartgui/pybootchartgui/batch.py
+++ b/scripts/pybootchartgui/pybootchartgui/batch.py
@@ -19,7 +19,7 @@ from .draw import RenderOptions
 
 def render(writer, trace, app_options, filename):
     handlers = {
-        "png": (lambda w, h: cairo.ImageSurface(cairo.FORMAT_ARGB32, w, h), \
+        "png": (lambda w, h: cairo.ImageSurface(cairo.FORMAT_ARGB32, w, h),
                 lambda sfc: sfc.write_to_png(filename)),
         "pdf": (lambda w, h: cairo.PDFSurface(filename, w, h), lambda sfc: 0),
         "svg": (lambda w, h: cairo.SVGSurface(filename, w, h), lambda sfc: 0)
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 29eb7505bc..1dc9bd02a6 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -152,7 +152,7 @@ STATE_WAITING   = 3
 STATE_STOPPED   = 4
 STATE_ZOMBIE    = 5
 
-STATE_COLORS = [(0, 0, 0, 0), PROC_COLOR_R, PROC_COLOR_S, PROC_COLOR_D, \
+STATE_COLORS = [(0, 0, 0, 0), PROC_COLOR_R, PROC_COLOR_S, PROC_COLOR_D,
         PROC_COLOR_T, PROC_COLOR_Z, PROC_COLOR_X, PROC_COLOR_W]
 
 # CumulativeStats Types
@@ -256,7 +256,7 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
     ctx.set_line_width(0.5)
     x_shift = proc_tree.start_time
 
-    def transform_point_coords(point, x_base, y_base, \
+    def transform_point_coords(point, x_base, y_base,
                    xscale, yscale, x_trans, y_trans):
         x = (point[0] - x_base) * xscale + x_trans
         y = (point[1] - y_base) * -yscale + y_trans + chart_bounds[3]
@@ -278,15 +278,15 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
         yscale = float(chart_bounds[3]) / max_y
         ybase = 0
 
-    first = transform_point_coords (data[0], x_shift, ybase, xscale, yscale, \
+    first = transform_point_coords (data[0], x_shift, ybase, xscale, yscale,
                         chart_bounds[0], chart_bounds[1])
-    last =  transform_point_coords (data[-1], x_shift, ybase, xscale, yscale, \
+    last =  transform_point_coords (data[-1], x_shift, ybase, xscale, yscale,
                         chart_bounds[0], chart_bounds[1])
 
     ctx.set_source_rgba(*color)
     ctx.move_to(*first)
     for point in data:
-        x, y = transform_point_coords (point, x_shift, ybase, xscale, yscale, \
+        x, y = transform_point_coords (point, x_shift, ybase, xscale, yscale,
                            chart_bounds[0], chart_bounds[1])
         ctx.line_to(x, y)
     if fill:
@@ -370,12 +370,12 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
         if clip_visible (clip, chart_rect):
             draw_box_ticks (ctx, chart_rect, sec_w)
             draw_annotations (ctx, proc_tree, trace.times, chart_rect)
-            draw_chart (ctx, IO_COLOR, True, chart_rect, \
-                    [(sample.time, sample.user + sample.sys + sample.io) for sample in trace.cpu_stats], \
+            draw_chart (ctx, IO_COLOR, True, chart_rect,
+                    [(sample.time, sample.user + sample.sys + sample.io) for sample in trace.cpu_stats],
                     proc_tree, None)
             # render CPU load
-            draw_chart (ctx, CPU_COLOR, True, chart_rect, \
-                    [(sample.time, sample.user + sample.sys) for sample in trace.cpu_stats], \
+            draw_chart (ctx, CPU_COLOR, True, chart_rect,
+                    [(sample.time, sample.user + sample.sys) for sample in trace.cpu_stats],
                     proc_tree, None)
 
         curr_y = curr_y + 30 + bar_h
@@ -390,15 +390,15 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
         if clip_visible (clip, chart_rect):
             draw_box_ticks (ctx, chart_rect, sec_w)
             draw_annotations (ctx, proc_tree, trace.times, chart_rect)
-            draw_chart (ctx, IO_COLOR, True, chart_rect, \
-                    [(sample.time, sample.util) for sample in trace.disk_stats], \
+            draw_chart (ctx, IO_COLOR, True, chart_rect,
+                    [(sample.time, sample.util) for sample in trace.disk_stats],
                     proc_tree, None)
 
         # render disk throughput
         max_sample = max (trace.disk_stats, key = lambda s: s.tput)
         if clip_visible (clip, chart_rect):
-            draw_chart (ctx, DISK_TPUT_COLOR, False, chart_rect, \
-                    [(sample.time, sample.tput) for sample in trace.disk_stats], \
+            draw_chart (ctx, DISK_TPUT_COLOR, False, chart_rect,
+                    [(sample.time, sample.tput) for sample in trace.disk_stats],
                     proc_tree, None)
 
         pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
@@ -450,7 +450,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
             draw_box_ticks (ctx, chart_rect, sec_w)
             draw_annotations (ctx, proc_tree, trace.times, chart_rect)
             for i in range(len(volumes), 0, -1):
-                draw_chart (ctx, VOLUME_COLORS[(i - 1) % len(VOLUME_COLORS)], True, chart_rect, \
+                draw_chart (ctx, VOLUME_COLORS[(i - 1) % len(VOLUME_COLORS)], True, chart_rect,
                             [(sample.time,
                               # Sum up used space of all volumes including the current one
                               # so that the graphs appear as stacked on top of each other.
@@ -472,21 +472,21 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
         draw_legend_box(ctx, "Mem cached (scale: %u MiB)" % (float(mem_scale) / 1024), MEM_CACHED_COLOR, off_x, curr_y+20, leg_s)
         draw_legend_box(ctx, "Used", MEM_USED_COLOR, off_x + 240, curr_y+20, leg_s)
         draw_legend_box(ctx, "Buffers", MEM_BUFFERS_COLOR, off_x + 360, curr_y+20, leg_s)
-        draw_legend_line(ctx, "Swap (scale: %u MiB)" % max([(sample.swap)/1024 for sample in mem_stats]), \
+        draw_legend_line(ctx, "Swap (scale: %u MiB)" % max([(sample.swap)/1024 for sample in mem_stats]),
                  MEM_SWAP_COLOR, off_x + 480, curr_y+20, leg_s)
         draw_box_ticks(ctx, chart_rect, sec_w)
         draw_annotations(ctx, proc_tree, trace.times, chart_rect)
-        draw_chart(ctx, MEM_BUFFERS_COLOR, True, chart_rect, \
-               [(sample.time, sample.buffers) for sample in trace.mem_stats], \
+        draw_chart(ctx, MEM_BUFFERS_COLOR, True, chart_rect,
+               [(sample.time, sample.buffers) for sample in trace.mem_stats],
                proc_tree, [0, mem_scale])
-        draw_chart(ctx, MEM_USED_COLOR, True, chart_rect, \
-               [(sample.time, sample.used) for sample in mem_stats], \
+        draw_chart(ctx, MEM_USED_COLOR, True, chart_rect,
+               [(sample.time, sample.used) for sample in mem_stats],
                proc_tree, [0, mem_scale])
-        draw_chart(ctx, MEM_CACHED_COLOR, True, chart_rect, \
-               [(sample.time, sample.cached) for sample in mem_stats], \
+        draw_chart(ctx, MEM_CACHED_COLOR, True, chart_rect,
+               [(sample.time, sample.cached) for sample in mem_stats],
                proc_tree, [0, mem_scale])
-        draw_chart(ctx, MEM_SWAP_COLOR, False, chart_rect, \
-               [(sample.time, float(sample.swap)) for sample in mem_stats], \
+        draw_chart(ctx, MEM_SWAP_COLOR, False, chart_rect,
+               [(sample.time, float(sample.swap)) for sample in mem_stats],
                proc_tree, None)
 
         curr_y = curr_y + meminfo_bar_h
@@ -496,17 +496,17 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
     chart_rect = [off_x, curr_y+header_h, w, h - curr_y - 1 * off_y - header_h  ]
 
-    draw_legend_box (ctx, "Configure", \
+    draw_legend_box (ctx, "Configure",
              TASK_COLOR_CONFIGURE, off_x  , curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Compile", \
+    draw_legend_box (ctx, "Compile",
              TASK_COLOR_COMPILE, off_x+120, curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Install", \
+    draw_legend_box (ctx, "Install",
              TASK_COLOR_INSTALL, off_x+240, curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Populate Sysroot", \
+    draw_legend_box (ctx, "Populate Sysroot",
              TASK_COLOR_SYSROOT, off_x+360, curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Package", \
+    draw_legend_box (ctx, "Package",
              TASK_COLOR_PACKAGE, off_x+480, curr_y + 45, leg_s)
-    draw_legend_box (ctx, "Package Write", \
+    draw_legend_box (ctx, "Package Write",
              TASK_COLOR_PACKAGE_WRITE, off_x+600, curr_y + 45, leg_s)
 
     ctx.set_font_size(PROC_TEXT_FONT_SIZE)
@@ -575,7 +575,7 @@ def render(ctx, options, xscale, trace):
     ctx.select_font_face(FONT_NAME)
     draw_fill_rect(ctx, WHITE, (0, 0, max(w, MIN_IMG_W), h))
     w -= 2*off_x
-    curr_y = off_y;
+    curr_y = off_y
 
     if options.charts:
         curr_y = render_charts (ctx, options, clip, trace, curr_y, w, h, sec_w)
@@ -595,7 +595,7 @@ def render(ctx, options, xscale, trace):
     if not options.kernel_only:
         curr_y = draw_header (ctx, trace.headers, duration)
     else:
-        curr_y = off_y;
+        curr_y = off_y
 
     # draw process boxes
     proc_height = h
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index b42dac6b88..d527bce2fc 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -297,7 +297,8 @@ def _parse_proc_ps_log(writer, file):
     timed_blocks = _parse_timed_blocks(file)
     for time, lines in timed_blocks:
         for line in lines:
-            if not line: continue
+            if not line:
+                continue
             tokens = line.split(' ')
             if len(tokens) < 21:
                 continue
@@ -352,7 +353,8 @@ def _parse_taskstats_log(writer, file):
             ltime = time
 #                       continue
         for line in lines:
-            if not line: continue
+            if not line:
+                continue
             tokens = line.split(' ')
             if len(tokens) != 6:
                 continue
@@ -380,7 +382,7 @@ def _parse_taskstats_log(writer, file):
                     process = process.split (writer, pid, cmd, ppid, time)
                     processMap[pid] = process
                 else:
-                    process.cmd = cmd;
+                    process.cmd = cmd
             else:
                 process = Process(writer, pid, cmd, ppid, time)
                 processMap[pid] = process
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index 9fc309b3ab..ab573329f2 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -160,7 +160,7 @@ class Process:
             self.parent = processMap.get (self.ppid)
             if self.parent == None and self.pid // 1000 > 1 and \
                 not (self.ppid == 2000 or self.pid == 2000): # kernel threads: ppid=2
-                self.writer.warn("Missing CONFIG_PROC_EVENTS: no parent for pid '%i' ('%s') with ppid '%i'" \
+                self.writer.warn("Missing CONFIG_PROC_EVENTS: no parent for pid '%i' ('%s') with ppid '%i'"
                                  % (self.pid,self.cmd,self.ppid))
 
     def get_end_time(self):
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
index c005cf341f..18943f3037 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
@@ -51,7 +51,7 @@ class TestBCParser(unittest.TestCase):
 
 		ps_data = open(self.mk_fname('extract2.proc_ps.log'))
 		for index, line in enumerate(ps_data):
-			tokens = line.split();
+			tokens = line.split()
 			process = sorted_processes[index]
 			if debug:
 				print(tokens[0:4])
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py b/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
index 6f46a1c03d..47249056fd 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
@@ -24,7 +24,7 @@ class TestProcessTree(unittest.TestCase):
 
         parsing.parse_file(writer, trace, self.mk_fname('proc_ps.log'))
         trace.compile(writer)
-        self.processtree = process_tree.ProcessTree(writer, None, trace.ps_stats, \
+        self.processtree = process_tree.ProcessTree(writer, None, trace.ps_stats,
             trace.ps_stats.sample_period, None, options.prune, None, None, False, for_testing = True)
 
     def mk_fname(self,f):
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 8c0fdb986a..692a9d5ed6 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -95,7 +95,7 @@ def change_interpreter(elf_file_name):
             if p_filesz == 0:
                 break
             if (len(new_dl_path) >= p_filesz):
-                print("ERROR: could not relocate %s, interp size = %i and %i is needed." \
+                print("ERROR: could not relocate %s, interp size = %i and %i is needed."
                     % (elf_file_name, p_memsz, len(new_dl_path) + 1))
                 break
             dl_path = new_dl_path + b("\0") * (p_filesz - len(new_dl_path))
@@ -149,7 +149,7 @@ def change_dl_sysdirs(elf_file_name):
                 new_ldsocache_path = old_prefix.sub(new_prefix, ldsocache_path)
                 new_ldsocache_path = new_ldsocache_path.rstrip(b("\0"))
                 if (len(new_ldsocache_path) >= sh_size):
-                    print("ERROR: could not relocate %s, .ldsocache section size = %i and %i is needed." \
+                    print("ERROR: could not relocate %s, .ldsocache section size = %i and %i is needed."
                     % (elf_file_name, sh_size, len(new_ldsocache_path)))
                     sys.exit(-1)
                 # pad with zeros
@@ -164,7 +164,7 @@ def change_dl_sysdirs(elf_file_name):
                     new_path = old_prefix.sub(new_prefix, path)
                     new_path = new_path.rstrip(b("\0"))
                     if (len(new_path) >= 4096):
-                        print("ERROR: could not relocate %s, max path size = 4096 and %i is needed." \
+                        print("ERROR: could not relocate %s, max path size = 4096 and %i is needed."
                         % (elf_file_name, len(new_path)))
                         sys.exit(-1)
                     # pad with zeros
@@ -227,8 +227,8 @@ for e in executables_list:
     except IOError:
         exctype, ioex = sys.exc_info()[:2]
         if ioex.errno == errno.ETXTBSY:
-            print("Could not open %s. File used by another process.\nPlease "\
-                  "make sure you exit all processes that might use any SDK "\
+            print("Could not open %s. File used by another process.\nPlease "
+                  "make sure you exit all processes that might use any SDK "
                   "binaries." % e)
         else:
             print("Could not open %s: %s(%d)" % (e, ioex.strerror, ioex.errno))
diff --git a/scripts/runqemu b/scripts/runqemu
index 1f332ef525..2f2ef17fa1 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -521,7 +521,7 @@ class BaseConfig(object):
                     unknown_arg = arg
                 else:
                     raise RunQemuError("Can't handle two unknown args: %s %s\n"
-                                       "Try 'runqemu help' on how to use it" % \
+                                       "Try 'runqemu help' on how to use it" %
                                         (unknown_arg, arg))
         # Check to make sure it is a valid machine
         if unknown_arg and self.get('MACHINE') != unknown_arg:
@@ -1239,7 +1239,7 @@ class BaseConfig(object):
                         logger.info('Using ide drive')
                         vm_drive = "-drive file=%s,format=%s" % (self.rootfs, rootfs_format)
                     elif drive_type.startswith("/dev/vdb"):
-                        logger.info('Using block virtio drive');
+                        logger.info('Using block virtio drive')
                         vm_drive = '-drive id=disk0,file=%s,if=none,format=%s -device virtio-blk-device,drive=disk0%s' \
                                     % (self.rootfs, rootfs_format,qb_rootfs_extra_opt)
                     else:
diff --git a/scripts/tiny/dirsize.py b/scripts/tiny/dirsize.py
index 501516b0d4..8e41126183 100755
--- a/scripts/tiny/dirsize.py
+++ b/scripts/tiny/dirsize.py
@@ -67,7 +67,7 @@ def main():
         minsize = int(sys.argv[1])
     rootfs = Record.create(".")
     total = rootfs.show(minsize)
-    print("Displayed %d/%d bytes (%.2f%%)" % \
+    print("Displayed %d/%d bytes (%.2f%%)" %
           (total, rootfs.size, 100 * float(total) / rootfs.size))
 
 
diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index db2b9ec39f..01c561b9a9 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -39,7 +39,7 @@ class Sizes:
             self.text = self.data = self.bss = self.total = 0
 
     def show(self, indent=""):
-        print("%-32s %10d | %10d %10d %10d" % \
+        print("%-32s %10d | %10d %10d %10d" %
               (indent+self.title, self.total, self.text, self.data, self.bss))
 
 
@@ -85,7 +85,7 @@ class Report:
 
     def show(self, indent=""):
         rule = str.ljust(indent, 80, '-')
-        print("%-32s %10s | %10s %10s %10s" % \
+        print("%-32s %10s | %10s %10s %10s" %
               (indent+self.title, "total", "text", "data", "bss"))
         print(rule)
         self.sizes.show(indent)
@@ -94,10 +94,10 @@ class Report:
             if p.sizes.total > 0:
                 p.sizes.show(indent)
         print(rule)
-        print("%-32s %10d | %10d %10d %10d" % \
+        print("%-32s %10d | %10d %10d %10d" %
               (indent+"sum", self.totals["total"], self.totals["text"],
                self.totals["data"], self.totals["bss"]))
-        print("%-32s %10d | %10d %10d %10d" % \
+        print("%-32s %10d | %10d %10d %10d" %
               (indent+"delta", self.deltas["total"], self.deltas["text"],
                self.deltas["data"], self.deltas["bss"]))
         print("\n")
diff --git a/scripts/tiny/ksum.py b/scripts/tiny/ksum.py
index 8f0e4c0517..e1ca4033f5 100755
--- a/scripts/tiny/ksum.py
+++ b/scripts/tiny/ksum.py
@@ -78,7 +78,7 @@ def add_ko_file(filename):
         if len(output) > 2:
             sizes = output[-1].split()[0:4]
             if verbose:
-                print("     %10d %10d %10d %10d\t" % \
+                print("     %10d %10d %10d %10d\t" %
                     (int(sizes[0]), int(sizes[1]), int(sizes[2]), int(sizes[3])), end=' ')
                 print("%s" % filename[len(os.getcwd()) + 1:])
             global n_ko_files, ko_text, ko_data, ko_bss, ko_total
@@ -94,7 +94,7 @@ def get_vmlinux_totals():
         if len(output) > 2:
             sizes = output[-1].split()[0:4]
             if verbose:
-                print("     %10d %10d %10d %10d\t" % \
+                print("     %10d %10d %10d %10d\t" %
                     (int(sizes[0]), int(sizes[1]), int(sizes[2]), int(sizes[3])), end=' ')
                 print("%s" % vmlinux_file[len(os.getcwd()) + 1:])
             global vmlinux_text, vmlinux_data, vmlinux_bss, vmlinux_total
@@ -132,16 +132,16 @@ def main():
     print("\nTotals:")
     print("\nvmlinux:")
     print("    text\tdata\t\tbss\t\ttotal")
-    print("    %-10d\t%-10d\t%-10d\t%-10d" % \
+    print("    %-10d\t%-10d\t%-10d\t%-10d" %
         (vmlinux_text, vmlinux_data, vmlinux_bss, vmlinux_total))
     print("\nmodules (%d):" % n_ko_files)
     print("    text\tdata\t\tbss\t\ttotal")
-    print("    %-10d\t%-10d\t%-10d\t%-10d" % \
+    print("    %-10d\t%-10d\t%-10d\t%-10d" %
         (ko_text, ko_data, ko_bss, ko_total))
     print("\nvmlinux + modules:")
     print("    text\tdata\t\tbss\t\ttotal")
-    print("    %-10d\t%-10d\t%-10d\t%-10d" % \
-        (vmlinux_text + ko_text, vmlinux_data + ko_data, \
+    print("    %-10d\t%-10d\t%-10d\t%-10d" %
+        (vmlinux_text + ko_text, vmlinux_data + ko_data,
          vmlinux_bss + ko_bss, vmlinux_total + ko_total))
 
 if __name__ == "__main__":
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 44e77b73d0..c345ca5674 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -107,12 +107,12 @@ def main():
     logger.info("Detected layers:")
     for layer in layers:
         if layer['type'] == LayerType.ERROR_BSP_DISTRO:
-            logger.error("%s: Can't be DISTRO and BSP type at the same time."\
-                     " Both conf/distro and conf/machine folders were found."\
+            logger.error("%s: Can't be DISTRO and BSP type at the same time."
+                     " Both conf/distro and conf/machine folders were found."
                      % layer['name'])
             layers.remove(layer)
         elif layer['type'] == LayerType.ERROR_NO_LAYER_CONF:
-            logger.info("%s: Doesn't have conf/layer.conf file, so ignoring"\
+            logger.info("%s: Doesn't have conf/layer.conf file, so ignoring"
                      % layer['name'])
             layers.remove(layer)
         else:
-- 
2.32.0

