Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619FCC43219
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:28 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.12234.1664898685499908570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WGl27a7m;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id lx7so13244121pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=7q44iXCHEdnWOos98g0imxgyAcPOVthrkakrSEW3hOY=;
        b=WGl27a7mm6WmaFlbttYKJlNAj7eZg/lOiBkeJb3tPydWeKJY49+yftouHuBe7Syf5Z
         VpCorw5wgkmm2UixztRrQ4d2k1kjtP4djA3sDFFZrjviAvYLm5xZsYFbiMqcfobhuuLR
         9dN2UFB6N7t3aWlKv42WevY0qR8eIg+cRktv97Miyha5+hSRTYiEgSE6dHay8faQx1rD
         NhMcHIqhPggr1eLFGqJfLOGJsv9fMaB3AGlH6OnU6ZpdlAriq2jPUCuQiDBmqz6mveEw
         6S4p8gznX4NYhuj3zZVXZFTyn/0olpxbibV5ttmcZEPYKCuUFS59MpO7GnhmHrr1Deo6
         6tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7q44iXCHEdnWOos98g0imxgyAcPOVthrkakrSEW3hOY=;
        b=5AzDp46ihohxfil6yepL52OFXMGjIhADBbifVffaQ58v6tVpDzd/szC/KWJKCXlRsE
         BG/rlZlYwwsXCGB29c5CsZL0zbkHTUwemtCMdkOHVjCRFSsuauKqizDv03zMIarQ0x5u
         182H0PltosPSnTtZYvLsKl+syBmCWCv8NK/PIFy5uDMphvOHYnhXMX0RogwUuUeQ2ELA
         zpcms3+zaYXxQ9fuFpscF6JQ5qfP2e6cvZYhX7igvfjuz20EVY4NaCqQWLqcFuZbULwA
         4S6S5QSqGSAgqWEVhkdsbzK5jGEAMMFlGuLGMsYvTIcQ15erPXJHF9w3ZQcUxucgLxhE
         DRTQ==
X-Gm-Message-State: ACrzQf0tkkOilnLh4Lm5MAvZgARIPXbGdbmp3+2keQkefE3tb0wFso1h
	Oe2c2yxUtQRbhiJoJ/kqiG6hoagd41/b5r7N
X-Google-Smtp-Source: 
 AMsMyM7fK1OQ2XeVSEIQ9NqrfmSeEa9v/DqiGmZoNBC9fDWArnNk4/WE25bI+vI0d8FXifVZuC3M6Q==
X-Received: by 2002:a17:90a:d990:b0:20a:df07:66ba with SMTP id
 d16-20020a17090ad99000b0020adf0766bamr417529pjv.12.1664898684528;
        Tue, 04 Oct 2022 08:51:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/18] rpm: Remove
 -Wimplicit-function-declaration warnings
Date: Tue,  4 Oct 2022 05:50:37 -1000
Message-Id: 
 <b2be1f5e7e858056cd5bf3273dca312a5ea8cf92.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171415

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 9f2dbfc51ef2faf1b6154856adb69ca9f764573b)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...alling-execute-package-scriptlets-wit.patch | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index 4020a31092..2a0069cafe 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -28,11 +28,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  lib/rpmscript.c | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)
 
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index cc98c4885..f8bd3df04 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -394,8 +394,7 @@ exit:
+@@ -17,7 +17,7 @@
+ #include "rpmio/rpmio_internal.h"
+ 
+ #include "lib/rpmplugins.h"     /* rpm plugins hooks */
+-
++#include "lib/rpmchroot.h"      /* rpmChrootOut */
+ #include "debug.h"
+ 
+ struct scriptNextFileFunc_s {
+@@ -391,8 +391,7 @@ exit:
  	Fclose(out);	/* XXX dup'd STDOUT_FILENO */
  
      if (fn) {
@@ -42,7 +49,7 @@ index cc98c4885..f8bd3df04 100644
  	free(fn);
      }
      free(mline);
-@@ -428,7 +427,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
+@@ -426,7 +425,13 @@ rpmRC rpmScriptRun(rpmScript script, int
  
      if (rc != RPMRC_FAIL) {
  	if (script_type & RPMSCRIPTLET_EXEC) {
@@ -57,6 +64,3 @@ index cc98c4885..f8bd3df04 100644
  	} else {
  	    rc = runLuaScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
  	}
--- 
-2.11.0
-
-- 
2.25.1


