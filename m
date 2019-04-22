Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 536DA72EB7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:32:58 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id y134so17534574itc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WKOYtP04EKiKUf6DBgnw4Dj+YmH0PKWBpaB+HUTSbMs=;
	b=FdK5Bz16EM0oFlZhw3QCnKEgaw8oz/AJUs0q/nWi+Uvnc1VSFlsQdTXicnjjRJ57ph
	6tNDhHJA0YQQ4JKV37flJPFd9BicUIZ/OX7a1Sg6dYB3g2oBc0NXWQB+ehPkri2j2wok
	VmX+CbMrco5sbTP0RdUtIq+ityGDM4ss0zeYp4Zk9I8hnb4tMcgg+YdrLAPD2/xYATy1
	WOhbjqZs6teOwCVhZaBa8WgRUC2OwfLR5PH2JxtgZRBUJH9ULk0itoju5F41R89ZZN7I
	4KtphwTWLKzP+QYWNAi6fSn4TI+RafXFEWDezsL/InJClzqCtr3Oc9iu+Hoy1+Md7g0J
	+PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WKOYtP04EKiKUf6DBgnw4Dj+YmH0PKWBpaB+HUTSbMs=;
	b=gAcjCG9JKewhoH/Iq0A7lHSV/XXMrmtlO42GhpQtTm3p/XJdIi7wjmQRAsBd4x6vB4
	mAFhGQN6ySSmpPaLvW2+Irj6YPfWp4VCqCHA0OdOjYOVoeQ11fsEL8NOf1UnlMF38OsM
	+CxnKvFCz3s5S/cJDKCdWO1wZD8uvdNZMU7lEO42a7WMNilWjkk+9YEYbEESxgB0ogWH
	lf+TjnEuAgaA+tVg7YkfnUmw58REvY9l0KUR06yOpic+HALbxm6sE/MJQaL8fuSjZ8W0
	I7xoMmm8jo7evcmeVAGDuFEgGq9poS8xk9gU8AKTTMKXl36m+9X6C4tucvJHeA/dVaf2
	toSA==
X-Gm-Message-State: APjAAAUX1Co4Q7JjGT6i1xbMjkfCH0kdZjclg1RDqmud7PQnH8I7u5bH
	wUiavU8D5qtWuU6chjPxGGIJ3Vu/
X-Google-Smtp-Source: APXvYqyIr/bC8ycYYg2Ich0qdUogbyGvPp50aWXZsIoh6i09vdlp21pZKyCltIkWfa9k9ZwqKbloKw==
X-Received: by 2002:a24:fc06:: with SMTP id b6mr12367452ith.130.1555936379314; 
	Mon, 22 Apr 2019 05:32:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id 19sm5889536itm.6.2019.04.22.05.32.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:32:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:32:42 -0600
Message-Id: <1555936363-18793-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
References: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 5/6] logparser: Add LTP compliance section
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
X-List-Received-Date: Mon, 22 Apr 2019 12:32:58 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/utils/logparser.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 76efac4..584ad4f 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -111,3 +111,40 @@ class LtpParser(object):
             self.section['log'] = self.section['log'] + ("%s: %s\n" % (result.strip()[:-2], test.strip()))
 
         return self.results, self.section
+
+
+# ltp Compliance log parsing
+class LtpComplianceParser(object):
+    def __init__(self):
+        self.results = {}
+        self.section = {'duration': "", 'log': ""}
+
+    def parse(self, logfile):
+        test_regex = {}
+        test_regex['PASSED'] = re.compile(r"^PASS")
+        test_regex['FAILED'] = re.compile(r"^FAIL")
+        test_regex['SKIPPED'] = re.compile(r"(?:UNTESTED)|(?:UNSUPPORTED)")
+
+        section_regex = {}
+        section_regex['test'] = re.compile(r"^Testing")
+
+        with open(logfile, errors='replace') as f:
+            for line in f:
+                result = section_regex['test'].search(line)
+                if result:
+                    self.name = ""
+                    self.name = line.split()[1].strip()
+                    self.results[self.name] = "PASSED"
+                    failed = 0
+
+                failed_result = test_regex['FAILED'].search(line)
+                if failed_result:
+                    failed = line.split()[1].strip()
+                    if int(failed) > 0:
+                        self.results[self.name] = "FAILED"
+
+        for test in self.results:
+            result = self.results[test]
+            self.section['log'] = self.section['log'] + ("%s: %s\n" % (result.strip()[:-2], test.strip()))
+
+        return self.results, self.section
-- 
2.7.4


