Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0758CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 06:09:05 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.70877.1756793343665164791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 23:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TqgpGWNw;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: dpmin7@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4c3d8bd21eso3145771a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756793342; x=1757398142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ACjlbNRVWhfMwx7LaHvuFjURs8L65PRQhdNueLneU7Y=;
        b=TqgpGWNwG7g/3r+wCBZAPX+8PBgDKz77aolaaFRj0HikZVl0k6OkhHjs0OwcrrcPEx
         PVPnv+G6fTRMZ71/FIa9yihnQIjyzCCk/sct8FVmHn2QyZw5AGLvzFC8rXlEuvOWwkJ2
         4HMNnJhj21pLrrkaG3jKSvKXEmO63IYY2ONtB9FEopncLiGM8nmVj2/zwFNwJ1PCFD22
         Bvlvly+aUOdkrDzGo3a5GCa5tDPLU449h+BawVgXURLtSIMBEDkCgj+dKbgTyeSMCqZi
         ECtCif7RxNkc1Y8spnJuXoiyiAAEcF3FaAPzGo5oTGxnxKE94bLQWGCTtXMwdzdHYv0P
         IxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793342; x=1757398142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACjlbNRVWhfMwx7LaHvuFjURs8L65PRQhdNueLneU7Y=;
        b=ptd/EvszYZTMkvlWy+CHRJHF1zzZE6LlfMT9hyNdpXX7fyy/WMdGJyB+8yp3iLzia8
         LGr3s6xiLMmXWI0tHLyjm+bBkbkKqiWdwDh6cy7gmcC3AsfQLmnYXlPBKcB4HbIIy1sd
         +cpkoF3MOT3tlkCVu2aI4upxhSHdyYZWmo5/zroLjv2B08qHS2mxW6Arj6D9MIe3MIr7
         ApQsMKXio3OBSdeL6pEr/Pax6Gipe5N6QvkuuIDZsK+gPs/pkw0aCu78NcjwGjl8xHgJ
         y9hRpEZuCICW+np+ai8AYDD25fSBypNu/RnOOHmiPRZcMaQTsPxTfEVOMes71srdV2/y
         QCMA==
X-Gm-Message-State: AOJu0YxZpD2lVoXHp8lm9Q6OCR+Vl30xUnDo3j7uZzyXH5fwMnfEIeJY
	8xazfpJbusqem+3eWV0Duvh6YA+JPpxB4iDQHNhXPda9CXmHImMnFmGLo/HFeA==
X-Gm-Gg: ASbGncsZYy45aJkGXyuDzY2B517W98x7pLbAKhhVbJ6fCuE9SkMMZvjswUxE7pEzXq3
	VqIlJhh2dW/7tv8/gF4TArGWAZz7OXiLvMcID939QeiXeD/phC7nbqD8vfc3EmOJA7oKr4HQaoI
	3AIhKBvHhuFuEoXOf+x1AdJ5V8xFPwqEKKotpk+18obXLv7GYIPP0+mI3LmKATeuJUOa4bYlx5+
	vfDgEXVoDhRKL9CKVWU8YF7IjZ7nf0fZFMWAjOhwgp7j3YsZgiF0joj64NNQmMjGc06zCdDful+
	MQymkqgnQSONAto/j+V4j+4x1rg2+w+/uG4cbcM/694HnYuInWZBspDgBvn4CEsPtDaVGdJb0iL
	WDzEgSFGbmlXHh/QKP+1kMQ==
X-Google-Smtp-Source: AGHT+IEp8w9r92AcYzyhGcJ7v6lqOm1UfGYDJjNW0RiKyOqCyVovxIGzmJAHhbdG6PYv5LVb1j3Evg==
X-Received: by 2002:a17:903:32d2:b0:249:353:ebd2 with SMTP id d9443c01a7336-249446d26acmr130820305ad.0.1756793342286;
        Mon, 01 Sep 2025 23:09:02 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24a92f897d8sm81045355ad.24.2025.09.01.23.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:09:01 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dpmin7@gmail.com>
Subject: [PATCH] pulseaudio: Add audio group explicitly
Date: Tue,  2 Sep 2025 15:08:56 +0900
Message-Id: <20250902060856.1689123-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 06:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222706

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
 meta-selftest/files/static-group                  | 1 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 441123e2c5..252fdac67d 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -28,3 +28,4 @@ sgx:x:528:
 ptest:x:529:
 xuser:x:530:
 seat:x:531:
+audio:x:532:
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

