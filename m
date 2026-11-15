Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4318.1794732543756010918
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D6qBw5RK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2243163f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732542; x=1795337342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7PNKYsu/Yg/4CIhEfVMzas0QHiMGaz1f10476JiYFvA=;
        b=D6qBw5RKz65LpP2MQb3kgZpcLV5tqjLZ9+/4vuDx7j8+n9pA/TLmmHCrIEx/GN4QJ2
         1wdBjImJp+rb/2NiL9MXwmTJd9E3Mif4MGmK3bXIxhRQR6cpyXTt7mcODKiXRFEaajfU
         pkiPwk9SKGjvcwVE0Nxpg1kyA01YYaFH6C4jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732542; x=1795337342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7PNKYsu/Yg/4CIhEfVMzas0QHiMGaz1f10476JiYFvA=;
        b=LfmW9Vb5TQS1XnZSXAFDeYCYEEl7NOKO01vPsF2DU9sJ6W1FEzm4+aFsAH1HYMwzJF
         TB7CVQ+A2ZSPyUuq1jMEVg9aRwZiMQSevQQfVV1udhZSWz0ja/VuHjLIG7OKBQ+gZbgl
         XDLV9ZWGOlmJG3ohW7cr1Cq18W8CfM4OvJynskitHEJ/1ViprYZOGI8h2pVLwe6J/ORH
         FGpHgdtazBabSXnJyfyPedf4eTxe0X4/KXGOYod8mP1GwEN1d8xfaJAjODxUKLlMHjm4
         sGZ5OYYQ2oPVLlo3Ry/t5I2hM2DKi5MAMckaWdg3muNZnggWBtgUwtrFGCgTqJ6SUcwQ
         3mEA==
X-Gm-Message-State: APuU4Z+Eh/b5fpZKMcNzbH4KaaPqtvgfmIxzSSU1+Sr9ORN8fuGSGUb2
	fV9Gdetqdo2HsJXCWgtTeXA5Yin94OpHXb1enwTqHn4uwgb6iGEO4syEBLxqd3iSWxrmtrQa1P5
	OazDGtio=
X-Gm-Gg: AYBFou0BuPJGXSh69BPaYnKktGBbWmwi4qzNahmA4bLr6noo7ofVwaRwd3akK2Ehgqd
	OE4O+NOlVGSng9TtN97RhoGxmTRURE6FMJpUD8C/6poLqFBaDuLslzgKL2obIF8/Mnu651yQCkZ
	2uDx8BHHTBXyDeppBrv3xDlIHxaO3KuqLxFZQAqqjDXr9rqVBEEXgwNqYhCbPrEXCJ31I8EY5JS
	mVbJTdXao4IWxLM0vG9QSp1cNgs+RhevaWwGPEm27Ox06tDaGUAhWZh/IZY1T6A7anhDhtEqhTP
	JWNt/br7eaMrOUiWMjBFR7glhBYOM3ZVjCD0WsB7/WPIpRjDDRoeAHBqMGnrEYTa80RwlXU79UM
	+Me6zFle7Rl7m0aKYHLjo1k9eT66jVMqfDLhqJ+R7w20aSNvzbr0tkE3Kgg+7si+zpRkLgRFPxG
	61V3mz4QnEhIFITA0aI78lqXO5cSD9/7PPh+feqDa8hrxFMeljHXJYirXT3kvV6TUmbF1NbjFmm
	F/ypUA8ZJUTuGifbrvQYMmgFczZSoG96HPd6wRbcc2AhfHtdwnMkQLlWGGx9Fq2zOaYN8a471Mm
	UFebMbrScl/9RNiWiJthEpQ0MruO1m9TuJSmZvrPdqVcv2hpHg9GFAltOA==
X-Received: by 2002:a05:6000:290c:b0:493:a59d:880e with SMTP id ffacd0b85a97d-49c713add85mr15792415f8f.30.1794732541844;
        Sun, 15 Nov 2026 00:49:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/41] oeqa: Drop explicit 'object' base classes
Date: Sun, 15 Nov 2026 08:48:11 +0000
Message-ID: <20261115084845.701136-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250239
Content-Type: text/plain; charset="utf-8"

All classes are new-style in Python 3 so inheriting from object is
redundant.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/buildperf/base.py              | 2 +-
 meta/lib/oeqa/core/context.py                | 4 ++--
 meta/lib/oeqa/core/runner.py                 | 6 +++---
 meta/lib/oeqa/core/target/__init__.py        | 2 +-
 meta/lib/oeqa/core/utils/concurrencytest.py  | 2 +-
 meta/lib/oeqa/oetest.py                      | 2 +-
 meta/lib/oeqa/runexported.py                 | 2 +-
 meta/lib/oeqa/sdk/testmetaidesupport.py      | 2 +-
 meta/lib/oeqa/sdk/testsdk.py                 | 2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 ++--
 meta/lib/oeqa/selftest/cases/runcmd.py       | 2 +-
 meta/lib/oeqa/selftest/cases/spdx.py         | 2 +-
 meta/lib/oeqa/utils/commands.py              | 4 ++--
 meta/lib/oeqa/utils/decorators.py            | 2 +-
 meta/lib/oeqa/utils/dump.py                  | 2 +-
 meta/lib/oeqa/utils/git.py                   | 2 +-
 meta/lib/oeqa/utils/logparser.py             | 4 ++--
 meta/lib/oeqa/utils/sshcontrol.py            | 4 ++--
 18 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 944314d7c29..37696466f4e 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -32,7 +32,7 @@ log = logging.getLogger('build-perf')
 runCmd2 = partial(runCmd, assert_error=False, limit_exc_output=40)
 
 
-class KernelDropCaches(object):
+class KernelDropCaches:
     """Container of the functions for dropping kernel caches"""
     sudo_passwd = None
 
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 46de9135c17..9745286548e 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -15,7 +15,7 @@ from oeqa.core.loader import OETestLoader
 from oeqa.core.runner import OETestRunner
 from oeqa.core.exception import OEQAMissingManifest, OEQATestNotFound
 
-class OETestContext(object):
+class OETestContext:
     loaderClass = OETestLoader
     runnerClass = OETestRunner
 
@@ -97,7 +97,7 @@ class OETestContext(object):
         self.runner = self.runnerClass(self, verbosity=2)
         return self.runner.list_tests(self.suites, display_type)
 
-class OETestContextExecutor(object):
+class OETestContextExecutor:
     _context_class = OETestContext
     _script_executor = 'oe-test'
 
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 8ad65facead..9164ee6bcca 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -15,7 +15,7 @@ import sys
 from unittest import TextTestResult as _TestResult
 from unittest import TextTestRunner as _TestRunner
 
-class OEStreamLogger(object):
+class OEStreamLogger:
     def __init__(self, logger):
         self.logger = logger
         self.buffer = ""
@@ -243,7 +243,7 @@ class OETestResult(_TestResult):
         # Account for expected failures
         return not self.wasSuccessful() or len(self.expectedFailures)
 
-class OEListTestsResult(object):
+class OEListTestsResult:
     def wasSuccessful(self):
         return True
 
@@ -333,7 +333,7 @@ class OETestRunner(_TestRunner):
 
         return OEListTestsResult()
 
-class OETestResultJSONHelper(object):
+class OETestResultJSONHelper:
 
     testresult_filename = 'testresults.json'
 
diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/target/__init__.py
index 177f648fe35..38655743425 100644
--- a/meta/lib/oeqa/core/target/__init__.py
+++ b/meta/lib/oeqa/core/target/__init__.py
@@ -6,7 +6,7 @@
 
 from abc import abstractmethod
 
-class OETarget(object):
+class OETarget:
 
     def __init__(self, logger, *args, **kwargs):
         self.logger = logger
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 9da0c5e661e..ade0a83cb82 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -203,7 +203,7 @@ subunit._OutSideTest.addSkip = outSideTestaddSkip
 # is available and accepts writes. This allows unittest with buffer=True
 # to interact ok with subunit which wants to access sys.stdout.buffer.
 #
-class dummybuf(object):
+class dummybuf:
    def __init__(self, parent):
        self.p = parent
    def write(self, data):
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index af555bea620..ac972cfb223 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -155,7 +155,7 @@ def custom_verbose(msg, *args, **kwargs):
             logger.info(_buffer_logger.rstrip("\n"), *args, **kwargs)
         _buffer_logger = ""
 
-class TestContext(object):
+class TestContext:
     def __init__(self, d, exported=False):
         self.d = d
 
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 7e37213df69..982d8affa03 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -37,7 +37,7 @@ from oeqa.utils.sshcontrol import SSHControl
 # this isn't pretty but we need a fake target object
 # for running the tests externally as we don't care
 # about deploy/start we only care about the connection methods (run, copy)
-class FakeTarget(object):
+class FakeTarget:
     def __init__(self, d):
         self.connection = None
         self.ip = None
diff --git a/meta/lib/oeqa/sdk/testmetaidesupport.py b/meta/lib/oeqa/sdk/testmetaidesupport.py
index 1110c40b9bf..c7a4041e08a 100644
--- a/meta/lib/oeqa/sdk/testmetaidesupport.py
+++ b/meta/lib/oeqa/sdk/testmetaidesupport.py
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-class TestSDK(object):
+class TestSDK:
     def run(self, d):
         import json
         import logging
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 7b0765f2726..747608f260c 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -6,7 +6,7 @@
 
 from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
 
-class TestSDKBase(object):
+class TestSDKBase:
     @staticmethod
     def get_sdk_configuration(d, test_type):
         import platform
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 28236a28d52..f0eda2ac4ab 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -30,7 +30,7 @@ DIFFERENT = 'DIFFERENT'
 SAME = 'SAME'
 
 @functools.total_ordering
-class CompareResult(object):
+class CompareResult:
     def __init__(self):
         self.reference = None
         self.test = None
@@ -42,7 +42,7 @@ class CompareResult(object):
     def __lt__(self, other):
         return (self.status, self.test) < (other.status, other.test)
 
-class PackageCompareResults(object):
+class PackageCompareResults:
     def __init__(self, exclusions):
         self.total = []
         self.missing = []
diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index 70047ca0caa..589c0c28e01 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -13,7 +13,7 @@ import threading
 import time
 import signal
 
-class MemLogger(object):
+class MemLogger:
     def __init__(self):
         self.info_msgs = []
         self.error_msgs = []
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index a9b47119243..ce9a8af4f65 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -12,7 +12,7 @@ from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
 import oe.spdx30
 
 
-class SPDX3CheckBase(object):
+class SPDX3CheckBase:
     """
     Base class for checking SPDX 3 based tests
     """
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 3473ffb74bc..f8d6a793550 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -25,7 +25,7 @@ try:
 except ImportError:
     pass
 
-class Command(object):
+class Command:
     def __init__(self, command, bg=False, timeout=None, data=None, output_log=None, **options):
 
         self.defaultopts = {
@@ -161,7 +161,7 @@ class Command(object):
             self.log.debug("Last 20 lines:\n%s" % lout)
 
 
-class Result(object):
+class Result:
     pass
 
 
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index ea90164e5e7..c45d5f4512c 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -16,7 +16,7 @@ import threading
 import signal
 from functools import wraps
 
-class testcase(object):
+class testcase:
     def __init__(self, test_case):
         self.test_case = test_case
 
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 588547e3a34..c32e6f7b9ae 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -12,7 +12,7 @@ import datetime
 import itertools
 from .commands import runCmd
 
-class BaseDumper(object):
+class BaseDumper:
     """ Base class to dump commands from host/target """
 
     def __init__(self, cmds, parent_dir):
diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
index ea35a766eb7..e1f377bb0fd 100644
--- a/meta/lib/oeqa/utils/git.py
+++ b/meta/lib/oeqa/utils/git.py
@@ -13,7 +13,7 @@ class GitError(Exception):
     """Git error handling"""
     pass
 
-class GitRepo(object):
+class GitRepo:
     """Class representing a Git repository clone"""
     def __init__(self, path, is_topdir=False):
         git_dir = self._run_git_cmd_at(['rev-parse', '--git-dir'], path)
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index d445b4e2a01..c0d68339953 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -9,7 +9,7 @@ import os
 import re
 
 # A parser that can be used to identify weather a line is a test result or a section statement.
-class PtestParser(object):
+class PtestParser:
     def __init__(self):
         self.results = {}
         self.sections = {}
@@ -144,7 +144,7 @@ class LtpParser:
 
 
 # ltp Compliance log parsing
-class LtpComplianceParser(object):
+class LtpComplianceParser:
     def __init__(self):
         self.results = {}
         self.section = {'duration': "", 'log': ""}
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 88a61aff635..2aca59554d4 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -14,7 +14,7 @@ import os
 import select
 
 
-class SSHProcess(object):
+class SSHProcess:
     def __init__(self, **options):
 
         self.defaultopts = {
@@ -99,7 +99,7 @@ class SSHProcess(object):
             raise
         return (self.status, self.output)
 
-class SSHControl(object):
+class SSHControl:
     def __init__(self, ip, logfile=None, timeout=300, user='root', port=None):
         self.ip = ip
         self.defaulttimeout = timeout
