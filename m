Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 662347D40F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:20 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id c85so3824110pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/FYVXu2jBNZ5iwErrNgYlhXJmDJ4q46LYvc59U8gLtA=;
	b=UYPzJTsCe6uEEGue5YdSfi7JjGoXidRZiErAgO1+2lgWYq/AOX0R0hWBbmJCAa82mp
	OdknHc+Cr53kDW++A4unYmKuGoigYxOdSeOystV6Y3NRBNNY+nxMSdq7ki523pht6PrR
	pw8tWqMJVv1C3Gb/qc15O0ikFs38Flq1EB4wzkpdXJwaXWnV/ZuDoWzPNzc861P7poM/
	0E8H+Wuu9cht6I0Xi38REQzvj0e1/pA583mjWjsDQakoebWsr0tt4JsxfmE70/pwnYvU
	ovASmje0bpP7C0a4LQJ4WkHKz3wW9eCYSBN79WZc0mli/iTrs/Gbsx5i4Qsq/b3nsXeO
	F9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/FYVXu2jBNZ5iwErrNgYlhXJmDJ4q46LYvc59U8gLtA=;
	b=UZIpnnV7PrsPkl6l/4guvYbBKPSE3eP9X7sR+UTEHekhLeKKmmEQhOO1YIymK1lqr2
	WN3+SONj7sFypspTslVD/LtFACn/DTwn1WUCG2yaMHxWV/wHAhF6fUN1JJDu3HIhdleK
	Ywg8K4vt54Fygs5eGIx9twBNqCfl1OBOZOC4NzuScBxOU1kbMa/VKuJnrAu4bdDkO/z/
	fUfXIRRWx51S0fUQCr+exfwFduzMVs7ogPysGMOW4kF4R2XTObPliqeKRs+RmBZGhVYT
	D6krqyq+viZbpzQcah8AKeoYrEAlTdE9GfyrhBnywMVlJZw5i2iFFgJuNRlj4FIsqq15
	RXdQ==
X-Gm-Message-State: APjAAAVBamxQq8GSG4cTy1PSniczTMtTh8XPmibP7Xzg2TDRascvi0Oo
	oSPcPCLBamBDrMRBc4rllxAFsNsd
X-Google-Smtp-Source: APXvYqzn3vjS6V399Oe8cB7lxOsv/Xvn99iVVLvtQSqRZ/Uix1B9ZqDzKgsnlp6QN0xriJhVsIOJIA==
X-Received: by 2002:a17:90a:4814:: with SMTP id
	a20mr16861210pjh.62.1560092061386; 
	Sun, 09 Jun 2019 07:54:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:52 -0700
Message-Id: <b16f153bde10386a895096051b1eda3c1af0e9ad.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 17/27] resulttool: add ltp test support
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:20 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/report.py                   | 43 +++++++++++++++++++++-
 .../resulttool/template/test_report_full_text.txt  | 17 +++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index b1c9d13..a98f239 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -17,6 +17,7 @@ import oeqa.utils.gitarchive as gitarchive
 class ResultsTextReport(object):
     def __init__(self):
         self.ptests = {}
+        self.ltptests = {}
         self.result_types = {'passed': ['PASSED', 'passed'],
                              'failed': ['FAILED', 'failed', 'ERROR', 'error', 'UNKNOWN'],
                              'skipped': ['SKIPPED', 'skipped']}
@@ -51,6 +52,38 @@ class ResultsTextReport(object):
             if status in self.result_types[tk]:
                 self.ptests[suite][tk] += 1
 
+    def handle_ltptest_result(self, k, status, result):
+        if k == 'ltpresult.sections':
+            # Ensure tests without any test results still show up on the report
+            for suite in result['ltpresult.sections']:
+                if suite not in self.ltptests:
+                    self.ltptests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+                if 'duration' in result['ltpresult.sections'][suite]:
+                    self.ltptests[suite]['duration'] = result['ltpresult.sections'][suite]['duration']
+                if 'timeout' in result['ltpresult.sections'][suite]:
+                    self.ltptests[suite]['duration'] += " T"
+            return
+        try:
+            _, suite, test = k.split(".", 2)
+        except ValueError:
+            return
+        # Handle 'glib-2.0'
+        if 'ltpresult.sections' in result and suite not in result['ltpresult.sections']:
+            try:
+                _, suite, suite1, test = k.split(".", 3)
+                print("split2: %s %s %s" % (suite, suite1, test))
+                if suite + "." + suite1 in result['ltpresult.sections']:
+                    suite = suite + "." + suite1
+            except ValueError:
+                pass
+        if suite not in self.ltptests:
+            self.ltptests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+        for tk in self.result_types:
+            if status in self.result_types[tk]:
+                self.ltptests[suite][tk] += 1
+
+    def get_aggregated_test_result(self, logger, testresult):
+        test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
     def get_aggregated_test_result(self, logger, testresult):
         test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
         result = testresult.get('result', [])
@@ -63,6 +96,8 @@ class ResultsTextReport(object):
                 test_count_report['failed_testcases'].append(k)
             if k.startswith("ptestresult."):
                 self.handle_ptest_result(k, test_status, result)
+            if k.startswith("ltpresult."):
+                self.handle_ltptest_result(k, test_status, result)
         return test_count_report
 
     def print_test_report(self, template_file_name, test_count_reports):
@@ -73,9 +108,10 @@ class ResultsTextReport(object):
         template = env.get_template(template_file_name)
         havefailed = False
         haveptest = bool(self.ptests)
+        haveltp = bool(self.ltptests)
         reportvalues = []
         cols = ['passed', 'failed', 'skipped']
-        maxlen = {'passed' : 0, 'failed' : 0, 'skipped' : 0, 'result_id': 0, 'testseries' : 0, 'ptest' : 0 }
+        maxlen = {'passed' : 0, 'failed' : 0, 'skipped' : 0, 'result_id': 0, 'testseries' : 0, 'ptest' : 0 ,'ltptest': 0}
         for line in test_count_reports:
             total_tested = line['passed'] + line['failed'] + line['skipped']
             vals = {}
@@ -94,10 +130,15 @@ class ResultsTextReport(object):
         for ptest in self.ptests:
             if len(ptest) > maxlen['ptest']:
                 maxlen['ptest'] = len(ptest)
+        for ltptest in self.ltptests:
+            if len(ltptest) > maxlen['ltptest']:
+                maxlen['ltptest'] = len(ltptest)
         output = template.render(reportvalues=reportvalues,
                                  havefailed=havefailed,
                                  haveptest=haveptest,
                                  ptests=self.ptests,
+                                 haveltp=haveltp,
+                                 ltptests=self.ltptests,
                                  maxlen=maxlen)
         print(output)
 
diff --git a/scripts/lib/resulttool/template/test_report_full_text.txt b/scripts/lib/resulttool/template/test_report_full_text.txt
index 590f35c..6ecd5bc 100644
--- a/scripts/lib/resulttool/template/test_report_full_text.txt
+++ b/scripts/lib/resulttool/template/test_report_full_text.txt
@@ -25,6 +25,23 @@ PTest Result Summary
 There was no ptest data
 {% endif %}
 
+{% if haveltp %}
+==============================================================================================================
+Ltp Test Result Summary
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{{ 'Recipe'.ljust(maxlen['ltptest']) }} | {{ 'Passed'.ljust(maxlen['passed']) }} | {{ 'Failed'.ljust(maxlen['failed']) }} | {{ 'Skipped'.ljust(maxlen['skipped']) }} | {{ 'Time(s)'.ljust(10) }}
+--------------------------------------------------------------------------------------------------------------
+{% for ltptest in ltptests |sort %}
+{{ ltptest.ljust(maxlen['ltptest']) }} | {{ (ltptests[ltptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ltptests[ltptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ltptests[ltptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ltptests[ltptest]['duration']|string) }}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
+
+{% else %}
+There was no LTP Test data
+{% endif %}
+
+
 ==============================================================================================================
 Failed test cases (sorted by testseries, ID)
 ==============================================================================================================
-- 
2.7.4


