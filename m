Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0108C44501
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 05:01:11 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3448.1784005269623401370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 22:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W5sE+Kxr;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cace91f112so34300275ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 22:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784005269; x=1784610069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04q+loF4V+vFTxm+fwoaWotiTPTHPGQJVQspvYl7aE0=;
        b=W5sE+KxrSoxWOJ0OlDalxgLQ0G6rQjfXFZNUu1sovsedQBbRco7xVuCnQGwxIhYFJm
         22aVkuaW5oExQSc9cIh/Dzi8hC6Ta54caParn5I8/8tbeCB2nY6OMkDeGIEbP3XD69fF
         xBo0BrH5a1Z1652O1lCm6+WHUm0fEhfqUmB8nLwxfn7Z0z+YdZrZhQiRHZwcbe5zqbAl
         xz1beDWAozNDLgw8e/fvC+7pSl7PEszJn/XcpcAz500wovOqkKDujjGIytg+hbbgDRdX
         wvaP57hbdp1U0/3PwJxke4ZvvtU4EJB7LyMzk008l5L5H++qLPUg2jS8jA83irjIv8iL
         RUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005269; x=1784610069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04q+loF4V+vFTxm+fwoaWotiTPTHPGQJVQspvYl7aE0=;
        b=ejKCKsoNoEdtLC6a8E5SFI1lgmYkELrjsBf9tV/ScVfloe0eZCu8P6Y59Me2OkRYme
         /UnSB0PiR0L/D/UQ2Xz6vKGlg2TKYf24Ye6tN7ajb51rnwTtqc3JJCrWiLdYoQ9jDXjQ
         5KiJ/u70D8qfM/ggp+BlGZngmaY1G+pZbliZ3kjjw8f8BnRVr9OaaN147S4Bhq74kAfS
         ztV9sX7EfT3vYTkTkzDLcflD3PQASj9cpaV9H/Zi9iY7qzJNjXRuEbL4grAtlQxReYwU
         spEswNKoErv3hWkQaWenqRGm4n0BuDZlUI5p7hVdJkrm/FCVl+VE2vhj1B8QVEsaIVHg
         gHDg==
X-Gm-Message-State: AOJu0Yz9JxMSjB84HVDg2nr/u8SoNRTn67gW6ZHGdDwkc7X/QAUZfito
	4T8sKSxLQRwD+jkIdCLNGLNXAL9lnMEeJk2PmtqZtH1/CI8713lKUTgApBOXq/mKdu8=
X-Gm-Gg: AfdE7cmvd63UQxoDGgtIIRIo2H/A6GSpC37eBb35+QZ1C7vieX204VFAPQQ09yC+FOz
	lFChaF0xrr896MAlk/1inpen6uFRHhOmBzMCQPuScXueyUTxSsPUYnp+mbW2NRelzq0n9h5OMSU
	ju8FRRht0Zcx0QBF9t1UYOdBkogis7WhI9OdI4SfJTxFxal8FUORDqMxYGUNJDpkzFP34S0Bz7g
	hlhjeVrcK5ySpTaX0KxOsBkVDfZKlzto5Yo+cALZnTO5gj10vMYHv62Lf+sL8R6Bo6qVddx5nbQ
	kAOpBGlPEyqmWKhtsTi75NrOTmLBDGXkc8lVIDuiuaPTfXpM9DMligonMW4okMJf2Fdwi44sOf8
	RDrAWSXdaJBj5PwYNxr63tA41753RRrdkLb+F34jrfob2YSlvv2MFNEMK4q+vGHhDY4nAWOFrUk
	/YnxQGF9iJCC5V
X-Received: by 2002:a17:902:fc8f:b0:2c9:c6f3:457a with SMTP id d9443c01a7336-2ce9f01d68fmr105696425ad.31.1784005268915;
        Mon, 13 Jul 2026 22:01:08 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm109720255ad.6.2026.07.13.22.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:01:08 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 2/2] oeqa/selftest/devtool: cover update-recipe --initial-rev
Date: Tue, 14 Jul 2026 05:01:06 +0000
Message-ID: <20260714050107.7-2-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714050107.7-1-bbnpreetsingh@gmail.com>
References: <20260714050107.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 05:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240864

The --initial-rev option had no selftest coverage, which let the
regression fixed by the previous commit go unnoticed since 2023.
Extend test_devtool_update_recipe to run update-recipe twice more with
--initial-rev: once with the recorded initial revision, which must
produce the same result as not passing the option, and once with a
revision in the middle of the local commits, which must export only
the commits after it.

Without the fix in the previous commit, the first --initial-rev
invocation fails with "Unable to find initial revision - please
specify it with --initial-rev".

AI-Generated: Uses Claude (claude-fable-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b2cd13e9a5..1bad223278 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1286,6 +1286,28 @@ class DevtoolUpdateTests(DevtoolBase):
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
         result = runCmd(cleanup_cmd)
         self._check_repo_status(os.path.dirname(recipefile), [])
+        # Now try the same passing --initial-rev: the recorded initial
+        # revision must give the same result as not passing the option, and a
+        # later revision must export only the commits after it
+        result = runCmd('git rev-parse devtool-base', cwd=tempdir)
+        initial_rev = result.output.strip()
+        result = runCmd('devtool update-recipe --initial-rev %s %s' % (initial_rev, testrecipe))
+        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('A ', '.*/0001-Change-the-README.patch$'),
+                           ('A ', '.*/0002-Add-a-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd(cleanup_cmd)
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        result = runCmd('git rev-parse HEAD~1', cwd=tempdir)
+        midpoint_rev = result.output.strip()
+        result = runCmd('devtool update-recipe --initial-rev %s %s' % (midpoint_rev, testrecipe))
+        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('A ', '.*/0001-Add-a-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd(cleanup_cmd)
+        self._check_repo_status(os.path.dirname(recipefile), [])
 
     def test_devtool_update_recipe_git(self):
         # Check preconditions
-- 
2.43.0


