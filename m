Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id A60947F93B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c13so12415759pfp.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HDd/ubaY1ufqHeYuaDOKWW0bDl3AojC4aJ/E62+RU5s=;
	b=X+eN+fxu+uAzUpdRXiWS82IhUiC54SWcXQiscsQ7+bKU1LApRoKy+FMV6HZC8Z6cLB
	vPWVo7l2zBYYnMrQUckgcZLljkmLr503k/9YUdi5d5T/uEI7tcKro6tXhOM56VltsWvg
	UGSem0eZ8CNGZK6phDqwlm6OiKlBm0LUvc2R2bCsZ+ARyaWkqw4Z/b7+3HXNQJIonZfR
	Z7gdT6kXjyT98rNPsvq8caRMRWt41jFu5E3A3igdj91CP57PFBfA+RyQBsb6/ff2Uawx
	ZwR6Q+Xf2WjFcViJJ1xTcXsPel616cwH9LgVfFwePG4aoI6BaVOyz6JFU7CuKQsRzgkk
	HWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HDd/ubaY1ufqHeYuaDOKWW0bDl3AojC4aJ/E62+RU5s=;
	b=CbcWyD5bWP4+EHV4EczxyGKnx2UvGNEmoKVsW+S4XcTJk1C0t++OEpgw3djHKLaWrx
	/jTWUY0mkxW+AF8yz0ZQq8656Lpwx3ndfZro1iXFOCc5EMMJZ1iaylmzhGi1+rwQmbX6
	BcWBKzAf2nqaVzxeEi8AhV/8YW7q/5n7M4Deeshw+v8F8n3OKaKZc/uUl7FG96p+nedm
	vqrfuTVVtIz2qftm4eQeoFcl3SYiys6B6QQkYx0DpcACuSqzHB6t4GkxJ2I2w5iSbluN
	qYyMajbJZFMgCxjWFJV/lYYptmiHGr44SIR+nd06R8J4hnZs1qzfD/3GdwD9AR9eYiZ2
	IIjg==
X-Gm-Message-State: APjAAAXZrZtLLl1iFdpt57spZ4PgIZzdx6pwP1l2yvWd2K+OJV1l3gXI
	KBtfpGc2DelSaTjGw8Iz2ssv0GDW
X-Google-Smtp-Source: APXvYqwJPCh6TAIyaChTIDH2TA+O8z97A4QqAMwyues//YkkyZkkTqJlN+bWC2gGAHhFAxsxAz04kQ==
X-Received: by 2002:a63:67c3:: with SMTP id
	b186mr32802263pgc.152.1573533224420; 
	Mon, 11 Nov 2019 20:33:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:21 -0800
Message-Id: <39490dac388235c7723051537bc294b0b2d7829b.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 02/20] OEQA: Add qemu checks
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:43 -0000

Some test should not be run in QEMU systems so
add some checks to make that easier

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/core/decorator/data.py | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index ff92fba..bc4939e 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -27,6 +27,16 @@ def has_machine(td, machine):
         return True
     return False
 
+def is_qemu(td, qemu):
+    """
+        Checks if MACHINE is qemu.
+    """
+
+    machine = td.get('MACHINE', '')
+    if (qemu in td.get('MACHINE', '') or
+    machine.startswith('qemu')):
+        return True
+    return False
 
 @registerDecorator
 class skipIfDataVar(OETestDecorator):
@@ -175,3 +185,38 @@ class skipIfMachine(OETestDecorator):
         self.logger.debug(msg)
         if has_machine(self.case.td, self.value):
             self.case.skipTest(self.msg)
+
+@registerDecorator
+class skipIfNotQemu(OETestDecorator):
+    """
+        Skip test based on MACHINE.
+
+        value must be a qemu MACHINE or it will skip the test
+        with msg as the reason.
+    """
+
+    attrs = ('value', 'msg')
+
+    def setUpDecorator(self):
+        msg = ('Checking if %s is not this MACHINE' % self.value)
+        self.logger.debug(msg)
+        if not is_qemu(self.case.td, self.value):
+            self.case.skipTest(self.msg)
+
+@registerDecorator
+class skipIfQemu(OETestDecorator):
+    """
+        Skip test based on Qemu Machine.
+
+        value must not be a qemu machine or it will skip the test
+        with msg as the reason.
+   """
+
+    attrs = ('value', 'msg')
+
+    def setUpDecorator(self):
+        msg = ('Checking if %s is this MACHINE' % self.value)
+        self.logger.debug(msg)
+        if is_qemu(self.case.td, self.value):
+             self.case.skipTest(self.msg)
+
-- 
2.7.4


