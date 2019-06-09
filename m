Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 25B467D40F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:21 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id x15so3830300pfq.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UjYu2WdZhJF5EwHuKOVVPnw0KsMGYeIN1pHqL+vISYI=;
	b=PW9Dn7XRty66EeJQU1Wdi8+tEC1lt83ydlNy/gjBVmz2Xy95WyB/V17hrCQzCSAMdU
	5FpT3TPCM1Fm/S4EkMFwLaXzClsEtBHVUintIWeC0YEMOwGrZXVeaX7Ta4KHSf/ZcUv6
	HCwPkIpKL1+N0rP35Hzsw9L/X8Vu1noXjgzRcxVJjBM16jFKJrDRVXXTwrlZeoUg/VPy
	UtqyplkOqjHyZU/L7gA/txDnEskhkOJH9qOysth0bfhN6aixxyOQZj7Yb8nWw33KZpBV
	DrWqTd4Hk1TAOd7LjSRO991WqKzhFVcnlkC85g80nPqZMS3rP891gfOZDkivVtQKMeHQ
	HDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UjYu2WdZhJF5EwHuKOVVPnw0KsMGYeIN1pHqL+vISYI=;
	b=dFhR8lLaLxpWos2GpwaRYZEouMBgUo2Fls2u+ogeZjfd2YBnlUUgcWT1pAB+Lw/5qY
	AuNbj0TAFfzbdoKMiLBo6M97qqjvaiKdMpWW9KpO2IO1jYjK9VVZwcSZYUs46RspHNta
	uasgusenY9Jz/6nwIyxsKPng6a6TKBD3V7aVU4yTuqzL0FvFAfoCP2LrDc2uVwu2QhI8
	Qs1tTgRMwxYcIGiTiWYAdI4irISvFT5fDv2lWwArlcTo9cO/RLPyfxf97rfHGFYaqGaA
	JbYW7wifiITvRUUY2TjcMbgCiNU5+eNozH1NCLaQpI0QQp/n8XHrFPmQ82smKOunPas6
	MmyQ==
X-Gm-Message-State: APjAAAVPAnAj3E2FyZFa+B4EoOWal4ZDwNAitpByJoIBmRsppTzJsTrp
	z59jvpzz5A3hOcQ5k/PVInfgFxRv
X-Google-Smtp-Source: APXvYqz9kB5CMvZqmD/Cmq20pDR/HkSFJhsax7rTJ7Vopvofv+ZlS7f0TdN2m46wQtqLNiJIkhYUbA==
X-Received: by 2002:a17:90a:2648:: with SMTP id
	l66mr16188672pje.65.1560092062140; 
	Sun, 09 Jun 2019 07:54:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:53 -0700
Message-Id: <bb0947f0edde48bd979cee1f0da08aa6d9438692.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 18/27] resulttool: add LTP compliance section
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:21 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/report.py                   | 42 +++++++++++++++++++++-
 .../resulttool/template/test_report_full_text.txt  | 17 +++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index a98f239..cb6b1cf 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -18,6 +18,7 @@ class ResultsTextReport(object):
     def __init__(self):
         self.ptests = {}
         self.ltptests = {}
+        self.ltpposixtests = {}
         self.result_types = {'passed': ['PASSED', 'passed'],
                              'failed': ['FAILED', 'failed', 'ERROR', 'error', 'UNKNOWN'],
                              'skipped': ['SKIPPED', 'skipped']}
@@ -82,6 +83,37 @@ class ResultsTextReport(object):
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
@@ -98,6 +130,8 @@ class ResultsTextReport(object):
                 self.handle_ptest_result(k, test_status, result)
             if k.startswith("ltpresult."):
                 self.handle_ltptest_result(k, test_status, result)
+            if k.startswith("ltpposixresult."):
+                self.handle_ltpposixtest_result(k, test_status, result)
         return test_count_report
 
     def print_test_report(self, template_file_name, test_count_reports):
@@ -109,9 +143,10 @@ class ResultsTextReport(object):
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
@@ -133,12 +168,17 @@ class ResultsTextReport(object):
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


