Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A750C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:37 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.17949.1754643027773034910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+fNqztr;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76bd2b11f80so1868194b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643027; x=1755247827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00z6XZq54Cby1WUq1VS6PdUzIlxPUvCNNz2PR+XFg4g=;
        b=D+fNqztrw+c5NQ9s3jBCd3VZWSmxgPbGUCbXoqZIpa7z6DeyAKVwLfLWYeXHn6Ka8K
         NzG9W4wgUC2rRbp+XTts1axtETr2VEA3jSCGJWJgwLnRIZ8cHzWxgGnK+SdAawOddFVK
         yv23Db18tVaiDX5jkqz3BCkdTplMCpDrbTKYxiLXvs4WmvNAvnWuz+kMmzwMuYZSxV7P
         fk/zsjA91rVrzuKvRhvfoeeTBVXjQrYkI7o6xP8n522yBmHYp2JDFGqfnxcmLZkVoNh+
         NkK5ryDlGuiSz+LWqrxPkuwK+zsnsYFTpNGu2PI8oPFgz3KaHfXku3a0hjSadO61o2st
         60Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643027; x=1755247827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00z6XZq54Cby1WUq1VS6PdUzIlxPUvCNNz2PR+XFg4g=;
        b=It3lG2VTP15nKfLUkllGyVIuDfr0FWtaIYyaGssGsqKHHZslGvuqOJ4GOzUgT+Bkag
         tJr2yv/U08QsQaGEDBYd8DHZplzhSPUj+oO6peouBKpOqavuwIf5/74hE33cy150pGAb
         9reHgDwmLkyjYUKcByUQpHLmbyQ6PRXas4+1PoXnpUjJ8+YZr9zUjAF/6VWrNyAyIAGA
         qo36Utlv+twYZrW5CtkHThT0KBCrqieO0TCytLlA5CGZbew6niRStuRKJ10Z5cA25h16
         D4bmlKfN0HkWTxlTr9bSYBejLihA8Qk9dNrcwiEi/SAzkoVGhQ2RLYgmTXkd8okM3Pkr
         jNQg==
X-Gm-Message-State: AOJu0YzFM8CJD5e780aO4B6Rm8NN3abEFVv8jiXMq086M9Qdk4rU6fkJ
	K79S3ay1ML1RwKWNECob4jCHcuddr80r8lXMnDOirXi2TPRDl3qjW+j04N8LXA==
X-Gm-Gg: ASbGncsTYaBngQIH7joSK03o5kuX3Nhlmuf5666qkJdz7QOd247WJlCuFofIKQ66Dd6
	x4bqM5Jf16IZaq5YiUhTUQyMNVB3l5TNASbjPN5gg1zcpWPFx8oynhGJ3rZX9hsKi+vdZVzX+1Z
	jCyII8gzrmOF05rWFSUgk+1n+UjzTHhx56u2y8XKbeXC4AnyrdbSeqgD9uM6kZ9gq2CXQjhbXNl
	VP8S1immCJk9wcD/AFYHdAh8bO/uW18J8tYkOJgiAtCDvr9U/JiMgAWh+dFPlfHeZ7D5Yvg6Izw
	jyy3dnoDmA0WrVncHJ6jTdlEl9MA8ulnntPZEkwW04+xWeAVDQc0f39qU4lzZKX0x2fXckbz09t
	Yqkdf9eMbObX6VjW7CrGppihI5ZXTtIsz
X-Google-Smtp-Source: AGHT+IGAGIsTTE1vkivP66cYjIp2S8tP1SGpZSnsaU+k8gE5X8xs27mxvCnL5HUGtPUZ/XczbF2QHg==
X-Received: by 2002:a17:903:1b66:b0:240:7753:3bec with SMTP id d9443c01a7336-242c228e4e1mr32120345ad.51.1754643026794;
        Fri, 08 Aug 2025 01:50:26 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:26 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip.lorenz@bmw.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 18/23] bitbake: fetch2: Fix LFS object checkout in submodules
Date: Fri,  8 Aug 2025 14:19:26 +0530
Message-Id: <20250808084931.2156763-18-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221615

From: Philip Lorenz <philip.lorenz@bmw.de>

Skipping smudging prevents the LFS objects from replacing their
placeholder files when `git submodule update` actually checks out the
target revision in the submodule. Smudging cannot happen earlier as the
clone stored in `.git/modules` is bare.

This should be fine as long as all LFS objects are available in the
download cache (which they are after the other fixes are applied).

(Bitbake rev: d270e33a07c50bb9c08861cf9a6dc51e1fd2d874)

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3eeac69385e8f29a08d022a17b28b5d504deed66)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/gitsm.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/gitsm.py b/bitbake/lib/bb/fetch2/gitsm.py
index 992de8276a..9f397699a5 100644
--- a/bitbake/lib/bb/fetch2/gitsm.py
+++ b/bitbake/lib/bb/fetch2/gitsm.py
@@ -246,12 +246,11 @@ class GitSM(Git):
         ret = self.process_submodules(ud, ud.destdir, unpack_submodules, d)
 
         if not ud.bareclone and ret:
-            # All submodules should already be downloaded and configured in the tree.  This simply
-            # sets up the configuration and checks out the files.  The main project config should
-            # remain unmodified, and no download from the internet should occur. As such, lfs smudge
-            # should also be skipped as these files were already smudged in the fetch stage if lfs
-            # was enabled.
-            runfetchcmd("GIT_LFS_SKIP_SMUDGE=1 %s submodule update --recursive --no-fetch" % (ud.basecmd), d, quiet=True, workdir=ud.destdir)
+            cmdprefix = ""
+            # Avoid LFS smudging (replacing the LFS pointers with the actual content) when LFS shouldn't be used but git-lfs is installed.
+            if not self._need_lfs(ud):
+                cmdprefix = "GIT_LFS_SKIP_SMUDGE=1 "
+            runfetchcmd("%s%s submodule update --recursive --no-fetch" % (cmdprefix, ud.basecmd), d, quiet=True, workdir=ud.destdir)
     def clean(self, ud, d):
         def clean_submodule(ud, url, module, modpath, workdir, d):
             url += ";bareclone=1;nobranch=1"
-- 
2.25.1


