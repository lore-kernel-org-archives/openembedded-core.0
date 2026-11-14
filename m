Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2401.1794682523137276197
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 10:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kBRvdH/o;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2025148a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 10:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794682522; x=1795287322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hD9GKewXTVaB/8VordEY0N+vSAsTrf/8tc3IsAXe3FQ=;
        b=kBRvdH/osg3r0ba9CnvywUUSwGLzZkeJ41ct5BIS9vHaM2NwfqqPgKDlMG7xmerZGk
         OTuBVs0dgp3nPNVtcw8YOaJvl1UdgnG5WTVQcRQVjh8nv57ysYslEhPvcxEPT/GLcEOp
         cCxWFbLCX+YAHYwy0OAEwW/k7QXO3yVrkhwYFxCTKomUdM3Odnw1ZUZDWLsAvXO/f6ix
         NaFAPfEE+fPThXnlzmdEjp5cvQu0X/e6N3ATFaSY43vg4TiEJlalEPvUJ1AJ1ZbG9l/D
         2XVDF02OtDurgtQlUBZVb6DWQOK13dpS3USrV00W6HD+Xdx6bvIJ8Rh2rPyrPqqkMIXU
         zfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794682522; x=1795287322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hD9GKewXTVaB/8VordEY0N+vSAsTrf/8tc3IsAXe3FQ=;
        b=G17R7c0OqD8zFmyJwDKO58DgUKDpGB0k7s/LrtGXd9WFCJFm0hlk6uPWRm8OHT3NOR
         PJLkWGGKLfwjKXrw7I7rsHEghBKkfpTBSkosEHSxqhXTfKUDnIlUs2AN3YkIWysLZ2G1
         wPNBDYMmWXu8BTFf3qrQUaoaoA73PsHc5bZOD1LSXT/U0SOx05uF4ABbPH0nIKc1Uj11
         lP6HtNaVYFqsOPeUTHJTM2tca0dWCFpTOV0P9N0FaqFs5CpEa2a/8yPo9GjWgBNyoYo3
         UxkND5J7OwyDNsmkBDKKufeuVl4HPuoQtBv9PwKK697nKZRAKJB1YjZL88Ckw8BiSdEa
         8DSw==
X-Gm-Message-State: APuU4Z9gyh8XE+U+0CsplhqAovoU/NsoJwmp+eQEU5/3TwuA4VOnEE8W
	Dq868laYMfEqtsEzvcGiZ9bhig7mWIM2Au5nYrhKepXvdFitXupZ9lka+PWKbzRE
X-Gm-Gg: AYBFou1kNOGljpaQwXmdgA5g+/sde4N3znu/feHrrY6U4GxVeNRKrD0p98XfRT9I+zC
	CBJTPjc9KjrEJcMqrAVxsp0Dv4xXLqWs79EfyiGcjmdA8fLvGV/9ryAk3COB4+CgjGxSp0hjgZv
	K6vpsOJkCahAilwkLyyT6nuiyJCxMQVcAbj4u9F9QQA0ZLUX5Ru9DvSIbTIRXnGhyuC7U7uHCEd
	Wubh2XBHdmIZfb7GHo+210/1AHe+6OCthyOeRIYA6a6nmHEcIXre0/S1FPo5UxA7QLmliZDm1na
	j7nE6eaRG4ABiUI1T50hFf7f7j81pHUF4+oRKZn6h7MP60ovS/i1/sG0n8iF2va1t7+BQmyv/Wc
	jh/r4p4gCS0sKcGWJPM4VHZ0koyRL12bVRDM3XPJpHEbGoiseAMYb6yZ/giea0Xm/IhtEA5HljV
	7PXYA2gaHScIrEV10fbRypPf4tWFc40jlr2EsNaCwGpUYiOmkz8KgRfk6TWQsbp8fFykM2bFEAz
	Qs/0aNBBKEojr+gtsdzj2Glzm6gcjl2UDFFJMtwMczkto7fLVsNwBpJ0AL286Wd2MmjM4fGImAr
	CqLFZIBZBn4gQUR6+G9FqNthfA2dTEmBcygtSTEZAs/74MEFh1ccNVI0JT6VgU4=
X-Received: by 2002:a17:90b:3bcc:b0:3b0:a1af:e4fa with SMTP id 98e67ed59e1d1-3b1b09fca30mr6620673a91.24.1794682522399;
        Sat, 14 Nov 2026 10:55:22 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb18b73sm9440524a91.3.2026.11.14.10.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:55:21 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chris Laplante <chris.laplante@agilent.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] oeqa/selftest: clear SANITY_TESTED_DISTROS instead of failing
Date: Sat, 14 Nov 2026 18:55:20 +0000
Message-ID: <20261114185520.6-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 18:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250205
Content-Type: text/plain; charset="utf-8"

oe-selftest refuses to run when SANITY_TESTED_DISTROS is set, and
poky.conf sets it:

  Please unset SANITY_TESTED_DISTROS in order to run oe-selftest

Clear it in the test build directory with :forcevariable, so a value
set through an override goes too, and drop the check.

[YOCTO #11933]

Suggested-by: Chris Laplante <chris.laplante@agilent.com>
Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---

Notes:
    https://lore.kernel.org/openembedded-core/20241003213726.2518832-1-chris.laplante@agilent.com/

 meta/lib/oeqa/selftest/context.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c9eb481725..e042eb1a78 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -141,6 +141,9 @@ class OESelftestTestContext(OETestContext):
         # Set SSTATE_DIR to match the parent SSTATE_DIR
         subprocess.check_output("echo 'SSTATE_DIR ?= \"%s\"' >> %s/conf/local.conf" % (sstatedir, newbuilddir), cwd=newbuilddir, shell=True)
 
+        # Clear SANITY_TESTED_DISTROS however it was set
+        subprocess.check_output("echo 'SANITY_TESTED_DISTROS:forcevariable = \"\"' >> %s/conf/local.conf" % newbuilddir, cwd=newbuilddir, shell=True)
+
         os.chdir(newbuilddir)
 
         def patch_test(t):
@@ -349,10 +352,6 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             self.tc.logger.error("Please unset PRSERV_HOST in order to run oe-selftest")
             raise OEQAPreRun
 
-        if "SANITY_TESTED_DISTROS" in self.tc.td:
-            self.tc.logger.error("Please unset SANITY_TESTED_DISTROS in order to run oe-selftest")
-            raise OEQAPreRun
-
         _add_layer_libs()
 
         self.tc.logger.info("Checking base configuration is valid/parsable")
-- 
2.43.0

