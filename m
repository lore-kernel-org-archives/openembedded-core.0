Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD47C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 22:19:07 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.27559.1707862745612286159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 14:19:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cJLmOFeb;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56001d49cc5so6092759a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707862744; x=1708467544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW7RF5+tUIR7tQtpfsI/n7U8l/cBXYZtWq1OuhWhGTE=;
        b=cJLmOFebMURKI7pfiFMbIt1GUfj/aH9IGZeUTKFjW7DFp8WR/G5vzj+/0f6cKQFC1a
         A2hjPXdD6/mQZKyVZGthOLkdp6GZ/P2cwOQWJkaIyTpuPNAHr0+5YMDcFRxr4ZQAWUai
         CqXWai4KZQWuhT6pWAqoc7522b1Mo0GLZ9HsH49ss3v+UVPZemvsw8ipc9dzsssw0FBm
         WV3bQbpv9EzelpTwXSqs20+8swEjqyTh7PFZK6VrtJMCff7PLKmjtBuLV6Eyfc0cJjsL
         qaEFoDfI8W10K4kVsAiFag63cIXkke30rsfmAoGTlkP/kQbrpUQPjAbtlyi+nFPj2Dgd
         XdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707862744; x=1708467544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kW7RF5+tUIR7tQtpfsI/n7U8l/cBXYZtWq1OuhWhGTE=;
        b=wnCR/pmDruB8Sb2auS1JOD1bcOu3YBJxGOVVR3uggpzWlu4c7klkhzwiS37rClzbX0
         az/f2PvUV28eGU3XJFTPSkExqG72DfYc5Jtnqm/weEjXWXBMdtitOaDxx4T5pj2QyCr0
         X1judFrcBBBQIN/fCYrZ0WbfcCn5oN56mcZuNjeFpULnXrLgSixV3ymWTL5gw14Wuj0K
         ihtfLdUaQ85n3O9D+VoUsQao/gA9dughNRcITdZHF+iXTZax+y3RIL4it1ka+6ginfiY
         9xN2blUSP0Q6+3nTcaTnZca0A6p+RhvGpbx642kHDZFzfviTAXCz+cXzvkvg8EHSqcYa
         NoDw==
X-Gm-Message-State: AOJu0YzZZBcxiOXxdehKg63a7nro3VMY/Dr6kGbTC3PkyC77jWJpyihg
	vWrwaZHULpyS++u4BeaN6ayC/qc/eNbK+kwwYSXpt3iSB1N5p+/4t+NHZZmZ
X-Google-Smtp-Source: AGHT+IFh1TDD5I9gnf5SwSjKg08XAqls6INKp4N5LfkvCHdb0SxTKQYp/5scLlz3bUXR94hBWXLuPA==
X-Received: by 2002:aa7:c991:0:b0:560:269c:214f with SMTP id c17-20020aa7c991000000b00560269c214fmr702096edt.19.1707862743854;
        Tue, 13 Feb 2024 14:19:03 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id k23-20020a05640212d700b005612987a525sm4027137edx.89.2024.02.13.14.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 14:19:03 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/4] vscode: drop .vscode folder
Date: Tue, 13 Feb 2024 23:18:05 +0100
Message-ID: <20240213221846.109260-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213221846.109260-1-adrian.freihofer@siemens.com>
References: <20240213221846.109260-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195440

There is a new official bitbake plugin:
https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake

This plugin automatically updates the .vscode/settings.json file.
Having the settings.json file in git and a plugin which modifies this
file is not ideal. It can lead to anoying situations especially when
working with git. For example a git stash reverts the settings which are
automatically applied by the plugin. While git stashed the settings.json
file the plugin immediately changes the file again and tries to run
bitbake based on the newly generated settings. When git does a stash pop
the restored settings.json file conflicts with the new settigns.json
file which has been generated while the git stash took place.

Therefore this patch removes the .vscode folder from git.

Removing the settings.json leads to other issues as already described
in the commit message of 5ff688fe29. But we still need another solution
where the settings.json file is not in Git.

Discussion is here:
https://github.com/yoctoproject/vscode-bitbake/issues/95

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .gitignore            |  3 +--
 .vscode/settings.json | 32 --------------------------------
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 .vscode/settings.json

diff --git a/.gitignore b/.gitignore
index f6ce090b5fc..ca9b5c8f515 100644
--- a/.gitignore
+++ b/.gitignore
@@ -36,5 +36,4 @@ _toaster_clones/
 downloads/
 sstate-cache/
 toaster.sqlite
-.vscode/
-vscode-bitbake-build/
+.vscode/*
diff --git a/.vscode/settings.json b/.vscode/settings.json
deleted file mode 100644
index 517a86d1bfa..00000000000
--- a/.vscode/settings.json
+++ /dev/null
@@ -1,32 +0,0 @@
-{
-    "files.watcherExclude": {
-        "**/.git/**": true,
-        "**/cache/**": true,
-        "**/tmp*/**": true,
-        "**/downloads/**": true,
-        "**/sstate-cache/**": true,
-        "**/vscode-bitbake-build/**": true,
-        "**/workspace/sources/**": true,
-        "**/workspace/attic/**": true
-    },
-    "files.exclude": {
-        "**/.git/**": true,
-        "**/cache/**": true,
-        "**/tmp*/**": true,
-        "**/downloads/**": true,
-        "**/sstate-cache/**": true,
-        "**/vscode-bitbake-build/**": true,
-        "**/workspace/sources/**": true,
-        "**/workspace/attic/**": true
-    },
-    "python.analysis.exclude": [
-        "**/.git/**",
-        "**/cache/**",
-        "**/tmp*/**",
-        "**/downloads/**",
-        "**/sstate-cache/**",
-        "**/vscode-bitbake-build/**",
-        "**/workspace/sources/**",
-        "**/workspace/attic/**"
-    ]
-}
-- 
2.43.0


