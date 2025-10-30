Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED116CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 19:36:09 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.6601.1761852964518364938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 12:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q/AU6OrF;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: joaohf@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a271fc7e6bso249501b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 12:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761852963; x=1762457763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RYrUzTXZYRiS6BAgnDoBBBjJvsS4ZW0TRyf2aHkBA8I=;
        b=Q/AU6OrFS0F2hIoyg0eIoMYmHgsMOC+htg6xR6Us7VSXBaM1PWpzU36IMJwqw46Mxt
         jwXhPNzmfsFMy6y9KvoAR2zNMOPhHn78Euq2lZ3+2bwGW3HTFIi8nuyyBXCB2Epjki4H
         Rl3zLKNqjxMx1jdNdKrABwTp/B5KMma7hZtt9zLxp+kr3n2/TpH7gBswht7zUKsuAor3
         90cYQcxfO9WnHTpw9pmXxXlOEhmvZKN1CGhFuKaCpb7ai91xN8Cuf5270vYyj7YbOfBa
         ElnBHOf4G7by6CNCU9tnvZ5rSzMSY2A3lCiWtrjsIUmi1p9Yl7OPA6O6m/g1jXwF2mRS
         p/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761852963; x=1762457763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYrUzTXZYRiS6BAgnDoBBBjJvsS4ZW0TRyf2aHkBA8I=;
        b=mHV8aeIS7mV9z1y6UOvd8sNf16DCsUai84uTUitDc0bigtxemPM3rgcpWbfadOxt1u
         Igtbe6vIZ6593wc/PNgskSuXvIle40XncNxP8JHkwMmZmGeeysMa8IBmc6JLGCYHsoD7
         IqoPj5UE7zw90U+AwiZzIMS3XArunOuZTbI9oplrqLes6BpoUsd20qfYoOrgvMP++6cF
         EATiVC69D/0s1fnhpQaPvi7t6SoN+nQDbJ+/rECax/19mQFiWPqiHpLK/no69O6r+US4
         9UxUjYhnGsV2ZdVWHal+UGmhukVRFB8Ysyc3ZpS4lQT7d7j5BMXygEWU0wK00XlcCWFF
         7Z3w==
X-Gm-Message-State: AOJu0YwCFBC5uIXYVVgGusC2dobnaKt5Bc+f4MFY0k7fbb7IRMHzjisW
	InPvH7U/SM7CSj8lY8bgq4NdAsVGUoDh5SkbFBRTvTjnNM2jgJQs7oSxTCLPRPQ+
X-Gm-Gg: ASbGncv4PHnIBI51hDyvr3T7moD1GHvvEwaVu8l7rK/Wf5JSz7s+woBHGJfzBiZ1eHz
	4ss18nJrXcalrNueXjKU2+3du4je6wX0OSfawwjfd7pr1WE1mbp/N80T8Zo7Jmom5bz+5vAjSIN
	Uayvnn9NFs2QOw1rCnLRiraB/Z4eBdkLyjTveItS2lJwWxAHy9tE6kR3Uxq92Rn1J5gBHe+Q3Xw
	EJVjAods6kv1EXwNMKeuUgmqFzF3u45ubcIpEMqfuDwAx2GgOhN5pKpJ9/h5eYCuurG/f9Wc4W8
	hjezQZAXPRwJ8vBnJGsWwUfYnuj+d+4HEyIDoe1MDTXlIbuf1UOS2ANsOSIFS6tSxdQBPJ0hiWl
	HlijDjrX6MQO2brbDDEWxY3MJg7wNlc6ShymA0LzS7f9XSqu/NsG2Q/dEPz2PLTObdw==
X-Google-Smtp-Source: AGHT+IHH7nZ8vAFHq9OsFrjZE6/FCEhZw1/AF/DJOuaecvN4LLH0i4P4pQuIYbFXDc47s6Iv1L/p1w==
X-Received: by 2002:a17:903:188f:b0:27a:186f:53ec with SMTP id d9443c01a7336-2951a4da98fmr4417625ad.9.1761852963370;
        Thu, 30 Oct 2025 12:36:03 -0700 (PDT)
Received: from porco.. ([177.188.211.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d23218sm194279755ad.51.2025.10.30.12.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 12:36:02 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
Subject: [PATCH] readline: backport a patch to fix for caller setting rl_prompt to NULL
Date: Thu, 30 Oct 2025 16:35:25 -0300
Message-ID: <20251030193525.866305-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 19:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225518

I've observed this issue affecting iwctl and connmanctl.

Patching readline solves the issue.

References:

1: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/issues/1
2: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/commit/b30636dc66fc783a091af51b049dc5240f861dd0
3: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
4: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-front.org/

Fixes [YOCTO #16047]

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 ...for-caller-setting-rl_prompt-to-NULL.patch | 24 +++++++++++++++++++
 meta/recipes-core/readline/readline_8.3.bb    |  5 ++--
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch

diff --git a/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch
new file mode 100644
index 0000000000..7cc366079a
--- /dev/null
+++ b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch
@@ -0,0 +1,24 @@
+From 7c1019182f928ca05e794aecd06c33a27b7d07b1 Mon Sep 17 00:00:00 2001
+From: kas User <kas@example.com>
+Date: Thu, 30 Oct 2025 14:19:41 -0300
+Subject: [PATCH] fix for caller setting rl_prompt to NULL
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=devel&id=488d7edc22894d30b6de7f2d4190bf7403f63ffd]
+Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
+---
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

