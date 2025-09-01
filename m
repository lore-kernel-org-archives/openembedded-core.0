Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497D8CA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 15:55:21 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.55716.1756742115717123889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 08:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OMpf7Hf+;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61ce9bcc624so4920551a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756742114; x=1757346914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rooVj9y5GyvZLC1KSxDscYWfV7vaFmVBS7p4GdHLOvw=;
        b=OMpf7Hf+wsdokn+05QTKJk4nuSIpEDpN+xwiy+LKXjbHOnTfhQOQ/cQtddOUM4Bd+e
         IhZHnTN+AzpoBrsKgdyYXR9vqlFQYigVLK2K1Ryjth6sL0tT3c0xVSRSQ+vT5wg/deV6
         jeFmh73iV/olvFK5PPn1Cbn0qFp1MWwv/g6sGH6YGpiGFUrlDoEKFWIVkuqL9zAq63o0
         bEktPjyGSxGnj0i0SQHN2TXoX/4ElV7yGTz1tluUSmFIBTMGY0ohB4DoBGLM2Tf11/OG
         Cmajd0BMRt7p4hL6VPuDPfYDD5VBkJba0FsIcWcRAQxmo8189ZpVKb8Vro1LcUQFwvRn
         ZXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756742114; x=1757346914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rooVj9y5GyvZLC1KSxDscYWfV7vaFmVBS7p4GdHLOvw=;
        b=WZRehsrtCxhTHklE9yBFXsj0Op7kgjdG1ZkaOwvCQibRlOhLGFGWrolWCJk21+0dDg
         nrshyYQ90fD3584yn5HlyA7iB9hCvXbcWHMXbSvRb3qaLK6G2rGSjjQZGHXJUFKU2aRk
         Ztl+UpNxvmXGx+YH2kndZtpOlyaONzHXkihAW2MA96zZ10qyzepEoDN790Jw7N1lDIwf
         F1EGqwED9TeV5AVBCTMx+q8VHlsPGVa/66IlmrXpjNtcG5plm/XPG7WtsBpPt7zYmIsn
         +6y1/dzwCvVvJniOb9oYjH2RxAE6skDhQ8bmlAgsFRpsBMPOuQJL6Gg1oNaO/Sh+XSXh
         aeuA==
X-Gm-Message-State: AOJu0YxhwMnzz/tPQmKt+PoEtDrLvSLi0ukufoemWGrIgPdL9ylKiJDv
	+T8cDzYY/oHJx85c/6DCaHw/VxqZ4sYVBiwKpSr6bzJzF382qeQJcHxgRmG1Yw==
X-Gm-Gg: ASbGnctzRgavUCzTMfq0dbgYQbtywrJN7X8iOEbmTvqfq8kpMhy51s2d0HHQNfXlX1P
	RNN/OyY67d+50gUAbWRq2BibG3oG/gXaaDIyAdRDwWfrE3DYY+loohDGqEEqsBJmGG6d0PIk3S4
	JWy85u6pJMz7BljFfMfSYAzntvOSWrleb9PKdvJ9KfpHaHJcz3jvAyWNJYw/IZyzFcCcWN4gnOU
	Hy5fwlIpKopM40eHJ0wiOKUCFMedaHymLS0V6A5qTr8+U18Xi3Qm6FZYYJZ0ZYA81srr5om53k0
	qjBkp46h9H6LAqLOL9DvGHT/D7HCeUXKNgVzUUMmfxveINroRZIQALdYRFTToYGw3kFV/Rb3y0s
	DuxiTBs2/F7UyG/y3gxu7Ax3gb4Y7flxko8q/Q3zOAg==
X-Google-Smtp-Source: AGHT+IEd6mfVFRE2JODGafLw7rq0lwGIQvCTPwPM6WE2mfYH8QFTDre8uIJsUl0iiAIHMCRKhY0OOQ==
X-Received: by 2002:a05:6402:51c6:b0:61d:2897:b9c9 with SMTP id 4fb4d7f45d1cf-61d2897bc5bmr7607142a12.9.1756742113743;
        Mon, 01 Sep 2025 08:55:13 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4bbc51sm7285789a12.27.2025.09.01.08.55.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 08:55:13 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqemu: fix snapshot status log format
Date: Mon,  1 Sep 2025 17:55:12 +0200
Message-ID: <20250901155512.869106-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 15:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222667

The snapshot status is diisplayed incorrectly, in case snasphot is disabled.

Enabled state:
SNAPSHOT: [Enabled. Changes on rootfs won't be kept after QEMU shutdown.]

Disabled state:
Disabled. Changes on rootfs will be kept after QEMU shutdown.

Fix the log output to make them have the same format.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 827300080a..fd61f3b605 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1054,9 +1054,10 @@ to your build configuration.
             logoutput.append('NFS_DIR: [%s]' % self.rootfs)
         else:
             logoutput.append('ROOTFS: [%s]' % self.rootfs)
-        logoutput.append('SNAPSHOT: [%s]' %
-                         "Enabled. Changes on rootfs won't be kept after QEMU shutdown." if self.snapshot
-                         else "Disabled. Changes on rootfs will be kept after QEMU shutdown.")
+
+        logoutput.append(f'SNAPSHOT: [{"Enabled. Changes on rootfs won't be kept after QEMU shutdown." if self.snapshot 
+                         else "Disabled. Changes on rootfs will be kept after QEMU shutdown."}]')
+
         if self.ovmf_bios:
             logoutput.append('OVMF: %s' % self.ovmf_bios)
         if (self.ovmf_secboot_pkkek1):

