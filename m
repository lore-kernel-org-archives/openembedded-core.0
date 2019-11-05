Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 56F186BC44
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 16:52:59 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c13so15959322pfp.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 08:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HDd/ubaY1ufqHeYuaDOKWW0bDl3AojC4aJ/E62+RU5s=;
	b=YKcjA/Op2bBB8elzn1JicqrvxpNPITH/zKru6WOg9oS9iipguhYvdXkEecmb7y6K8y
	1Itd+Y9SK2Qv/yXiWFZrHnKeiyyEwwR4JrRK+vK0SR/xgBq78cVF8R37FqG2nXoMh7+U
	HgBIaijU3P1bShMbYr2+m8dNeA60H2yrqhtbgHpJbPGXtt+ZSRlFOjBZzldWVLFDOLB5
	YR/IEe0/Bgn7Vl8vmFIYQErd9sJc1+UY1PF88BwYAgVMM0+Wddzdg9gBSM0344OIKgLQ
	SoDG8VQ78b5FkaqyKMmYYOD4C02H0a5uHWEHYvMGR1Cy9aT41N+oV6711th0K8gFzrSX
	JvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HDd/ubaY1ufqHeYuaDOKWW0bDl3AojC4aJ/E62+RU5s=;
	b=PjrABfGM3hE7ou0RHEolbmAsEbj6uWItBm9D5hRoR1/gtLkjTFOBCgqlaliS18M4Y2
	hwRu27qldyW43mWkDFSvSt/bkGbJIt0Sh9sosVl6UW2jMXwpuXBCuL1IA6BGLOKezNOS
	/KBKEnjdiGEcS9aWP/CqgeBkPxQaNROTdpGTxKfkujhGNpkq/fzMaFE0cyLfjoSovm30
	U6RWUxULUyoFVSXYvWjevN45SQZa+EriCOxT2Mfse1+6+dTNC44czGviv70m4TPLYRJa
	pCtp0vXbBbKHfjGozjqCz1QUz3LxYDTlFIeMpBZfiOeQ7KUdIH4ebAr/k5h+uiFoBC3v
	Wi+A==
X-Gm-Message-State: APjAAAU4j4FKjjgalAON4R8KDMGxhTwInKV9qqqYkv+BOqoMnNZMBiUg
	Vvg1EPa0wvQNxzfqqenn1Gltwm1T
X-Google-Smtp-Source: APXvYqxuw3pLHSm8k1J+LN903y6uhG9BprFVTIrDo9sQfmf1uuZv6UufE2e7TFB+0RQ5BqSX9A9iqg==
X-Received: by 2002:a63:1514:: with SMTP id v20mr8721186pgl.393.1572972780057; 
	Tue, 05 Nov 2019 08:53:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com ([162.249.178.138])
	by smtp.gmail.com with ESMTPSA id
	21sm21467223pgw.87.2019.11.05.08.52.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Nov 2019 08:52:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 08:52:53 -0800
Message-Id: <1572972773-4844-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572972773-4844-1-git-send-email-akuster808@gmail.com>
References: <1572972773-4844-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] OEQA: Add qemu checks
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
X-List-Received-Date: Tue, 05 Nov 2019 16:52:59 -0000

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


