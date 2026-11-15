Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4385.1794732568675162504
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IqFF5jer;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so20172275e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732567; x=1795337367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oZKjYFAXhpeS/hzha++WxE7oXiYUe/QL0AECFZrso9o=;
        b=IqFF5jerX98W4nWzU/q+ckItpvXtRaJUpccg09QgB+MA3R9qOyoF5V/NjZVA/6lvum
         jIOsjm19b8qeLdpxc2PAo08k+lMxCTKFaiBgHSFRelZcKRX66m8QWpkyWlceD0/SOVzX
         DsInrWb3XLB35zxqmis+37DRiNfNEEY/W/c7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732567; x=1795337367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oZKjYFAXhpeS/hzha++WxE7oXiYUe/QL0AECFZrso9o=;
        b=I+47t4xyHazY4/5cj6wglu/2K0CTBCCfRhk2ONyE0rIejg3wljFHvSoGPgK4ZAlNSe
         axe9Gu8b4OgumHT/OL9fosPeAmZsTcZrHMAeuGKUkG/YnAEGfIUlXcPvd6GqdkdgaUwX
         HO6pzv/BlOrJA0B8x2uXs+1SiQB1wH7R/NzAKe4RaLZzp0J0OBeCY8w7sn7qbJnQAalp
         /ymlhBXIeBeGFZNBbMSI1RF2Gp2BX+gXgwCEo68GKVG4Hnos6LmicLWg5e1g7VCpKxwD
         NEOvxkMzo4YU8cbdA4YqEkluQu4WlXHsFU5inLDp4IG3iQ3Yek9NGabSyY+wHDBglxcK
         AxoA==
X-Gm-Message-State: APuU4Z83q5nfDW95R3id6UnISyogUHJ+8eWo9P023MBHZg2DVf7osld/
	jRPfDpX6c8FFjqaghjhHP514phfCpcUUw60BbcSY9kDWrmaR4CvCK6xW5XVrEoj0IdlpP8Gw+Z0
	ucKTGHQ8=
X-Gm-Gg: AYBFou3KHTBRM8zexp6H7He90xKJulJys/8tCpBYhRzWfelTbgatCFrNY0Oq0ftWd+a
	Fd6P0VP85i2SNhm4ndsCg6EOzU1npj6vBUGsXF9/X6sWltikd9NoVt376n+XB1VV0w62ikUaA1u
	nSqJhP9yTmY8f/eavkeGGj6/UPz8KQb4S+xmwQncVC5ZG3t7pZop8bTGLmNG16YJHEbpsyeF8rG
	zZpILs019y2nti8oTMHLObH1OnzFYppuQSGZWpJAw/Xw2m/WsRLE5b/ve3LNkw28dxUWQLSOkg2
	1Ice/Nv/y4CPFRoF/kqRMbjhdyD2JBrib2OM5zX+3u1zw24+TZbO2hMKY/Z42eA1QkHm/9J2VEt
	bdKZsHk2Lp983LHOJhUve0WnbGVWSO4W56mtcWaNDWAVIh7zXTsOqbqSh6vzeVYr7r/vPHpyKTK
	fKSEGnaigpgxORn5vQ2t3pPwCQDo67q20iY+uGZOfaCVJrolU0AL7tYWbp6lx4WJf+81wJGglBp
	oC2nbg0/JJYHYwyc1bMpbw0vSVqIEFdQ6M1lIwJj5AXt6AlSLSOhUyL2idLb1cKX3si/qryW+Ht
	dCU57kifxsLZ8nQnpvEqLnO6El8ERc87oQ6bBNNuHDbt7DLpk9V5YtmalQ==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4bb55a95dbamr153277325e9.31.1794732566720;
        Sun, 15 Nov 2026 00:49:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/41] oeqa: Remove unused code
Date: Sun, 15 Nov 2026 08:48:27 +0000
Message-ID: <20261115084845.701136-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250255
Content-Type: text/plain; charset="utf-8"

Drop code nothing uses:
- utils/targetbuild.py, an older copy of the BuildProject classes which
  are now in utils/buildproject.py, runtime/utils and sdk/utils
- str_to_fn() in buildperf, which also always raised ValueError as
  re.LOCALE can't be used with str patterns
- the dummybuf class in concurrencytest
- getCaseClass() in core/utils/test.py
- the empty metadata_from_data_store() stub
- an unused variable in sdk/context.py and an unused assignment in the
  OETestDataDepends check

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/buildperf/base.py             |   5 -
 meta/lib/oeqa/core/decorator/data.py        |   4 +-
 meta/lib/oeqa/core/utils/concurrencytest.py |  11 --
 meta/lib/oeqa/core/utils/test.py            |   6 -
 meta/lib/oeqa/sdk/context.py                |   1 -
 meta/lib/oeqa/utils/metadata.py             |   9 --
 meta/lib/oeqa/utils/targetbuild.py          | 144 --------------------
 7 files changed, 1 insertion(+), 179 deletions(-)
 delete mode 100644 meta/lib/oeqa/utils/targetbuild.py

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 37696466f4e..dcdc053da85 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -65,11 +65,6 @@ class KernelDropCaches:
         runCmd2(cmd, data=input_data)
 
 
-def str_to_fn(string):
-    """Convert string to a sanitized filename"""
-    return re.sub(r'(\W+)', '-', string, flags=re.LOCALE)
-
-
 class ResultsJsonEncoder(json.JSONEncoder):
     """Extended encoder for build perf test results"""
     unix_epoch = datetime.utcfromtimestamp(0)
diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 0daf46334f6..fddedfdb4bc 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -99,9 +99,7 @@ class OETestDataDepends(OETestDecorator):
 
     def setUpDecorator(self):
         for v in self.td_depends:
-            try:
-                value = self.case.td[v]
-            except KeyError:
+            if v not in self.case.td:
                 raise OEQAMissingVariable("Test case need %s variable but"\
                         " isn't into td" % v)
 
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index ade0a83cb82..267dba7ba19 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -198,17 +198,6 @@ def outSideTestaddSkip(self, offset, line):
 
 subunit._OutSideTest.addSkip = outSideTestaddSkip
 
-#
-# A dummy structure to add to io.StringIO so that the .buffer object
-# is available and accepts writes. This allows unittest with buffer=True
-# to interact ok with subunit which wants to access sys.stdout.buffer.
-#
-class dummybuf:
-   def __init__(self, parent):
-       self.p = parent
-   def write(self, data):
-       self.p.write(data.decode("utf-8"))
-
 #
 # Taken from testtools.ConncurrencyTestSuite but modified for OE use
 #
diff --git a/meta/lib/oeqa/core/utils/test.py b/meta/lib/oeqa/core/utils/test.py
index d38cab8a511..99b7b9e6a6c 100644
--- a/meta/lib/oeqa/core/utils/test.py
+++ b/meta/lib/oeqa/core/utils/test.py
@@ -64,12 +64,6 @@ def getCaseModule(test_case):
     """
     return test_case.__module__
 
-def getCaseClass(test_case):
-    """
-        Returns test case class name.
-    """
-    return test_case.__class__.__name__
-
 def getCaseID(test_case):
     """
         Returns test case complete id.
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index f00e40eb6c6..6024554cac4 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -113,7 +113,6 @@ class OESDKTestContextExecutor(OETestContextExecutor):
     def _get_sdk_environs(sdk_dir):
         sdk_env = {}
 
-        environ_pattern = sdk_dir + '/environment-setup-*'
         full_sdk_env = glob.glob(sdk_dir + '/environment-setup-*')
         for env in full_sdk_env:
             m = re.search('environment-setup-(.*)', env)
diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 941a66de03e..3716e997f26 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -50,15 +50,6 @@ def metadata_from_bb():
         info_dict['config'][var] = data_dict[var]
     return info_dict
 
-def metadata_from_data_store(d):
-    """ Returns test's metadata as OrderedDict.
-
-        Data will be collected from the provided data store.
-    """
-    # TODO: Getting metadata from the data store would
-    # be useful when running within bitbake.
-    pass
-
 def git_rev_info(path):
     """Get git revision information as a dict"""
     info = OrderedDict()
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
deleted file mode 100644
index 2365dda11bd..00000000000
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ /dev/null
@@ -1,144 +0,0 @@
-#
-# Copyright (C) 2013 Intel Corporation
-#
-# SPDX-License-Identifier: MIT
-#
-
-# Provides a class for automating build tests for projects
-
-import os
-import re
-import bb.utils
-import subprocess
-import tempfile
-from abc import ABCMeta, abstractmethod
-
-class BuildProject(metaclass=ABCMeta):
-
-    def __init__(self, d, uri, foldername=None, tmpdir=None):
-        self.d = d
-        self.uri = uri
-        self.archive = os.path.basename(uri)
-        self.tempdirobj = None
-        if not tmpdir:
-            tmpdir = self.d.getVar('WORKDIR')
-            if not tmpdir:
-                self.tempdirobj = tempfile.TemporaryDirectory(prefix='buildproject-')
-                tmpdir = self.tempdirobj.name
-        self.localarchive = os.path.join(tmpdir, self.archive)
-        if foldername:
-            self.fname = foldername
-        else:
-            self.fname = re.sub(r'\.tar\.bz2$|\.tar\.gz$|\.tar\.xz$', '', self.archive)
-
-    # Download self.archive to self.localarchive
-    def _download_archive(self):
-        dl_dir = self.d.getVar("DL_DIR")
-        if dl_dir and os.path.exists(os.path.join(dl_dir, self.archive)):
-            bb.utils.copyfile(os.path.join(dl_dir, self.archive), self.localarchive)
-            return
-
-        exportvars = ['HTTP_PROXY', 'http_proxy',
-                      'HTTPS_PROXY', 'https_proxy',
-                      'FTP_PROXY', 'ftp_proxy',
-                      'FTPS_PROXY', 'ftps_proxy',
-                      'NO_PROXY', 'no_proxy',
-                      'ALL_PROXY', 'all_proxy',
-                      'SOCKS5_USER', 'SOCKS5_PASSWD']
-
-        env = os.environ.copy()
-        for var in exportvars:
-            val = self.d.getVar(var)
-            if val:
-                env[var] = val
-
-        cmd = ['wget', '-O', self.localarchive, self.uri]
-        subprocess.check_output(cmd, env=env)
-
-    # This method should provide a way to run a command in the desired environment.
-    @abstractmethod
-    def _run(self, cmd):
-        pass
-
-    # The timeout parameter of target.run is set to 0 to make the ssh command
-    # run with no timeout.
-    def run_configure(self, configure_args='', extra_cmds=''):
-        return self._run('cd %s; %s ./configure %s' % (self.targetdir, extra_cmds, configure_args))
-
-    def run_make(self, make_args=''):
-        return self._run('cd %s; make %s' % (self.targetdir, make_args))
-
-    def run_install(self, install_args=''):
-        return self._run('cd %s; make install %s' % (self.targetdir, install_args))
-
-    def clean(self):
-        if self.tempdirobj:
-            self.tempdirobj.cleanup()
-        self._run('rm -rf %s' % self.targetdir)
-        subprocess.check_call(['rm', '-f', self.localarchive])
-
-class TargetBuildProject(BuildProject):
-
-    def __init__(self, target, d, uri, foldername=None):
-        self.target = target
-        self.targetdir = "~/"
-        BuildProject.__init__(self, d, uri, foldername)
-
-    def download_archive(self):
-
-        self._download_archive()
-
-        (status, output) = self.target.copy_to(self.localarchive, self.targetdir)
-        if status != 0:
-            raise Exception("Failed to copy archive to target, output: %s" % output)
-
-        (status, output) = self.target.run('tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir))
-        if status != 0:
-            raise Exception("Failed to extract archive, output: %s" % output)
-
-        #Change targetdir to project folder
-        self.targetdir = self.targetdir + self.fname
-
-    # The timeout parameter of target.run is set to 0 to make the ssh command
-    # run with no timeout.
-    def _run(self, cmd):
-        return self.target.run(cmd, 0)[0]
-
-
-class SDKBuildProject(BuildProject):
-
-    def __init__(self, testpath, sdkenv, d, uri, foldername=None):
-        self.sdkenv = sdkenv
-        self.testdir = testpath
-        self.targetdir = testpath
-        bb.utils.mkdirhier(testpath)
-        self.datetime = d.getVar('DATETIME')
-        self.testlogdir = d.getVar("TEST_LOG_DIR")
-        bb.utils.mkdirhier(self.testlogdir)
-        self.logfile = os.path.join(self.testlogdir, "sdk_target_log.%s" % self.datetime)
-        BuildProject.__init__(self, d, uri, foldername, tmpdir=testpath)
-
-    def download_archive(self):
-
-        self._download_archive()
-
-        cmd = ['tar', 'xf', self.targetdir + self.archive, '-C', self.targetdir]
-        subprocess.check_output(cmd)
-
-        #Change targetdir to project folder
-        self.targetdir = os.path.join(self.targetdir, self.fname)
-
-    def run_configure(self, configure_args='', extra_cmds=' gnu-configize; '):
-        return super().run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=extra_cmds)
-
-    def run_install(self, install_args=''):
-        return super().run_install(install_args=(install_args or "DESTDIR=%s/../install" % self.targetdir))
-
-    def log(self, msg):
-        if self.logfile:
-            with open(self.logfile, "a") as f:
-               f.write("%s\n" % msg)
-
-    def _run(self, cmd):
-        self.log("Running . %s; " % self.sdkenv + cmd)
-        return subprocess.check_call(". %s; " % self.sdkenv + cmd, shell=True)
