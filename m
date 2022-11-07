Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198A2C4167D
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:38:09 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.106.1667835461090914246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nr8DmwPH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id l2so11364795pld.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQMrq7TsIECmantlTXhK2KJedJCwRIqKJi8n31n1QpA=;
        b=nr8DmwPHJFBJ2c2A0sgBiCTNJtWFMzBQUcVe+LNs/Ifq5NaS1LJN+LGPXxMA25z91t
         shadBtOiotKYEdbPiJv7s0VHI+vrlnz+3zOcRcLHPKwIsKaJppiiEcxuIJHJSVkcEAbS
         LkVdOxCgrV8D5XV8wZRiM715HujTg50DewKCA4LrbjjSt9ZMFyvviShx7QC4uItuLBgB
         7vKo0005ro3KzadU9RzHonRzNy4E2Io9FITBVXlprVY8dKB1ADGAjfW0DukupzqcgCga
         amBMTc/1LAWFfpJO8UO4Cfo0mBM2gZ09hZ3qjt6zKI8PgC/KS1vD6qIF8kDcdAax/L1a
         0POw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQMrq7TsIECmantlTXhK2KJedJCwRIqKJi8n31n1QpA=;
        b=T73qy9JpBzeUkA8nmSEpKbDV5qDa4b0NnOigFJCmU8nOjsYKaVx7juClEjf3+QJMnQ
         rKcCvmkXGFIftEJlAvmo5xiON3/4icrM/AGRydwa0PafDHfHZHzi0fZLx1+C/o9yrBZP
         XcJd1TJNih3X9euXSg0oGbqflcA/Do9jgz/vI/4Ep9UoFw/+cFZQQawsoZ+8viTu/ztW
         +iLc9Bl0DoceK4MBTSP1z2kmSrbdyEaE8GfKruOOTRY/WXfquj8v1q13VLDBBo+AJ/sO
         XaNw6xcjylVN7XRVLr+hA+EFsU6a6Qz8rDT8LPFoeSxvVPgm25wiRZ7Cu5Y6GoBZaxHI
         eREQ==
X-Gm-Message-State: ACrzQf18VN568Eccw4gi1RwjCO3xWRlLNNXietjtFwuofE2Hl8iOrHwZ
	X1HINrvYOgQyG+daHbuubpG0yeh20fR5Aegr
X-Google-Smtp-Source: AMsMyM6QvTuJ58t9t4OGdy+DEoGXWc0wjw4YcpjAneJjwze1a0kdYKdOTAE/iOYrg9MzNvPUPS5LrA==
X-Received: by 2002:a17:903:2303:b0:186:ed93:fc46 with SMTP id d3-20020a170903230300b00186ed93fc46mr48867374plh.172.1667835459865;
        Mon, 07 Nov 2022 07:37:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/25] externalsrc: git submodule--helper list unsupported
Date: Mon,  7 Nov 2022 05:36:41 -1000
Message-Id: <0750fa73ea9ff08e844480865cc51db0c924ad0b.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172921

From: John Edward Broadbent <jebr@google.com>

Git has removed support for "git submodule--helper list".
https://github.com/git/git/commit/31955475d1c283120d5d84247eb3fd55d9f5fdd9

This change provides an alternate method for gathering the submodules
information.

Tested:
Build recipes with and without submodules

Signed-off-by: Carson Labrado <clabrado@google.com>
Signed-off-by: John Edward Broadbent <jebr@google.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d9364e5f3535954f65cbbc694ee7933ac1d664f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index d87363a88c..a6a8ca6318 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -229,15 +229,16 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
-            for line in submodule_helper.splitlines():
-                module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-                if os.path.isdir(module_dir):
-                    proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
-                    proc.communicate()
-                    proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
-                    stdout, _ = proc.communicate()
-                    git_sha1 += stdout.decode("utf-8")
+            if os.path.exists(".gitmodules"):
+                submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
+                for line in submodule_helper.splitlines():
+                    module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
+                    if os.path.isdir(module_dir):
+                        proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+                        proc.communicate()
+                        proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
+                        stdout, _ = proc.communicate()
+                        git_sha1 += stdout.decode("utf-8")
             sha1 = hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
-- 
2.25.1


