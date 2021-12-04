Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114F7C433FE
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.22345.1638602013718510078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QAPx9yBR;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so3928603wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X12RmqaPHXYhrmF42Ojc+Z53iCpX6A5z5LIqHQihl1o=;
        b=QAPx9yBRAqA+KfWeQhuvMKEKhQBtaeEryQfD9uKi0l1hRzHIbtr//sPikUoenx1L34
         BjYT8hw8R6V946IeJXuej+F4PBFxefT8PMaN6gzbanil9GH/107QnN0ef9v0v8/TL4WP
         niETV6LhApBjmNcSp5An5Z0dhOmEZEoiSYP3lOPdZDwoFOdBM8Sn9OcwRQSFscmBKyGU
         si/96wYIPdoMaFVnQie6vfkeSoWV6b5mi1slk1L9MFxdr0ECbl4NvLPDjIZ7QE6u+MyB
         mPcaEJlf2QD5oLQM+3Yg4fkBK7IDr4LY5S5wW33wgk7pSGgeR637imp/wo3UhxXBAQlG
         2D0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X12RmqaPHXYhrmF42Ojc+Z53iCpX6A5z5LIqHQihl1o=;
        b=ksW5FrOGkYOhHSi8OjjiaWtIJttMuXILq0vfY+L6BjC/Ym1yfMqo37ZAhgbq7m2M/2
         8N0ZtwP+qtNsH6XXEnrE930VS8rgfdQJQUZX44/ukBCZAwol/JykTu5Y8Q7msQglhc6f
         EJVqjvNmjSOy8HXzq7IfYrAyehnZEM/6MG3c7YsADdPAV4cOUgnhy9PCNe4cf0Dst+5H
         gdoBuesqkhBd60I+z3yAUKHWvDLn36cMDAS7gwh9iQ/Q/kaRRIhRHnewkJ6e16+FDL17
         UoDuSm0NqXEIRrWvXveUlF0kg5miTmUvxV9UMXq4BKFQIWIK3IrTRXSt/y3/WIQfNWt3
         khDw==
X-Gm-Message-State: AOAM533tLFm3l83iVZ8g42x/ZCWhj56VA1+bCdTugYu/OO3X/W0M2mJx
	6MyKQeGu8gcbY87aHxlfFdkuAEAO/txS8g==
X-Google-Smtp-Source: 
 ABdhPJzzym81oE72os127T/Y5Suixxh79OVR6o57Zn31C7ExrtJLoB+hfc2U5IT1t7FMi3VP0+oD5w==
X-Received: by 2002:a1c:4d15:: with SMTP id
 o21mr21048736wmh.171.1638602012309;
        Fri, 03 Dec 2021 23:13:32 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/26] vala: submit patch upstream
Date: Sat,  4 Dec 2021 08:13:04 +0100
Message-Id: <20211204071323.2480163-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159154

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch b/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
index ecab0fc1c9..2aaf2ab94e 100644
--- a/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
+++ b/meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] vapigen.m4: use $PKG_CONFIG_SYSROOT_DIR
 This is necessary in cross-compiling environments, where directories
 returned by pkg-config should be prefixed with sysroot location.
 
-Upstream-Status: Pending [review in oe-core list]
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/vala/-/merge_requests/218]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  vapigen/vapigen.m4 | 8 ++++----
-- 
2.20.1


