Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0F8CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 08:08:08 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.46164.1756714083339832183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 01:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+GDZUHz;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: dpmin7@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4717543ed9so2617623a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 01:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756714082; x=1757318882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nJwnFfIV1nyUMhaMV56YnVt9setmS1je7FXzp2Gkq/Y=;
        b=c+GDZUHzjNZ2PJ9Le+qBECczZ4coBS9B0K2J0HzS0Aczp58L1b2gG3smC7OSc7LWM+
         M8ScTeHV/AwNghK1ZxaJEKJAMvc1vcyItRNgeJOYL/H0grKBx37qmVI0eXBmzWZytGV/
         seIlH9Uaq6GSS5vzbTV6APnnAkOS72Z6szRJvdaiqcrPoYsX+RMd7Ziwfp//6wdqFyhp
         L5NfKgKjpscCE/aB8zyv2rSnJNCIZp7jXZGBi83mISM+z84ZuiYh0cwk8Y+4ezopyzuH
         wIuU+nmVXBRNGzKp9ifxUcGz0Pg8CGFagcghgjPfpN/KXePWTzCYkuFDBTGU1JcdrwzL
         cV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714082; x=1757318882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJwnFfIV1nyUMhaMV56YnVt9setmS1je7FXzp2Gkq/Y=;
        b=AYAl/DE/8lgetjFXbBkt86xh1HjGvjDKB+ztzzTA192TpwywjavQEsn4XWYzoqwWzy
         /ABAAZmzL9MprcJPJweWeom57hBFluKwxYa2tGYYdXbTces4Je7SQ+pLAr4RzWOt//mW
         vLWh39p1VCoFSL0IzYXd04OKKH61Gkorndj7Xs+JKrsIowySM0nQW+9kRreTEMhZz0DO
         EFkXp7dVAv8gfWZYmyYSuSfk5W3ETUZa2x7eMMCfXa36JqI9tHLimxlfpZHDp/OKKHyv
         4BhJSszJ5zpTAF1M7LX4jNf74hhmlLOEWnvf9GH5DbFZUxwMuSHDJZMfYu2TZ0RLoH0d
         5r+Q==
X-Gm-Message-State: AOJu0YzgaleL4TPriimgsJfz+FRrd9OTL741cUsFuhywSv4n1gr8jd83
	0Ulr0VNq99d4IF+b8WElyvT6pJP2eKIDD2g4NJkqJ8oK3ctPo5cL7Wd0frbqyw==
X-Gm-Gg: ASbGncuSh4okzY5O2Vgkx4hQetLW6yT7gOWa7M94+D8yxxSlgzT2lj6DcrCIQiwU6ZN
	9pynRN+vHBZh8s1hx9FO8FGFrTWdXKq5CkebEIb8omQO9wGCYglWtPWtFWFl5gmYknyR0Ck+e8I
	W4fZ5fKrvH9cW3tTp57G24zBU/VZx5y5wtCJPUOCfB6EeqOluR0M/wv2qV85miqacQNj+O62psm
	O0lBrNNgchFfXqlTzn/P4KHlF3ufoRdPjTqsK8BS6btu/rCvuelPs0Mk/hPeuxUoItLR6YSgnc1
	9k7hyRx4lA+4jYpgIi7AmDZc3T6pHBMWzlFjPvJDbir6YmMPMcbg0L0yb0bLjvMm7Ohi+Te51Vo
	6sw2p/QEA4aVMIijnp8jHQA==
X-Google-Smtp-Source: AGHT+IEOJo8F+xW97xoIk+oKknHnbbPK7TtAc+D02/VoKFJeSXQj7ssNK+fiTzxT1PUGSqGBGV55+w==
X-Received: by 2002:a17:903:28c:b0:246:4077:4563 with SMTP id d9443c01a7336-24944ab8dc3mr86005345ad.34.1756714082171;
        Mon, 01 Sep 2025 01:08:02 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da1884sm97066395ad.95.2025.09.01.01.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:08:01 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dpmin7@gmail.com>
Subject: [PATCH] pulseaudio: Add audio group explicitly
Date: Mon,  1 Sep 2025 17:07:53 +0900
Message-Id: <20250901080753.897087-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 08:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222646

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-poky-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 695f4b676d..16c142130b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -155,7 +155,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

