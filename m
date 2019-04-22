Return-Path: <akuster808@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 70186748D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:32:57 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u12so9339614iop.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WNo/dQd3uVfnr3dhwqH5W/UER3W7/jW1ScDbPcAVqzk=;
	b=PC8kRaHKrEAsbwT29GScqfcnyUScX7YYRrL/aSVeB2Rdk1Dp7v//kg+RbosgqhrYu1
	rWSnfuonJ7ThzH8uCqb1DTbzPLJ/RwehryqmVsEDNpZrZPMnoF/p9Zjfpfa5oqufMuJN
	howgAt1U0b/J/1OVa/19dKBDfU9/rW4rH/EmzebIgU6EYGuKlpuyxY26FX/j+VpFQmpg
	mM5Z/DC9u+Z3EQFBIa17vXwwkznQBVlgtyUWxYYHK2mmYy+QkN1fmqAQH3EcEQn23frp
	EoyigIp32NDWUltyuBHNQgTvMJUcYXT01olV6lEMSPoHzHwFtbFDariDjQNTn4HH7jpI
	gVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WNo/dQd3uVfnr3dhwqH5W/UER3W7/jW1ScDbPcAVqzk=;
	b=A+5AdPmC1cjfOVxE/vD8pJSTrkmdIsVhweXLICsSxxRw1eFR8w6Er5L0kkvZcoIYNb
	I3WpwX1gjXodOHk/XC/lyKRByiYp5gTVT5A+TbQk65n4KzwDrE0MlWo57zLD2AXoXCaJ
	HxLKFR2C1k+RFPNvbc6rSzS3OaiDvSLpKypvO+yegbGdnfhhD6ER4J2mr5X2BHGib0WT
	iBbkPA3tUbvcxxqUlEngYRL7w1Ac3XLwZUoZFMyES+Z9W6G/3E/rqUUt9RN7NPS/dMay
	YVk1ZfNMe/t3Ad3+NK/Y5wLLwbRDzc27+2fvMkyyJwoyqcHLctlZ6pRM5dAK4aXuVYzn
	XzHA==
X-Gm-Message-State: APjAAAVrqczREQjpDrVHN/EvULG+WdzLPhj68+Ph1eTPa7NpEn+PC1mV
	XQ4w6xmJvcHlboVA6//MXzgWR6i5
X-Google-Smtp-Source: APXvYqxiy9flwyczQHQvU09lSOYI4N1XwKRwTKJsWQ13t5n9urq5m1MS0JJdczkUFDvgJRrC2OxbWA==
X-Received: by 2002:a5e:de4d:: with SMTP id e13mr1079695ioq.39.1555936378338; 
	Mon, 22 Apr 2019 05:32:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id 19sm5889536itm.6.2019.04.22.05.32.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:32:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:32:41 -0600
Message-Id: <1555936363-18793-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
References: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 4/6] resulttool: add LTP compliance section
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
X-List-Received-Date: Mon, 22 Apr 2019 12:32:57 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/report.py                   | 42 +++++++++++++++++++++-
 .../resulttool/template/test_report_full_text.txt  | 17 +++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index e5962a0..cd30250 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -24,6 +24,7 @@ class ResultsTextReport(object):
     def __init__(self):
         self.ptests = {}
         self.ltptests = {}
+        self.ltpposixtests = {}
         self.result_types = {'passed': ['PASSED', 'passed'],
                              'failed': ['FAILED', 'failed', 'ERROR', 'error', 'UNKNOWN'],
                              'skipped': ['SKIPPED', 'skipped']}
@@ -88,6 +89,37 @@ class ResultsTextReport(object):
             if status in self.result_types[tk]:
                 self.ltptests[suite][tk] += 1
 
+    def handle_ltpposixtest_result(self, k, status, result):
+        if k == 'ltpposixresult.sections':
+            # Ensure tests without any test results still show up on the report
+            for suite in result['ltpposixresult.sections']:
+                if suite not in self.ltpposixtests:
+                    self.ltpposixtests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+                if 'duration' in result['ltpposixresult.sections'][suite]:
+                    self.ltpposixtests[suite]['duration'] = result['ltpposixresult.sections'][suite]['duration']
+            return
+        try:
+            _, suite, test = k.split(".", 2)
+        except ValueError:
+            return
+        # Handle 'glib-2.0'
+        if 'ltpposixresult.sections' in result and suite not in result['ltpposixresult.sections']:
+            try:
+                _, suite, suite1, test = k.split(".", 3)
+                if suite + "." + suite1 in result['ltpposixresult.sections']:
+                    suite = suite + "." + suite1
+            except ValueError:
+                pass
+        if suite not in self.ltpposixtests:
+            self.ltpposixtests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+        for tk in self.result_types:
+            if status in self.result_types[tk]:
+                self.ltpposixtests[suite][tk] += 1
+
+    def get_aggregated_test_result(self, logger, testresult):
+        test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
+    def get_aggregated_test_result(self, logger, testresult):
+        test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
     def get_aggregated_test_result(self, logger, testresult):
         test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
     def get_aggregated_test_result(self, logger, testresult):
@@ -104,6 +136,8 @@ class ResultsTextReport(object):
                 self.handle_ptest_result(k, test_status, result)
             if k.startswith("ltpresult."):
                 self.handle_ltptest_result(k, test_status, result)
+            if k.startswith("ltpposixresult."):
+                self.handle_ltpposixtest_result(k, test_status, result)
         return test_count_report
 
     def print_test_report(self, template_file_name, test_count_reports):
@@ -115,9 +149,10 @@ class ResultsTextReport(object):
         havefailed = False
         haveptest = bool(self.ptests)
         haveltp = bool(self.ltptests)
+        haveltpposix = bool(self.ltpposixtests)
         reportvalues = []
         cols = ['passed', 'failed', 'skipped']
-        maxlen = {'passed' : 0, 'failed' : 0, 'skipped' : 0, 'result_id': 0, 'testseries' : 0, 'ptest' : 0 ,'ltptest': 0}
+        maxlen = {'passed' : 0, 'failed' : 0, 'skipped' : 0, 'result_id': 0, 'testseries' : 0, 'ptest' : 0 ,'ltptest': 0, 'ltpposixtest': 0}
         for line in test_count_reports:
             total_tested = line['passed'] + line['failed'] + line['skipped']
             vals = {}
@@ -139,12 +174,17 @@ class ResultsTextReport(object):
         for ltptest in self.ltptests:
             if len(ltptest) > maxlen['ltptest']:
                 maxlen['ltptest'] = len(ltptest)
+        for ltpposixtest in self.ltpposixtests:
+            if len(ltpposixtest) > maxlen['ltpposixtest']:
+                maxlen['ltpposixtest'] = len(ltpposixtest)
         output = template.render(reportvalues=reportvalues,
                                  havefailed=havefailed,
                                  haveptest=haveptest,
                                  ptests=self.ptests,
                                  haveltp=haveltp,
+                                 haveltpposix=haveltpposix,
                                  ltptests=self.ltptests,
+                                 ltpposixtests=self.ltpposixtests,
                                  maxlen=maxlen)
         print(output)
 
diff --git a/scripts/lib/resulttool/template/test_report_full_text.txt b/scripts/lib/resulttool/template/test_report_full_text.txt
index 6ecd5bc..d2725b8 100644
--- a/scripts/lib/resulttool/template/test_report_full_text.txt
+++ b/scripts/lib/resulttool/template/test_report_full_text.txt
@@ -41,6 +41,23 @@ Ltp Test Result Summary
 There was no LTP Test data
 {% endif %}
 
+{% if haveltpposix %}
+==============================================================================================================
+Ltp Posix Result Summary
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{{ 'Recipe'.ljust(maxlen['ltpposixtest']) }} | {{ 'Passed'.ljust(maxlen['passed']) }} | {{ 'Failed'.ljust(maxlen['failed']) }} | {{ 'Skipped'.ljust(maxlen['skipped']) }} | {{ 'Time(s)'.ljust(10) }}
+--------------------------------------------------------------------------------------------------------------
+{% for ltpposixtest in ltpposixtests |sort %}
+{{ ltpposixtest.ljust(maxlen['ltpposixtest']) }} | {{ (ltpposixtests[ltpposixtest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ltpposixtests[ltpposixtest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ltpposixtests[ltpposixtest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ltpposixtests[ltpposixtest]['duration']|string) }}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
+
+{% else %}
+There was no LTP Posix Test data
+{% endif %}
+
+
 
 ==============================================================================================================
 Failed test cases (sorted by testseries, ID)
-- 
2.7.4


