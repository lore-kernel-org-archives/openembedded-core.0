Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4338.1794732593988179709
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cm1anUGu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1182956f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732592; x=1795337392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EaH2JGFMcnKA8FQC/KYul3/ib5Xmz2bvzXq5eRibPxY=;
        b=Cm1anUGua7z6HJys+iHWVej521GrAUpJfmG7yegMDn/pD/bq2WYdHb3CzjIhuFRNLx
         sF971Q8em8gxTnXGeAkUTG5t2c5ldtsMXQx+cXvpmOodRgPiPcp7jHESqDe5kpesZg1j
         Z0oVVzLGQQtYIK3+BhRHAHKIuInlmKglkTgEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732592; x=1795337392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EaH2JGFMcnKA8FQC/KYul3/ib5Xmz2bvzXq5eRibPxY=;
        b=X/t81wdjrN4Spo3xlfctRNbeloRZccl55Z34CbdKjoo9bP7ir2LMdoEGepGslsrY7K
         0Plv7A5ARhg0F229M4b581aB+WIJeh4C4bi4nPmy6b9G8BDd1N5AA7/U3tNp3Tz9NGo8
         ghYiodYSPl/BBve5g3YFCS29ZFFrhktC7CYkRlZQsufG35K/iZaBjcUVml5OqrVH9Gfq
         MA1P12cpTo758lg5P8PWtW06fWaYcqkwgcgAKjGZ7tO1Yxjo8GrXeC93US75S9qyW83M
         7/KfiVsEbnmrH6Q4q6yrlcpWZFum+WaDnojQVvdhOeN9i48reN6BuTm7Ydsxj/WlWj4m
         eWlA==
X-Gm-Message-State: APuU4Z8NPcv+dSKpwq9FTfXxOHTzBk5LzZ5WMkTCa/okihw6DtN7OCS3
	LP0Qyb4W3khq/xtbY4GjZkeEWAiwO1XZm0cccOmsd+9SUEBgAaNrpT9GF2KxrB6S3Lsvl9TIkCz
	FVikZo6g=
X-Gm-Gg: AYBFou2OFBOi9qErfovi0rHB/wOErLelfMXT0dffM99wQF/QJJM215x1iEunvR7oUb+
	dkn0EdTPyzHNTr00juXlnsp/CWw9GWyYa+jRmQ0LpFnhEDQEBrE+idQJUaflSRv0VyGbcC+ja4H
	FtLtoVfOv5BBR54o/7jMxXe+G0hTWFeOfAsmK5NWPPY8EZivyngVTVzv+oNmIQisJYIXHIB3Twm
	3cCxR/9yvqKlNshn+YTP5B8i8j8iFP3E9BlrlaOOLiNzer0to+1+ZNUCw+l/TmTzYyuYoHlbfXW
	aYRa+etkaGffxehflZ1gThCL9wUS5nZtDZQs4imNE2Jc6ceoePXoCD8cMz8ERoQexs/UwH4+Q3F
	SQ0jH2j3/YyThZ9kKfrxRXGQXh4890Y7XUWkjSi4kOxQsCOvpuvrP1CdUhZn8Fh9SFSLYQwj9oJ
	WISSVHd2ziGRh17FoTwJjRamK60c/goZ/kcB4N7EqHx2/Iedx47hSfx0pKospXQXXHz7hUxxJGG
	RfC19m94Tihji9UyUQMMVb/NYiWhVamyvxtZSvdEb+XPurQfjT8jqp4AtZX0MuvdMTxOeBzTgwi
	QscHelySMA3lAgyYJbW9elqkSimIyJ+Vr5ukDnuwEqFOrYGf8Hb8bKVU7NCAQgvpR4mmAmZ6WfL
	umKU=
X-Received: by 2002:a05:6000:228a:b0:48e:3647:c35d with SMTP id ffacd0b85a97d-49c7381ade0mr17690446f8f.21.1794732592206;
        Sun, 15 Nov 2026 00:49:52 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 39/41] oeqa: Drop the unused tc_kwargs list phase and dead selftest code
Date: Sun, 15 Nov 2026 08:48:42 +0000
Message-ID: <20261115084845.701136-39-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250270
Content-Type: text/plain; charset="utf-8"

Nothing ever adds arguments to tc_kwargs['list'] and no context's
listTests() takes any, so drop it. In oe-selftest, remove an unused
config_paths assignment, the unused machines argument of
OESelftestTestContext and its runTests()/listTests() overrides which
only existed to drop an unused machine argument.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/context.py     |  3 +--
 meta/lib/oeqa/selftest/context.py | 12 ++----------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 601a8014d9b..9e38cddcfeb 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -162,7 +162,6 @@ class OETestContextExecutor:
         self.tc_kwargs = {}
         self.tc_kwargs['init'] = {}
         self.tc_kwargs['load'] = {}
-        self.tc_kwargs['list'] = {}
         self.tc_kwargs['run']  = {}
 
         self.tc_kwargs['init']['logger'] = self._setup_logger(logger, args)
@@ -219,7 +218,7 @@ class OETestContextExecutor:
             sys.exit(1)
 
         if args.list_tests:
-            rc = self.tc.listTests(args.list_tests, **self.tc_kwargs['list'])
+            rc = self.tc.listTests(args.list_tests)
         else:
             self._pre_run()
             rc = self.tc.runTests(**self.tc_kwargs['run'])
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 1802454a0c0..aaae9574c94 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -69,7 +69,7 @@ def removebuilddir(d):
     bb.utils.prunedir(d, ionice=True)
 
 class OESelftestTestContext(OETestContext):
-    def __init__(self, td=None, logger=None, machines=None, config_paths=None, newbuilddir=None, keep_builddir=None):
+    def __init__(self, td=None, logger=None, config_paths=None, newbuilddir=None, keep_builddir=None):
         super().__init__(td, logger)
 
         self.config_paths = config_paths
@@ -170,12 +170,6 @@ class OESelftestTestContext(OETestContext):
         else:
             return NonConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir, self.bb_vars)
 
-    def runTests(self, processes=None, machine=None, skips=[]):
-        return super().runTests(processes, skips)
-
-    def listTests(self, display_type, machine=None):
-        return super().listTests(display_type)
-
 class OESelftestTestContextExecutor(OETestContextExecutor):
     _context_class = OESelftestTestContext
     _script_executor = 'oe-selftest'
@@ -398,7 +392,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             sys.exit(1)
 
         if args.list_tests:
-            rc = self.tc.listTests(args.list_tests, **self.tc_kwargs['list'])
+            rc = self.tc.listTests(args.list_tests)
         else:
             self._pre_run()
             rc = self.tc.runTests(**self.tc_kwargs['run'])
@@ -417,8 +411,6 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         try:
              rc = self._internal_run(logger, args)
         finally:
-            config_paths = self.tc_kwargs['init']['config_paths']
-
             output_link = os.path.join(os.path.dirname(args.output_log),
                     "%s-results.log" % self.name)
             if os.path.lexists(output_link):
