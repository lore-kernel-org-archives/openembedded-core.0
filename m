Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B83ACAC582
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 10:38:58 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.7049.1757846332003367627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 03:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h9IeoF+m;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso6576368a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757846330; x=1758451130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wohKYPn/rw+KtwS/bVFDxCR3ulMYEDLw3lbX1qiqcU=;
        b=h9IeoF+mcCHnJ32B6ArIV3soyJMdXBommyJpbyjRzb4SNP5HA80mWbZMgtJlHdVYJz
         gtJcDu0VYGEH0/VvpJFZJFQK+04Vw8JahkDMIW36BMJk9wkLMx/QUp/lVjk8Wg7JzTXV
         yx+dXpL+gpu/8QMtY7S4ifUIwBWaa0eCTxTc0Hhzct/XTGZtAB/wwFVHt5KcwJfZV2lT
         rI7Zhau22ZMsfRhWDUb1+9UXVw0uEFtmKzYpNy1eO5jkQCELZf4XIL6cqjXxDWRl/fxg
         cPltWM9XKnFjYG+F2wnEP1xHLMdoC8wayxdPnGh9xi7DXRnlqedV1iY29ja0lOYsWR47
         noPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757846330; x=1758451130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wohKYPn/rw+KtwS/bVFDxCR3ulMYEDLw3lbX1qiqcU=;
        b=EnoRmu5s+J/tHTcdI8ukSqdNbOB80wZalBW+r0SPmH5JT+4neFnrTU02Gwiej+6P9E
         pEn/sTncMx/JXQDcfzfEAi0GHwaQgPPEn9GEQjcGfXEmiyE3SaTHWiUenJ1/SVQDK/vh
         +rXkWQ1EO3WaEc+XqMbDNlRojBRtMa35aqYAWTGZ+6LjODN1LaQF3c0hDD9feOg+lqkQ
         C8BinUaKSYMe8AUg/fjfCor3UORVumfprB79qroshEzD9Jv6ebqODpqQQKvY7u1jlW8Y
         5Eh1C4KrIqz27EiXgWSUoxjXqsJTnBPDBcZ4whVTv6BhTdlygK8NLYftcdnfxUtp20KK
         8Biw==
X-Gm-Message-State: AOJu0YwZOMVqnIEBi0EfifLX4qZOtYgMQpxEAd+9CbaTiMdvUE1S8C4s
	Tan7W5vd2yNE5plRVxID9sxi+a8UP7LBKFwDDpAznczwTzh9vYvW8ulNH2A22w==
X-Gm-Gg: ASbGncuC1tqa/Nvkb6V0hQmHB2AoK0j7bvs3Gjj8WU/fseI+EU1bbM0xh0wkXhd1Zh1
	PZDJnzqlO71pOgZqlfBsJ2fN4aTKU3D3UjtSDqH1OfAmmiUsA6xYCWWCX/XNHgWn6FCO005J4IO
	vZ27UEXBQdVHGtjPX3kJwQ89kYhFZ5+vq36LRN8GDdwIzSjrVb20NK9QOCR19WuJ51dmfACJW4a
	tcKUM1308b/PieP8x7q+QuELNNu2E0J+YR6pSV6yw7JjRj93OLErpWzcIiF7jKHmwwRpNti67FR
	hNsEA4REpqtmIBrWQ7bjJ512mrLLRDBsQavScWNZjCyt/c8JyXSX6cw5XP8HXo+TqsMAQog248a
	A/sijuFjEg0CpIL9ZTj3tr7w+rX12CAY=
X-Google-Smtp-Source: AGHT+IFpvBaEKJeZiS0QLcgFWdXLUz96Qf47EQ7Cp1caTX55tkYX2ThWs4zz/181A+GeoPF/k7h3lQ==
X-Received: by 2002:a17:907:7f9e:b0:b04:3f35:9761 with SMTP id a640c23a62f3a-b07c353e2f8mr859472066b.1.1757846329845;
        Sun, 14 Sep 2025 03:38:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd5b4sm731435066b.70.2025.09.14.03.38.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 03:38:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/devtool: make 'git status' list all files separately
Date: Sun, 14 Sep 2025 12:38:48 +0200
Message-ID: <20250914103848.2067604-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 10:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223346

By default, when running "git status", and git finds an untracked folder with some
files in it, it lists only the folder, without the file content. In case the folder
is already tracked, then the new/modified files inside the folder are displayed
separately.

Some tests rely on listing all the files separately to be able to determine the outcome
of the test. As an example, test_devtool_git_submodules creates a patch that's stored
in the meta layer. It verifies from git status that the patch is present in the layer.
However, when using the default "git status" behavior, to be able to see the file listed,
its parent folder must be tracked by git already, otherwise only the folder is listed.

The recipe that this testcase uses has carried patches for a long time - recently the
recipe was updated, and the last patch was also removed. This broke the test, because
git tracked no patch-folder anymore, and when the test couldn't find the test-patch's
name in the git status report, it failed.

To avoid this problem, add "--untracked-files=all" argument to the git status request,
which displays all untracked files, regardless of their parent folder tracking-status.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 19a205912b..a59d9e123a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -122,7 +122,7 @@ class DevtoolTestCase(OESelftestTestCase):
 
     def _check_repo_status(self, repo_dir, expected_status):
         """Check the worktree status of a repository"""
-        result = runCmd('git status . --porcelain',
+        result = runCmd('git status . --porcelain  --untracked-files=all',
                         cwd=repo_dir)
         for line in result.output.splitlines():
             for ind, (f_status, fn_re) in enumerate(expected_status):

