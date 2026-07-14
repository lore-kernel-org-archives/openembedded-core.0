Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F086BC43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 03:20:39 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2382.1783999231970639096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 20:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NACHiK64;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so518476b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 20:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783999231; x=1784604031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9hN6Y9aoE1FoHPYRWOup+q6yKgG835M1PsBbxEfzkA=;
        b=NACHiK64zgfJ+vE7MQllD6C56YuEnlpMJNq8o2n/R5HcoidE7ksCnDpqgXreh/gCM8
         DN08Ud1UJSKDBPZNJNp0FS8sBOB7srhmUBiryRQIyKb5GtzxI/vNjeDBPfCUwQZHWFyR
         fzhgGE/tBlcbx2n8MSHS9KdVUZW3ulbZa5Akiy9zLy1QsujWTsEPqnTjtNELIC1a6CkF
         FVPzAREpu9pATZdfnlKHnqa7q/WZF8kdbGb1CTYbfHSvCUWsAcMy2hYgLz3z/l9GCQnh
         1HznoTiWX6NFtfA2bhdznTc7mQ5iLsDbQuxDHYc5abw+Q4cGn2r5pFBcXcy87gFgZlQR
         nemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783999231; x=1784604031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9hN6Y9aoE1FoHPYRWOup+q6yKgG835M1PsBbxEfzkA=;
        b=kyRNtpa80VpUVCe1zdsMaEWVSmW4Lq9TPdpVNK4zZeOylwVMSUP8n9AOh/6sbUzlSl
         KSqFLGrvn1scjI8qTxpLtoq1y+YahUwm+2tUovZvBqcMNIs6Ibe0gh9vfuUz4w8fNXpk
         AUI02xW9pEM2W5q9rD2HPb/K6dPGK3uoFpGIvMvWj4Pln97y3Nhw6rchS39yfN3SlyzF
         b/MsRsD4Mf8L+gabyoftKoZ4qroQE5lWGEzjVycrXWyntBlm2TjF1/6iQ1exaH5fgmFL
         PALQZvKM2EDS5/0ZdxG+0TaDtFb7bWM2NG6a9srtGheEgB9ziP5I0sVhHt/ClMvz9rgf
         Tslg==
X-Gm-Message-State: AOJu0YzL6EaXREg3zuwOc5/tPrSiGYTs9UZm9n1jC56BkYSs2GP7CFE9
	yjjQsYJvL58loS9zsn6ETsHblROIvWxYKep6KaVF/SKHaFeTufhnnHus49b05b1N9ec=
X-Gm-Gg: AfdE7cmPFkdsATFFbS3IcRWqjlhp1mxGSbIB+76zn175qOxNilV3bx2/loXCgsYs83F
	vd+KHN9ZqgR70CTULPn98Qc7cbh2VuZxCGvrILZ1Dvp+2MvRKSplw+fUGPsr1Pf3KQAatCBKcqd
	fsx56ir+jzjXPFmoFmzf4tcGtP6hrHOha1LEC3xUgQj16snvB+rpWS+gFo/8Vnet+35tjIiBmdj
	BcZYP4ggKJWYkfx0rh3Y+U61Z4YI6sIdWlpenTsddNiZmJJtokJn9u+wjV3rdz7ghtZr77hLCjt
	Ntfi+SVCJDU4ltQi2+SIOJnnhw5LRxHmCQXsKPy4EdAiT3WS3kaSfkt1zlgwFVRJBGkJHpuII58
	xrjGmRV3kqGJogtAZyWlWguAjMMf85tU1rpU/4rA0pY/QcsnaD27hoqyHH0xwm4TC/GOGW5dWWW
	bVXByNJB0mbPF0
X-Received: by 2002:a05:6a00:6c9e:b0:842:4982:82f with SMTP id d2e1a72fcca58-8488ab52c4emr9772164b3a.2.1783999231275;
        Mon, 13 Jul 2026 20:20:31 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f2389f8sm699858b3a.4.2026.07.13.20.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 20:20:31 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH v2 2/2] oeqa/selftest/devtool: exercise devtool finish on an AUTOREV recipe
Date: Tue, 14 Jul 2026 03:20:29 +0000
Message-ID: <20260714032029.7-2-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714032029.7-1-bbnpreetsingh@gmail.com>
References: <20260713060444.7-1-bbnpreetsingh@gmail.com>
 <20260714032029.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 03:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240861

Adjust test_devtool_add_fetch_git() so that the recipe it creates with
SRCREV = "${AUTOREV}" is finished into a temporary layer instead of
just being reset: check that devtool finish succeeds (before the
previous commit srcrev mode failed with "fatal: bad revision
'AUTOINC'"), that the finished recipe still uses SRCREV = "${AUTOREV}",
and that no spurious patch files are generated. The reset it replaces
is covered by many other devtool tests.

srcrev mode is forced with --mode srcrev: update-mode guessing only
considers git:// URLs, so for this gitsm:// recipe auto mode would
select patch mode and never reach the code path being tested.

[YOCTO #16354]

Cc: Alexander Kanavin <alex.kanavin@gmail.com>
AI-Generated: Uses Claude (claude-sonnet-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
changes in v2:
- extend the existing test_devtool_add_fetch_git() instead of
  adding a new test (Alexander Kanavin)
- force --mode srcrev in the test: update-mode guessing never
  selects srcrev for the gitsm:// URL used there (verified the
  adjusted test passes with the fix reverted if the mode is not
  forced, i.e. it would not catch the bug)
 meta/lib/oeqa/selftest/cases/devtool.py | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b2cd13e9a5..51f9d6f8b7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -613,8 +613,27 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['SRC_URI'] = url_branch
         checkvars['SRCREV'] = '${AUTOREV}'
         self._test_recipe_contents(recipefile, checkvars, [])
+        # Finish into a temporary layer instead of resetting; srcrev mode
+        # used to fail with "fatal: bad revision 'AUTOINC'" because the
+        # unresolved AUTOREV placeholder was used as the git revision to
+        # export patches from [YOCTO #16354]. srcrev mode has to be forced
+        # because update-mode guessing never selects it for gitsm:// URLs.
+        templayerdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(templayerdir)
+        self._create_temp_layer(templayerdir, False, 'selftestautorev')
+        result = runCmd('devtool finish --mode srcrev %s %s' % (testrecipe, templayerdir))
+        result = runCmd('devtool status')
+        self.assertNotIn(testrecipe, result.output, 'Recipe should have been removed from workspace by devtool finish')
+        newrecipefiles = glob.glob(os.path.join(templayerdir, 'recipes-*', testrecipe, '%s_git.bb' % testrecipe))
+        self.assertEqual(len(newrecipefiles), 1, 'Recipe not moved into destination layer by devtool finish')
+        # The finished recipe should still use a floating revision and no
+        # patch files should have been created
+        checkvars = {}
+        checkvars['SRCREV'] = '${AUTOREV}'
+        self._test_recipe_contents(newrecipefiles[0], checkvars, [])
+        patchfiles = glob.glob(os.path.join(templayerdir, 'recipes-*', testrecipe, '*', '*.patch'))
+        self.assertEqual(patchfiles, [], 'Unexpected patch files generated by devtool finish')
         # Try with revision and version specified
-        result = runCmd('devtool reset -n %s' % testrecipe)
         shutil.rmtree(srcdir)
         url_rev = '%s;rev=%s' % (url, checkrev)
         result = runCmd('devtool add %s %s -f "%s" -V 1.5' % (testrecipe, srcdir, url_rev))
-- 
2.43.0


