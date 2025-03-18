Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AD8C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.2881.1742323142877622769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vf5WV2/h;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso4497348a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323142; x=1742927942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk4DvG8eVTVw5pktdDAj45EUsau3TFqeotrTSWpfjHw=;
        b=Vf5WV2/haENnPItHHYBrrKIxjqW3uQwRZT5RTCB8XMkSurZdthxGF/5uks3EsKLlhD
         Xyl6vXxkEYzjOF0/iU9XroOd+9ROc5esVAAgxxcpNuaYAnwvoHqHCvl6X78lOLQeQrU/
         FfUKaxAFG9yeJchYHijIoPLf+S5BMzUbl19SVlYvJvBN8zgue3HHwBkwIJJlXfWIUP98
         Qd9JWq9fuxoGxKAHTrQjqpFbIA3doSZ0H1+J+nLKXvtJRIPeMpqRJyE03xDQJBQ31GOC
         k9vaT9X4TZwn1llus2507JpIL8hedZTQokoxHaIOJAt/uprQ5u/7aNjv2dYJQdIc59us
         EJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323142; x=1742927942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk4DvG8eVTVw5pktdDAj45EUsau3TFqeotrTSWpfjHw=;
        b=tXlF0qHSxfLFkkXEQ9c1E7f+GCF9zFedu3oq5NY3JMpxEVSKMUsHAYo8jsK7Gnmco2
         pe2kPGkArsCBnjic+//W1P6wH7dWj0hHtcauM71TWm3Ao5nieBPTwEXBLrbzqHwUXCyi
         YYhEhbZiOqvWRWsmtKWXXOBmX/jk9/dYm7u3d4QCZkr81E/MQK1lsJQsqrcy0vuAF7Hm
         zHn1r67/xVv1H7oBadSE8ZpiHCGJhyWgPubpH3XKgg+miPQiB00OPGRAQKjiBA0BdvTh
         jEu+Dx4c0NtrbbdDNX09kR7Y49EfW/qyISFksdxrICj8PFPYRDhLlL42ifceILHwo06h
         nXGg==
X-Gm-Message-State: AOJu0Yz0haGJuCVfvGRp0gvPJM2EvLwhxZ8+8M7nSg1zYOM5pt2xmT1T
	aeiLpbx669Lzcs+ggMpbklNmhGv8H86HC5ZikWCAa8pkGnDp+n4lL5RuAvcv
X-Gm-Gg: ASbGncuxv9omQwOGI4UIiQgyJYzgV59TysSFXIs2Dyo1sKFoYvMmhDwsTKPMZAaNLeP
	b+xm+gl7XYP1R1oksBFtI0y0l6TTx8brmniDpXdWs6roGahqxc4ibaEfrJfTZ6BMPzTjn8iHMTg
	TidrTo5dH1sGjg5WGJXYTQNwvVXYqGNk7w6nZEqFbxgly9tHkt1TvJwYLykKCqpTS8zYZ7pva0X
	20nKn03ndS4TCxXYV+Df1uBgpYDsTe8UrazBjTks8qEX5MsxakzMvmFL3VGpFKuwoTvBt+VoTJk
	AdNttDF21AAJIaVcnM+Wjpv5EIuesfx15fPv
X-Google-Smtp-Source: AGHT+IHB9LES3mOR9fpWNYtTOwM39kB4G4kP6abC0yQTjYh+im6OnMMNsvU2l2ANpsdR2YGiz4TPgw==
X-Received: by 2002:a17:90b:2b45:b0:2ff:5cb7:5e73 with SMTP id 98e67ed59e1d1-301a5bd3b41mr3903263a91.23.1742323142059;
        Tue, 18 Mar 2025 11:39:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:39:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 21/25] time: Fix build with GCC 15
Date: Tue, 18 Mar 2025 11:38:36 -0700
Message-ID: <20250318183842.2256284-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213247

Initialize interrupt_signal and quit_signal with correct type

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../time-1.9-Fix-compiling-with-GCC15.patch   | 33 +++++++++++++++++++
 meta/recipes-extended/time/time_1.9.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch

diff --git a/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch b/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch
new file mode 100644
index 00000000000..76141aec18c
--- /dev/null
+++ b/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch
@@ -0,0 +1,33 @@
+From 831194f0be7733c99c7a2c69d9e9695b82e05010 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Poho=C5=99elsk=C3=BD?= <opohorel@redhat.com>
+Date: Thu, 30 Jan 2025 08:48:47 +0100
+Subject: [PATCH] time: fix compiling with GCC15
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC15 complains about incompatible pointer type in run_command()
+Initialize interrupt_signal and quit_signal with correct type
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2025-01/msg00000.html]
+Signed-off-by: Ondřej Pohořelský <opohorel@redhat.com>
+---
+ src/time.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/time.c b/src/time.c
+index 7b401bc..c8d7ab0 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -803,7 +803,7 @@ run_command (cmd, resp)
+      RESUSE *resp;
+ {
+   pid_t pid;			/* Pid of child.  */
+-  sighandler interrupt_signal, quit_signal;
++  __sighandler_t interrupt_signal, quit_signal;
+   int saved_errno;
+ 
+   resuse_start (resp);
+-- 
+2.48.1
+
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index 8364210e61c..d9e2d06b32d 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -15,6 +15,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
            file://0001-include-string.h-for-memset.patch \
+           file://time-1.9-Fix-compiling-with-GCC15.patch \
            "
 
 SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"

