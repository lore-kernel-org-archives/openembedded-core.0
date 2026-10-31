Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3747.1793405765116756445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=GSn6ghQ4;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so11379225e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405763; x=1794010563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J8aH8aMtaZ9G+AJsv6ysdRGbsB+5UiA6iH46LAA+7rY=;
        b=GSn6ghQ4fvUK2nj+u08vxXykON5WjRYrBCKtVtPxb8AYsEL0FotzDWtYoIZZVeyVA5
         Az1X2c1+KrFYWvE+xa/TcIgY/ifq1CXy/gIJrSIPrNSPHtskqLKOzDdnJjKHV58Kir/e
         Id9qC9zj4XKFar8JRgrWPOGqhNTWCJPTapp3uUMPXxOcfGvlgA9C0hy4R5brACTXm3MG
         233lrTHUkwiUUy8OFRzwVkLm6ZTxEtvUHJ8Q1j3Fmv5xveK0eIppnSM0VW5Ak9GZ/FBD
         mO+OjveJecSMgE5jKeH6iDUTX4OX3yGvrGP1ZDapLTFPfnHcG4Au3EGpWbYk5wEtvAzM
         M2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405763; x=1794010563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J8aH8aMtaZ9G+AJsv6ysdRGbsB+5UiA6iH46LAA+7rY=;
        b=nTTkAnV1OMeOG+fgF079QbaeB1G9St6VFaOr8GmUJm5vMjP9QFDNyuRIQseS7JbVuB
         /dfjn698QOeq5mq6udxx0FvDxvX0mf6sHYaR4W6a6hAGix6IO2VTh+CaIrRJoz4IagEb
         A4S6PgLLH9/J3ymHjHFvYk60vqmG9ZLelrEEMKvC0MRAPucu7moCCnIag+qFnejx/Jsn
         cSTqpD7umdirU52NlZlYwV61aS+NFUrLaL5tgLnlnhb09xqTiJNVSYDFBMSNhhm7du8H
         NfFPOAl49A67OtmLGjSwy3t3uzlrs13B7AzCekVjzLNr9/S8LmXST0BlLZM4pQWHZUPd
         PA+Q==
X-Gm-Message-State: AFq9FYLEt+iwoEwsJRwXUL7pn2Dn8MgOZwnaTOzsKKvAGYyAsuXMDSXG
	MQjfqEwLq+fOx+fQO5CtSqs2zLPX7A1pYy+YUx9MeXBxE5CQbkBO5V6KReU2NrAA+U6m1wTE5XJ
	suMkXDE0=
X-Gm-Gg: AYBFou1UvcqqaeNBxrtvrviHs0nW9yYS525qcitbZOw/U2n97lClTb1RCgZI3mRiubn
	ek3lVOhhfr/hBSyOlOvgiPt9aKaMWb/P5Un1rmFXhl3tDYpcbukKOKCx+FRvRlayAOtDxHSKtyU
	jRlrqNb0b4nLBoWOsUwE/1JAwoVvc85QWH/Z2WGU+UyOWoLoOQo+jUFHuDk/4Sgb8/SZEebKY9q
	ZFyfcH4BRCfPvMTSfQjm8fbajcpK5SfYLRq3pfrccGPoMamuGWyhk3N4sWF3edXgcvMZSOjzbqj
	oRD8F2WGeIveAJIIFXDAZBZ125L03nZLcf0d3POwjmBXUgsoDB3/kBAV9eeLoMh8feqv32U9jG5
	b8diBeiQSNI0MA25uZNZqvaczsyJYc4oZ+qCj9DjAIXsTXiaPracmz6gzgzIq0LKGgr2mN0FF5L
	VgP5sOseVJO17eHpFjh3KuQNwoMF1cpRNZGu9eaf53rEVO/oanDB1Qeu8A5epvazXMX0kvSQ1sz
	vlIBdf2l9PnyZFCZCHX5wcctAgpuiQvMoUuYlhBvUMpK/8VxFGYuQR6FF2c3Fh2nIxcSbo4UPaH
	9ym7qEOMSUsngz29SIPDPDfH3u8NpYzsA1+O5p6qqE3eUhY/p+Z9I+xyR8FSlPuvaLWanjWDT+G
	R7Uq+goncUvLTgDWYb0rc8K2j4pvW7Gs6BhxsvHrcKUvY6vdaCw==
X-Received: by 2002:a05:600c:5246:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4ac16acfe48mr86338365e9.10.1793405763420;
        Fri, 30 Oct 2026 17:16:03 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 35/55] b4-config: Add configuration for scarthgap
Date: Sat, 31 Oct 2026 01:14:56 +0100
Message-ID: <470df3d03192b603a621135a9b3e6118983a7272.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249110
Content-Type: text/plain; charset="utf-8"

From: Paul Barker <paul@pbarker.dev>

This should simplify sending patches for scarthgap using `b4`.

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .b4-config | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 .b4-config

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 00000000000..5876a9f2691
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,4 @@
+[b4]
+  send-series-to = openembedded-core@lists.openembedded.org
+  prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking
+  send-prefixes = scarthgap
