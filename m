Return-Path: <akuster808@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 362676D5B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:32:54 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r10so5444145ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9RspmtOCf4KtcLUlz82LtaxzYUq6LwbH7WGp3hD4PgM=;
	b=XWwK6TQDL+RaMk+3CyjvDp/oPJDumd7XkufSldDIMW1EdLGXE7W7fGp0WENtbc210P
	sDqCLSC3rsJMGCC5jBED9zhTPd/LI0MpKLarwJjCN3QseBGpv2g/jycNKhinTVUrzhcA
	1y86NQr1GQXICmfBunxfuBpfBtbXLO8CcAl89vpVZOVgL0rLVdjbrG62rONzr5jpa/hs
	SHKCLNks7IB3wmbWAzyrcHDBvru3RkAsxoJ7BkQz8ehm4KjAiAc1vuCPXzUuVZxE/hOR
	QQ9moyiR7DRo0FyGz+99H53fyMJF6OSTB/WbFlBKA4GgY9NO/Ve353IjowqWx8SBR/Gq
	FTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9RspmtOCf4KtcLUlz82LtaxzYUq6LwbH7WGp3hD4PgM=;
	b=Qt7UKhvtwFIRI+HUslFqocoWif6XQP/vexKgDAJOTt2nMs6UIuISLjKRNFIcwReJWg
	bK6xFXOwi6h8B51KBW6HxBKZJ0KYMaUl1menhqO7qemqz3kZvyhwB7EICxyfyP8JDMX4
	2q8HmoFhoNSQ8UulmmW7MDLvS2u7rqDA6jEK1WrPLBG7qhqWR1YvcztGeTNIhft1KHK2
	PUXr0ZOa/3v7dyVTwludKI7EAC1tW3Du9t+917rz7KxyxeRSLqp/BKQ2O2Np4AMkf30W
	V/nbejuF5pvyBEo9Yi7UhuDjEeghmlHnKOFEAYW3G9xk899R3RWB3wboRtr71wi5cQmu
	rHUQ==
X-Gm-Message-State: APjAAAUMOLxawl1B3aHYTCbOWi73kIC5ZCmsLN67yM/SIt4IPf+0gHtH
	dNdWIDcSl4O/NlJMrN+3H/T9A22u
X-Google-Smtp-Source: APXvYqyJFoiA/DJHEjjRHtQNox7Pj+lpJ3ywVa1PYX3snDL8u0BKUSeF8UeaBqi8dikJ0gahcKE+XQ==
X-Received: by 2002:a5e:c019:: with SMTP id u25mr12378467iol.104.1555936375018;
	Mon, 22 Apr 2019 05:32:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id 19sm5889536itm.6.2019.04.22.05.32.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:32:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:32:38 -0600
Message-Id: <1555936363-18793-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
References: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 1/6] resulttool: add ltp test support
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
X-List-Received-Date: Mon, 22 Apr 2019 12:32:55 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/report.py                   | 43 +++++++++++++++++++++-
 .../resulttool/template/test_report_full_text.txt  | 17 +++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 9008620..e5962a0 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -23,6 +23,7 @@ import oeqa.utils.gitarchive as gitarchive
 class ResultsTextReport(object):
     def __init__(self):
         self.ptests = {}
+        self.ltptests = {}
         self.result_types = {'passed': ['PASSED', 'passed'],
                              'failed': ['FAILED', 'failed', 'ERROR', 'error', 'UNKNOWN'],
                              'skipped': ['SKIPPED', 'skipped']}
@@ -57,6 +58,38 @@ class ResultsTextReport(object):
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
@@ -69,6 +102,8 @@ class ResultsTextReport(object):
                 test_count_report['failed_testcases'].append(k)
             if k.startswith("ptestresult."):
                 self.handle_ptest_result(k, test_status, result)
+            if k.startswith("ltpresult."):
+                self.handle_ltptest_result(k, test_status, result)
         return test_count_report
 
     def print_test_report(self, template_file_name, test_count_reports):
@@ -79,9 +114,10 @@ class ResultsTextReport(object):
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
@@ -100,10 +136,15 @@ class ResultsTextReport(object):
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


