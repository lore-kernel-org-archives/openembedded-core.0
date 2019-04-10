Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 67A1A7D934
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w15so2531027wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iShKFIsNF6YmHYT3WfeB7O3BZQK7Pq+lalYnbxK7Ja0=;
	b=WzPNt4Q/zOYvAihpR3tqLq9KGue2Vj8N2l1YoVuNWxoP+QXLn1TpOcdqTo7F9zR4mR
	RZHvJS2OQ8BdHeEFHS7eAjn6mOjDow1+Es63gs7sg7+bgOgWxWGa05/x8QMgKZkHW4tY
	jeZ+3aC1AITurHnkEl4iBS4iRrfTXgJ2rYtY3kXBIRtz+d+taIpzkt+59y+a0kb1HRrd
	jLzB4AV4dYjtKOn3Wa5pqPvMRbPBoS0qwiBEp1ALqLmX+Af3XrmqUfYtiqAQ62uwUe/E
	JBADy1TUUOVVEyk94IO+FbFCbsmknqwXr/Jk2wG9JQwT7e8LG65I4Vuk6NsmtjFpO1bz
	5CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iShKFIsNF6YmHYT3WfeB7O3BZQK7Pq+lalYnbxK7Ja0=;
	b=egfgeQr7WuCbNaPi2POqWkQ0T0p3MHq3YFkCaNHcyIx8QHYIdvrh1vnP7ZvWe4xYQi
	A3MVgFI/9YC19Vl5aGjiL1GXeYcxCfXY3gUhDzKruuax4jHmW5SlPrt8niw6WxEooEM/
	GBsreKFQl2fLmZi3NM8R5R4dgXcQL+tw03wuDROilwje1bsOE3SMBbXTx0uE9dS9kiR+
	gA6JiU436W+AwNGsoXY9gOo0zb1SqEnqATU/rAX6uj9ehONALwFCLge11MBXAnppAXUf
	A0DWlvJZQUQhVKHx2Rk2OeiPXXJ6MF4cfZM7FN8HH+GfINT5dfixXieOLSKlEh7fzqqv
	uexg==
X-Gm-Message-State: APjAAAXJP8a6zctgk5zdEwpxnbcWrd0OFJnZSHtqinM4MrvJmDygP8Af
	HH8FG/CVzSGSCZivuvf6EeQqWFU69N8=
X-Google-Smtp-Source: APXvYqwaybImamhSWHHMYM5T48nrJKjOSzxYqLXo0WgZzhdW846FQxQtb6W5akpJnQf1BUYcCNU7+Q==
X-Received: by 2002:a05:600c:2189:: with SMTP id
	e9mr2855113wme.4.1554901945835; 
	Wed, 10 Apr 2019 06:12:25 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:38 +0530
Message-Id: <77ede7cbb7da2ed1b01d11441edcbd7dedad9b9a.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 19/33] resulttool/manualexecution: Refactor and simplify codebase
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:25 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

Simplify and removed unnecessary codes.
Refactor to allow pythonic loop.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/manualexecution.py | 56 +++++++++++--------------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 9a29b0b..c94f981 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -24,24 +24,12 @@ def load_json_file(file):
     with open(file, "r") as f:
         return json.load(f)
 
-
 class ManualTestRunner(object):
-    def __init__(self):
-        self.jdata = ''
-        self.test_module = ''
-        self.test_cases_id = ''
-        self.configuration = ''
-        self.starttime = ''
-        self.result_id = ''
-        self.write_dir = ''
 
     def _get_testcases(self, file):
         self.jdata = load_json_file(file)
-        self.test_cases_id = []
         self.test_module = self.jdata[0]['test']['@alias'].split('.', 2)[0]
-        for i in self.jdata:
-            self.test_cases_id.append(i['test']['@alias'])
-    
+
     def _get_input(self, config):
         while True:
             output = input('{} = '.format(config))
@@ -67,45 +55,42 @@ class ManualTestRunner(object):
         extra_config = set(store_map['manual']) - set(self.configuration)
         for config in sorted(extra_config):
             print('---------------------------------------------')
-            print('This is configuration #%s. Please provide configuration value(use "None" if not applicable).'
-                  % config)
+            print('This is configuration #%s. Please provide configuration value(use "None" if not applicable).' % config)
             print('---------------------------------------------')
             value_conf = self._get_input('Configuration Value')
             print('---------------------------------------------\n')
             self.configuration[config] = value_conf
 
     def _create_result_id(self):
-        self.result_id = 'manual_' + self.test_module + '_' + self.starttime
+        self.result_id = 'manual_%s_%s' % (self.test_module, self.starttime)
 
-    def _execute_test_steps(self, test_id):
+    def _execute_test_steps(self, test):
         test_result = {}
-        total_steps = len(self.jdata[test_id]['test']['execution'].keys())
         print('------------------------------------------------------------------------')
-        print('Executing test case:' + '' '' + self.test_cases_id[test_id])
+        print('Executing test case: %s' % test['test']['@alias'])
         print('------------------------------------------------------------------------')
-        print('You have total ' + str(total_steps) + ' test steps to be executed.')
+        print('You have total %s test steps to be executed.' % len(test['test']['execution']))
         print('------------------------------------------------------------------------\n')
-        for step, _ in sorted(self.jdata[test_id]['test']['execution'].items(), key=lambda x: int(x[0])):
-            print('Step %s: ' % step + self.jdata[test_id]['test']['execution']['%s' % step]['action'])
-            expected_output = self.jdata[test_id]['test']['execution']['%s' % step]['expected_results']
+        for step, _ in sorted(test['test']['execution'].items(), key=lambda x: int(x[0])):
+            print('Step %s: %s' % (step, test['test']['execution'][step]['action']))
+            expected_output = test['test']['execution'][step]['expected_results']
             if expected_output:
-                print('Expected output: ' + expected_output)
+                print('Expected output: %s' % expected_output)
         while True:
-            done = input('\nPlease provide test results: (P)assed/(F)ailed/(B)locked/(S)kipped? \n')
-            done = done.lower()
+            done = input('\nPlease provide test results: (P)assed/(F)ailed/(B)locked/(S)kipped? \n').lower()
             result_types = {'p':'PASSED',
-                                'f':'FAILED',
-                                'b':'BLOCKED',
-                                's':'SKIPPED'}
+                            'f':'FAILED',
+                            'b':'BLOCKED',
+                            's':'SKIPPED'}
             if done in result_types:
                 for r in result_types:
                     if done == r:
                         res = result_types[r]
                         if res == 'FAILED':
                             log_input = input('\nPlease enter the error and the description of the log: (Ex:log:211 Error Bitbake)\n')
-                            test_result.update({self.test_cases_id[test_id]: {'status': '%s' % res, 'log': '%s' % log_input}})
+                            test_result.update({test['test']['@alias']: {'status': '%s' % res, 'log': '%s' % log_input}})
                         else:
-                            test_result.update({self.test_cases_id[test_id]: {'status': '%s' % res}})
+                            test_result.update({test['test']['@alias']: {'status': '%s' % res}})
                 break
             print('Invalid input!')
         return test_result
@@ -120,9 +105,9 @@ class ManualTestRunner(object):
         self._create_result_id()
         self._create_write_dir()
         test_results = {}
-        print('\nTotal number of test cases in this test suite: ' + '%s\n' % len(self.jdata))
-        for i in range(0, len(self.jdata)):
-            test_result = self._execute_test_steps(i)
+        print('\nTotal number of test cases in this test suite: %s\n' % len(self.jdata))
+        for t in self.jdata:
+            test_result = self._execute_test_steps(t)
             test_results.update(test_result)
         return self.configuration, self.result_id, self.write_dir, test_results
 
@@ -130,8 +115,7 @@ def manualexecution(args, logger):
     testrunner = ManualTestRunner()
     get_configuration, get_result_id, get_write_dir, get_test_results = testrunner.run_test(args.file)
     resultjsonhelper = OETestResultJSONHelper()
-    resultjsonhelper.dump_testresult_file(get_write_dir, get_configuration, get_result_id,
-                                          get_test_results)
+    resultjsonhelper.dump_testresult_file(get_write_dir, get_configuration, get_result_id, get_test_results)
     return 0
 
 def register_commands(subparsers):
-- 
2.7.4


