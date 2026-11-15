Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4339.1794732595268876715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PSpOb9c0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49465892f7bso2045732f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732593; x=1795337393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N+zpHGFPAiu1tv1cw7hqeGyd3pXVrdy5WeAfTUys6tU=;
        b=PSpOb9c0E3BQVC1f5+IeezcZIqC3eWCuTj+cvRJuQbxjGverS8q6/IYef/r1v0FI8j
         qBDDFHREvwYNpFs5yntVSuQIKgekcZJkEqburYc7ejc+xHfqigkKmcFuVeFIUa42jIak
         SvMzZRcIVVdzIbP4wdxuF1YPuxml9qlJy7DW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732593; x=1795337393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N+zpHGFPAiu1tv1cw7hqeGyd3pXVrdy5WeAfTUys6tU=;
        b=Wf4JaUR11O0wmFRNGW3WUc9LHlLb2aOA5vLpbWrthiG5eWOt6KkPnWu0FkLal7fF5p
         1S4hs1LHLh6bNmcYm56WH9WLbTWVLq7vAFP+5n/LEtf5mDmrR4eaEKD41bSNMTUNqUlC
         qPhAWzeYC4YqntVhm4E2y65NqC38uDTynM84PnGQRe+GP1qPg2XNk3BvyBboFpbabeAV
         zBbZiE2tFpcJJO4KrAqNdxP4XJl/AmXTgw80iyDy1V4lwE6tpP91o7btQBOxtHXjWxqF
         3ZIIOboVI1skIDUC8RvuSllU4Y/RwzstX2QPC4ZW6ju9rgGiMplF7b+VDmG6x2agMYsb
         NP0A==
X-Gm-Message-State: APuU4Z8gJGCxpWEQEoBbAdEMSkNHpg12LjIv6dXfYAU29W5GCxna96wG
	5Fzf17AEMrD4HgBJJLmaD3AML7bCllDZmxxQxxdZiwILJSCAnADSzu4Imr7TLqtjNTAMZcvft++
	4nvjm/Pg=
X-Gm-Gg: AYBFou1TMXMudJNWbdIsejRdZYVIgM3gAAqUKnNIC9rMcjxZQFmq1t6+00xSZOmfoxg
	oO6d3vsg08msmTPxilJTfrnMRJkVVkeXSbkpy1sgHlnzR7bJ5QSOY9RFhp8JTVl516mnkPLqRvr
	VA18fgBs3BcZRsIkwPv9NpjcNMCxmL+kdJ1UjWDQQXQ/AyAuTbw8y5EV1cZB/vF5yzzP4iwAIbA
	eZDN8eWt8hq2qiRymklu2fk9OwHXaasCSVy61EowTd5/SryGHDr8gb7mO6cBQA2f1RAeGEkGFqf
	BQ0PCNl2S89wYRdqVVYCpfwbijfFHy0gsLDUFDjR9iQe36oaWbqmLTTTyiekKE9oXb8eF3ssGH9
	GOADLc5eG7QsxTgIIbEWxcba0fL6KfyChoOtCRlzJXw7ogQi8EkeDkWFWZZLTX9dAtz2DTtehri
	zIa918VcfuDGJgI5kHDkStKFMtS0JdXzq72SYCPk/yCwg7U8q6wvoMtcHQKe+2SMxYQ5Bds5Kb2
	1XjcrEBMeClNm6U+kh+y6KXKg5fMRYPYVAPRpbycQQbn63c6OF5W3vthMM6P4W+nG2vvLPw7di1
	Vtiqlqv4IBz8rmBZBeAXO8BkTBl4eTWzDk1ALdOAXlxC0n9O2jFAPve7ag==
X-Received: by 2002:a5d:64cf:0:b0:48d:f3ee:7cc with SMTP id ffacd0b85a97d-49c71a66085mr14300175f8f.30.1794732593165;
        Sun, 15 Nov 2026 00:49:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 40/41] oeqa: Replace tc_kwargs with explicit attributes
Date: Sun, 15 Nov 2026 08:48:43 +0000
Message-ID: <20261115084845.701136-40-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250271
Content-Type: text/plain; charset="utf-8"

The test component executors collected the arguments for the test
context in a dict of dicts, tc_kwargs, which run() then expanded into
the context constructor, loadTests() and runTests(). Apart from the
constructor arguments, which vary by context, these were always the same
few values.

Store the test data, logger, modules to load, tag filter, skips and
process count as attributes and pass them explicitly, and keep a single
context_args dict for the context specific constructor arguments. The
calls made to the contexts are unchanged.

Layers with their own test components which extend tc_kwargs will need
to set these attributes instead.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/context.py     | 42 +++++++++++++++++--------------
 meta/lib/oeqa/runtime/context.py  |  8 +++---
 meta/lib/oeqa/sdk/context.py      | 10 ++++----
 meta/lib/oeqa/selftest/context.py | 33 ++++++++++++------------
 4 files changed, 49 insertions(+), 44 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 9e38cddcfeb..7d7d9f3c5c8 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -47,6 +47,8 @@ class OETestContext:
         return modules
 
     def skipTests(self, skips):
+        if not skips:
+            return
         # Use unittest's skip support so that skipped tests, and the class
         # setup of skipped classes, don't run
         for test in self.suites:
@@ -159,32 +161,33 @@ class OETestContextExecutor:
         return logger
 
     def _process_args(self, logger, args):
-        self.tc_kwargs = {}
-        self.tc_kwargs['init'] = {}
-        self.tc_kwargs['load'] = {}
-        self.tc_kwargs['run']  = {}
-
-        self.tc_kwargs['init']['logger'] = self._setup_logger(logger, args)
+        self.logger = self._setup_logger(logger, args)
         if args.test_data_file:
-            self.tc_kwargs['init']['td'] = json.load(
-                    open(args.test_data_file, "r"))
+            with open(args.test_data_file, "r") as f:
+                self.td = json.load(f)
         else:
-            self.tc_kwargs['init']['td'] = {}
+            self.td = {}
+
+        # Any further arguments for the test context, for subclasses to add
+        self.context_args = {}
 
         # Run image specific TEST_SUITE like testimage.bbclass by default
-        test_suites = self.tc_kwargs['init']['td'].get("TEST_SUITES")
+        test_suites = self.td.get("TEST_SUITES")
         if test_suites:
             test_suites = test_suites.split()
 
+        self.modules_required = []
         if args.run_tests:
-            self.tc_kwargs['load']['modules'] = args.run_tests
-            self.tc_kwargs['load']['modules_required'] = args.run_tests
+            self.modules = args.run_tests
+            self.modules_required = args.run_tests
         elif test_suites:
-            self.tc_kwargs['load']['modules'] = test_suites
+            self.modules = test_suites
         else:
-            self.tc_kwargs['load']['modules'] = []
+            self.modules = []
+        self.tags_filter = None
 
-        self.tc_kwargs['run']['skips'] = []
+        self.processes = None
+        self.skips = []
 
         self.module_paths = args.CASES_PATHS
 
@@ -192,7 +195,7 @@ class OETestContextExecutor:
         return args.json_result_dir
 
     def _get_configuration(self):
-        td = self.tc_kwargs['init']['td']
+        td = self.td
         configuration = {'TEST_TYPE': self.name,
                         'MACHINE': td.get("MACHINE"),
                         'DISTRO': td.get("DISTRO"),
@@ -210,9 +213,10 @@ class OETestContextExecutor:
     def run(self, logger, args):
         self._process_args(logger, args)
 
-        self.tc = self._context_class(**self.tc_kwargs['init'])
+        self.tc = self._context_class(td=self.td, logger=self.logger, **self.context_args)
         try:
-            self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
+            self.tc.loadTests(self.module_paths, modules=self.modules,
+                    modules_required=self.modules_required, tags_filter=self.tags_filter)
         except OEQATestNotFound as ex:
             logger.error(ex)
             sys.exit(1)
@@ -221,7 +225,7 @@ class OETestContextExecutor:
             rc = self.tc.listTests(args.list_tests)
         else:
             self._pre_run()
-            rc = self.tc.runTests(**self.tc_kwargs['run'])
+            rc = self.tc.runTests(processes=self.processes, skips=self.skips)
 
             json_result_dir = self._get_json_result_dir(args)
             if json_result_dir:
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 0763fb25ac0..c507197d8d1 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -206,7 +206,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         super()._process_args(logger, args)
 
-        td = self.tc_kwargs['init']['td']
+        td = self.td
 
         target_kwargs = {}
         target_kwargs['machine'] = td.get("MACHINE") or None
@@ -216,12 +216,12 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         target_kwargs['serialcontrol_ps1'] = td.get("TEST_SERIALCONTROL_PS1") or None
         target_kwargs['serialcontrol_connect_timeout'] = td.get("TEST_SERIALCONTROL_CONNECT_TIMEOUT") or None
 
-        self.tc_kwargs['init']['target'] = \
+        self.context_args['target'] = \
                 OERuntimeTestContextExecutor.getTarget(args.target_type,
                         None, args.target_ip, args.server_ip, **target_kwargs)
-        self.tc_kwargs['init']['image_packages'] = \
+        self.context_args['image_packages'] = \
                 OERuntimeTestContextExecutor.readPackagesManifest(
                         args.packages_manifest)
-        self.tc_kwargs['init']['extract_dir'] = args.extract_dir
+        self.context_args['extract_dir'] = args.extract_dir
 
 _executor_class = OERuntimeTestContextExecutor
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 6024554cac4..3e2a7cff00e 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -101,13 +101,13 @@ class OESDKTestContextExecutor(OETestContextExecutor):
     def _process_args(self, logger, args):
         super()._process_args(logger, args)
 
-        self.tc_kwargs['init']['sdk_dir'] = args.sdk_dir
-        self.tc_kwargs['init']['sdk_env'] = self.sdk_env
-        self.tc_kwargs['init']['target_pkg_manifest'] = \
+        self.context_args['sdk_dir'] = args.sdk_dir
+        self.context_args['sdk_env'] = self.sdk_env
+        self.context_args['target_pkg_manifest'] = \
                 OESDKTestContextExecutor._load_manifest(args.target_manifest)
-        self.tc_kwargs['init']['host_pkg_manifest'] = \
+        self.context_args['host_pkg_manifest'] = \
                 OESDKTestContextExecutor._load_manifest(args.host_manifest)
-        self.tc_kwargs['run']['processes'] = args.processes
+        self.processes = args.processes
 
     @staticmethod
     def _get_sdk_environs(sdk_dir):
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index aaae9574c94..49d9fc2cba1 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -262,16 +262,17 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         elif args.list_tests:
             args.list_tests = 'name'
 
-        self.tc_kwargs['init']['td'] = bbvars
+        self.td = bbvars
 
         builddir = os.environ.get("BUILDDIR")
-        self.tc_kwargs['init']['config_paths'] = {}
-        self.tc_kwargs['init']['config_paths']['testlayer_path'] = get_test_layer(bbvars["BBLAYERS"])
-        self.tc_kwargs['init']['config_paths']['builddir'] = builddir
-        self.tc_kwargs['init']['config_paths']['localconf'] = os.path.join(builddir, "conf/local.conf")
-        self.tc_kwargs['init']['config_paths']['bblayers'] = os.path.join(builddir, "conf/bblayers.conf")
-        self.tc_kwargs['init']['newbuilddir'] = args.newbuilddir
-        self.tc_kwargs['init']['keep_builddir'] = args.keep_builddir
+        self.context_args['config_paths'] = {
+            'testlayer_path': get_test_layer(bbvars["BBLAYERS"]),
+            'builddir': builddir,
+            'localconf': os.path.join(builddir, "conf/local.conf"),
+            'bblayers': os.path.join(builddir, "conf/bblayers.conf"),
+        }
+        self.context_args['newbuilddir'] = args.newbuilddir
+        self.context_args['keep_builddir'] = args.keep_builddir
 
         def tag_filter(tags):
             if args.exclude_tags:
@@ -283,10 +284,10 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             return False
 
         if args.select_tags or args.exclude_tags:
-            self.tc_kwargs['load']['tags_filter'] = tag_filter
+            self.tags_filter = tag_filter
 
-        self.tc_kwargs['run']['skips'] = args.skips
-        self.tc_kwargs['run']['processes'] = args.processes
+        self.skips = args.skips
+        self.processes = args.processes
 
     def _pre_run(self):
         def _check_required_env_variables(vars):
@@ -381,12 +382,12 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         return '%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['HOST_DISTRO'], configuration['MACHINE'], configuration['STARTTIME'])
 
     def _internal_run(self, logger, args):
-        self.module_paths = self._get_cases_paths(
-                self.tc_kwargs['init']['td']['BBPATH'].split(':'))
+        self.module_paths = self._get_cases_paths(self.td['BBPATH'].split(':'))
 
-        self.tc = self._context_class(**self.tc_kwargs['init'])
+        self.tc = self._context_class(td=self.td, logger=self.logger, **self.context_args)
         try:
-            self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
+            self.tc.loadTests(self.module_paths, modules=self.modules,
+                    modules_required=self.modules_required, tags_filter=self.tags_filter)
         except OEQATestNotFound as ex:
             logger.error(ex)
             sys.exit(1)
@@ -395,7 +396,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             rc = self.tc.listTests(args.list_tests)
         else:
             self._pre_run()
-            rc = self.tc.runTests(**self.tc_kwargs['run'])
+            rc = self.tc.runTests(processes=self.processes, skips=self.skips)
             configuration = self.get_configuration(args)
             rc.logDetails(self.get_json_result_dir(args),
                           configuration,
