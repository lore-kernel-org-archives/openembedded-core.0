Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4340.1794732596575333146
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SusLYIl+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so1126431f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732595; x=1795337395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f4DFIM4L139WE3XeP/019heMPTSxj7drBQ+tVsHw4pM=;
        b=SusLYIl+J3y+/BznqQDhSjMuKGsU0/TIRsA70nLUCqZkvqh5kEiDRK+ZrEEIsrctOY
         rcB91+5UG5kybOPThE57pX7B5Nes0W4gKiIcxgbHSBspDwCrOjVtVGq9fZ/OBJLAHEc2
         xxmQqW0R885+BfIil+YSLusxf6TkXbbDafnk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732595; x=1795337395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f4DFIM4L139WE3XeP/019heMPTSxj7drBQ+tVsHw4pM=;
        b=VhxJT6BE8IE8D+/9LRdFz9qTTkKez5ud4wW9+9lTzb8ADtgHYvtib0veIdmrwz+SgL
         ApNrA8DDTi584CkjBUH8UrqutqVkF6PCKOBCH18vWL2yUNxcFt71pU62PeDfpnp6kMeV
         mpDAyGpSYm0c9wdxiK/sH5j6SGbvlCaSjGmk2ytPbvBFcFksNF1h+jLDDrHKC5jB3XD4
         9V249uA9grM+gfSUlpjjJ1BHI2MWy5UDUC5Z/2UFpvdu/TftDHWSSHWMlwVTvAuHQoMR
         gh0DsZOPfCrh9uFoL05ZA3i1uWIB5eTh7HsWlvzUTk8/4JPWw2fwn0yFy/NOEByph8cb
         BweA==
X-Gm-Message-State: APuU4Z/I3p1qgIhYTuaquCZJBqiPj5j6mvsWh+VngWOGzHpk00DTGuKn
	X81J/ACW5C7TjsoWXIy6ZDbBF0tLvlAlQRiM1IGCGra+oGhqwgwYua3jFzAHwPvxDYsJgln6vIl
	ZsYTAHFQ=
X-Gm-Gg: AYBFou3V4vZZRnCC9kJF7POQ2WXuVYkihMTgKhdWBdLOO/Vnceggrizyy4aWCLSsCKr
	ZS/lStdus3pgk5r3mIFYFnPwOjeHsyMGnlMAu2yIrJi+c+Dk/1N6gGlUptEGumgLKRLH/ga5IED
	NJbU+Eq5q6cyvkTE84HV+BczLdRG01ANB3cujrjFIxiEzBhYFQBkYy0Arrcyz85+MP0iu7Q3JHp
	XUf4oAoFGvCn4CU0eq44P1R0ouJguFG+YetjLEjKtcja+KIClf8DSOIgNLARpvd0ecSj2ERwNvI
	QmG7BiffTJhflu7lDGaddmlTeh/kGL215gqoztqgHVcoQZVYYJ7rJGU/ngM3kxyNHL68sO9H8gI
	lE616S9RoXuTnlKYz8iU1rVM1h6WRkSFZp7YpxCNuBazDWxMyHSzrQoYMsXZJO2L6rPbdNcnlw+
	XetdlrnREhmNj2fkMIE2gyHCCIwQ8CWZkvJR2D1RwSAdj/SccO1ial/gHEE4zzjeXHiV9eGkxwi
	KZQqEt1QzV4tccJ7hSn0W4Fz1lGpkWb3mqoXH9M6eoj2RDa0kguprvwh41x/ryB9399k1u9rOtR
	Io5fz33V1w1K5GklDVmyHEnIJVcL4L9sW8U4/qVMqyGSaCi4wZA+cpQOd+JL7bLyuU5jOv9xr0z
	dWVA=
X-Received: by 2002:a5d:5e02:0:b0:499:81db:47a3 with SMTP id ffacd0b85a97d-49c71e3e123mr15282806f8f.11.1794732594799;
        Sun, 15 Nov 2026 00:49:54 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 41/41] oeqa/selftest: Use the core executor's run()
Date: Sun, 15 Nov 2026 08:48:44 +0000
Message-ID: <20261115084845.701136-41-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250272
Content-Type: text/plain; charset="utf-8"

OESelftestTestContextExecutor carried its own copy of run(), split into
run() and _internal_run(), which differed from the core version only in
finding the test module paths from BBPATH, always writing the json
results and creating the results log link even when the run raised an
exception. It also had its own versions of the configuration, result id
and json directory hooks under different names, which the core code
never called.

Split the core run() so the results log link is always created, pass
args to _get_configuration() as the selftest version needs it, rename
the selftest hooks to match the core ones and set the module paths in
_process_args(). The selftest copy of run() can then be dropped.

This also fixes the core run() failing with FileExistsError when the old
results log link is dangling, as os.path.exists() is false for a broken
link. Use os.path.lexists() as the selftest code did.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/context.py     | 52 +++++++++++++++++--------------
 meta/lib/oeqa/selftest/context.py | 49 ++++-------------------------
 2 files changed, 34 insertions(+), 67 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 7d7d9f3c5c8..fe071ddb409 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -194,7 +194,7 @@ class OETestContextExecutor:
     def _get_json_result_dir(self, args):
         return args.json_result_dir
 
-    def _get_configuration(self):
+    def _get_configuration(self, args):
         td = self.td
         configuration = {'TEST_TYPE': self.name,
                         'MACHINE': td.get("MACHINE"),
@@ -210,9 +210,7 @@ class OETestContextExecutor:
     def _pre_run(self):
         pass
 
-    def run(self, logger, args):
-        self._process_args(logger, args)
-
+    def _run(self, logger, args):
         self.tc = self._context_class(td=self.td, logger=self.logger, **self.context_args)
         try:
             self.tc.loadTests(self.module_paths, modules=self.modules,
@@ -222,28 +220,34 @@ class OETestContextExecutor:
             sys.exit(1)
 
         if args.list_tests:
-            rc = self.tc.listTests(args.list_tests)
+            return self.tc.listTests(args.list_tests)
+
+        self._pre_run()
+        rc = self.tc.runTests(processes=self.processes, skips=self.skips)
+
+        json_result_dir = self._get_json_result_dir(args)
+        if json_result_dir:
+            configuration = self._get_configuration(args)
+            rc.logDetails(json_result_dir,
+                          configuration,
+                          self._get_result_id(configuration))
         else:
-            self._pre_run()
-            rc = self.tc.runTests(processes=self.processes, skips=self.skips)
-
-            json_result_dir = self._get_json_result_dir(args)
-            if json_result_dir:
-                configuration = self._get_configuration()
-                rc.logDetails(json_result_dir,
-                              configuration,
-                              self._get_result_id(configuration))
-            else:
-                rc.logDetails()
-
-            rc.logSummary(self.name)
-
-        output_link = os.path.join(os.path.dirname(args.output_log),
-                "%s-results.log" % self.name)
-        if os.path.exists(output_link):
-            os.remove(output_link)
-        os.symlink(args.output_log, output_link)
+            rc.logDetails()
 
+        rc.logSummary(self.name)
         return rc
 
+    def run(self, logger, args):
+        self._process_args(logger, args)
+        try:
+            return self._run(logger, args)
+        finally:
+            # Link to the latest log, even if running the tests failed. The
+            # old link may be dangling if its log was removed.
+            output_link = os.path.join(os.path.dirname(args.output_log),
+                    "%s-results.log" % self.name)
+            if os.path.lexists(output_link):
+                os.unlink(output_link)
+            os.symlink(args.output_log, output_link)
+
 _executor_class = OETestContextExecutor
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 49d9fc2cba1..1f03f511af2 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -17,7 +17,7 @@ import bb.utils
 import bb.tinfoil
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
-from oeqa.core.exception import OEQAPreRun, OEQATestNotFound
+from oeqa.core.exception import OEQAPreRun
 
 from oeqa.utils.commands import runCmd, get_bb_vars, get_test_layer
 
@@ -289,6 +289,8 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.skips = args.skips
         self.processes = args.processes
 
+        self.module_paths = self._get_cases_paths(self.td['BBPATH'].split(':'))
+
     def _pre_run(self):
         def _check_required_env_variables(vars):
             for var in vars:
@@ -358,14 +360,14 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             vars['BBLAYERS'] = str(d.getVar('BBLAYERS'))
         self.tc.set_variables(vars)
 
-    def get_json_result_dir(self, args):
+    def _get_json_result_dir(self, args):
         json_result_dir = os.path.join(self.tc.td["LOG_DIR"], 'oeqa')
         if "OEQA_JSON_RESULT_DIR" in self.tc.td:
             json_result_dir = self.tc.td["OEQA_JSON_RESULT_DIR"]
 
         return json_result_dir
 
-    def get_configuration(self, args):
+    def _get_configuration(self, args):
         from oeqa.utils.metadata import metadata_from_bb
         metadata = metadata_from_bb()
         oeselftest_metadata = get_oeselftest_metadata(args)
@@ -378,46 +380,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                         'OESELFTEST_METADATA': oeselftest_metadata}
         return configuration
 
-    def get_result_id(self, configuration):
+    def _get_result_id(self, configuration):
         return '%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['HOST_DISTRO'], configuration['MACHINE'], configuration['STARTTIME'])
 
-    def _internal_run(self, logger, args):
-        self.module_paths = self._get_cases_paths(self.td['BBPATH'].split(':'))
-
-        self.tc = self._context_class(td=self.td, logger=self.logger, **self.context_args)
-        try:
-            self.tc.loadTests(self.module_paths, modules=self.modules,
-                    modules_required=self.modules_required, tags_filter=self.tags_filter)
-        except OEQATestNotFound as ex:
-            logger.error(ex)
-            sys.exit(1)
-
-        if args.list_tests:
-            rc = self.tc.listTests(args.list_tests)
-        else:
-            self._pre_run()
-            rc = self.tc.runTests(processes=self.processes, skips=self.skips)
-            configuration = self.get_configuration(args)
-            rc.logDetails(self.get_json_result_dir(args),
-                          configuration,
-                          self.get_result_id(configuration))
-            rc.logSummary(self.name)
-
-        return rc
-
-    def run(self, logger, args):
-        self._process_args(logger, args)
-
-        rc = None
-        try:
-             rc = self._internal_run(logger, args)
-        finally:
-            output_link = os.path.join(os.path.dirname(args.output_log),
-                    "%s-results.log" % self.name)
-            if os.path.lexists(output_link):
-                os.unlink(output_link)
-            os.symlink(args.output_log, output_link)
-
-        return rc
-
 _executor_class = OESelftestTestContextExecutor
