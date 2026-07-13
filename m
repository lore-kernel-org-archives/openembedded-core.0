Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E2DC44506
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 06:04:47 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4846.1783922686104663989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 23:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ppm0z9yO;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso31443725ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 23:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783922685; x=1784527485; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jkjpg2rPv2+yHBFaLShVDlp1ehWIXLHfeBVVuyKlMY8=;
        b=ppm0z9yON8ZARHt54GrN7OSz9R3mJdIxQhHnIgzrCMR4Nj89bzxOrcO8/xEEEObW56
         2hFDDmAv5aGrDKHhjP5sSaisb7ZPSkUv3atONpHY2HN7//pUbcEcMoezqOHC4xKcuIj/
         j70V1U61oRoLIU6vTT6cUCu2g1COIkScXhSQYM7nGgVsjSkpW0oW5Q2RvWN81Y63X6Ls
         FelfwEoiwUG2mBqTwf2KcVhXOHBwY8m875bud0+NRvjJWLIV2cLgDfEKb3+4d8r05Uah
         f5Nfcdsj9/FCUipt5Cs2POKLec5c0vx1roWi9IjyecaPpKqjPeiRuq2hr9EuHYKrVYg5
         Sdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922685; x=1784527485;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jkjpg2rPv2+yHBFaLShVDlp1ehWIXLHfeBVVuyKlMY8=;
        b=C3u2unde8aGftnXAdW4dsjhvHakRvJ0QJzOyDMsviLLqHFOtP/yq8HlkQ1UmAbo13A
         QCYX6oph5y2DhvFBrWkypImNbVi5C2wx6wQv4yyhLob5HJwneOe/bp+slWMqd1aYODTt
         9VUQWWWbuKJptcTZnD2xxiV3Dv6O1dVkaDRj5XtjZvYFBe8uljYtxQGebjs89MRNhGCW
         N6VkD/nL6g3rTq7sTg6wthZBhlC9SIIN1F8y6kEvi2pSWL09q5i5yrxI8ct5o4w3UAbd
         quFva0C73ZNkgrctkKuFiUmbpIMH/C0RSHx8lvNUfvXfObxLuoOFwbeLWaNJ9uQcl9hs
         YO5A==
X-Gm-Message-State: AOJu0YzVOKpjfXDd09xmyhxg3Q8QnAGT2vn3obpTu6X6ZIeiY5J6p1oA
	6v745Ceotg7VhOqd0u5CCSJTPhWCLw3uMdlC5/TL2iAduaKrGrkHY69GzOMi5PtA
X-Gm-Gg: AfdE7cn81CBOSnSDDTvU7RytaQjCV4nG6crPRB8CiyAffW3NWF8WjbhYHaaLkTjkLWZ
	XC8WCT90JI4/b/3u4qI7N5TOcpJTDZEsVYxd74e6z4qRc/pBGDi5ajr1jrxOC2mKZMHMnA+EJBx
	JQZE80+ypaaHi769vQWnTZyOKphHNKuPG3bbTtd4S/5YUM4OlFAWJTyzZVBBYO2690Q1vGKnSVm
	Y6N/Vio8BZ1k6UG/U+Q/OGWbNg1YAPM0byM/BVkgkHaTwb+RjCgU7Cy7ApWZ6US1aHW0SIvCgvZ
	P8BPKU0BU1yBZmQskbZaSvWcQiQl7iHdxn+hfSE5iiXqKnAWAzA/kHMkfaEG3BLMaRbSJ3rmGaC
	lmirtV4Kg9gTPz/aFgBsfH3QZkbr8iSEelPOe9QJTWBYKnUziDiStyNuSPn3abCzKDu1ur1Ehqe
	2TIMma+n2ObeELc3wQsy4RRws=
X-Received: by 2002:a17:902:ef43:b0:2bf:13af:b077 with SMTP id d9443c01a7336-2cea17fa70cmr64952405ad.14.1783922685363;
        Sun, 12 Jul 2026 23:04:45 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm93228515ad.18.2026.07.12.23.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:04:44 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 0/2] devtool: fix finish for recipes using AUTOREV
Date: Mon, 13 Jul 2026 06:04:42 +0000
Message-ID: <20260713060444.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 06:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240825

devtool finish (and devtool update-recipe in srcrev mode) crashes with
"fatal: bad revision 'AUTOINC'" on any recipe with SRCREV = "${AUTOREV}",
e.g. one created with devtool add --autorev, because the unresolved
AUTOREV placeholder is passed to git format-patch as the base revision
for exporting patches.

Patch 1 uses the initial revision(s) recorded in the workspace bbappend
instead (as patch mode already does), and stops replacing the AUTOREV
with a pinned revision on finish. Patch 2 adds the oe-selftest case
Randy asked for in the bug; it fails with the exact reported error
before patch 1 and passes after.

While investigating I verified this is not a recent regression: the
same crash reproduces on wrynose, whinlatter, scarthgap and kirkstone,
so it most likely dates back to the introduction of --autorev.

Tested on oe-core master in a qemux86-64 build environment:
- devtool add --autorev + devtool finish: fails before, passes after,
  finished recipe keeps SRCREV = "${AUTOREV}"
- devtool add (pinned) + devtool finish: unchanged
- oe-selftest -r devtool.DevtoolAddTests.test_devtool_add_git_autorev_finish
  (new): PASSED
- oe-selftest -r devtool.DevtoolUpdateTests.test_devtool_update_recipe_git
  devtool.DevtoolUpdateTests.test_devtool_update_recipe_append_git: PASSED

[YOCTO #16354]

Babanpreet Singh (2):
  devtool: standard: fix finish/update-recipe for recipes using AUTOREV
  oeqa/selftest/devtool: add test for finishing a recipe using AUTOREV

 meta/lib/oeqa/selftest/cases/devtool.py | 32 +++++++++++++++++++++++++
 scripts/lib/devtool/standard.py         | 16 +++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

-- 
2.43.0


