Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4313.1794732534660300965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N4sDP7CZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2750017f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732533; x=1795337333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ic4PhKDKC/l+5YXO7nJhqLyNk+JKsmErvbla0bTtFWE=;
        b=N4sDP7CZsbPCKOcdvfTNvTIXcoWAXtOIzkLLZO9hkPhKqveZKzmusW6LFPRqUUZEDw
         TtiLrKlSpSyoAMSm9bKhyGcKpNPtZmN1liasEv9HYqLiNpC3UF97YAk7R/cPYcp1EJfB
         NyUxev4r/f4yRxksi7R3VhizkuUDawNMvzlDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732533; x=1795337333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ic4PhKDKC/l+5YXO7nJhqLyNk+JKsmErvbla0bTtFWE=;
        b=tTOjERlSBFeDUo6mtPT2A6B9jomO5XJJ4H50ldXjE9PHWTI031hNjCbqRLkX+w6IbB
         ii+qW0xijgiAMNEFyp5PcRe5MKtpnBaGDBMzHKrB7BU7w6BdmGAE7Ejoua6ldMRMi8z/
         81DdPpx6rLY8WIeewnjjfvQWtDA2AGkRhzbkhpiddNu9yEKvI9WSMTsiD1QO7U2SmEM1
         bPIEhWofH33SS8metdxvu8zFqKpPtdscM6V66ZGYPw5XXrzcMRmiY0PSa4elknya1W/b
         kh1krq75LMRPj6XhZXFskYFxKLiQQXH7mzUiY96VHBbmajwkFr4LS9VpU62XHPlOtjPX
         1oxw==
X-Gm-Message-State: APuU4Z+P5frQuPxr/n+yn0zgQwzkyIjw2ZszGV36HRAqK1u9nfZM8bk+
	JmcyO8M9bmxeiQXutV0c7SSDcgBfN23GKns2qsTu1HjY2DQCGEsiKplQ+rJSbJyUIN5bkXmKoI4
	JCm6Dd0s=
X-Gm-Gg: AYBFou3oGaN5gVWMuntMut1/LGvyweoIOCgHRNzRvCpjIocXUOl28YgAwilIO7Da20m
	zr8+uCz2QcRd04JfB4vOcmzWbCMJIyGhSbyNBh497WnltTAgX2s6mrmvPX/sKq8Pi+w5RneN0Rz
	/X2JeUklwIBxEZyYob8/JRQiDrybGfzcxzdfNU6K2WPeOSfM2lCO6i/V1VtM8JdZdESWHorE+pD
	wtJKwthVRkIvh3sWlq11gQqVNKTYjxZF2Y77goMUKohsSB83kVWF6WZQ1eNLNpfZJyovgNM84nS
	xazCJG146brfpA3HDwbePk2P6W02x0GQo+aCalg6wSor1omeUW/tZyFOSc28nhTLD3svoWrp8Jc
	ws9gRsrQu0LC0IMlwowSC1XYq+rwnWdEunBbdl5K6NP8YnMPAEkVCkqVjLkA+T5gJ5On6SGeloJ
	kgD8641HsNqeVOcX9IjqamQJFcs/xV5NZNDeTXJpdhn5tehPneNcz+s4IMXo/GZZMhO83Gb1gbE
	GZwkqK+DqsNdGxiQgXpa+WE0DVL++ix3g70KUVViu9gCwBI+PTN86AnJr8NpTHS+zsU94XWGc0i
	Q25q7CqSVEFOn7lrtvDyK91mT8CU3TOKdXGKBLzNq2EIRFyVKLoPLFOhIw==
X-Received: by 2002:a5d:5f08:0:b0:48d:f36e:ccc0 with SMTP id ffacd0b85a97d-49c6a645d4fmr15264347f8f.0.1794732532254;
        Sun, 15 Nov 2026 00:48:52 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.48.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:48:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/41] lib: Simplify super() calls
Date: Sun, 15 Nov 2026 08:48:05 +0000
Message-ID: <20261115084845.701136-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250234
Content-Type: text/plain; charset="utf-8"

python3 allows the super() calls to be simplified, make this
change through our python code.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/classutils.py                     |  2 +-
 meta/lib/oe/package_manager/common_deb_ipk.py |  2 +-
 meta/lib/oe/package_manager/deb/__init__.py   |  2 +-
 meta/lib/oe/package_manager/deb/rootfs.py     |  4 ++--
 meta/lib/oe/package_manager/deb/sdk.py        |  2 +-
 meta/lib/oe/package_manager/ipk/__init__.py   |  4 ++--
 meta/lib/oe/package_manager/ipk/rootfs.py     |  4 ++--
 meta/lib/oe/package_manager/ipk/sdk.py        |  2 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |  2 +-
 meta/lib/oe/package_manager/rpm/rootfs.py     |  2 +-
 meta/lib/oe/package_manager/rpm/sdk.py        |  2 +-
 meta/lib/oe/terminal.py                       |  2 +-
 meta/lib/oeqa/buildperf/base.py               | 20 +++++++++----------
 meta/lib/oeqa/controllers/controllerimage.py  |  6 +++---
 meta/lib/oeqa/core/decorator/depends.py       |  2 +-
 meta/lib/oeqa/core/loader.py                  |  6 +++---
 meta/lib/oeqa/core/runner.py                  | 18 ++++++++---------
 meta/lib/oeqa/core/target/qemu.py             |  2 +-
 meta/lib/oeqa/core/target/serial.py           |  2 +-
 meta/lib/oeqa/core/target/ssh.py              |  2 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |  6 +++---
 meta/lib/oeqa/oetest.py                       | 12 +++++------
 meta/lib/oeqa/runtime/case.py                 |  4 ++--
 meta/lib/oeqa/runtime/context.py              |  6 +++---
 meta/lib/oeqa/runtime/loader.py               |  2 +-
 meta/lib/oeqa/sdk/context.py                  |  8 ++++----
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py    |  4 ++--
 meta/lib/oeqa/selftest/case.py                | 10 +++++-----
 .../selftest/cases/_sstatetests_noauto.py     |  2 +-
 meta/lib/oeqa/selftest/cases/bblayers.py      |  2 +-
 meta/lib/oeqa/selftest/cases/bblock.py        |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  8 ++++----
 meta/lib/oeqa/selftest/cases/esdk.py          |  2 +-
 meta/lib/oeqa/selftest/cases/gotoolchain.py   |  4 ++--
 .../oeqa/selftest/cases/kerneldevelopment.py  |  6 +++---
 meta/lib/oeqa/selftest/cases/layerappend.py   |  2 +-
 meta/lib/oeqa/selftest/cases/manifest.py      |  2 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py      |  4 ++--
 meta/lib/oeqa/selftest/cases/pkgdata.py       |  2 +-
 meta/lib/oeqa/selftest/cases/prservice.py     |  2 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |  8 ++++----
 meta/lib/oeqa/selftest/cases/runqemu.py       |  4 ++--
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  4 ++--
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  2 +-
 meta/lib/oeqa/selftest/cases/wic.py           |  4 ++--
 meta/lib/oeqa/selftest/context.py             |  8 ++++----
 meta/lib/oeqa/targetcontrol.py                |  8 ++++----
 meta/lib/oeqa/utils/dump.py                   |  4 ++--
 meta/lib/oeqa/utils/targetbuild.py            |  4 ++--
 meta/lib/patchtest/tests/base.py              |  4 ++--
 scripts/lib/argparse_oe.py                    | 14 ++++++-------
 scripts/lib/buildstats.py                     |  2 +-
 scripts/lib/checklayer/context.py             |  2 +-
 scripts/lib/devtool/__init__.py               |  2 +-
 scripts/test-remote-image                     |  4 ++--
 55 files changed, 126 insertions(+), 126 deletions(-)
 mode change 100755 => 100644 scripts/test-remote-image

diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
index ec3f6ad720f..a73e0ebb1b5 100644
--- a/meta/lib/oe/classutils.py
+++ b/meta/lib/oe/classutils.py
@@ -25,7 +25,7 @@ control over whether the class will be added to the registry (e.g. to keep
 abstract base classes out of the registry)."""
     priority = 0
     def __init__(cls, name, bases, attrs):
-        super(ClassRegistry, cls).__init__(name, bases, attrs)
+        super().__init__(name, bases, attrs)
         try:
             if not cls.implemented:
                 return
diff --git a/meta/lib/oe/package_manager/common_deb_ipk.py b/meta/lib/oe/package_manager/common_deb_ipk.py
index b93089e523a..cb337cce462 100644
--- a/meta/lib/oe/package_manager/common_deb_ipk.py
+++ b/meta/lib/oe/package_manager/common_deb_ipk.py
@@ -18,7 +18,7 @@ class OpkgDpkgPM(PackageManager):
         """
         This is an abstract class. Do not instantiate this directly.
         """
-        super(OpkgDpkgPM, self).__init__(d, target_rootfs)
+        super().__init__(d, target_rootfs)
 
     def package_info(self, pkg):
         """
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index e878401468b..c2325f17bd7 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -115,7 +115,7 @@ class PMPkgsList(PkgsList):
 
 class DpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None, deb_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
-        super(DpkgPM, self).__init__(d, target_rootfs)
+        super().__init__(d, target_rootfs)
         self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), deb_repo_workdir)
 
         create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_DEB"), "package_write_deb", filterbydependencies)
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index d2b077cc374..df3932b0294 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -14,7 +14,7 @@ from oe.package_manager.deb import DpkgPM
 
 class DpkgOpkgRootfs(Rootfs):
     def __init__(self, d, progress_reporter=None, logcatcher=None):
-        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super().__init__(d, progress_reporter, logcatcher)
 
     def _get_pkgs_postinsts(self, status_file):
         def _get_pkg_depends_list(pkg_depends):
@@ -124,7 +124,7 @@ class DpkgOpkgRootfs(Rootfs):
 
 class PkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super().__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '^E:'
         self.log_check_expected_regexes = \
         [
diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index 46dcc16cc74..f4134c21300 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -14,7 +14,7 @@ from oe.package_manager.deb.manifest import PkgManifest
 
 class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
-        super(PkgSdk, self).__init__(d, manifest_dir)
+        super().__init__(d, manifest_dir)
 
         self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
         self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 6c0b896a086..489fe4d3796 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -67,7 +67,7 @@ class OpkgIndexer(Indexer):
 
 class PMPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir):
-        super(PMPkgsList, self).__init__(d, rootfs_dir)
+        super().__init__(d, rootfs_dir)
         config_file = d.getVar("IPKGCONF_TARGET")
 
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
@@ -95,7 +95,7 @@ class PMPkgsList(PkgsList):
 
 class OpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
-        super(OpkgPM, self).__init__(d, target_rootfs)
+        super().__init__(d, target_rootfs)
 
         self.config_file = config_file
         self.pkg_archs = archs
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index a760000d3fa..3509413d87b 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -15,7 +15,7 @@ from oe.package_manager.ipk import OpkgPM
 
 class DpkgOpkgRootfs(Rootfs):
     def __init__(self, d, progress_reporter=None, logcatcher=None):
-        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super().__init__(d, progress_reporter, logcatcher)
 
     def _get_pkgs_postinsts(self, status_file):
         def _get_pkg_depends_list(pkg_depends):
@@ -125,7 +125,7 @@ class DpkgOpkgRootfs(Rootfs):
 
 class PkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super().__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '(exit 1|Collected errors)'
 
         self.manifest = PkgManifest(d, manifest_dir)
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index 9a7ff9f0c9e..3c916ccead5 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -14,7 +14,7 @@ from oe.package_manager.ipk import OpkgPM
 
 class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
-        super(PkgSdk, self).__init__(d, manifest_dir)
+        super().__init__(d, manifest_dir)
 
         # In sdk_list_installed_packages the call to opkg is hardcoded to
         # always use IPKGCONF_TARGET and there's no exposed API to change this
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 3460a6bb35e..c2595f3b3c6 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -64,7 +64,7 @@ class RpmPM(PackageManager):
                  rpm_repo_workdir="oe-rootfs-repo",
                  filterbydependencies=True,
                  needfeed=True):
-        super(RpmPM, self).__init__(d, target_rootfs)
+        super().__init__(d, target_rootfs)
         self.target_vendor = target_vendor
         self.task_name = task_name
         if arch_var == None:
diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index 8d54b5ab48c..19ec2e47906 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -12,7 +12,7 @@ from oe.package_manager.rpm import RpmPM
 
 class PkgRootfs(Rootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        super().__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
                                r'|exit 1\b|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index ea79fe050bc..b74d566690f 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -13,7 +13,7 @@ from oe.package_manager.rpm import RpmPM
 
 class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
-        super(PkgSdk, self).__init__(d, manifest_dir)
+        super().__init__(d, manifest_dir)
 
         self.target_manifest = PkgManifest(d, self.manifest_dir,
                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index a8d3840153f..f762ef6c8c7 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -24,7 +24,7 @@ class Registry(oe.classutils.ClassRegistry):
     command = None
 
     def __init__(cls, name, bases, attrs):
-        super(Registry, cls).__init__(name.lower(), bases, attrs)
+        super().__init__(name.lower(), bases, attrs)
 
     @property
     def implemented(cls):
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 5d656c781a7..944314d7c29 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -90,7 +90,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
     test_run_queue = []
 
     def __init__(self, out_dir, *args, **kwargs):
-        super(BuildPerfTestResult, self).__init__(*args, **kwargs)
+        super().__init__(*args, **kwargs)
 
         self.out_dir = out_dir
         self.hostname = socket.gethostname()
@@ -100,30 +100,30 @@ class BuildPerfTestResult(unittest.TextTestResult):
 
     def addSuccess(self, test):
         """Record results from successful tests"""
-        super(BuildPerfTestResult, self).addSuccess(test)
+        super().addSuccess(test)
         self.successes.append(test)
 
     def addError(self, test, err):
         """Record results from crashed test"""
         test.err = err
-        super(BuildPerfTestResult, self).addError(test, err)
+        super().addError(test, err)
 
     def addFailure(self, test, err):
         """Record results from failed test"""
         test.err = err
-        super(BuildPerfTestResult, self).addFailure(test, err)
+        super().addFailure(test, err)
 
     def addExpectedFailure(self, test, err):
         """Record results from expectedly failed test"""
         test.err = err
-        super(BuildPerfTestResult, self).addExpectedFailure(test, err)
+        super().addExpectedFailure(test, err)
 
     def startTest(self, test):
         """Pre-test hook"""
         test.base_dir = self.out_dir
         log.info("Executing test %s: %s", test.name, test.shortDescription())
         self.stream.write(datetime.now().strftime("[%Y-%m-%d %H:%M:%S] "))
-        super(BuildPerfTestResult, self).startTest(test)
+        super().startTest(test)
 
     def startTestRun(self):
         """Pre-run hook"""
@@ -248,7 +248,7 @@ class BuildPerfTestCase(unittest.TestCase):
     build_target = None
 
     def __init__(self, *args, **kwargs):
-        super(BuildPerfTestCase, self).__init__(*args, **kwargs)
+        super().__init__(*args, **kwargs)
         self.name = self._testMethodName
         self.base_dir = None
         self.start_time = None
@@ -268,7 +268,7 @@ class BuildPerfTestCase(unittest.TestCase):
         return os.path.join(self.base_dir, self.name + '.tmp')
 
     def shortDescription(self):
-        return super(BuildPerfTestCase, self).shortDescription() or ""
+        return super().shortDescription() or ""
 
     def setUp(self):
         """Set-up fixture for each test"""
@@ -285,7 +285,7 @@ class BuildPerfTestCase(unittest.TestCase):
     def run(self, *args, **kwargs):
         """Run test"""
         self.start_time = datetime.now()
-        super(BuildPerfTestCase, self).run(*args, **kwargs)
+        super().run(*args, **kwargs)
         self.elapsed_time = datetime.now() - self.start_time
 
     def run_cmd(self, cmd):
@@ -496,7 +496,7 @@ class BuildPerfTestRunner(unittest.TextTestRunner):
     sortTestMethodsUsing = None
 
     def __init__(self, out_dir, *args, **kwargs):
-        super(BuildPerfTestRunner, self).__init__(*args, **kwargs)
+        super().__init__(*args, **kwargs)
         self.out_dir = out_dir
 
     def _makeResult(self):
diff --git a/meta/lib/oeqa/controllers/controllerimage.py b/meta/lib/oeqa/controllers/controllerimage.py
index 78a4aaff873..e71143bdacd 100644
--- a/meta/lib/oeqa/controllers/controllerimage.py
+++ b/meta/lib/oeqa/controllers/controllerimage.py
@@ -29,7 +29,7 @@ class ControllerImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABC
     supported_image_fstypes = ['tar.gz', 'tar.bz2']
 
     def __init__(self, d):
-        super(ControllerImageHardwareTarget, self).__init__(d)
+        super().__init__(d)
 
         # target ip
         addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
@@ -119,7 +119,7 @@ class ControllerImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABC
 
     def deploy(self):
         # base class just sets the ssh log file for us
-        super(ControllerImageHardwareTarget, self).deploy()
+        super().deploy()
         self.controller = sshcontrol.SSHControl(ip=self.ip, logfile=self.sshlog, timeout=600, port=self.port)
         status, output = self.controller.run("cat /etc/controllerimage")
         if status != 0:
@@ -162,7 +162,7 @@ class ControllerImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABC
 class SystemdbootTarget(ControllerImageHardwareTarget):
 
     def __init__(self, d):
-        super(SystemdbootTarget, self).__init__(d)
+        super().__init__(d)
         # this the value we need to set in the LoaderEntryOneShot EFI variable
         # so the system boots the 'test' bootloader label and not the default
         # The first four bytes are EFI bits, and the rest is an utf-16le string
diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index 33f0841cab0..41a324e61fb 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -81,7 +81,7 @@ class OETestDepends(OETestDiscover):
     attrs = ('depends',)
 
     def bind(self, registry, case):
-        super(OETestDepends, self).bind(registry, case)
+        super().bind(registry, case)
         if not registry.get('depends'):
             registry['depends'] = {}
         _add_depends(registry['depends'], case, self.depends)
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 84448325804..1c964dadae6 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -95,7 +95,7 @@ class OETestLoader(unittest.TestLoader):
 
         self._patchCaseClass(self.caseClass)
 
-        super(OETestLoader, self).__init__()
+        super().__init__()
 
     def _patchCaseClass(self, testCaseClass):
         # Adds custom attributes to the OETestCase class
@@ -274,7 +274,7 @@ class OETestLoader(unittest.TestLoader):
         big_suite = self.suiteClass()
         for path in self.module_paths:
             _find_duplicated_modules(big_suite, path)
-            suite = super(OETestLoader, self).discover(path,
+            suite = super().discover(path,
                     pattern='*.py', top_level_dir=path)
             big_suite.addTests(suite)
 
@@ -329,7 +329,7 @@ class OETestLoader(unittest.TestLoader):
         load_module, load_underscore = self._filterModule(module)
 
         if load_module or load_underscore:
-            return super(OETestLoader, self).loadTestsFromModule(
+            return super().loadTestsFromModule(
                     module, *args, pattern=pattern, **kws)
         else:
             return self.suiteClass()
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 0d2bc3a3ed0..8ad65facead 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -37,7 +37,7 @@ class OEStreamLogger(object):
 
 class OETestResult(_TestResult):
     def __init__(self, tc, *args, **kwargs):
-        super(OETestResult, self).__init__(*args, **kwargs)
+        super().__init__(*args, **kwargs)
 
         self.successes = []
         self.starttime = {}
@@ -58,14 +58,14 @@ class OETestResult(_TestResult):
         # May have been set by concurrencytest
         if test.id() not in self.starttime:
             self.starttime[test.id()] = time.time()
-        super(OETestResult, self).startTest(test)
+        super().startTest(test)
 
     def stopTest(self, test):
         self.endtime[test.id()] = time.time()
         if self.buffer:
             self.logged_output[test.id()] = (
                     sys.stdout.getvalue(), sys.stderr.getvalue())
-        super(OETestResult, self).stopTest(test)
+        super().stopTest(test)
         if test.id() in self.progressinfo:
             self.tc.logger.info(self.progressinfo[test.id()])
 
@@ -153,25 +153,25 @@ class OETestResult(_TestResult):
 
     def addError(self, test, *args, details = None):
         self.extractExtraResults(test, details = details)
-        return super(OETestResult, self).addError(test, *args)
+        return super().addError(test, *args)
 
     def addFailure(self, test, *args, details = None):
         self.extractExtraResults(test, details = details)
-        return super(OETestResult, self).addFailure(test, *args)
+        return super().addFailure(test, *args)
 
     def addSuccess(self, test, details = None):
         #Added so we can keep track of successes too
         self.successes.append((test, None))
         self.extractExtraResults(test, details = details)
-        return super(OETestResult, self).addSuccess(test)
+        return super().addSuccess(test)
 
     def addExpectedFailure(self, test, *args, details = None):
         self.extractExtraResults(test, details = details)
-        return super(OETestResult, self).addExpectedFailure(test, *args)
+        return super().addExpectedFailure(test, *args)
 
     def addUnexpectedSuccess(self, test, details = None):
         self.extractExtraResults(test, details = details)
-        return super(OETestResult, self).addUnexpectedSuccess(test)
+        return super().addUnexpectedSuccess(test)
 
     def logDetails(self, json_file_dir=None, configuration=None, result_id=None,
             dump_streams=False):
@@ -252,7 +252,7 @@ class OETestRunner(_TestRunner):
 
     def __init__(self, tc, *args, **kwargs):
         kwargs['stream'] = self.streamLoggerClass(tc.logger)
-        super(OETestRunner, self).__init__(*args, **kwargs)
+        super().__init__(*args, **kwargs)
         self.tc = tc
         self.resultclass = OETestResult
 
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 76c1ada02e6..a4f53747b01 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -24,7 +24,7 @@ class OEQemuTarget(OESSHTarget):
             tmpdir='', dir_image='', boottime=60, serial_ports=2,
             boot_patterns = defaultdict(str), ovmf=False, tmpfsdir=None, native_sysroot=None, **kwargs):
 
-        super(OEQemuTarget, self).__init__(logger, None, server_ip, timeout,
+        super().__init__(logger, None, server_ip, timeout,
                 user, port)
 
         self.server_ip = server_ip
diff --git a/meta/lib/oeqa/core/target/serial.py b/meta/lib/oeqa/core/target/serial.py
index 7c2cd8b2485..bafcaf9a95d 100644
--- a/meta/lib/oeqa/core/target/serial.py
+++ b/meta/lib/oeqa/core/target/serial.py
@@ -25,7 +25,7 @@ class OESerialTarget(OETarget):
             fileHandler.setFormatter(formatter)
             logger.addHandler(fileHandler)
 
-        super(OESerialTarget, self).__init__(logger)
+        super().__init__(logger)
 
         if serialcontrol_ps1:
             self.target_ps1 = serialcontrol_ps1
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 0ac3ae43889..757ab67580c 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -27,7 +27,7 @@ class OESSHTarget(OETarget):
             fileHandler.setFormatter(formatter)
             logger.addHandler(fileHandler)
 
-        super(OESSHTarget, self).__init__(logger)
+        super().__init__(logger)
         self.ip = ip
         self.server_ip = server_ip
         self.server_port = server_port
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index d10f8f7f04c..5a760c620b2 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -51,7 +51,7 @@ _all__ = [
 class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
 
     def __init__(self, target, semaphore, threadnum, totalinprocess, totaltests, output, finalresult):
-        super(BBThreadsafeForwardingResult, self).__init__(target, semaphore)
+        super().__init__(target, semaphore)
         self.threadnum = threadnum
         self.totalinprocess = totalinprocess
         self.totaltests = totaltests
@@ -81,7 +81,7 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
             self.semaphore.release()
         self.finalresult._stderr_buffer = io.StringIO(initial_value=self.outputbuf.getvalue().decode("utf-8"))
         self.finalresult._stdout_buffer = io.StringIO()
-        super(BBThreadsafeForwardingResult, self)._add_result_with_semaphore(method, test, *args, **kwargs)
+        super()._add_result_with_semaphore(method, test, *args, **kwargs)
 
 class ProxyTestResult:
     # a very basic TestResult proxy, in order to modify add* calls
@@ -194,7 +194,7 @@ class dummybuf(object):
 class ConcurrentTestSuite(unittest.TestSuite):
 
     def __init__(self, suite, processes, setupfunc, removefunc, bb_vars):
-        super(ConcurrentTestSuite, self).__init__([suite])
+        super().__init__([suite])
         self.processes = processes
         self.setupfunc = setupfunc
         self.removefunc = removefunc
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index bcb6a878c7a..af555bea620 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -88,7 +88,7 @@ class oeTest(unittest.TestCase):
 class oeRuntimeTest(oeTest):
     def __init__(self, methodName='runTest'):
         self.target = oeRuntimeTest.tc.target
-        super(oeRuntimeTest, self).__init__(methodName)
+        super().__init__(methodName)
 
     def setUp(self):
         # Install packages in the DUT
@@ -346,7 +346,7 @@ class TestContext(object):
 
 class RuntimeTestContext(TestContext):
     def __init__(self, d, target, exported=False):
-        super(RuntimeTestContext, self).__init__(d, exported)
+        super().__init__(d, exported)
 
         self.target = target
 
@@ -549,7 +549,7 @@ class RuntimeTestContext(TestContext):
 
 class ImageTestContext(RuntimeTestContext):
     def __init__(self, d, target, host_dumper):
-        super(ImageTestContext, self).__init__(d, target)
+        super().__init__(d, target)
 
         self.tagexp = d.getVar("TEST_SUITES_TAGS")
 
@@ -570,7 +570,7 @@ class ImageTestContext(RuntimeTestContext):
         """
 
         pkg_dir = self.d.getVar("TEST_EXTRACTED_DIR")
-        super(ImageTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
+        super().install_uninstall_packages(test_id, pkg_dir, install)
 
 class ExportTestContext(RuntimeTestContext):
     def __init__(self, d, target, exported=False, parsedArgs={}):
@@ -580,7 +580,7 @@ class ExportTestContext(RuntimeTestContext):
         parsedArgs can contain the following:
             - tag:      Filter test by tag.
         """
-        super(ExportTestContext, self).__init__(d, target, exported)
+        super().__init__(d, target, exported)
 
         tag = parsedArgs.get("tag", None)
         self.tagexp = tag if tag != None else d.getVar("TEST_SUITES_TAGS")
@@ -595,4 +595,4 @@ class ExportTestContext(RuntimeTestContext):
         export_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
         extracted_dir = self.d.getVar("TEST_EXPORT_EXTRACTED_DIR")
         pkg_dir = os.path.join(export_dir, extracted_dir)
-        super(ExportTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
+        super().install_uninstall_packages(test_id, pkg_dir, install)
diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
index af1e3ca4ab3..4a6a0a1b816 100644
--- a/meta/lib/oeqa/runtime/case.py
+++ b/meta/lib/oeqa/runtime/case.py
@@ -15,11 +15,11 @@ class OERuntimeTestCase(OETestCase):
     target = None
 
     def setUp(self):
-        super(OERuntimeTestCase, self).setUp()
+        super().setUp()
         install_package(self)
 
     def tearDown(self):
-        super(OERuntimeTestCase, self).tearDown()
+        super().tearDown()
         uninstall_package(self)
 
 def run_network_serialdebug(target):
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index daabc449109..0763fb25ac0 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -21,7 +21,7 @@ class OERuntimeTestContext(OETestContext):
 
     def __init__(self, td, logger, target,
                  image_packages, extract_dir):
-        super(OERuntimeTestContext, self).__init__(td, logger)
+        super().__init__(td, logger)
 
         self.target = target
         self.image_packages = image_packages
@@ -56,7 +56,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     default_extract_dir = 'packages/extracted'
 
     def register_commands(self, logger, subparsers):
-        super(OERuntimeTestContextExecutor, self).register_commands(logger, subparsers)
+        super().register_commands(logger, subparsers)
 
         runtime_group = self.parser.add_argument_group('runtime options')
 
@@ -204,7 +204,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         if not args.packages_manifest:
             raise TypeError('Manifest file not provided')
 
-        super(OERuntimeTestContextExecutor, self)._process_args(logger, args)
+        super()._process_args(logger, args)
 
         td = self.tc_kwargs['init']['td']
 
diff --git a/meta/lib/oeqa/runtime/loader.py b/meta/lib/oeqa/runtime/loader.py
index 7041ddfde82..e999d812ebb 100644
--- a/meta/lib/oeqa/runtime/loader.py
+++ b/meta/lib/oeqa/runtime/loader.py
@@ -11,7 +11,7 @@ class OERuntimeTestLoader(OETestLoader):
     caseClass = OERuntimeTestCase
 
     def _getTestCase(self, testCaseClass, tcName):
-        case = super(OERuntimeTestLoader, self)._getTestCase(testCaseClass, tcName)
+        case = super()._getTestCase(testCaseClass, tcName)
 
         # Adds custom attributes to the OERuntimeTestCase
         setattr(case, 'target', self.tc.target)
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index d4fdd832070..891910d218c 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -16,7 +16,7 @@ class OESDKTestContext(OETestContext):
 
     def __init__(self, td=None, logger=None, sdk_dir=None, sdk_env=None,
             target_pkg_manifest=None, host_pkg_manifest=None):
-        super(OESDKTestContext, self).__init__(td, logger)
+        super().__init__(td, logger)
 
         self.sdk_dir = sdk_dir
         self.sdk_env = sdk_env
@@ -63,7 +63,7 @@ class OESDKTestContextExecutor(OETestContextExecutor):
     default_test_data = None
 
     def register_commands(self, logger, subparsers):
-        super(OESDKTestContextExecutor, self).register_commands(logger, subparsers)
+        super().register_commands(logger, subparsers)
 
         sdk_group = self.parser.add_argument_group('sdk options')
         sdk_group.add_argument('--sdk-env', action='store',
@@ -99,7 +99,7 @@ class OESDKTestContextExecutor(OETestContextExecutor):
         return pkg_manifest
 
     def _process_args(self, logger, args):
-        super(OESDKTestContextExecutor, self)._process_args(logger, args)
+        super()._process_args(logger, args)
 
         self.tc_kwargs['init']['sdk_dir'] = args.sdk_dir
         self.tc_kwargs['init']['sdk_env'] = self.sdk_env
@@ -151,6 +151,6 @@ class OESDKTestContextExecutor(OETestContextExecutor):
                    "environment (%s) specified" % args.sdk_env, self.name)
 
         self.sdk_env = sdk_envs[args.sdk_env]
-        return super(OESDKTestContextExecutor, self).run(logger, args)
+        return super().run(logger, args)
 
 _executor_class = OESDKTestContextExecutor
diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
index 32f5e3310de..66edf56f6a1 100644
--- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -32,10 +32,10 @@ class SDKBuildProject(BuildProject):
         self.targetdir = os.path.join(self.targetdir, self.fname)
 
     def run_configure(self, configure_args='', extra_cmds=''):
-        return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=extra_cmds)
+        return super().run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=extra_cmds)
 
     def run_install(self, install_args=''):
-        return super(SDKBuildProject, self).run_install(install_args=(install_args or "DESTDIR=%s/../install" % self.targetdir))
+        return super().run_install(install_args=(install_args or "DESTDIR=%s/../install" % self.targetdir))
 
     def log(self, msg):
         if self.logfile:
diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index b0b55053786..bcbd9811407 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -17,11 +17,11 @@ import bb.utils
 class OESelftestTestCase(OETestCase):
     def __init__(self, methodName="runTest"):
         self._extra_tear_down_commands = []
-        super(OESelftestTestCase, self).__init__(methodName)
+        super().__init__(methodName)
 
     @classmethod
     def setUpClass(cls):
-        super(OESelftestTestCase, cls).setUpClass()
+        super().setUpClass()
 
         cls.testlayer_path = cls.tc.config_paths['testlayer_path']
         cls.builddir = cls.tc.config_paths['builddir']
@@ -46,7 +46,7 @@ class OESelftestTestCase(OETestCase):
     def tearDownClass(cls):
         cls.remove_include()
         cls.remove_inc_files()
-        super(OESelftestTestCase, cls).tearDownClass()
+        super().tearDownClass()
 
     @classmethod
     def add_include(cls):
@@ -94,7 +94,7 @@ class OESelftestTestCase(OETestCase):
                 pass
 
     def setUp(self):
-        super(OESelftestTestCase, self).setUp()
+        super().setUp()
         os.chdir(self.builddir)
         # we don't know what the previous test left around in config or inc files
         # if it failed so we need a fresh start
@@ -144,7 +144,7 @@ class OESelftestTestCase(OETestCase):
             self._track_for_cleanup = []
 
         self.tearDownLocal()
-        super(OESelftestTestCase, self).tearDown()
+        super().tearDown()
 
     def tearDownLocal(self):
         pass
diff --git a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
index 2c9584d3291..ef6c23d1e73 100644
--- a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
@@ -16,7 +16,7 @@ class RebuildFromSState(SStateBase):
 
     @classmethod
     def setUpClass(self):
-        super(RebuildFromSState, self).setUpClass()
+        super().setUpClass()
         self.builddir = os.path.join(os.environ.get('BUILDDIR'))
 
     def get_dep_targets(self, primary_targets):
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 1817e2c68a8..849afe36718 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -16,7 +16,7 @@ class BitbakeLayers(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
-        super(BitbakeLayers, cls).setUpClass()
+        super().setUpClass()
         bitbake("python3-jsonschema-native")
         bitbake("-c addto_recipe_sysroot python3-jsonschema-native")
 
diff --git a/meta/lib/oeqa/selftest/cases/bblock.py b/meta/lib/oeqa/selftest/cases/bblock.py
index 6ed1172f2e9..a18ebee46fd 100644
--- a/meta/lib/oeqa/selftest/cases/bblock.py
+++ b/meta/lib/oeqa/selftest/cases/bblock.py
@@ -18,7 +18,7 @@ from oeqa.selftest.case import OESelftestTestCase
 class BBLock(OESelftestTestCase):
     @classmethod
     def setUpClass(cls):
-        super(BBLock, cls).setUpClass()
+        super().setUpClass()
         cls.lockfile = cls.builddir + "/conf/bblock.conf"
 
     def unlock_recipes(self, recipes=None, tasks=None):
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c72bb494873..c748c8504bb 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -110,7 +110,7 @@ class DevtoolTestCase(OESelftestTestCase):
 
     def setUp(self):
         """Test case setup function"""
-        super(DevtoolTestCase, self).setUp()
+        super().setUp()
         self.workspacedir = os.path.join(self.builddir, 'workspace')
         self.assertTrue(not os.path.exists(self.workspacedir),
                         'This test cannot be run with a workspace directory '
@@ -315,7 +315,7 @@ class DevtoolBase(DevtoolTestCase):
 
     @classmethod
     def setUpClass(cls):
-        super(DevtoolBase, cls).setUpClass()
+        super().setUpClass()
         bb_vars = get_bb_vars(['TOPDIR', 'SSTATE_DIR'])
         cls.original_sstate = bb_vars['SSTATE_DIR']
         cls.devtool_sstate = os.path.join(bb_vars['TOPDIR'], 'sstate_devtool')
@@ -328,11 +328,11 @@ class DevtoolBase(DevtoolTestCase):
     def tearDownClass(cls):
         cls.logger.debug('Deleting devtool sstate cache on %s' % cls.devtool_sstate)
         runCmd('rm -rf %s' % cls.devtool_sstate)
-        super(DevtoolBase, cls).tearDownClass()
+        super().tearDownClass()
 
     def setUp(self):
         """Test case setup function"""
-        super(DevtoolBase, self).setUp()
+        super().setUp()
         self.append_config(self.sstate_conf)
 
 
diff --git a/meta/lib/oeqa/selftest/cases/esdk.py b/meta/lib/oeqa/selftest/cases/esdk.py
index 691a80cc8d4..a3b06ac3652 100644
--- a/meta/lib/oeqa/selftest/cases/esdk.py
+++ b/meta/lib/oeqa/selftest/cases/esdk.py
@@ -69,7 +69,7 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
 
     @classmethod
     def setUpClass(cls):
-        super(oeSDKExtSelfTest, cls).setUpClass()
+        super().setUpClass()
         cls.image = 'core-image-minimal'
 
         bb_vars = get_bb_vars(['SSTATE_DIR', 'WORKDIR'], cls.image)
diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index ee2cf4b09a2..a856b6fdb8d 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -33,7 +33,7 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
-        super(oeGoToolchainSelfTest, cls).setUpClass()
+        super().setUpClass()
         cls.tmpdir_SDKQA = tempfile.mkdtemp(prefix='SDKQA')
         cls.go_path = os.path.join(cls.tmpdir_SDKQA, "go")
         # Build the SDK and locate it in DEPLOYDIR
@@ -46,7 +46,7 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
     @classmethod
     def tearDownClass(cls):
         shutil.rmtree(cls.tmpdir_SDKQA, ignore_errors=True)
-        super(oeGoToolchainSelfTest, cls).tearDownClass()
+        super().tearDownClass()
 
     def run_sdk_go_command(self, gocmd, proj, name):
         cmd = "cd %s/src/%s/%s; " % (self.go_path, proj, name)
diff --git a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
index b1f78a0cd17..39111d7513e 100644
--- a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
+++ b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
@@ -13,7 +13,7 @@ class KernelDev(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
-        super(KernelDev, cls).setUpClass()
+        super().setUpClass()
         # Create the recipe directory structure inside the created layer
         cls.layername = 'meta-kerneltest'
         runCmd('bitbake-layers create-layer %s' % cls.layername)
@@ -27,10 +27,10 @@ class KernelDev(OESelftestTestCase):
     def tearDownClass(cls):
         runCmd('bitbake-layers remove-layer %s' % cls.layername, ignore_status=True)
         runCmd('rm -rf %s' % cls.layername)
-        super(KernelDev, cls).tearDownClass()
+        super().tearDownClass()
 
     def setUp(self):
-        super(KernelDev, self).setUp()
+        super().setUp()
         self.set_machine_config('MACHINE = "qemux86-64"\n')
 
     def test_apply_patches(self):
diff --git a/meta/lib/oeqa/selftest/cases/layerappend.py b/meta/lib/oeqa/selftest/cases/layerappend.py
index e8634d9fc84..afd65b485f1 100644
--- a/meta/lib/oeqa/selftest/cases/layerappend.py
+++ b/meta/lib/oeqa/selftest/cases/layerappend.py
@@ -53,7 +53,7 @@ SRC_URI:append = " file://appendtest.txt"
     def tearDownLocal(self):
         if self.layerappend:
             ftools.remove_from_file(self.builddir + "/conf/bblayers.conf", self.layerappend)
-        super(LayerAppendTests, self).tearDownLocal()
+        super().tearDownLocal()
 
     def test_layer_appends(self):
         corebase = get_bb_var("COREBASE")
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 07a6c804896..bbb92c17409 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -52,7 +52,7 @@ class VerifyManifest(OESelftestTestCase):
     @classmethod
     def setUpClass(self):
 
-        super(VerifyManifest, self).setUpClass()
+        super().setUpClass()
         self.buildtarget = 'core-image-minimal'
         self.classname = 'VerifyManifest'
 
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index f105302d8ba..295ad3da6b4 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -16,7 +16,7 @@ class MetaIDE(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
-        super(MetaIDE, cls).setUpClass()
+        super().setUpClass()
         bitbake('meta-ide-support')
         bitbake('build-sysroots -c build_native_sysroot')
         bitbake('build-sysroots -c build_target_sysroot')
@@ -30,7 +30,7 @@ class MetaIDE(OESelftestTestCase):
     @classmethod
     def tearDownClass(cls):
         shutil.rmtree(cls.tmpdir_metaideQA, ignore_errors=True)
-        super(MetaIDE, cls).tearDownClass()
+        super().tearDownClass()
 
     def test_meta_ide_had_installed_meta_ide_support(self):
         self.assertExists(self.environment_script_path)
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 69196ccf129..8accf1be097 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -15,7 +15,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
-        super(OePkgdataUtilTests, cls).setUpClass()
+        super().setUpClass()
         # Ensure we have the right data in pkgdata
         cls.logger.info('Running bitbake to generate pkgdata')
         bitbake('target-sdk-provides-dummy -c clean')
diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 32b499c1d90..ee03a4044dd 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -20,7 +20,7 @@ class BitbakePrTests(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
-        super(BitbakePrTests, cls).setUpClass()
+        super().setUpClass()
         cls.pkgdata_dir = get_bb_var('PKGDATA_DIR')
 
         cls.exported_db_path = os.path.join(cls.builddir, 'export.inc')
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 54b7cb3a651..e2365141ac5 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -43,7 +43,7 @@ def needTomllib(test):
 class RecipetoolBase(devtool.DevtoolTestCase):
 
     def setUpLocal(self):
-        super(RecipetoolBase, self).setUpLocal()
+        super().setUpLocal()
         self.templayerdir = templayerdir
         self.tempdir = tempfile.mkdtemp(prefix='recipetoolqa')
         self.track_for_cleanup(self.tempdir)
@@ -55,7 +55,7 @@ class RecipetoolBase(devtool.DevtoolTestCase):
 
     def tearDownLocal(self):
         runCmd('rm -rf %s/recipes-*' % self.templayerdir)
-        super(RecipetoolBase, self).tearDownLocal()
+        super().tearDownLocal()
 
     def _try_recipetool_appendcmd(self, cmd, testrecipe, expectedfiles, expectedlines=None):
         result = runCmd(cmd)
@@ -89,7 +89,7 @@ class RecipetoolAppendTests(RecipetoolBase):
 
     @classmethod
     def setUpClass(cls):
-        super(RecipetoolAppendTests, cls).setUpClass()
+        super().setUpClass()
         # Ensure we have the right data in shlibs/pkgdata
         cls.logger.info('Running bitbake to generate pkgdata')
         bitbake('-c packagedata base-files coreutils busybox selftest-recipetool-appendfile')
@@ -858,7 +858,7 @@ class RecipetoolTests(RecipetoolBase):
     def setUpClass(cls):
         import sys
 
-        super(RecipetoolTests, cls).setUpClass()
+        super().setUpClass()
         bb_vars = get_bb_vars(['BBPATH'])
         cls.bbpath = bb_vars['BBPATH']
         libpath = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib', 'recipetool')
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index bfa76812ae2..84309231eb4 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -22,7 +22,7 @@ class RunqemuTests(OESelftestTestCase):
     deploy_dir_image = ''
 
     def setUpLocal(self):
-        super(RunqemuTests, self).setUpLocal()
+        super().setUpLocal()
         self.recipe = 'core-image-minimal'
         self.machine = self.td['MACHINE']
         self.image_link_name = get_bb_var('IMAGE_LINK_NAME', self.recipe)
@@ -187,7 +187,7 @@ class QemuTest(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
-        super(QemuTest, cls).setUpClass()
+        super().setUpClass()
         cls.recipe = 'core-image-minimal'
         cls.image_fstypes = "tar.zst"
 
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 658253d2964..0e7ccf45856 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -475,7 +475,7 @@ class SystemTap(OESelftestTestCase):
 
         @classmethod
         def setUpClass(cls):
-            super(SystemTap, cls).setUpClass()
+            super().setUpClass()
             cls.image = "core-image-minimal"
 
         def default_config(self):
@@ -545,7 +545,7 @@ IMAGE_INSTALL:append = " systemtap-runtime"
 class RustKernel(OESelftestTestCase):
         @classmethod
         def setUpClass(cls):
-            super(RustKernel, cls).setUpClass()
+            super().setUpClass()
             cls.image = "core-image-minimal"
 
         def test_kernel_rust_sample(self):
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 5da8caf1c39..d33a696ba85 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -26,7 +26,7 @@ keep_temp_files = False
 class SStateBase(OESelftestTestCase):
 
     def setUpLocal(self):
-        super(SStateBase, self).setUpLocal()
+        super().setUpLocal()
         self.temp_sstate_location = None
         needed_vars = ['SSTATE_DIR', 'TCLIBC', 'TUNE_ARCH',
                        'TOPDIR', 'TARGET_VENDOR', 'TARGET_OS']
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 5b90c64cfd6..1ce3255407e 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -63,7 +63,7 @@ class WicTestCase(OESelftestTestCase):
         """This code is executed before each test method."""
         self.resultdir = os.path.join(self.builddir, "wic-tmp")
         self._old_path = os.environ.get('PATH')
-        super(WicTestCase, self).setUpLocal()
+        super().setUpLocal()
 
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
@@ -96,7 +96,7 @@ class WicTestCase(OESelftestTestCase):
         else:
             os.environ['PATH'] = self._old_path
         rmtree(self.resultdir, ignore_errors=True)
-        super(WicTestCase, self).tearDownLocal()
+        super().tearDownLocal()
 
     def _get_wic_path(self):
         if WicTestCase.wic_bindir is None:
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c9eb4817253..eb38012eae3 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -72,7 +72,7 @@ def removebuilddir(d):
 
 class OESelftestTestContext(OETestContext):
     def __init__(self, td=None, logger=None, machines=None, config_paths=None, newbuilddir=None, keep_builddir=None):
-        super(OESelftestTestContext, self).__init__(td, logger)
+        super().__init__(td, logger)
 
         self.config_paths = config_paths
         self.newbuilddir = newbuilddir
@@ -173,10 +173,10 @@ class OESelftestTestContext(OETestContext):
             return NonConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir, self.bb_vars)
 
     def runTests(self, processes=None, machine=None, skips=[]):
-        return super(OESelftestTestContext, self).runTests(processes, skips)
+        return super().runTests(processes, skips)
 
     def listTests(self, display_type, machine=None):
-        return super(OESelftestTestContext, self).listTests(display_type)
+        return super().listTests(display_type)
 
 class OESelftestTestContextExecutor(OETestContextExecutor):
     _context_class = OESelftestTestContext
@@ -261,7 +261,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         bb.utils.mkdirhier(logdir)
         args.output_log = logdir + '/%s-results-%s.log' % (self.name, args.test_start_time)
 
-        super(OESelftestTestContextExecutor, self)._process_args(logger, args)
+        super()._process_args(logger, args)
 
         if args.list_modules:
             args.list_tests = 'module'
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1deea2e5cea..283290cd227 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -93,7 +93,7 @@ class QemuTarget(BaseTarget):
 
         import oe.types
 
-        super(QemuTarget, self).__init__(d, logger)
+        super().__init__(d, logger)
 
         self.rootfs = ''
         self.kernel = ''
@@ -161,7 +161,7 @@ class QemuTarget(BaseTarget):
 
         self.logger.info("rootfs file: %s" % self.rootfs)
         self.logger.info("Qemu log file: %s" % self.qemulog)
-        super(QemuTarget, self).deploy()
+        super().deploy()
 
     def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd='', discard_writes=True):
         if 'slirp' in runqemuparams.split():
@@ -228,7 +228,7 @@ class QemuTarget(BaseTarget):
 class SimpleRemoteTarget(BaseTarget):
 
     def __init__(self, d):
-        super(SimpleRemoteTarget, self).__init__(d)
+        super().__init__(d)
         addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
         self.ip = addr.split(":")[0]
         try:
@@ -245,7 +245,7 @@ class SimpleRemoteTarget(BaseTarget):
         self.logger.info("Server IP: %s" % self.server_ip)
 
     def deploy(self):
-        super(SimpleRemoteTarget, self).deploy()
+        super().deploy()
 
     def start(self, params=None, ssh=True, extra_bootparams=None):
         if ssh:
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index d4d271369fe..588547e3a34 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -82,7 +82,7 @@ class TargetDumper(BaseDumper):
     """
 
     def __init__(self, cmds, parent_dir, runner):
-        super(TargetDumper, self).__init__(cmds, parent_dir)
+        super().__init__(cmds, parent_dir)
         self.runner = runner
         self.errors = 0
 
@@ -112,7 +112,7 @@ class MonitorDumper(BaseDumper):
     """
 
     def __init__(self, cmds, parent_dir, runner):
-        super(MonitorDumper, self).__init__(cmds, parent_dir)
+        super().__init__(cmds, parent_dir)
         self.runner = runner
         self.errors = 0
 
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 677f125a4f6..2365dda11bd 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -129,10 +129,10 @@ class SDKBuildProject(BuildProject):
         self.targetdir = os.path.join(self.targetdir, self.fname)
 
     def run_configure(self, configure_args='', extra_cmds=' gnu-configize; '):
-        return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=extra_cmds)
+        return super().run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=extra_cmds)
 
     def run_install(self, install_args=''):
-        return super(SDKBuildProject, self).run_install(install_args=(install_args or "DESTDIR=%s/../install" % self.targetdir))
+        return super().run_install(install_args=(install_args or "DESTDIR=%s/../install" % self.targetdir))
 
     def log(self, msg):
         if self.logfile:
diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index 8263932dda9..3fb9882cb4e 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -109,7 +109,7 @@ class Base(unittest.TestCase):
         if data:
             value['data'] = data
 
-        return super(Base, self).fail(json.dumps(value))
+        return super().fail(json.dumps(value))
 
     def skip(self, issue, data=None):
         """ Convert the skip string to JSON"""
@@ -120,7 +120,7 @@ class Base(unittest.TestCase):
         if data:
             value['data'] = data
 
-        return super(Base, self).skipTest(json.dumps(value))
+        return super().skipTest(json.dumps(value))
 
     def shortid(self):
         return self.id().split('.')[-1]
diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index 176b732bbc3..9d4d2cde268 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -19,7 +19,7 @@ class ArgumentParser(argparse.ArgumentParser):
     def __init__(self, *args, **kwargs):
         kwargs.setdefault('formatter_class', OeHelpFormatter)
         self._subparser_groups = OrderedDict()
-        super(ArgumentParser, self).__init__(*args, **kwargs)
+        super().__init__(*args, **kwargs)
         self._positionals.title = 'arguments'
         self._optionals.title = 'options'
 
@@ -49,7 +49,7 @@ class ArgumentParser(argparse.ArgumentParser):
         if 'dest' not in kwargs:
             kwargs['dest'] = '_subparser_name'
 
-        ret = super(ArgumentParser, self).add_subparsers(*args, **kwargs)
+        ret = super().add_subparsers(*args, **kwargs)
         # Need a way of accessing the parent parser
         ret._parent_parser = self
         # Ensure our class gets instantiated
@@ -100,7 +100,7 @@ class ArgumentSubParser(ArgumentParser):
             self._group = kwargs.pop('group')
         if 'order' in kwargs:
             self._order = kwargs.pop('order')
-        super(ArgumentSubParser, self).__init__(*args, **kwargs)
+        super().__init__(*args, **kwargs)
 
     def parse_known_args(self, args=None, namespace=None):
         # This works around argparse not handling optional positional arguments being
@@ -117,7 +117,7 @@ class ArgumentSubParser(ArgumentParser):
             action.save_nargs = action.nargs
             action.nargs = 0
 
-        namespace, remaining_args = super(ArgumentSubParser, self).parse_known_args(args, namespace)
+        namespace, remaining_args = super().parse_known_args(args, namespace)
         for action in positionals:
             # remove the empty positional values from namespace
             if hasattr(namespace, action.dest):
@@ -125,7 +125,7 @@ class ArgumentSubParser(ArgumentParser):
         for action in positionals:
             action.nargs = action.save_nargs
         # parse positionals
-        namespace, extras = super(ArgumentSubParser, self).parse_known_args(remaining_args, namespace)
+        namespace, extras = super().parse_known_args(remaining_args, namespace)
         return namespace, extras
 
     def format_help(self):
@@ -134,7 +134,7 @@ class ArgumentSubParser(ArgumentParser):
         for action in positionals:
             if hasattr(action, 'save_nargs'):
                 action.nargs = action.save_nargs
-        return super(ArgumentParser, self).format_help()
+        return super().format_help()
 
 
 class OeHelpFormatter(argparse.HelpFormatter):
@@ -172,7 +172,7 @@ class OeHelpFormatter(argparse.HelpFormatter):
                     lines.append('%s%s' % (groupindent, self._format_action(subaction).rstrip()))
             return '\n'.join(lines)
         else:
-            return super(OeHelpFormatter, self)._format_action(action)
+            return super()._format_action(action)
 
 def int_positive(value):
     ivalue = int(value)
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index 6db60d5bcf2..ab845d82b45 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -33,7 +33,7 @@ class BSTask(dict):
         self['iostat'] = {}
         self['rusage'] = {}
         self['child_rusage'] = {}
-        super(BSTask, self).__init__(*args, **kwargs)
+        super().__init__(*args, **kwargs)
 
     @property
     def cputime(self):
diff --git a/scripts/lib/checklayer/context.py b/scripts/lib/checklayer/context.py
index 4de8f668fd2..aff2534fcfd 100644
--- a/scripts/lib/checklayer/context.py
+++ b/scripts/lib/checklayer/context.py
@@ -12,6 +12,6 @@ from oeqa.core.context import OETestContext
 
 class CheckLayerTestContext(OETestContext):
     def __init__(self, td=None, logger=None, layer=None, test_software_layer_signatures=True):
-        super(CheckLayerTestContext, self).__init__(td, logger)
+        super().__init__(td, logger)
         self.layer = layer
         self.test_software_layer_signatures = test_software_layer_signatures
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 9d227e20326..8e016cfb214 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -20,7 +20,7 @@ logger = logging.getLogger('devtool')
 class DevtoolError(Exception):
     """Exception for handling devtool errors"""
     def __init__(self, message, exitcode=1):
-        super(DevtoolError, self).__init__(message)
+        super().__init__(message)
         self.exitcode = exitcode
 
 
diff --git a/scripts/test-remote-image b/scripts/test-remote-image
old mode 100755
new mode 100644
index 1d018992b07..ee90231a576
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -126,7 +126,7 @@ class BaseTargetProfile(object, metaclass=ABCMeta):
 class AutoTargetProfile(BaseTargetProfile):
 
     def __init__(self, image_type):
-        super(AutoTargetProfile, self).__init__(image_type)
+        super().__init__(image_type)
         self.image_name = get_bb_var('IMAGE_LINK_NAME', target=image_type)
         self.kernel_type = get_bb_var('KERNEL_IMAGETYPE', target=image_type)
         self.controller = self.get_controller()
@@ -203,7 +203,7 @@ class BaseRepoProfile(object, metaclass=ABCMeta):
 class PublicAB(BaseRepoProfile):
 
     def __init__(self, repolink, localdir=None):
-        super(PublicAB, self).__init__(repolink, localdir)
+        super().__init__(repolink, localdir)
         if localdir is None:
             self.localdir = os.path.join(os.environ['BUILDDIR'], 'PublicABMirror')
 
