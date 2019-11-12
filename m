Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2847E5FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:42 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id h4so10969370pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jmTGYLU+OlMhfeA0evx+l8b+Ydeg81qQCvrqHlEzuu0=;
	b=g8huaDhahpPWa+dNlHsdj1Bmvs5iOg2/kW2OwbxyqFD4UcXa4uD2MDofWYmC8fKR2M
	h/X2jQlu6pzpFNU4nkbGwHdr/TmMqc4BgSWTSAZGVQLiTXI1wtM31P5RUfrbuX/KppVQ
	6RVGf6x9w7zkKTYxg7BPFOfmlTeymp4fs8f+ZykeiyBamQ37UGkLmJUya0rCoX+E8Hew
	RJ4Vy0Fh9yyKqeeld4cZUiYYGPb4dnFOTXRTNC6YYiBVGDOT2RkCShdlIja7s0HwUxhL
	+EXLVciAi0qxrrsAuplGQokjC+m3T5srU6NyBpgkOR7tPubLeRu0k7CVLzWdo6f8jC+t
	ByVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jmTGYLU+OlMhfeA0evx+l8b+Ydeg81qQCvrqHlEzuu0=;
	b=kZWPSUflXwdqje1rWOffqFIAI7JJ5ZWpb96stiVv673b74/x1qH38+OKngshXKjmya
	+xprV1mdEQnvcZp1ePa+CxDvfLEA8jT3O3FbRSq3rEdGrp7aRfztOlojT7MmcO2e6+ly
	vXKQuBbgq+gHubBIYhNG92kYLyt4njO/bvWUe6OZ9kBIy/vMFWcR5GiQl+bZwcVaFfgt
	JxbYREz/nSKasI/xO/a85yn0+uJzrx77xqhS1snnUeEcC/nUP3meWIqx365OgTSvmLoD
	zhhWVJBUuoxSlG0iZFcV59+lguRGr6uC1IPn2igDOOHAs44gQCaLSqdUa0TBjqk9CvUb
	/QTg==
X-Gm-Message-State: APjAAAVkjdSgxWnU3A+Nt3lWeBvmZX9hWLXoXYfQJbprw+A1sy0qe4LJ
	0ZJlGFBOEAv0SMRhod94/L3mDcal
X-Google-Smtp-Source: APXvYqxKzl4cS10Ova7pg2zM6NNyVs7kW8KHhL+gvbjhVxXoExxEOcBp6qZCmt/L1Q71gkMHqYppcg==
X-Received: by 2002:a17:90b:3108:: with SMTP id
	gc8mr3622566pjb.54.1573533223523; 
	Mon, 11 Nov 2019 20:33:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:20 -0800
Message-Id: <308c52f1938d42fffa4563a440c34edff109a416.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 01/20] OEQA: Add a check for MACHINE
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

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/core/decorator/data.py | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 12d462f..ff92fba 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -18,6 +18,16 @@ def has_feature(td, feature):
         return True
     return False
 
+def has_machine(td, machine):
+    """
+        Checks for MACHINE.
+    """
+
+    if (machine in td.get('MACHINE', '')):
+        return True
+    return False
+
+
 @registerDecorator
 class skipIfDataVar(OETestDecorator):
     """
@@ -131,3 +141,37 @@ class skipIfFeature(OETestDecorator):
         self.logger.debug(msg)
         if has_feature(self.case.td, self.value):
             self.case.skipTest(self.msg)
+
+@registerDecorator
+class skipIfNotMachine(OETestDecorator):
+    """
+        Skip test based on MACHINE.
+
+        value must be match MACHINE or it will skip the test
+        with msg as the reason.
+    """
+
+    attrs = ('value', 'msg')
+
+    def setUpDecorator(self):
+        msg = ('Checking if %s is not this MACHINE' % self.value)
+        self.logger.debug(msg)
+        if not has_machine(self.case.td, self.value):
+            self.case.skipTest(self.msg)
+
+@registerDecorator
+class skipIfMachine(OETestDecorator):
+    """
+        Skip test based on Machine.
+
+        value must not be this machine or it will skip the test
+        with msg as the reason.
+    """
+
+    attrs = ('value', 'msg')
+
+    def setUpDecorator(self):
+        msg = ('Checking if %s is this MACHINE' % self.value)
+        self.logger.debug(msg)
+        if has_machine(self.case.td, self.value):
+            self.case.skipTest(self.msg)
-- 
2.7.4


