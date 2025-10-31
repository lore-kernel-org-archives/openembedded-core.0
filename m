Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719D2CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 18:13:00 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.2096.1761934375305134721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 11:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FFA7/Ugi;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: joaohf@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-340762857c7so371804a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 11:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761934374; x=1762539174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwwhTCLH5n6fopEqotkFhXkKQmZ1O6aWvb7IWNenlkE=;
        b=FFA7/UgiU4Nq9HMba9u4/nY/uLtdKRmBTTrucnfLdqVe2XDGltEGlnNBtydIYPBsE1
         TzAYI0UXRlis1X05Fb9u4Fu1OTV6wGJYyFyFCU7lCjV7Cg/9Q8qUtdQC1iTXWq1cBub9
         picdmzqZxNBwib8bZb7VB0Fhjw3kTGp7JotJi45UvHMSCgDJGqWChE7pe6nPTr7KCIVB
         F3KsMowktgOQCSLajOm5h5H/S3P+ETEr+ctviSjVVOM5dGeNdrogHIiqrKTsDQjb00RZ
         uyV553xG6A82e0vp+U8Nl26FTmmza47OKi3He9p0sTJN3xMUc29bBHqmRoKAHzAvz0Tg
         264w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761934374; x=1762539174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwwhTCLH5n6fopEqotkFhXkKQmZ1O6aWvb7IWNenlkE=;
        b=jWlIoqkE7Xuhw4AFuDF/biOSgwmmog16ZjMtB5MQKRAk3tP9/YfIgz8+ul6ijWHGFR
         H6j0d2ZWFHCwtIcunpd/PTHk9aQPoMv6foT2so7YzmHMceQAJjzcEWrXfHgDJPrVhZ+t
         GQw+euixpXwkiLbCNcopwubyCoMfozOifCQqsfOx2lL17LHDfKyFuvo5Q2PWQhzAVZc3
         vzqlEHanlVsgdIeZnDm4LdVMOwtrENfSOTF+Zlnpn4EPiCRv4aXL0I+sjYrXLbqp5aeV
         ehoFDlVDA93uJZB7GtcFuo0AchlyZRwSFoWNsTlwDIcFkvxWa2s9Bao0IR5iOnl2MvJo
         O5oQ==
X-Gm-Message-State: AOJu0YyQnvioRGokCplQFwCQAEDH5EfeVbpvHlyOnDlOUXIUVolvyz1A
	tFnC+nJtnmG6OrcR856bY5k2cR9K86oekCioKTX3nSMq4DV3/H2ObWlG6gm2hw/G
X-Gm-Gg: ASbGncuJogUi+27LW0yTSBVrXSeJPL3YeozuO4/4Y1sqibPxkAGFRgBPjLg90N36sEj
	yuFuZPmORwniZIMp5oRGJvNgKNTgnt1RsBm4qD+txSDnLzbySPTEwFaaRnDjwLrzBVR6mSgXTUE
	qdO/RbOnUpYc4Px1zC8Asy7K23uNvcwRs5NEpY9qeEqhIq/wiZuR7ZAgLN7qvdw7G9t3XCLupGx
	pNSs4/7npnp9OisvpXHup/eUuDVjydCDhGGub9POoQB7eTxE2Bdg1XOTLGJZZsSBFjQDbYq9WTh
	inPVLYqfGPW6RsjvW48sG5P50PmPS473GLyod+FieQJWXqu7hF/c1jSPgOWqyyXBo7bVMvqvtqK
	lXh2yLNCjDev8Tmp6bElPGC3niB21q6iCg1xt1+y7GSUbtDs/p/65yJZNqwrOFkC2Pw==
X-Google-Smtp-Source: AGHT+IHVIDQLaUWFP6W5kjDe/iP7Am2F+6mYs20LJaS5TfYYwGX7s4M4qQuItKrjq8GP/CQzRbciYg==
X-Received: by 2002:a17:90b:4a8c:b0:340:29db:6196 with SMTP id 98e67ed59e1d1-34083071322mr3288120a91.4.1761934374304;
        Fri, 31 Oct 2025 11:12:54 -0700 (PDT)
Received: from porco.. ([177.188.211.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34092d48252sm2863149a91.15.2025.10.31.11.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 11:12:53 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2] readline: backport a patch to fix for caller setting rl_prompt to NULL
Date: Fri, 31 Oct 2025 15:12:28 -0300
Message-ID: <20251031181228.3810813-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 18:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225558

I've observed this issue affecting iwctl and connmanctl.

Patching readline solves the issue.

The original patch from [5] mixes many fixes in one commit. I've extract
only what matters to solve the issues observed with connman and iwd. The
final patch is the same patch sent by readline author to readline's mail list [6].

References:

1: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/issues/1
2: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/commit/b30636dc66fc783a091af51b049dc5240f861dd0
3: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
4: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-front.org/
5: https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=devel&id=488d7edc22894d30b6de7f2d4190bf7403f63ffd
6: https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.txt

Fixes [YOCTO #16047]

CC: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---

Notes:
    changes in v2:
    - add readline fix author name
    - add explanation why and where the original patch come from

 ...for-caller-setting-rl_prompt-to-NULL.patch | 42 +++++++++++++++++++
 meta/recipes-core/readline/readline_8.3.bb    |  5 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch

diff --git a/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch
new file mode 100644
index 0000000000..c8ac712d56
--- /dev/null
+++ b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch
@@ -0,0 +1,42 @@
+From a0a4c011c0c5e598c5b51cbf81d3b4501fa72e0c Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Thu, 30 Oct 2025 14:19:41 -0300
+Subject: [PATCH] fix for caller setting rl_prompt to NULL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=devel&id=488d7edc22894d30b6de7f2d4190bf7403f63ffd]
+Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
+---
+
+Notes:
+    The original patch came from [1, 2] and it has been integrated into
+    readline git repository, commit (488d7edc22894d30b6de7f2d4190bf7403f63ffd)
+    
+    This patch has only the fix needed to solve the follow issues [3,4].
+    
+    I added the original author as this patch has been sent through readline mail
+    list.
+    
+    1: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
+    2: https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.txt
+    3: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-front.org/
+    4: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/issues/1
+
+ display.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/display.c b/display.c
+index 9aa8c7b..edb525d 100644
+--- a/display.c
++++ b/display.c
+@@ -783,7 +783,7 @@ _rl_optimize_redisplay (void)
+ 
+ /* Useful shorthand used by rl_redisplay, update_line, rl_move_cursor_relative */
+ #define INVIS_FIRST()	(local_prompt_invis_chars[0])
+-#define WRAP_OFFSET(line, offset)  ((line <= prompt_last_screen_line) ? local_prompt_invis_chars[line] : 0)
++#define WRAP_OFFSET(line, offset)  ((line <= prompt_last_screen_line && local_prompt_invis_chars) ? local_prompt_invis_chars[line] : 0)
+ 
+ #define W_OFFSET(line, offset) ((line) == 0 ? offset : 0)
+ #define VIS_LLEN(l)	((l) > _rl_vis_botlin ? 0 : (vis_lbreaks[l+1] - vis_lbreaks[l]))
diff --git a/meta/recipes-core/readline/readline_8.3.bb b/meta/recipes-core/readline/readline_8.3.bb
index a2f23eb353..8bc4477946 100644
--- a/meta/recipes-core/readline/readline_8.3.bb
+++ b/meta/recipes-core/readline/readline_8.3.bb
@@ -1,7 +1,8 @@
 require readline.inc
 
 SRC_URI += "file://norpath.patch \
-            file://fix-for-readline-event-hook.patch \
-            "
+           file://fix-for-readline-event-hook.patch \
+           file://fix-for-caller-setting-rl_prompt-to-NULL.patch \
+           "
 
 SRC_URI[archive.sha256sum] = "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc"

