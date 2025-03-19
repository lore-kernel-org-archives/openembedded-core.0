Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B002AC36007
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.2929.1742372200103364140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WepQrOdI;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22580c9ee0aso113637375ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372199; x=1742976999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk4DvG8eVTVw5pktdDAj45EUsau3TFqeotrTSWpfjHw=;
        b=WepQrOdIckQkxEpUiCnq/ckeWIINB0ikgk3ixyKn3yXLd+GZz5AXikvyjhZowi/4vl
         Mpf0THA6Dxnf1sG8iGoG4r2+mw5vp66xNvRge9JRCzXhjat75RsLC58LYui0r3Adv65B
         Synp3DYfvpG351ZEbXYr8zK0oNqlkIbLafYjBn9k+5J7iKjYaWv7lQEoDc3gmVuGPhip
         ykt3Bd4VGKDf/PSBZNmDdvPFPKjn06Z5Skl8XGKNgCeY043LDhp6xTdh1nadeQ6dZcxZ
         931vXgWUSS3uS+peZxR4+mQZKe3Qi1kpHy9tgSVfKy+oLOaeb8/fGn0OPTEzw7SjYxzS
         pOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372199; x=1742976999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk4DvG8eVTVw5pktdDAj45EUsau3TFqeotrTSWpfjHw=;
        b=j6KFI6Y3w9mouKnZ6b3TvygypvjxSeLAvPEiYQSm/rI+tr5fjfXjWTCxHpizKuazIU
         zWnYAwUIr4fRuAoXq6w9iaJ+qP6bZCWKhtWL46G7+or8BttykefT+QM2k0cRJusZxHd+
         FO5F1aujs+8KNLStjo2OQlHfHsN16d8FXDugH9cizJUs5+5TzDmTeNX6l0gr8J4ml9np
         AFJIgybVPQFYc48EwVcjZ9JDTWKV5REb4d12WY6AIQ+vAWCmB3hwSJ9umL5vkqHigFUA
         SOKvW/MsVOWMojGfRIjGpL2031JWZKnbshdvnV6Z5fdIvhOscvzB0GKaoohmFiiTC03c
         v2ZQ==
X-Gm-Message-State: AOJu0Ywv7AEZBcr8LdpRFro52oOrwNt8I9M4MVDssCXIMNarsXGuWUaw
	Tcw1v5cqvUDmbyYgoqBAPahQ86jp3d7k+KoGVxoa0PnN2+n9142ymlfiezzm
X-Gm-Gg: ASbGncvgrUfDaS+BLlW8S2RXK3i1J0PxSKox9lGXvWxUp4YXxK2oq6U7cCJ/Tjm6mcS
	3TfGrxnoxDW8ROZzBWMrlW0+qnKTHh/hOcskHfkpz03ryzOflydDwo4n8Gvr6mneR6Nuh5vHfJS
	my796ktCXcydG6KMGDTnDJPzS0slK+Rv/wmnH/oTdDjx8ZiRQRzXxBzdLDwfc9mkn1l7CCptXJF
	wDFz7s/Ovpg09B5PZEKzED+78CtNdE1mUu9gTjfgVdyoAYupwvJTvZiagZh/YJR8Xv/yd/AzJ0y
	k1K9U6YzlcJvJK0L9cW2Ewi2C9EKJ5Awl9hc
X-Google-Smtp-Source: AGHT+IEXaDWHhS76yXPTCXvxR5cw2Q4AD2unspD0eUeq8aZlG1gVqFD+AEm4pwX+kAkQQzT0gdXwhA==
X-Received: by 2002:a05:6a21:7889:b0:1f5:a577:dd24 with SMTP id adf61e73a8af0-1fbebd7d017mr2816863637.25.1742372199278;
        Wed, 19 Mar 2025 01:16:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 21/25] time: Fix build with GCC 15
Date: Wed, 19 Mar 2025 01:15:59 -0700
Message-ID: <20250319081610.3536475-31-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213297

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

