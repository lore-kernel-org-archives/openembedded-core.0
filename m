Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4320.1794732546813233541
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DoQbdD23;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so26085785e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732545; x=1795337345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o5KzdtHiO68HQtBVOHZpkOLC1gZpGTHOF5BngzqBzPo=;
        b=DoQbdD23gply9F0gZaaIUY335P+bYgqXrEncuWn42lfw8qQOkMyGHayhigk1g6ddxK
         eMO5DSUM0rJcdUEK7h3vMePBGSu0SFh9zZmgjlTbADXCzhLmB2+S+WJ930dhrZ7rH8R+
         jTkCPeNZPsJblBPDfh+dRqx8NMF3T9OX0aQDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732545; x=1795337345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o5KzdtHiO68HQtBVOHZpkOLC1gZpGTHOF5BngzqBzPo=;
        b=hw+wHGv+7eoUs2/Iiq8ToveklNl1EqquGEEAQa2bi4SeoqrvinMiWMynn0rwN9L5/h
         MwKr/pQK9e3DOBVibrj6bfxfrO9wJIzv3ndMlRifFYIWNOE9/tI7pehsxboTZeaqUxiS
         mumUyK8sOj654dmldOzCgtGz7SoAspGpix2efIsRlJThIVOsCj5hQyclu991zN4O8kp+
         NCIKe2B68zT5iWOcnw3mSuFHPg0ut8N0QkF18PfBjCi1pj1HtzMH6KyZIk0UV/uJIztH
         7xAlmQNseVYjvM0aB/vIRjHxtKZdrUai39hYOUCwBXVSvS/OhxxbQkKSfW1P2ZJO6IVc
         wdeg==
X-Gm-Message-State: APuU4Z+yBsVUarttppf/zhaSXOs8v1UVy7wuV6NbpepB1w82GSEAASlj
	QBKTREmgbBUef8T9/xWhWVzp80qtm3qkH9BCyyNpdsoZcxUzZsr1UrM8lrXIqAhvJU/Rq5xS4g2
	Xu+biuAc=
X-Gm-Gg: AYBFou3XzKkOfGiiS2UB/fTjj3xOAKcU6vIptQxnQRMaIwrZ2s2IxVdNyxlopWhmoMn
	Xe0V4E6JMIU4BfrbGqgbaOuoMTOW3R4PJhhaLKDXQHoepYdW3To+uQ2v9dHJo/6PYxoysxaZCXv
	RFAdMTQ2JBpmonI5vfTbNSf/V+yYwG4JdLcivLDnmkPv9IhBAcU0letnjOzA8gpbAHfOr23ceuT
	5DjdfJ1vWpj3RFXBACIuv3MxmNwja/LTIm3TRXnS5OTSbMVXdSuUdoLCTxkMESovrYZoXTizVXV
	snMd5oUkH85jM42159lPEg1iUSDoGOpgq/jw5ndoN4+Hxpm/w4sBzjcbbrJSVqNACQMwAii3A0D
	X6GV/6y0KKa1SCclfp8LY16N6FLNE3vqukohop87oEbXAhRfVM2Rl2c5ltMD9DH4JzmX3yTgUKp
	I+eTaOncVmKx/A54fot1zJ8xTMRIIT+h/LetxzOvVTc/Su5ApjCBIAfCFwC+SJjcZukWcmqs0tD
	tNlAZJXrUTuqaIipmNqcPBcWETtAIk8+otqgxtYXkMFCGjawIXpqgYyGyxBpnJguVLpaSLB9S9p
	UwnN6uNG7zACLhC3XBd8VgBjGzYIZ3fVdf63C9Kb4XpsR0yWyang94Z5tRDgqyF3Ma44U6nQTGd
	qsf0=
X-Received: by 2002:a05:600c:6208:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4bb55a93a9amr145815115e9.30.1794732545024;
        Sun, 15 Nov 2026 00:49:05 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/41] oeqa: Use 'is None' for None comparisons
Date: Sun, 15 Nov 2026 08:48:13 +0000
Message-ID: <20261115084845.701136-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250241
Content-Type: text/plain; charset="utf-8"

Comparing to None with == or != is unidiomatic and can be overridden by
__eq__; use identity checks instead.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/loader.py               | 2 +-
 meta/lib/oeqa/core/target/ssh.py           | 4 ++--
 meta/lib/oeqa/oetest.py                    | 2 +-
 meta/lib/oeqa/selftest/cases/oelib/path.py | 2 +-
 meta/lib/oeqa/utils/subprocesstweak.py     | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 1c964dadae6..5e96988b7a9 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -40,7 +40,7 @@ def _find_duplicated_modules(suite, directory):
 def _built_modules_dict(modules, logger):
     modules_dict = {}
 
-    if modules == None:
+    if modules is None:
         return modules_dict
 
     for module in modules:
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 757ab67580c..e380fd84854 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -293,7 +293,7 @@ def SSHCall(command, logger, timeout=None, raw=False, **opts):
                 logger.debug('No output from SSH call')
 
         # timout or not, make sure process exits and is not hanging
-        if process.returncode == None:
+        if process.returncode is None:
             try:
                 process.wait(timeout=5)
             except TimeoutExpired:
@@ -339,7 +339,7 @@ def SSHCall(command, logger, timeout=None, raw=False, **opts):
         # whilst running and ensure we don't leave a process behind.
         if process.poll() is None:
             process.kill()
-        if process.returncode == None:
+        if process.returncode is None:
             process.wait()
         logger.debug('Something went wrong, killing SSH process')
         raise
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index a57cea74b46..f5703ea9cd3 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -583,7 +583,7 @@ class ExportTestContext(RuntimeTestContext):
         super().__init__(d, target, exported)
 
         tag = parsedArgs.get("tag", None)
-        self.tagexp = tag if tag != None else d.getVar("TEST_SUITES_TAGS")
+        self.tagexp = tag if tag is not None else d.getVar("TEST_SUITES_TAGS")
 
         self.sigterm = None
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index b963e447e37..f573dcbd580 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -67,7 +67,7 @@ class TestRealPath(TestCase):
 
     def test_norm(self):
         for l in self.LINKS:
-            if l[2] == None:
+            if l[2] is None:
                 continue
 
             target_p = self.__realpath(l[0], True)
diff --git a/meta/lib/oeqa/utils/subprocesstweak.py b/meta/lib/oeqa/utils/subprocesstweak.py
index 046667faa98..0da836c48de 100644
--- a/meta/lib/oeqa/utils/subprocesstweak.py
+++ b/meta/lib/oeqa/utils/subprocesstweak.py
@@ -13,7 +13,7 @@ class OETestCalledProcessError(subprocess.CalledProcessError):
         s = super().__str__()
         s = s + "\nStandard Output: " + strify(self.output)
         # stderr is not available for check_output method
-        if self.stderr != None:
+        if self.stderr is not None:
             s = s + "\nStandard Error: " + strify(self.stderr)
         return s
 
