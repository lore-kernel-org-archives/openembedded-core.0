Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0F8C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:27 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.17691.1754643019522755395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fNUKmyCc;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76bfd457607so2095471b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643018; x=1755247818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvzK5n3PwGDDQmqcYH0JdNvOVPe/CWZZMAURAxGoslo=;
        b=fNUKmyCcbDpK/YsZJtUG8Dye/hILU6ZW2+J3d7HW3SjYdfNNC3/3TpqcgTC9hRwK0N
         6OYcodQuSs+ve/vFFIaXxSW4EVfyzAikNiuYlkKMdtrJHbaJyOPfcoBlbOsmkIyxisYU
         ld2XvvE6TdQMgcqChrJ5PffXcA46Jy9Iqv0WAAlUOsb2o2lLOSF3L+pzLSJfsRyFb1zN
         V1wS13QH4aqskJKyen8uI0Uk04L4M2/bGcFZ+lw7u2B/9xFLDG63+3x4KOvWEJK4UuQI
         OA7X0oRRSl76Bn4XjB15g3f5eUDKNyblNox2pvIGjJrw2u6UBn9OrwB3kuZKTXaHPFKZ
         +XVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643018; x=1755247818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvzK5n3PwGDDQmqcYH0JdNvOVPe/CWZZMAURAxGoslo=;
        b=gS1XQ1n8hR52zSLaPQPGz9GVRn0/J8TSvYo3iP2DzhVRUfvHtcFlbnTAONprdbEV2W
         FZ4dNzar5IM3UUYQt5iCg3WkzmcOCh06eOjLZh0lc0RcNBicC43Is1iB1EijSLUGAS68
         ztALChe+R3XtaYnwFUIbmrDUclWngNG6EIc1/ykp6++8oC9wCyS8HjPkMwIqKqhE9Zil
         PqILwsdMmGPlROKCvC5/lIpG4HO36LJlwJ3HNT6Cy/F/5xhkT0cKufYH3l/C/iCDPdxx
         LbErwKCiMEZ9XK9Gp7F3tW6Aab5tdbBHECpOxenVspFcLvdEN5X6kG/qjmBK+6aZQ3Jh
         Un+Q==
X-Gm-Message-State: AOJu0Yz5A/hHSGrj2mqNfn1EmVcayIDcHKe+yDj5diZAPLOm+ZSYOc7o
	2WVhWKiwBrTnaAY1gBp/nljIyQqO/87lAHSm/BYubgccHSC6LlW/9PKdEP+huQ==
X-Gm-Gg: ASbGncubqCQVEAXvdC+JsMCco3yCd6bcyT7NBhrNTgz35JcZ6/qIqgflyvkVku2G5ro
	Bblj5wBguwnRuVtzxd2UNm+TyRg7TcqHJrApq1b5rFXS1+I6Yt9EE3bu9+M09AJJ+y6uxkUjpmY
	f3eekV0kkXLaYCrGFCRdjqFu4o1PdVahvqp98ycYQo2NWghDSi+/pRS43bUdXyPXiu7/9lpYenz
	itKuYWTygiMX6obSn6HvdFlfmcZp1KR7EOMGhrtFE5EoM4UNqjAoJ3k6nY6bB83/lghFyV6Ay8L
	Q3yoH4OkB20m7zznmk98mM5rYS9DBaIRMZfRcZPKqQAXt9j7QkfwPvKfTV2SUJGjmGsuk56sRzy
	SJBmX1zWRPKlHmGSZajJkhJjXhxsS4JsA
X-Google-Smtp-Source: AGHT+IFy1UgIub0ppfoE3N6cLUUHDvJ5ZfNvyBfJUmQBdWqfHhPUVDplLEUVOGL5x+lmb9JEqzKnGQ==
X-Received: by 2002:a17:902:ebc7:b0:242:4b7e:fad1 with SMTP id d9443c01a7336-242c2206d7cmr24535685ad.28.1754643018573;
        Fri, 08 Aug 2025 01:50:18 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:18 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip.lorenz@bmw.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 15/23] bitbake: fetch2: Simplify git LFS detection
Date: Fri,  8 Aug 2025 14:19:23 +0530
Message-Id: <20250808084931.2156763-15-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221612

From: Philip Lorenz <philip.lorenz@bmw.de>

Its unclear why this function does not operate on the desired source
revision to begin with (which really should be the decider on whether a
particular source revision uses LFS or not). Simplify the decision logic
by always checking the `.gitattributes` file of the target revision.

(Bitbake rev: b3faa0ce5c0a6945f26b5b303a7f38c00d132397)

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74945e467895d6dd444f7ccf8d2a41eac63604ae)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 10ee248473..e211f7230e 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -855,18 +855,8 @@ class Git(FetchMethod):
         """
         Check if the repository has 'lfs' (large file) content
         """
-
-        if ud.nobranch:
-            # If no branch is specified, use the current git commit
-            refname = self._build_revision(ud, d, ud.names[0])
-        elif wd == ud.clonedir:
-            # The bare clonedir doesn't use the remote names; it has the branch immediately.
-            refname = ud.branches[ud.names[0]]
-        else:
-            refname = "origin/%s" % ud.branches[ud.names[0]]
-
         cmd = "%s grep lfs %s:.gitattributes | wc -l" % (
-            ud.basecmd, refname)
+            ud.basecmd, ud.revision)
 
         try:
             output = runfetchcmd(cmd, d, quiet=True, workdir=wd)
-- 
2.25.1


