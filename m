Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4393.1794732584331875744
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PdCyS7aJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa5103so960331f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732582; x=1795337382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0pNW/+qDSc+Pmwe0vGJ5r/khKdDAaMqjvLKP8uQlJJE=;
        b=PdCyS7aJpL4cxIBw7ibDa1TqIvTg5CM6VpA1Qq2apBUx/xzW1DMAVOHrTTrc2pQBhX
         keHetAo8HjKlodDh1Errjfyggjq8vs/OoPJVrXCeFvFV+b5MDQ1fZF25nTXuMG2H1ZvL
         wvbuw0qjL6zVBE4PXlp6eomOH+ODi/7tNJ0+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732582; x=1795337382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0pNW/+qDSc+Pmwe0vGJ5r/khKdDAaMqjvLKP8uQlJJE=;
        b=Wmxcz2N4ew9oibXT5dxwdcbR1m2RBmjrT0TBnf/s0umPa2V/7oM5vzXzJPUcg78WFU
         5c1wIwwPqwzadrErIrQcM4BEtL1rc5bzcFKK2oWUYAkdSs0u7yZnVxvdMNX5IyQSREa+
         g+hpvnxGxmyx0q0Di4AdL49O3nmgoU605yh1kc4pgjd5d5DyZJKznJKkjGfj3+POO9Uw
         oAroKI+NtZ0rarlefOg+DXhEGtMnuFDJZWsC7yEq+ECNgoJKwGQGCyH6tqHYGEyI8UUM
         xHMHiunUHmuzkNuFWJNCEoBn8mP0JwUYUNQfI6vheSiZ0Av5BgkZic8cK5QVwrQD4vAt
         8dJg==
X-Gm-Message-State: APuU4Z9peK/7tkyz4DKD85eYMxLXjw0cvtrlUnOtuL2TADiqw65lr6q7
	X8qfg6AL2MkutZwRzS6i6HNFnc3ECRfvrS712wuAOtptRInPfE7cbAzXra9eb12kyxY15CrYRhN
	7vGUIQiQ=
X-Gm-Gg: AYBFou3QrfzY24MU0JgQtct3+ylUXVwjvDbmHWM5p2Sl4ebdakreMZ7+S0TIDAfs+57
	aU2Kj7X4/ST7LcGKZSFUFP8uKtK5y+3xoNJAFNpHOW2zahoJXpWU9yNbUnsWggllQmS5y6V0vTt
	X3VT1R/254xJNuH9zD+kbb6IR5AzOdwPRiVMm/fkcHrWjcMfHFbehqgdHl2lAqKxBVT6HfPczTF
	wfXGdVva443wFCPLvw04WleI0xoNDwq09YeSIZXAgAucsEACgMTEDJD5NoN+b4zxqYO38QnazFX
	SQ/+PmD4FTYpg2R/AVYW9+ehkfc6R/8xHjc1ymCrYleKYIVXDXPfi3ud8lJLAFh8fxqzbOR0NCT
	HG+UMsqMU+0rHmz9nBinRe5wwD2eusOjc7xmPt3riJXtcLMrPVr3gr975zTZzZ0bs1+sTUwVjmu
	/1MXWQnB4S87MIHx/kbkql2jc2HkCjnDB1qtGsRI17bOqdpEnW/d/xql7ImbZWO/qBTdora+3Z6
	lyGHl14jSfwfZYAURwOIrigZPT6vkrwgb+UpO1MIDUbuQujGRP15U5s4vE7oEZ+a/ipBCdvdc6E
	KEA5w+5FtwqEVZYnTUuKV07VYNBXuYSNQ1Z1GIVmLosakCRAYK4/bv2OLA==
X-Received: by 2002:a05:6000:4803:b0:49c:192f:cf20 with SMTP id ffacd0b85a97d-49c6dbffed9mr14525022f8f.6.1794732582434;
        Sun, 15 Nov 2026 00:49:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 33/41] oeqa/core/runner: Track test results as they are added
Date: Sun, 15 Nov 2026 08:48:36 +0000
Message-ID: <20261115084845.701136-33-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250264
Content-Type: text/plain; charset="utf-8"

The status of each test was worked out by searching every unittest
result list, matching setUpClass/setUpModule failures with regular
expressions, once per test when writing the results. After every test,
stopTest() also searched all the failure, error and skip lists to show
its messages. Both grow with the square of the number of tests which
adds up for large selftest runs.

Record each result against its test, or against the class or module for
setup failures, when it is added, and use that for both. If a test has
more than one result, e.g. from subtests, the same precedence as before
is used.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 107 +++++++++++++++++++----------------
 1 file changed, 57 insertions(+), 50 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index a9b416f7cd7..f68203baa3b 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -20,6 +20,10 @@ def _case_id(case):
     # id of the test case it belongs to
     return getattr(case, 'test_case', case).id()
 
+# setUpClass/setUpModule failures are reported against a placeholder whose id
+# names the class or module
+_setup_failure_re = re.compile(r"^(?:setUpModule|setUpClass) \((?P<name>.*)\)")
+
 class OEStreamLogger:
     def __init__(self, logger):
         self.logger = logger
@@ -41,6 +45,10 @@ class OEStreamLogger:
             handler.flush()
 
 class OETestResult(_TestResult):
+    # If a test has several results, e.g. from subtests, the status reported
+    # is the first of these which it has
+    status_priority = ('FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL', 'PASSED')
+
     def __init__(self, tc, *args, **kwargs):
         super().__init__(*args, **kwargs)
 
@@ -49,7 +57,12 @@ class OETestResult(_TestResult):
         self.endtime = {}
         self.progressinfo = {}
         self.extraresults = {}
-        self.shownmsg = []
+        self.shownmsg = set()
+
+        # (status, message) results for each test id, and for setUpClass and
+        # setUpModule failures by class or module name
+        self.test_results = {}
+        self.setup_results = {}
 
         # Inject into tc so that TestDepends decorator can see results
         tc.results = self
@@ -76,12 +89,10 @@ class OETestResult(_TestResult):
 
         # Print the errors/failures early to aid/speed debugging, its a pain
         # to wait until selftest finishes to see them.
-        for t in ['failures', 'errors', 'skipped', 'expectedFailures']:
-            for (scase, msg) in getattr(self, t):
-                if test.id() == _case_id(scase):
-                    self.tc.logger.info(str(msg))
-                    self.shownmsg.append(test.id())
-                    break
+        for status, msg in self.test_results.get(test.id(), []):
+            if status != 'PASSED' and msg:
+                self.tc.logger.info(str(msg))
+                self.shownmsg.add(test.id())
 
     # Python 3.12 added this, stub it out for now
     def addDuration(self, test, elapsed):
@@ -101,45 +112,23 @@ class OETestResult(_TestResult):
         msg += " (successes=%d, skipped=%d, failures=%d, errors=%d)" % (len(self.successes), len(self.skipped), len(self.failures), len(self.errors))
         self.tc.logger.info(msg)
 
+    def _addResult(self, test, status, msg=None):
+        m = _setup_failure_re.match(str(test.id()))
+        if m:
+            self.setup_results.setdefault(m.group('name'), []).append((status, msg))
+        else:
+            self.test_results.setdefault(_case_id(test), []).append((status, msg))
+
     def _getTestResultDetails(self, case):
-        result_types = {'failures': 'FAILED', 'errors': 'ERROR', 'skipped': 'SKIPPED',
-                        'expectedFailures': 'EXPECTEDFAIL', 'successes': 'PASSED',
-                        'unexpectedSuccesses' : 'PASSED'}
-
-        for rtype in result_types:
-            found = False
-            for resultclass in getattr(self, rtype):
-                # unexpectedSuccesses are just lists, not lists of tuples
-                if isinstance(resultclass, tuple):
-                    scase, msg = resultclass
-                else:
-                    scase, msg = resultclass, None
-                if case.id() == _case_id(scase):
-                    found = True
-                    break
-                scase_str = str(scase.id())
-
-                # When fails at module or class level the class name is passed as string
-                # so figure out to see if match
-                m = re.search(r"^setUpModule \((?P<module_name>.*)\).*$", scase_str)
-                if m:
-                    if case.__class__.__module__ == m.group('module_name'):
-                        found = True
-                        break
-
-                m = re.search(r"^setUpClass \((?P<class_name>.*)\).*$", scase_str)
-                if m:
-                    class_name = "%s.%s" % (case.__class__.__module__,
-                                            case.__class__.__name__)
-
-                    if class_name == m.group('class_name'):
-                        found = True
-                        break
-
-            if found:
-                return result_types[rtype], msg
-
-        return 'UNKNOWN', None
+        results = self.test_results.get(case.id())
+        if not results:
+            # The test didn't run, look for a class or module setup failure
+            cls = case.__class__
+            results = self.setup_results.get("%s.%s" % (cls.__module__, cls.__name__)) or \
+                      self.setup_results.get(cls.__module__)
+        if not results:
+            return 'UNKNOWN', None
+        return min(results, key=lambda r: self.status_priority.index(r[0]))
 
     def extractExtraResults(self, test, details = None):
         extraresults = None
@@ -158,25 +147,43 @@ class OETestResult(_TestResult):
 
     def addError(self, test, *args, details = None):
         self.extractExtraResults(test, details = details)
-        return super().addError(test, *args)
+        super().addError(test, *args)
+        self._addResult(test, 'ERROR', self.errors[-1][1])
 
     def addFailure(self, test, *args, details = None):
         self.extractExtraResults(test, details = details)
-        return super().addFailure(test, *args)
+        super().addFailure(test, *args)
+        self._addResult(test, 'FAILED', self.failures[-1][1])
+
+    def addSubTest(self, test, subtest, err):
+        super().addSubTest(test, subtest, err)
+        if err is not None:
+            if issubclass(err[0], test.failureException):
+                self._addResult(test, 'FAILED', self.failures[-1][1])
+            else:
+                self._addResult(test, 'ERROR', self.errors[-1][1])
+
+    # No details argument, so testtools passes the reason
+    def addSkip(self, test, reason):
+        super().addSkip(test, reason)
+        self._addResult(test, 'SKIPPED', reason)
 
     def addSuccess(self, test, details = None):
         #Added so we can keep track of successes too
         self.successes.append((test, None))
         self.extractExtraResults(test, details = details)
-        return super().addSuccess(test)
+        super().addSuccess(test)
+        self._addResult(test, 'PASSED')
 
     def addExpectedFailure(self, test, *args, details = None):
         self.extractExtraResults(test, details = details)
-        return super().addExpectedFailure(test, *args)
+        super().addExpectedFailure(test, *args)
+        self._addResult(test, 'EXPECTEDFAIL', self.expectedFailures[-1][1])
 
     def addUnexpectedSuccess(self, test, details = None):
         self.extractExtraResults(test, details = details)
-        return super().addUnexpectedSuccess(test)
+        super().addUnexpectedSuccess(test)
+        self._addResult(test, 'PASSED')
 
     def logDetails(self, json_file_dir=None, configuration=None, result_id=None,
             dump_streams=False):
