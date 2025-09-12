Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF544CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 22:29:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.750.1757716182322026477
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 15:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k/HX8TnG;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso20680895e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757716180; x=1758320980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gm8x34ejih21cPfHWL5XmuHDqB/THjIZn80mlcK/gQ4=;
        b=k/HX8TnGtxiUwWBMHLcJ1JCqtcDCuXlLRd7igOK5TbHdJDYRzAcR6FjuvxyMSiihHM
         EObXR1uq6EPsV/sJoPDyBYZoKmWrXhaCXztglmvwL3WVMvtyJg6eruZLSswL0qK1JpXG
         ujF+KO87HYnTO2GS8ygdeG0sRb/uGd0gWh48dUfMG7bSjBvgY0TTHpxf2h6WxThQWlbY
         Pq948AqcbP1V8tSUOy/BSZwbLSiz+7fXE+MXIWfiPwzpkoO8DITnBiQEvg90NS0AsJpz
         cwRnvURzy7YJCW9JZ1udAACCU/Eo5pHe8jBmMUeseI+XvBrFKins/KSCls9pSdPkOkUr
         mnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757716180; x=1758320980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gm8x34ejih21cPfHWL5XmuHDqB/THjIZn80mlcK/gQ4=;
        b=H/0qQM8odWOS0+FaunMPzXA2ByiMJe9X9Huc8iiBYxKE641OxBi2Y5vIPbNw/OaPpq
         rA9T9jZBjpAYCZgyVawKHpdsOhThSmzmLX/rjbH9Ezk33Q3gQXOUWkngApePpPL79YSA
         NxOeuGh53ImsFUu2W6cTih+uPQL3PaV+muoy+33VVe5ysO7RPattT4TeqrnnMR8t2RS4
         rZml2Zr7bi/jXPt0sGo2YZTHSnhayKxYfHOMXe6H138K+bq5r3AG/omHU7HvDzVZEwEt
         s3WiYWywPIMAKSWDRxOWhGyVNbb6QrM1caQftNx6zs8bZluIzoZva36Oeb79wZrShLCm
         bnrQ==
X-Gm-Message-State: AOJu0YzvZMWMmeVK0k3NsN2pK4M1Vo4YuLwNqWTjJHzq8Y0FnzPccKHv
	Xrh6rT2KTEe0ji3hPUChg4Ugltq1abxHKgjAGWia4lF4LpOGqu+g/DzaeioJf1lKQdE=
X-Gm-Gg: ASbGnctRheH/DQsGFcuduLrjG0ZqLZXMZAmU78+XhFLMRDZkyx5xqAUHTdoeFZCjJ3H
	LXG9utyS+638WpyuoXTNIgmC18ukw1lAFeXMtamk/tihjzcVurEiSfsVh0NXNgDV3F/jpYaS2Lf
	teT+dC+UyBsnHcv66etKR0RG46WdbKFzEnhv1SmIg38jrwIdogSQevNuioRkPpxt9UgUsVMB8Pw
	l0Loqep97gysibVlbJPyIx8BfX6BZA54pzzpKTQ51xC+DAf3W+e52l9TgKJ0/aFW3IQWjVjISMJ
	2I68gOHvhavMqNGZA19Y4BHW4MFTrvU9CLDnDmp0ukUvdq+DIafEdnF595LdGmO82MRsm4KsJjs
	eEvqunDfm9aNFwB/WWlfW8/Hmh+r46sWHels=
X-Google-Smtp-Source: AGHT+IG+zluSr1aXatehygPOTZNB/YYYI0rXk8SbTBHkMcFfe93l8cAPVZJyYjilDKgTPCPmCwLqxA==
X-Received: by 2002:a05:600c:4fd6:b0:45b:76c6:cfb8 with SMTP id 5b1f17b1804b1-45f211d5d7bmr44101065e9.9.1757716180115;
        Fri, 12 Sep 2025 15:29:40 -0700 (PDT)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd9fasm7914065f8f.35.2025.09.12.15.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 15:29:39 -0700 (PDT)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	randy.macleod@windriver.com,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] overlayfs: Disable renaming of network interfaces
Date: Fri, 12 Sep 2025 22:29:00 +0000
Message-ID: <20250912222900.2772272-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 22:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223337

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Current qemurunner implementation expects internal network interface to
be eth0, but by default systemd renames network interfaces to have
predictable names. This causes a race in the evaluation of results of
susequent commands in case when qemurunner tries to setup the network
after the interface was already renamed and fails to do that (because
there's no eth0 interface present anymore).

[YOCTO #15962]

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-selftest/wic/overlayfs_etc.wks.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/wic/overlayfs_etc.wks.in b/meta-selftest/wic/overlayfs_etc.wks.in
index 8375d73a9c..f45a042c1c 100644
--- a/meta-selftest/wic/overlayfs_etc.wks.in
+++ b/meta-selftest/wic/overlayfs_etc.wks.in
@@ -1,4 +1,4 @@
 part /boot --active --source bootimg_biosplusefi --ondisk sda --sourceparams="loader=grub-efi" --align 1024
 part / --source rootfs --ondisk sda --fstype=${OVERLAYFS_ROOTFS_TYPE} --use-uuid --align 1024
 part --ondisk sda --fstype=ext4 --size=5 --align 1024
-bootloader --ptable gpt --timeout=1 --append="rootfstype=${OVERLAYFS_ROOTFS_TYPE} console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION}"
+bootloader --ptable gpt --timeout=1 --append="rootfstype=${OVERLAYFS_ROOTFS_TYPE} console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION} net.ifnames=0"

