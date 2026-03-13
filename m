Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07A1107BCD4
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 17:17:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21264.1773422262604134638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 10:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mgbWMNMf;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-485392de558so15515855e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773422260; x=1774027060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=syceUHw9dqxafk2CkNsTDhtUr4508PlZij4GGUJd4FU=;
        b=mgbWMNMf9imKO8m3BTPTQD7jv82ADg8C/nY/qvQmZuDWeaxmS2Pg5Y+ytDa1Wtih/F
         X2WeI6SUQbgYysKgVmulTGFKEtrNGMY06ywMalwm+T+RA/LbZEVxuGpmP9UvVgkWAYvU
         NUlRzu0PDhtZOFUoGYLKbUcf86vLW5GtlhNHDrKY2q/Q8NQH+kfCPytzy19rNgUGZzBQ
         eE5roz+4I8+ZBQqNJg9rONrvFmTKEsmoVOYACdhH539DfuxZ0Ze5BB8FTn1E3zzh+OHe
         cAhaUvqRFvH2d6n6JivtydxKESG0aNYng/Dc3IzEH6E8QJ+ufkdx3b3BjtGs5d/BWqu6
         Td6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422261; x=1774027061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syceUHw9dqxafk2CkNsTDhtUr4508PlZij4GGUJd4FU=;
        b=LOlLHoyzED8s4DagCriC0wv4tVPs7gkVlWdRtSib7TuFevJcyEyLSsFJdUkdMcCKpe
         rAaYKZy4pxcyJDvIQUrxENSOa7H0eckB1Ww41D49SekOVjWQqmh9TgwTC2XyH0nhz4na
         XnL6npJ2y2hnnoYiIvPrDiCTMq1HQC5xaooHvch1Z3BO/QWqPGDBnvIv/kwW+0IofCON
         yOk28Jd8s6PVDc5werzgH2XlfyVZ58NKwPFiHVYriY7DWDJTqGCv/IMTf7Dt66WGatgz
         VYRmRLrwW0Ke/db3oocn8xoRMllu+x7hggFRmVN4nBpG+is+VZtGDxk2Cysvc/BOoaEO
         maFQ==
X-Gm-Message-State: AOJu0YyeEHpl+TvWEgtWkgrcQJwu3niNcE10qryZz7woZwzYjfplj0hB
	brA1FOnyi7CsiugXiYvESAjue34ixJNSb1lXUJSQDndQ5phVlFrdnfeCsm5tLw==
X-Gm-Gg: ATEYQzwTCRnqd2BXZqbxpm0aGIlXYJusyI/55jm0+0o4tfe+J52RZMeTBe8S8MApawk
	EUODEN4yfIXfnKkgrplP3A9nsrcBdw3seJGRwwuQtHKvsEweyvhFZScdXRA5CtRhtLHLK7/fVR7
	kpgg//RTIim/Pz95i3ek67scJo1a5oTGt3nqhj8OjH+0tBqtxuvb09+pNk5Yghiz9O9Dkk/mzPB
	NORTBhf6cRTXGgOoOKn4kiPcp6yFCor5YQFNckaK5nLIAh+yAgJZPB+dODiRXWlQextx26+4mOM
	7ajWitJ4QiWtIKKCr4Fy2HPGsHMj1P5y9X7+0CfjQBtXjHk/E2Iq0ggdY6yiQnh44fC+/BWsX5D
	g0TTIFnPSSAjies6d8i/uQsaBNQBn7SjQcrZEjzmJ19sgnjGQt+u9S2R0Eqtfssyu5f2uRVD9sl
	k4wL+yFEBbmOWQW3rGpgNBRR5eLyqW7vhw
X-Received: by 2002:a05:600c:4753:b0:485:3a93:3aa3 with SMTP id 5b1f17b1804b1-485566d3094mr67908525e9.12.1773422260203;
        Fri, 13 Mar 2026 10:17:40 -0700 (PDT)
Received: from toster.lan ([185.228.162.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm19037471f8f.21.2026.03.13.10.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:17:39 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [OE-core][PATCH v2] pacth: add user and email when patchtool is git
Date: Fri, 13 Mar 2026 17:16:35 +0000
Message-ID: <20260313171635.777268-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 17:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233067

From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>

When the PATCHTOOL=git, oe-core creates a git repo for the sources with:

 git init
 git add .
 git commit

The git commit can fails blindly due to misconfigured user when git don't have
the email proper configured. Although the commit command does not fail
because it returns 0, it is not executed and the tree remains with all
files staged so the following git commands can fail and fails in some cases.

This problem has been particularly observed in some obscure and little-used
cases in openembedded-core like patching the linux-firmware which only works
using PATCHTOOL=git because it deals with binary files.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta/lib/oe/patch.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index afc42df8a7..2cd8de22c7 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -318,6 +318,8 @@ class GitApplyTree(PatchTree):
 
     def _initRepo(self):
         runcmd("git init".split(), self.dir)
+        runcmd(["git", "config", "user.email", self.commitemail], self.dir)
+        runcmd(["git", "config", "user.name", self.commituser], self.dir)
         runcmd("git add .".split(), self.dir)
         runcmd("git commit -a --allow-empty -m bitbake_patching_started".split(), self.dir)
 
-- 
2.53.0


