Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9419E6BC44
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 16:52:57 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d13so15973693pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 08:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=jmTGYLU+OlMhfeA0evx+l8b+Ydeg81qQCvrqHlEzuu0=;
	b=is49/pV7WyF8J845P8iXIab4MJmcwxrQfRQ+pnChCY6Tmf+u5pSMOKfg9UMeVy14j7
	LchXW3kiH5chA799fGJIyrEsY0KoOy7M4o2ngawKKdWpr1wZZh56mYBYRg/wUhH9java
	wcVKVVGKyKNiifYYLydR8alANPrFdUDBCTwPROiW4/cPRx/iYuPVwTp/GPci0RGfj5PE
	+g6gd8+EBzdLJQjZp2gdXHmHnwQJkxaAaB83Vd9XjiWI/6nlXxRMxbVTpkJPEoxpz7n4
	Lf5bSmIHSPik1jC+/AH3uQDpG1dd2Rtt20a6HSQbxLbJDxiGBWMKJtaBVpAuIdKjL63y
	+afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jmTGYLU+OlMhfeA0evx+l8b+Ydeg81qQCvrqHlEzuu0=;
	b=KT9LlmEy2u9SgL7az8gNbqxcjRdE4ALB2UWYhR0kOEjiQecoOto5s0fN+Geo4VEr0u
	/K0ZTKZvA9p6Tma+L+lVG/dP6UDA39lvbCnHVG+sEd5hNXxgXvvygE3uEfJr6nJsqrWO
	XKVrtuTTPA6Aj4lfcouAQqvDo72KolKLIvkTpc6uCiP7jDLo27Ry1HYNGESsVIX4l/YB
	Vt8M2/L+KrzKGpCvEWpG7suvSjq4MwLxPJYGpjLUqNLIrUybHd8x7WkfkbvPzgd0X6ht
	bX/ajEr6y1m9WgNoXM64y1H/4xTxReg95FisjqbIobiW5qrUenUOOyfitr9w0IXzl0Ju
	NDgg==
X-Gm-Message-State: APjAAAWhCC+FO8Jz/aXY8Ed3ZtKPV3Nc53BsH0mc5cIX9YtJidJf4FlP
	S1evTZm6WcbnPsj2Rnzr8kxSEaKk
X-Google-Smtp-Source: APXvYqzO9j1+XwZwdtEaRwT6yN+1RvSBBvSNWp808YWGOPxF2rvdVsltGoWK4lg9AUWpv48i7Yrodw==
X-Received: by 2002:a62:e818:: with SMTP id c24mr15114372pfi.125.1572972778324;
	Tue, 05 Nov 2019 08:52:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com ([162.249.178.138])
	by smtp.gmail.com with ESMTPSA id
	21sm21467223pgw.87.2019.11.05.08.52.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Nov 2019 08:52:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 08:52:52 -0800
Message-Id: <1572972773-4844-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] OEQA: Add a check for MACHINE
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
X-List-Received-Date: Tue, 05 Nov 2019 16:52:58 -0000

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


