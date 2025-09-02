Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87146CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:26:06 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.71509.1756797958957056008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dNcz//uu;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: dpmin7@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7722bcb989aso2675638b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 00:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756797958; x=1757402758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pdO7hqiPIjFoiXbpbd6pJnaj5KEeqP5aR25VSqjzfto=;
        b=dNcz//uuYeAFa6SORMuDBNk89pVnn9oMA3NJiqAVMldffPerMc2dxNKtVnLfQjoZJB
         XkyiRCeVHSScse1XQSV4f0yI1lNCVDOh7hxoKNAGeM1edixVBdz1ZcUkXxopdHa4ws1S
         N2VMOqBy2KPFjIvm5UMCy+IefrGQJuQ7z5JL7zISnggGtRtN4+Zdc5eZrSHwgJyAiiVm
         qY2QkVYf2Fgas8de8dij5aKL6a509w6ut+rqQBgwvrRUa4M3GO6SMMvgIyW5JL3dOum1
         v5JCnxHrSQ1j4G0guAdtr98rMfp+N8X5WaiUxG36VzvlLmOUnw+gBRQDj28nfrO2Syp6
         wAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797958; x=1757402758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdO7hqiPIjFoiXbpbd6pJnaj5KEeqP5aR25VSqjzfto=;
        b=b+UqB8FYOInPvVJHcGt9w+Ze1FKQ6Sg2eAClH4aFkCujxR1go/GL1wgxc6ifCgoS9F
         3yXDmXivQ+3Ukc/x3C+yxoK4N2Xu6VLIOsdWy2lqMCMsBWEjr8H0DslOJBMZ6xXxukyz
         GbuVvIsZGXyqp7n0genURo1sJEV4tWCLp77PAKLjCFe2iJT9CB2IujnHwjeSfVEUXncA
         QjgZL2GmmwMvOWCi0hAV/qCTzQd0vV7qMnkceS8P8J3V8ypFcnLvvUWyFf1Fucwv6YVP
         Vxsk2uv7u+dt528kH0uq2JYWXJKZouszpa66fjRMV9qKYdeDtWb+acWx+ZRCsSBdpTFT
         Jg6w==
X-Gm-Message-State: AOJu0Yz7pJ87XWc868jj2wIXQmS7kphfvYqbNAq/shi+fLROtRJ/S/NU
	mg6W1bLgK/rCdZjPpcQosdDojHdDc43QinOGfXEkQ89tv1jA1Rg5h++Dw2X0Ew==
X-Gm-Gg: ASbGncv2uMB8awhz4OSeWu3ECsGlWWeUYeIRk7KCAHaCst4tKWGYSXwZ/0cg5ed+b5h
	SS5V2HfXEtmzIRagWtYOYyLNRgt+ibF3/D0x/J8nfyPHZbbEjVEFbflCdbgSTjgypV6YJVDiefG
	XG0HU9GCN4BEpbNxdb5ntfdeo/b+8QTvmClpw7/m4ZS8cKny1RbnnoelIMG5SXrlwQdpmT2L1Fm
	g5olU97BwYPKSv0OgDW6KqmM9OpKYjFFb04+l8nPF1C4vR38kU1iT2xAECOvDmDiKpR0XA29f1+
	QRIvvRleDPhwRJxzsZAFDKL+NOZf/TonUKh7rWTufVPSju7LMZcRqSAdZbLzfanFDF7ykvCm3eL
	9DQm5r864mAY=
X-Google-Smtp-Source: AGHT+IGHzWWWPiGrFXn2t+DNuPQWCCBhw7Vv9T2XmlyFLmzrmv6/kac32rZs46UQq41CWew4I8puxg==
X-Received: by 2002:a05:6a20:9146:b0:243:a373:a9f9 with SMTP id adf61e73a8af0-243d6f02e94mr15713682637.38.1756797957657;
        Tue, 02 Sep 2025 00:25:57 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4de04a9ea7sm8962830a12.16.2025.09.02.00.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:25:57 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dpmin7@gmail.com>
Subject: [walnascar][PATCH] pulseaudio: Add audio group explicitly
Date: Tue,  2 Sep 2025 16:25:50 +0900
Message-Id: <20250902072550.677789-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 07:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222712

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
index 18c12ede63..4708145bb9 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -147,7 +147,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

