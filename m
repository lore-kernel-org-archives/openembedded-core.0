Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C107EC4167B
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:37:27 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.107.1665679042784880442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ieKqDb+Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id q1so1989296pgl.11
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieyVa81OmSKc+vjUo9uLGLFQ4ouBbZ+SspQmILGqLqk=;
        b=ieKqDb+YCsZR4ef4sr3lrjVhg6UTtTpSvN7Fi2gVxLEmn2U9GM6E2Oi/InBZ6Myhfk
         YdSsX+irZrwJLECg8I0Rt6KkRCIAILE3kQqYabOZCP8L8vfYoJdbAYgq55aM9BBknmpK
         WgDRkp7YAu0VHcrjyuOMrltPFltNpQ5NdYm4+cpWucc3GneI/UCw44tioxuMQ5hTwyX4
         t9tOrfuDHQOzU93z9GegjE/pGIu8I8/wenN+zL0tRF0n0aXx+y6+qsoCf/ZaIkei5osB
         OLIeNQZJnzC6muZh3GK6R2omo1ggXG7csvKdh37fwCTOExOUAvmGGmxkbgmGuxhdcX0Z
         mfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieyVa81OmSKc+vjUo9uLGLFQ4ouBbZ+SspQmILGqLqk=;
        b=jAqI883axRN1of4H98BMmGG5Jnmsejn3YE908qHZsljwfaVF66fEFUDV3vHt/ltGCz
         2S1t059mZmo2R6V0dLgM2VzpBihVzkCbW/Ve3rpjaD6yP49LT81LMP0u56FWbL6RIoIR
         hN3cD4lxhSBqeg5pPmOnZeSubqPpEufSiul5tpw0jEUJ9mY8CbJTWayiBdWIf+R7IUJz
         aEiMR+xaFSDJJzTXvIl8KjRzIueY6YYYVDA1NXRhPGKNcfnaRG6Uzf5BLsy9fvJ4Qi/B
         HfvZCFW0hMqDFT3pKzrjotzSr6P50xVjoWPQB8YfzfqhDgA/LPS6SW4MSXOdSLeXf4BG
         J5oA==
X-Gm-Message-State: ACrzQf12vW6Q7Fx8Ei9UjxF7X/8y4DwDX2Kvx45jXPVuz7Tm8U1lYVv2
	AHBxY+1d4F5rSWYPGQAy7qldDRzgVM0+Xtzi
X-Google-Smtp-Source: AMsMyM5guxQvKi/Yf6puZImm9NgttCWionM9xrWOF4UKwBf9s+Eg3MX3IQcz45ZaeXgEtzgJxSrm8Q==
X-Received: by 2002:a65:6c11:0:b0:46a:eec8:19f7 with SMTP id y17-20020a656c11000000b0046aeec819f7mr653840pgu.478.1665679041817;
        Thu, 13 Oct 2022 09:37:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d29-20020a634f1d000000b0043a09d5c32bsm3460615pgb.74.2022.10.13.09.37.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:37:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/9] externalsrc: git submodule--helper list unsupported
Date: Thu, 13 Oct 2022 06:36:53 -1000
Message-Id: <6c50d83af0af677c2dff864ac40c580ae446372b.1665678874.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665678874.git.steve@sakoman.com>
References: <cover.1665678874.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 16:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171714

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
index 0e0a3ae89c..291fcf5653 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -225,15 +225,16 @@ def srctree_hash_files(d, srcdir=None):
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


