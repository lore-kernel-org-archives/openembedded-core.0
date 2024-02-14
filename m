Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDE0C48BED
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 17:39:33 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.47206.1707932366525431424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 09:39:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SFPkpW0b;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a34c5ca2537so744274666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 09:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707932365; x=1708537165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW7RF5+tUIR7tQtpfsI/n7U8l/cBXYZtWq1OuhWhGTE=;
        b=SFPkpW0bz0JCJSh/7181GC0tjssy3HRQHPiWtkWKGXLYXeYwexKz6l4LHLAMR9dqgm
         E2C1IVhoGgNdg+2AnfP+mJPSJK60ZX9Co13XtvAbKc9Bzhx5BW3rb++/ltSRT+SC7aR4
         O7bKQka6bc+FFrjX1/c/3MOHm6YMtld/9O/tnDK8JFiRupW/p3Nmt1WEUz8Alyur4RMA
         0tuRmAz7KCPzxOW/KsZPtol0hivdrIWmzl3TYEGBPlKGVmnzi8YP7X1rNeTfeHd/ZoGF
         R86DKK973Giz+4GmXgk8nUZp/Vv3lqmwGpSndUZgB4CogqHrNhPhc6x1l32EQaV2S2J2
         tmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707932365; x=1708537165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kW7RF5+tUIR7tQtpfsI/n7U8l/cBXYZtWq1OuhWhGTE=;
        b=ZnEM0SORULDKQJk+KMqGrpIaiXaGuZ+TZN7BNMOd40R9uX2XIS2R7BPPanCTS56zpO
         cvaGqbujOD8AiGSGWCbzdoect00DAprfKbFRYjl7ttZsGA2mbLMcRuYXjj/41joDGOLp
         sbjQEi/rvGWARusO1+H41pReGk0qROEYTAsDmXsbOtxu9Iw3ZoP3rmZH3fmteNsYgEj0
         j9qZbJf5QcUBwvXBKcgA3Yh/KbGldXxq1VkW60PlYxT38MavaTn9QDvy+la4Cn6EkDCS
         o7jbz1aTil9YqeYZuXe7CPwRMJ3o6WiQ9dtT3yREdkIRCAM5M1ZfTmh57l3McnnBJyNe
         V9XQ==
X-Gm-Message-State: AOJu0Yyh/zuV0ZyO4Gc2XXW6saTvJ3Ka/FvyhhvVrkie9JBw5W4i1QAk
	/8MriSQLH4iGD3iPGXNxJo2M8zkbvjiaA49fDPeCcuvEjLDN8l0LjdL5pxSd
X-Google-Smtp-Source: AGHT+IHPxff00aHoGTJpqQ0Pkc+YPBC/pp74hFnEOYFOsFOC1Z5ac8HbRp5Dh2AZaHfsgZXVmjGMTg==
X-Received: by 2002:a17:906:fb1b:b0:a31:3f4f:bea7 with SMTP id lz27-20020a170906fb1b00b00a313f4fbea7mr2316651ejb.39.1707932364797;
        Wed, 14 Feb 2024 09:39:24 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id sn24-20020a170906629800b00a3d11feb32esm1616403ejc.186.2024.02.14.09.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 09:39:24 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 1/2] vscode: drop .vscode folder
Date: Wed, 14 Feb 2024 18:36:58 +0100
Message-ID: <20240214173914.136799-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214173914.136799-1-adrian.freihofer@siemens.com>
References: <20240214173914.136799-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 17:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195487

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


