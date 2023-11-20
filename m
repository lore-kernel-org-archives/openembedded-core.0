Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38105C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 14:57:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.52135.1700492228306666230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 06:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eG1w4RZU;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40853c639abso16927755e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 06:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700492226; x=1701097026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sngsXfmuLyAcYLzP/xfW5vpVobzL4pQLv+gNyizqmqk=;
        b=eG1w4RZUI1jJGSIFDEAIvP+daHPhGrZEnuPgN5uf6ul5merNb++edciD2uxzXX4N2v
         dV2xhwK2KP2lkzJrUihBCS9VJGT1FSMAT62s5masS9zqrH8wcmjZmYDmjGwdzLfI/lFz
         UH4C9XNBWUSpFoxOuPvlVkEVh4Uzqm8VWtlrTLet2TpV1ufWJt1HH0yCueGzHLD1ORsa
         JxNEibl1IRcZmvN3q1muXIJtM83DAG+AqzQXnTIR9sqmKfAhpbMaJpJC5oNK8eJAe7cr
         yB3gdTL9BeRQXllPXqogEDR19bLicRXFK/mTRIOvzc7qzPbPy7YYyY0L1c4wG7/p9KJa
         ND/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700492226; x=1701097026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sngsXfmuLyAcYLzP/xfW5vpVobzL4pQLv+gNyizqmqk=;
        b=YdFoEyh6/kQJz9trE62efsnHHHsMvFij8azX0BC+SK+axt2glf73nW6mpUej3fc3LQ
         dVUguOzeMDrwieD2GtMP+lQ6We2/vDROqaJ0YvlLLJ+tKGGGunt6+7a4fbl1sC1ax0NM
         PvdjQ1tATCDDy5gn/ueujs3s83irHCET11GhVAB9vbdeduDFVK+0bjL4jhpMFK6UJC6y
         zZKRdS32uIt14lHV/ABetFU+/vjwh8TRq6sVV4EfIz2vjKuKE+t0n/zn++M7fhr7UBO5
         dn+3KV9CYCd+wRcDBe0Z7gBR5lT2wBz/x5TOr/M0rIFW/yoPR/oo8lJUg8IjjMeWGXPW
         8l0g==
X-Gm-Message-State: AOJu0YyB7Rt3Ks5JI7wY7WEka4UUEAXutXETZi1XVWsUwlmILqHrYPTn
	m2wbMXvQUL9mGTb1S+byzkb6gtznwKw=
X-Google-Smtp-Source: AGHT+IGKuFyr+O5l0qiAS8Q6I1yw1Vbm9M1De0ZcULYIBA93Cr8TRUvS6QeumbCyUf0m3Vn98jAN8g==
X-Received: by 2002:a05:6000:1882:b0:332:c409:2c80 with SMTP id a2-20020a056000188200b00332c4092c80mr3120304wri.48.1700492226208;
        Mon, 20 Nov 2023 06:57:06 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d6a8d000000b0032fbe5b1e45sm11310392wru.61.2023.11.20.06.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 06:57:05 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] vscode: add minimal configuration
Date: Mon, 20 Nov 2023 15:57:02 +0100
Message-ID: <20231120145702.53016-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 14:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190881

It is essential to configure VSCode indexer plugins to ignore the build
folder of bitbake. Otherwise, the indexer plugins run with 100% CPU load
until an OOM exception occurs. In practice, this makes VSCode more or
less unusable for working with Yocto until a file like the one added by
this commit is deployed before VSCode starts. From the user's point of
view, it is not obvious why the system runs at 100% CPU load and
eventually crashes.

It is even more misleading that VSCode starts the indexers immediately,
but does not stop or reconfigure them when the ignore list is updated.
In practice, this means that every time the ignore list is changed,
VSCode immediately starts indexing the build folder until the OOM
exception stops it. Depending on the system's OOM handler, the entire
build machine may crash.
Particularly annoying is the Python plugin that ignores the general
ignore list and requires an extra ignore section.

The settings are suitable for workflows like bitbake, devtool modify,
devtool reset. The settings are not intended to work on the source code
of a recipe. It is assumed that a separate instance of VSCode is used
per workspace folder. These per workspace instances can have different
settings depending on the details of the sources that come with the
recipe.

VSCode can change the contents of the .vscode folder, which often leads
to a dirty git status. Normally, these changes are not added to git.
Otherwise, -f can be used to add them explicitly. It is not perfect if
the folder is listed in .gitignore. But it is also not better if it is
not.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .gitignore            |  2 ++
 .vscode/settings.json | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 .vscode/settings.json

diff --git a/.gitignore b/.gitignore
index 8f48d452da..f6ce090b5f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -36,3 +36,5 @@ _toaster_clones/
 downloads/
 sstate-cache/
 toaster.sqlite
+.vscode/
+vscode-bitbake-build/
diff --git a/.vscode/settings.json b/.vscode/settings.json
new file mode 100644
index 0000000000..517a86d1bf
--- /dev/null
+++ b/.vscode/settings.json
@@ -0,0 +1,32 @@
+{
+    "files.watcherExclude": {
+        "**/.git/**": true,
+        "**/cache/**": true,
+        "**/tmp*/**": true,
+        "**/downloads/**": true,
+        "**/sstate-cache/**": true,
+        "**/vscode-bitbake-build/**": true,
+        "**/workspace/sources/**": true,
+        "**/workspace/attic/**": true
+    },
+    "files.exclude": {
+        "**/.git/**": true,
+        "**/cache/**": true,
+        "**/tmp*/**": true,
+        "**/downloads/**": true,
+        "**/sstate-cache/**": true,
+        "**/vscode-bitbake-build/**": true,
+        "**/workspace/sources/**": true,
+        "**/workspace/attic/**": true
+    },
+    "python.analysis.exclude": [
+        "**/.git/**",
+        "**/cache/**",
+        "**/tmp*/**",
+        "**/downloads/**",
+        "**/sstate-cache/**",
+        "**/vscode-bitbake-build/**",
+        "**/workspace/sources/**",
+        "**/workspace/attic/**"
+    ]
+}
-- 
2.41.0


