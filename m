Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 393237D40F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:23 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 20so3667604pgr.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hxKPs5uojWEoKmuJdIDTniXGHkPpOFXPWdbh9mL0zGQ=;
	b=E7nXO7An1GuuL72K7BxBqf9fZBuhyDy0wOL1LNwSVBNeo/wwKlM/1FOh3+nYWsvxO/
	11k/9OSwjR9L4auhpE78ynGvIHHbsnDYIyVdZA5Qia5xjEVXGbJ3bKLEFc4doNX8sjwj
	XqZsF8Lg7C4+bRLCO1bG9P9R6h3U5iqUpz1kg1i4bV2346KduZvoKjYrsAqDtqYtCF74
	IXK+bjM0T2c/QAlZjNUWzG/L4JJjsOTPpP5NtxJakkgi1d/LM3E004IuHBwIwb4OieWl
	vbd1O0azfEoMX1uo1Zn21M/plNIVwLnbKM8VpVQ65mpvFgDojfHB0U5hoj7z67pKes9y
	zS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hxKPs5uojWEoKmuJdIDTniXGHkPpOFXPWdbh9mL0zGQ=;
	b=uQrs5CSPUPKHD8wnyeuA1p3c0SyY7eqUMXLVeLuGvcaE9JpGBRpqQdPmsiLbh8Zcd1
	4i/ZZcz0pbS3SwOm2kjFhqVyKAWSgI1PhLN9ReIMZogeRDDEzMioKno3Q/EUNVARCObc
	CmgaLoqzPBqSSChp5I5ly8N5i1yFhNUtPb9yvO4FIPKIbh+JUWgtH21HXD5RAibGnRrc
	vu+iXEEJg9uD6Ex5pTCVgfK36/ZlRK97oNrxIRWkVWQp8iETf2AK1CIGYI1wUuR1Zpj7
	Hjk37ZG3A+eKEJlFRTqPWI7Sh0fh4vyAhPdrf/F+9tPfyJ1omrr9Jkb38As5fmttesmp
	2VMg==
X-Gm-Message-State: APjAAAUc9kQAn6AaqK6L0ujnf1IhKGeN41YGJ6eCxcoWaVA+oyn0R4fs
	di9Kecg/Ud4caajkdfJkqn3WQBR/
X-Google-Smtp-Source: APXvYqwjIGQQ+OYPwQi/OwxwVF+EmOR2rSWpxddysAwypTLwcghyIVC8zGrCe5MC8pwkrHti09sejg==
X-Received: by 2002:a17:90a:9504:: with SMTP id
	t4mr16819886pjo.100.1560092064146; 
	Sun, 09 Jun 2019 07:54:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:55 -0700
Message-Id: <8782ade525f53330e59e19d50f213dc9d9176804.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 20/27] resulttool/manualexecution: Enable creation of test case configuration
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:23 -0000

From: sangeeta jain <sangeeta.jain@intel.com>

Allow the creation of test case configuration file based on user inputs.
Where this testcase configuration file will be used by the the manual
execution to run selected test cases for a module rather than compulsory
run all test cases in manual json file.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/manualexecution.py | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index df28e1d..ecb27c5 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -181,11 +181,38 @@ class ManualTestRunner(object):
         write_json_file(config_options_file, config_options)
         logger.info('Configuration option file created at %s' % config_options_file)
 
+    def make_testcase_config_file(self, logger, case_file, testcase_config_file):
+        if  testcase_config_file:
+            if os.path.exists(testcase_config_file):
+                print('\nTest configuration file with name %s already exists. Please provide a unique file name' % (testcase_config_file))
+                return 0
+
+        if not testcase_config_file:
+            testcase_config_file = os.path.join(self._get_write_dir(), "testconfig_new.json")
+
+        testcase_config = {}
+        cases = load_json_file(case_file)
+        new_test_module = self._get_test_module(case_file)
+        new_testcase_config = {}
+        new_testcase_config['testcases'] = []
+
+        print('\nAdd testcases for this configuration file:')
+        for case in cases:
+            print('\n' + case['test']['@alias'])
+            add_tc_config = self._get_true_false_input('\nDo you want to add this test case to test configuration : (Y)es/(N)o\n')
+            if add_tc_config:
+                new_testcase_config['testcases'].append(case['test']['@alias'])
+        write_json_file(testcase_config_file, new_testcase_config)
+        logger.info('Testcase Configuration file created at %s' % testcase_config_file)
+
 def manualexecution(args, logger):
     testrunner = ManualTestRunner()
     if args.make_config_options_file:
         testrunner.make_config_option_file(logger, args.file, args.config_options_file)
         return 0
+    if args.make_testcase_config_file:
+        testrunner.make_testcase_config_file(logger, args.file, args.testcase_config_file)
+        return 0
     configurations, result_id, write_dir, test_results = testrunner.run_test(args.file, args.config_options_file, args.testcase_config_file)
     resultjsonhelper = OETestResultJSONHelper()
     resultjsonhelper.dump_testresult_file(write_dir, configurations, result_id, test_results)
@@ -203,4 +230,6 @@ def register_commands(subparsers):
     parser_build.add_argument('-m', '--make-config-options-file', action='store_true',
                               help='make the configuration options file based on provided inputs')
     parser_build.add_argument('-t', '--testcase-config-file', default='',
-                              help='the testcase configuration file to enable user to run a selected set of test case')
\ No newline at end of file
+                              help='the testcase configuration file to enable user to run a selected set of test case or make a testcase configuration file')
+    parser_build.add_argument('-d', '--make-testcase-config-file', action='store_true',
+                    help='make the testcase configuration file to run a set of test cases based on user selection')
\ No newline at end of file
-- 
2.7.4


