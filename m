Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id DFDC67D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:48 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id e92so4165049plb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bhtzeBtSvcmP+WEcBjFywS4fRGbhrBg1TeiStidS7R0=;
	b=Cjj3jtLY0/9QOuZfWo7NVfZUNRbgnWfPCGCbiSA5QGfS5IIazl8wrKmnIn+BQSrgfc
	FudS6EI2m9AUOlDbajZvqFkF1qBfLJRKLiDVG9bFmsX18C8/LXoyEYZ64NK7dAanM9fG
	iJ743QU9U3s9/hAwo6SC6awaeEjlRGIJ13yDjE/CNS4w3usYHTjuWHneydzOdNGkK2qQ
	/FC8/D7eaUSAor0U1ukugR+iq/50M2mv6tVcij0MxP2kjLfFgiRxRMLiA7sfIB5RDCti
	SLseZ9Rpn8AiTehTdzOXPB5sz8zvdo7JgY+/zZkhqzLHOYAElauuD57j4lpohrnpCcfu
	HMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bhtzeBtSvcmP+WEcBjFywS4fRGbhrBg1TeiStidS7R0=;
	b=plQBMedx3eVf5QdxZAZyBjAdBc9G3x0h1Fm3kSNqkzhyrQ6wampFyZgbhXdfC/dVP1
	lIZvvHE2QO//Nc+1ZDxkBGrz9Y/IFvGsTgLofMibVRyd3jf+2UBdVjiDkmOivLU/Ri37
	0/mxGDpXLyMNQlqEYe1VKfKQGCvBHy1ByP3p8FtTE32r0JZxEPs7h9Qot3sj2MEMeryT
	rSNEeqmeyesrMgDVC3+RE1d4TbxifbLNfHUwFY0w5qKcclIZzWXcWFVn6GbvrcjE7PjS
	ZC3S50Fn67XJL4O1/RQ8ImCZmU0jd+p+VR3FqvOskJGoOtFfwKTW/Mp6jWRxkfLs63t3
	xHXw==
X-Gm-Message-State: APjAAAXE8AV1CGMsEDdcaPrLfP1xmBZDS02dU/WJF1Cyx8oG9xjfpfZv
	j7HpDNXJ8ktWXWl1/SGLI1drrRAv
X-Google-Smtp-Source: APXvYqyu5V/tXIVe6JsKxvpeMQokDUfAtIdlpqdELXKPc/h+qwL8RqKweFOldaTkDIPyR44jH6gLGA==
X-Received: by 2002:a17:902:e283:: with SMTP id
	cf3mr19729320plb.160.1556983669933; 
	Sat, 04 May 2019 08:27:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:00 -0700
Message-Id: <d35de5383275a5d83317160ce3dc09a20661a572.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 24/43] resulttool/manualexecution: Enable test case configuration option
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
X-List-Received-Date: Sat, 04 May 2019 15:27:49 -0000

From: sangeeta jain <sangeeta.jain@intel.com>

Current manualexecution required user to exceute all test cases defined inside a "modulename.json" file in oeqa/manual

There are cases when all test cases all not required to run for a module on specific DUT.

Enable manualexecution to have the optional feature where it will use pre-defined json format test case configuration file
where user will be able to select test cases from the "modulename.json" instead of running all of them. This will help
in reducing testing time and reporting unneccesary skip or failures.

Example pre-defined json format test case configuration file (for build-applince):

{
    "testcases" : [
        "build-appliance.build-appliance.Create_core-image-sato-sdk_using_build_appliance",
        "build-appliance.build-appliance.Build_a_image_without_error_(added_recipe)"
    ]
}

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/manualexecution.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index ea44219..dc368f3 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -17,6 +17,7 @@ import os
 import sys
 import datetime
 import re
+import copy
 from oeqa.core.runner import OETestResultJSONHelper
 
 
@@ -123,7 +124,7 @@ class ManualTestRunner(object):
     def _get_write_dir(self):
         return os.environ['BUILDDIR'] + '/tmp/log/manual/'
 
-    def run_test(self, case_file, config_options_file):
+    def run_test(self, case_file, config_options_file, testcase_config_file):
         test_module = self._get_test_module(case_file)
         cases = load_json_file(case_file)
         config_options = {}
@@ -132,6 +133,13 @@ class ManualTestRunner(object):
         configurations = self._get_config(config_options, test_module)
         result_id = 'manual_%s_%s' % (test_module, configurations['STARTTIME'])
         test_results = {}
+        if testcase_config_file:
+            test_case_config = load_json_file(testcase_config_file)
+            test_case_to_execute = test_case_config['testcases']
+            for case in copy.deepcopy(cases) :
+                if case['test']['@alias'] not in test_case_to_execute:
+                    cases.remove(case)
+
         print('\nTotal number of test cases in this test suite: %s\n' % len(cases))
         for c in cases:
             test_result = self._execute_test_steps(c)
@@ -184,7 +192,7 @@ def manualexecution(args, logger):
     if args.make_config_options_file:
         testrunner.make_config_option_file(logger, args.file, args.config_options_file)
         return 0
-    configurations, result_id, write_dir, test_results = testrunner.run_test(args.file, args.config_options_file)
+    configurations, result_id, write_dir, test_results = testrunner.run_test(args.file, args.config_options_file, args.testcase_config_file)
     resultjsonhelper = OETestResultJSONHelper()
     resultjsonhelper.dump_testresult_file(write_dir, configurations, result_id, test_results)
     return 0
@@ -200,3 +208,5 @@ def register_commands(subparsers):
                               help='the config options file to import and used as available configuration option selection or make config option file')
     parser_build.add_argument('-m', '--make-config-options-file', action='store_true',
                               help='make the configuration options file based on provided inputs')
+    parser_build.add_argument('-t', '--testcase-config-file', default='',
+                              help='the testcase configuration file to enable user to run a selected set of test case')
\ No newline at end of file
-- 
2.7.4


