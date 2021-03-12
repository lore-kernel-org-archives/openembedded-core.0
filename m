Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.5916.1615541522638827431
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MctbMPI6;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id u4so6973014edv.9
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cwph/qW2l8Mg76z0NPOKwu0A75GOaMFo1eW37Z9696U=;
        b=MctbMPI6AsV2TDrHBPOdZ5hjDlE3xVvCWtCJOn/+CGUSdNa+lN7UvnzBGlwEfSySnm
         Kp6HbtrJnbXnzYhxtsFCfnxbmJZTfFArypJbQ1IBh3hnJKPi7+F1D0P+0VxJzXG8+YLu
         RjgmtmM277/AAFaGMJA9uYpDQi7EJyEULpxguHEZqnf6hia2Lc18RGLTPKeiP43w3x+4
         oQTZh9l4viGc45xYrsQnMtmn8E3ewA6//Z+89LQ9c9KUaCkXwUQ9ciY1ijwc5QThhXlL
         r+Z5U26Ie5Q8P5Qxu5L8poLqbpzKBC8FM6MfpHDvVSJA0Fb8vsIrIbQTXkJAJlFluAyT
         Okrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cwph/qW2l8Mg76z0NPOKwu0A75GOaMFo1eW37Z9696U=;
        b=rIc4uPGC3ccoZE+rixgcrsaGBSAS0H/9sVek0Pv6gMkkvlUh4K1pOhhDS8hhoPAagk
         hsggLJo2R31YGAHFpZloJXlvBLuqiebI+Cv7uyuUG4UXJwXwc2+fS86lWqMrTmqqmiXB
         drUTYxZbv97YwFEOVBjLYq2k7gK1XtoZ/gAdXYB1r/oNEQcoErBy/kAbX772wbzFkl32
         UWtRty5urS3cpVgY0AdwjSKplt7SLZO7SWgtuYzjOTIobeo8iwBfPUdyhLB8gUcHWc/B
         Ghoz5GvHtHS5SJJ5/Lr5q0jOaXH6eGTZfnkphqsIMu2M1qRBwa+xsXMnlOXVSfLFiEge
         E0XA==
X-Gm-Message-State: AOAM533IJdMCVaZ/6m+MdpxST0rW2yGcua6WyEnU/ema89W2WyzCp0Xs
	1382ZzUEqz3ZE51PxKoN7n6QUEOi4JNWjw==
X-Google-Smtp-Source: ABdhPJxXkcw+s6pM4l+FC/srnhfUnxD5jtvuBrTxiPw/Pa8BCsfW/ZJCV/blDSlqOsSa+kGvKqjRxg==
X-Received: by 2002:a05:6402:51cd:: with SMTP id r13mr13235252edd.116.1615541521038;
        Fri, 12 Mar 2021 01:32:01 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a9sm2635831edt.82.2021.03.12.01.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:32:00 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 6/7] default-distrovars.inc: add wayland/opengl to default distro features
Date: Fri, 12 Mar 2021 10:31:38 +0100
Message-Id: <20210312093139.318889-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312093139.318889-1-alex.kanavin@gmail.com>
References: <20210312093139.318889-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This puts them on equal terms with x11 distro feature
(which I think is due).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 433d4b6651..0927e9c0ad 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat wayland opengl"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
-- 
2.29.2

