Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C20C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:58 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.66.1659106078074453528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ujB4xJeB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id b133so4828448pfb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OjvLg7D1v/XIcxHyXhJTslibDC+ygOX8Lba81ccDpEw=;
        b=ujB4xJeBfYOyad0M0Pkt4rXge2YbiwxLplJom2bVSk/ewri9pz0TeY9BzlOWAwR5Vi
         ohuYUcnW53j11vNPbPy6EMBZHZ7FqsYhfqxFfGUGR/jW8JfAtoAS+tK27lBh5H04OEL2
         zv53GHJoIievPeKey1B/InFj+cgduOMUxROQRs5wCgJzcQYMsV+v0H0QAupqumbtpinU
         AYNnsxaQjwFBSYG+zxbKwhrMAXppMiz9Jvwy+Sl/3OqzRspm8hok7ntw2d0sif0krCrk
         LU192a7WirI1IyIspQn8hMh1+H5Gzs6JC9noG+7sH6+6q4ihmNXRW/i3K4qu9tgS7qi6
         DrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OjvLg7D1v/XIcxHyXhJTslibDC+ygOX8Lba81ccDpEw=;
        b=TL9TN35gq5TTcaewCIepI4iZxyU8DtLxThFjSja1lVNiYTPp9eXgN/MsPGY7fNJGas
         nH21HMxZhAwbeO/nJoV7m8ip0MUrzwsXsmR5BI1VSXnQsF/j9dFlaEO0q+73479c/2zR
         F1h6ftUQF8foK8/jzwtpQIXnMokR5zvXkq6q8h4H5o2emU8jdre1PRDHGigZfVeGwRJB
         M3hBJJ5xbpLIDaqhvdaAChUMCcOmB40ysvcVmodI/iVAEOe9vU5GpteCRQ0Y+gRIUeUD
         BMny6W/gUFInps0SoVuMzfiobvfW7aZ/LuoTwP/IDItPw6pIEDs3OZkNDxaOFZypfBQN
         +OIA==
X-Gm-Message-State: AJIora/ct6nUC02tQQbaLp8VPZww+oyOLiPSdzRm6V5p2fApLT2WeuCD
	JsI2sg3en6FlDYL2gmX2avBqcTgJ6sMc/LTW
X-Google-Smtp-Source: 
 AGRyM1vVJEB+Qy2KoZQVK/lBUC9hulXG5SuiEKJIgY3eKMybXemotWzQSUCCcvDYvcL1QbdPrx9KwA==
X-Received: by 2002:a05:6a00:1a56:b0:52b:f5ad:3741 with SMTP id
 h22-20020a056a001a5600b0052bf5ad3741mr3872594pfv.64.1659106077047;
        Fri, 29 Jul 2022 07:47:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/29] vala: upgrade 0.56.0 -> 0.56.1
Date: Fri, 29 Jul 2022 04:46:31 -1000
Message-Id: 
 <b19e2022184c567b53858981c77ebf3b1d283a8b.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168650

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes in 0.56.1 LTS relase:

  - vala: Improve accessibility check inside member initializer [#1300]
  - vala: Don't allow nullable enum value as real GObject property [#1074]
  - valadoc: Include path to doclet in error message
  - manual: Update from wiki.gnome.org
  - gtk4: Fix GLib.Value parameter in ContentProvider.get_value()
  - gtk4: Split out gtk4-wayland and gtk4-x11 into separate bindings [#1308]
  - gstreamer: Update from 1.21+ git main
  - vapi: Update GIR-based bindings

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d78d6d6122b776f9abac27e3a71a3196999bebd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/vala/vala_0.56.0.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.1.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.0.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.1.bb

diff --git a/meta/recipes-devtools/vala/vala_0.56.0.bb b/meta/recipes-devtools/vala/vala_0.56.0.bb
deleted file mode 100644
index a4d6760f10..0000000000
--- a/meta/recipes-devtools/vala/vala_0.56.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "d92bd13c5630905eeb6a983dcb702204da9731460c2a6e4e39f867996f371040"
diff --git a/meta/recipes-devtools/vala/vala_0.56.1.bb b/meta/recipes-devtools/vala/vala_0.56.1.bb
new file mode 100644
index 0000000000..48d21685e8
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.1.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "c518b81dfdda82d1cdf586b3f9b2323162cb96bd3cb5a2c03650cea025d91fb9"
-- 
2.25.1


