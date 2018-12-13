Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4065279E15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:41 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id e11so1018159plt.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Y+DBu4O3J4lbufUrsFoLJekc8nOyDqs+WHAv7NzrhYA=;
	b=lTyEFiP8i5EFmTij1IIfPao4RXyDx8BM2si5jDekUAjZ5z50iVgZ98YN/6Ry/hEXyD
	y5YkD6l0mP7wMkovFgKpeJtoqCCKwA/MvFvdwz59et6jfPks4Aooy6iJIDKeU3p/Sq0q
	wDesVAUDOaDBhDPBA7amcpGf+lWczXWFh64+dg+jApdvvCFODxIwN20U2shim6QZ8SJ1
	kwDaPI3GIdPF1hnfci6ksvdQL4ISW5rw6UED36/dQjbzBMnaarltC1ILSBC/ET/haUD6
	niGN0aRgXhQEByBy4+W30MhX2MnyKAT28Ev/0y6E0IgnHp9aKAlQBIY3Se5m4RBOAslV
	aoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Y+DBu4O3J4lbufUrsFoLJekc8nOyDqs+WHAv7NzrhYA=;
	b=LbMMZsy9tZNq969nuT7gF9xZM7WDD1CooCC6dDztJJgfeTx0yLjai2cH4JfNocmRBD
	18Bl1Q/+8FF0vA7Xrynm/Lwd56QVIEx6pkJSir7xG2gEagtGaLBIEF4oh0aV42uBmWcr
	kv9uL3QtxuTriWaoZcpGA4yZglyf3nyUHLYBz8cnLncojsW0qLkUEF51ZIgN1DXiaw9D
	9JQWNpaqJRjZ9ZPWTNx7YjkSpG3+RUc+SUDq9XW6OM+1sISJhl16mDS0HLIBA5li569p
	rrrZBGDJi6hUx6EsH1ovokrM6/jgRFotqC02EwM4M+J2o0mnrTCi4r2WFn1AqATyGGTj
	L8UA==
X-Gm-Message-State: AA+aEWaDMK7c4D5sTIiqKIRN2Vqw07/6ytPmFvZjjTbKsXIHtgEmls1b
	Mgm0DY8Fzc9Uw5uHN7SY4rrsir3j
X-Google-Smtp-Source: AFSGD/W2FTeRk03dFYOXZFl9x1l7iLNfynYj4m4VW+996lBOSimb1+PeH4nE0XzfePFL142npfrKew==
X-Received: by 2002:a17:902:aa4c:: with SMTP id
	c12mr466957plr.48.1544737182205; 
	Thu, 13 Dec 2018 13:39:42 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:42 -0800
Message-Id: <07ef74eaca0b318c0e6adee20535b41c5b85e6ca.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 34/45] oeqa/runner: Sort the test result output by result class
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:41 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We want to see failures/errors listed last since this is the most easily
visible part of the log on consoles or autobuilder output and makes
human processing easier rather than having to scroll up and scan for
a single failure.

(From OE-Core rev: 2cc07ab253f1ba6a1f07a66051c9ba6d98cd2357)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 0cb1a95..f8bb23f 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -107,6 +107,7 @@ class OETestResult(_TestResult):
         self.tc.logger.info("RESULTS:")
 
         result = {}
+        logs = {}
         if hasattr(self.tc, "extraresults"):
             result = self.tc.extraresults
 
@@ -121,8 +122,19 @@ class OETestResult(_TestResult):
                     if hasattr(d, 'oeid'):
                         oeid = d.oeid
 
-            self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(), oeid, status))
-            result[case.id()] = {'status': status, 'log': log}
+            if status not in logs:
+                logs[status] = []
+            logs[status].append("RESULTS - %s - Testcase %s: %s" % (case.id(), oeid, status))
+            if log:
+                result[case.id()] = {'status': status, 'log': log}
+            else:
+                result[case.id()] = {'status': status}
+
+        for i in ['PASSED', 'SKIPPED', 'EXPECTEDFAIL', 'ERROR', 'FAILED', 'UNKNOWN']:
+            if i not in logs:
+                continue
+            for l in logs[i]:
+                self.tc.logger.info(l)
 
         if json_file_dir:
             tresultjsonhelper = OETestResultJSONHelper()
-- 
2.7.4


