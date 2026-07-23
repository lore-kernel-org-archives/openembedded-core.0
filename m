Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6AAC531F9
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 23:30:55 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8975.1784849446301192967
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 16:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CCUwZbra;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1102588a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 16:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784849446; x=1785454246; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2aFW6Cs6EygZHNkYvx7S4QlGZ5iUTfsLbNqDxBxZSzE=;
        b=CCUwZbraFUVp3LsAXInAlAj38bmwxbsb1FgxVLc+r9PUMcVLlUNuJEe6f8BMB+AMfM
         iP6vEbD2nrkBG6WJogBPOXRN+7wfDosrPxrvK7oC9HNwctYdb1eeDXXZhNkBilwsyuQe
         AdScLFEjEpOxlrMm1bRCFlT21d2L8ME9VpGMSaah8D2DBWl+E9V0I/I2tJEWfyqYZtjd
         6rEKxCqsiEgZoBek/CLjE6hkATqtFrgR8nk7F5O1uqwr6g6lFHs2QKIdICHSdeywKKt0
         cTFkjTMB973Q1PVfTQ5bA+LAL7CgPkJcliyfMmx+Rc/qiIL7mx2FbdVpOQrNQMbA+IWN
         7ZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784849446; x=1785454246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2aFW6Cs6EygZHNkYvx7S4QlGZ5iUTfsLbNqDxBxZSzE=;
        b=XpdlZmh6Ds68KiVY78WPzJXruPA9OVOLPAfDBeZs0XIq/BOYzJpIV4i53DFMlIkhK4
         xLJE+FsaUI0a2wR4G25Cf2f0Qc6wF2dVOK6TYD6cuaHb5yTegUn0EuXM9XvAoRgqRKWR
         iRR9xonXIr/kj5vbvrCxW2jtUwKLx/UenQlj8sdKA8tAmniHPvgyWqrQ+feTjtm5T22F
         3xtxRddKzxUJeB7mjw6feAipXD2w0LpDcgYdZuOywTrYvIvYniwH6x6fr1ArtGGJfC3C
         QIkX74AwrPEIycZYTddduCzYeu/F1RinfrS2qjA8KNQMCJhd0P8++wwUEgvUuqzMzCMD
         sjiQ==
X-Gm-Message-State: AOJu0YwjNQR2PcPzlkrzeBrsssi4h43C1PKrjeDYS3RDOt96JobVRFir
	N8xEn0GD7t0ppARbExbK4FhV07ZxX9uMZD+yPlgfxFcJjWK41Hv9r6TKsDZBK8QV9zc=
X-Gm-Gg: AR+sD11YJMV+WwaZfbMaLm3iuH4B0WUVVi06sRx2+4N6fXO4E7RuSqQQaFX1d5LStdS
	C3VY7/wB3yPkGsYxelBFmeakHIhojHUmF2AvWkIRwNMtXFnncRECiGAjvoVfA2SZOoN4lrTfqIT
	8kPn7MJ1ZlgMZ3ItjuVD7xJndmfjgMwdX9UzMA10yYVahlviIuyWGb+zfDXm9hG0zebvU7mvMdF
	AiPXaoZ15MF3VfhLn8N75lnI9aA1XPyluZkKMNRcXkejoCA6HLAr9/SoC5uzUD/oG4mtk1pa19Z
	6Fw3KC0PMoRgTF0NjeeCveizz87BO38vuJBim+TnjhFrEbeXV/n30SX3RBWsSNWGTFhIGwO2UH8
	Z3ZgRSpjtCuohiXD1fnXssqj/Viv/fGWDBcf9jerNnemi+Ud1MiuC5nrmP+2KMslJsqHZ8V/9gu
	+VZQ==
X-Received: by 2002:a17:90b:2f06:b0:38e:adf1:5b03 with SMTP id 98e67ed59e1d1-38ec6665307mr5307786a91.35.1784849445650;
        Thu, 23 Jul 2026 16:30:45 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03c20c06sm556011a91.12.2026.07.23.16.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 16:30:45 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH v2 2/2] oeqa/selftest/devtool: cover srcrev update mode guessing for gitsm://
Date: Thu, 23 Jul 2026 23:30:43 +0000
Message-ID: <20260723233043.7-2-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723233043.7-1-bbnpreetsingh@gmail.com>
References: <20260723060209.8-1-bbnpreetsingh@gmail.com>
 <20260723233043.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 23:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241878

Add test_devtool_update_recipe_gitsm: devtool modify the
git-submodule-test recipe, move the source tree to the parent of the
pinned revision (an upstream commit, no local changes) while staying on
the devtool branch, sync the submodules to it with 'git submodule
update', run 'devtool update-recipe' in the default auto mode, and
assert the recipe's SRCREV is updated to the checked-out revision.

Without the preceding fix the mode guesser cannot see gitsm:// URIs,
falls into patch mode, reports "No patches or files need updating" and
leaves the recipe untouched, and this test fails with:

    AssertionError: Missing file changes: [(' M', '.*/git-submodule-test.bb$')]

The 'git submodule update' step matters: the pinned revision of
git-submodule-test happens to bump a gitlink, so after checking out its
parent the submodule no longer matches the revision the parent records,
and the guesser deliberately stays in patch mode for such trees.

The other direction of the guess — local commits inside a submodule
must keep patch mode, because they leave the parent HEAD on the
upstream branch while a srcrev update would silently drop them — is
already covered by the vulkan-samples based test_devtool_git_submodules,
which is what caught exactly that regression in v1 of this series on
the autobuilder, so no test is added for it.

No existing test exercises the auto->srcrev guess for any URI scheme:
the auto-mode arm of test_devtool_update_recipe_git covers the
local-commits->patch direction only.

AI-Generated: Uses Claude (claude-sonnet-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
v1 -> v2:
- Run 'git submodule update --recursive' after moving the source tree:
  the pinned git-submodule-test revision bumps a gitlink, so without it
  the tree now legitimately stays in patch mode under the v2 guesser
- No new test for the submodule-local-commit direction: it is already
  covered by test_devtool_git_submodules, which caught the v1
  regression on the autobuilder and passes with this series

 meta/lib/oeqa/selftest/cases/devtool.py | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a10eb0c784..b138a5ef6f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1378,6 +1378,44 @@ class DevtoolUpdateTests(DevtoolBase):
                            ('??', '%s/0002-Add-a-new-file.patch' % relpatchpath)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+    def test_devtool_update_recipe_gitsm(self):
+        # Check that auto mode guesses srcrev update mode for a gitsm:// recipe
+        # when HEAD is on the upstream branch, same as it does for git://
+        testrecipe = 'git-submodule-test'
+        bb_vars = get_bb_vars(['FILE', 'SRC_URI', 'SRCREV'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
+        self.assertIn('gitsm://', src_uri, 'This test expects the %s recipe to be a gitsm recipe' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        # First, modify a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # Check git repo
+        self._check_src_repo(tempdir)
+        # Move the source tree to the parent of the pinned revision, staying
+        # on the devtool branch: a revision reachable from the upstream branch
+        # with no local commits, i.e. the "check out another upstream revision
+        # to move the recipe" workflow the srcrev guess exists to detect
+        result = runCmd('git rev-parse HEAD~1', cwd=tempdir)
+        prevrev = result.output.strip()
+        runCmd('git reset --hard %s' % prevrev, cwd=tempdir)
+        # Sync the submodules to the newly checked out revision: with any
+        # submodule checkout not matching the revision the parent records,
+        # there is potential submodule content to export and the guesser
+        # legitimately stays in patch mode
+        runCmd('git submodule update --recursive', cwd=tempdir)
+        self.add_command_to_tearDown('cd %s; git checkout %s' % (os.path.dirname(recipefile), os.path.basename(recipefile)))
+        result = runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile))]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
+        addlines = ['SRCREV = "%s"' % prevrev]
+        removelines = ['SRCREV = "%s"' % bb_vars['SRCREV']]
+        self._check_diff(result.output, addlines, removelines)
+
     def test_devtool_update_recipe_append(self):
         # Check preconditions
         testrecipe = 'minicom'
-- 
2.43.0


