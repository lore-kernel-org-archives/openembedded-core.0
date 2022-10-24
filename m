Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C86C67871
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 20:08:45 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.995.1666642122775308530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 13:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iyfmZjP4;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id v13-20020a17090a6b0d00b0021332e5388fso1156552pjj.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hc5g4d9eQxPUr9H/sLZ8HIwuh2ntRdiN4E2zMoqzkOM=;
        b=iyfmZjP4Ag1O8botOiF+fK05obtTDQ5IgqPaTa9HQWy1suw6tL5pMaomBCx5L4vcn1
         VKU7jtV2iry5z3XqpR1ipDEhdpn6Ts/El8TaODrMWzaffsHfZuERBnqP/lfTo9ylX90G
         iWhwXVYky5+LAWs4I6xgXaApmWi1akkBEBjxL0jRuyWay3EtLHvZu2L5lDemOg1OiZ2r
         lkmswVuaphMaE43PHiVIPMua0N93xgNJX1zcvRbNxgGLXqVe5fHILzJpSuF4kQysrE6V
         nBwryVb+Cso6saF/DjfIF6STTBzQVnXkJQUv20ULCY0p2c9Oqv78AwEECbM/QQNQ0tUb
         yB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hc5g4d9eQxPUr9H/sLZ8HIwuh2ntRdiN4E2zMoqzkOM=;
        b=ICuEcbgouYeoLEW/A+HVLEtblygoNz0jNL4K3xA+iqvVrAydZ3TCTQtfx9p2Q3pM5A
         SscLWd40RZ4egt+iq3XtPE8jULudnAonaKDKrt109NRD8/BRQWmIPsFzkSLsj4oe5d6R
         ChWEjSH4pMh2+1iydpAe4oFoDZRDf3IgYrUAZ323SfhpnWVLtMrf2xqeIfYJCvjutgdA
         M4Xu8C3zEf2HXA+LrB8EZqiU6Bcn+AVlbLUie2O2Yqyt7Jo4Zb3c5r+AMr9jF1Cj222M
         9HNS6cJixum/ancbNGh7L/xDDOBTGS030zkZ8Jd3ccwC6w981T/tg2PzSxf8bgmkkmQz
         1rAQ==
X-Gm-Message-State: ACrzQf1iQ9EACaU+lpI36t9ieZXBfoTdd/401xSqbZ3XnI/WuHRrR0z1
	xnteiorhmflPh5cw2BffKqoacUzsaeKShQ==
X-Google-Smtp-Source: AMsMyM7cVcOFytT/1afHMCHVpukJ+ptJpVl42XJyDRVbIkYZ4Vb9+D4y1Gu7MpNV7iUr3UELxG1U+g==
X-Received: by 2002:a17:902:ce8a:b0:186:b051:1c8d with SMTP id f10-20020a170902ce8a00b00186b0511c8dmr4812745plg.82.1666642121611;
        Mon, 24 Oct 2022 13:08:41 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:94d6:2e34:1254:77d8])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902a38700b0017f8094a52asm130566pla.29.2022.10.24.13.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:08:41 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [langdale][PATCH] git: upgrade 2.37.3 -> 2.37.4
Date: Mon, 24 Oct 2022 13:08:30 -0700
Message-Id: <20221024200830.3082026-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 20:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172117

https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.37.4.txt

Git 2.37.4 Release Notes
========================

This primarily is to backport various fixes accumulated on the 'master'
front since 2.37.3, and also includes the same security fixes as in
v2.30.6.

Fixes since v2.37.3
-------------------

 * CVE-2022-39253:
   When relying on the `--local` clone optimization, Git dereferences
   symbolic links in the source repository before creating hardlinks
   (or copies) of the dereferenced link in the destination repository.
   This can lead to surprising behavior where arbitrary files are
   present in a repository's `$GIT_DIR` when cloning from a malicious
   repository.

   Git will no longer dereference symbolic links via the `--local`
   clone mechanism, and will instead refuse to clone repositories that
   have symbolic links present in the `$GIT_DIR/objects` directory.

   Additionally, the value of `protocol.file.allow` is changed to be
   "user" by default.

   Credit for finding CVE-2022-39253 goes to Cory Snider of Mirantis.
   The fix was authored by Taylor Blau, with help from Johannes
   Schindelin.

 * CVE-2022-39260:
   An overly-long command string given to `git shell` can result in
   overflow in `split_cmdline()`, leading to arbitrary heap writes and
   remote code execution when `git shell` is exposed and the directory
   `$HOME/git-shell-commands` exists.

   `git shell` is taught to refuse interactive commands that are
   longer than 4MiB in size. `split_cmdline()` is hardened to reject
   inputs larger than 2GiB.

   Credit for finding CVE-2022-39260 goes to Kevin Backhouse of
   GitHub. The fix was authored by Kevin Backhouse, Jeff King, and
   Taylor Blau.

 * An earlier optimization discarded a tree-object buffer that is
   still in use, which has been corrected.

 * Fix deadlocks between main Git process and subprocess spawned via
   the pipe_command() API, that can kill "git add -p" that was
   reimplemented in C recently.

 * xcalloc(), imitating calloc(), takes "number of elements of the
   array", and "size of a single element", in this order.  A call that
   does not follow this ordering has been corrected.

 * The preload-index codepath made copies of pathspec to give to
   multiple threads, which were left leaked.

 * Update the version of Ubuntu used for GitHub Actions CI from 18.04
   to 22.04.

 * The auto-stashed local changes created by "git merge --autostash"
   was mixed into a conflicted state left in the working tree, which
   has been corrected.

Also contains other minor documentation updates and code clean-ups.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/git/{git_2.37.3.bb => git_2.37.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.3.bb => git_2.37.4.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.3.bb b/meta/recipes-devtools/git/git_2.37.4.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.3.bb
rename to meta/recipes-devtools/git/git_2.37.4.bb
index 2eed85e807f..2205a50d160 100644
--- a/meta/recipes-devtools/git/git_2.37.3.bb
+++ b/meta/recipes-devtools/git/git_2.37.4.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "181f65587155ea48c682f63135678ec53055adf1532428752912d356e46b64a8"
+SRC_URI[tarball.sha256sum] = "a638c9bf9e45e8d48592076266adaa9b7aa272a99ee2aee2e166a649a9ba8a03"
-- 
2.30.2


