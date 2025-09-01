Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A809CCA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 08:04:28 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.46109.1756713862021451731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 01:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YpfYhU4V;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: dpmin7@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77238cb3cbbso1789397b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 01:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756713861; x=1757318661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SWzTELrpfpSJG7O2+nCWJGcVLWd3BY3MsYIG73WYMr4=;
        b=YpfYhU4V5cLDzkXuPf4Z1MvSXn2tjlua1JkBSNg6Avc4bpC2O8UdUPQtLNjIxLkJoz
         7cQTtYpwQnzJ32fn6Xkm8iYS9HSn8X7GlrH2A490bGT393A8PntBlSUHUe/TCYAysGy4
         VnnDRr9P0cizok6WsmnmsqCfgkTU/ylaz/kg648Ji2tCkQbZZTKgn991tGu9K5DDoTmX
         MOTcGKx1zC9aQcDXIHYkfr7/sy701joGtl54pDMOEmGepugxrg+SBRT/kj/JYJr3mcAg
         RNK/jvVDgYs1BNRYxPz3B3c4h6E9FrGDtxz+QV0iV36gcy7KLqI/KY8DycMfS/ZsAaDL
         EAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756713861; x=1757318661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWzTELrpfpSJG7O2+nCWJGcVLWd3BY3MsYIG73WYMr4=;
        b=h69VyApI3YfjQPKh4TFbOtld99iBe23eJLLjuiI4e9TmigUH2jCt2cLP6LVnHziSOc
         /q2VGgEYBJlOdVOrZzZ+EL9Q8Vx7z/6fVk5bj+IPF8pfmkEE20mGF4ox/rNV/puUFRLm
         Cbvt1PRxdc8fd6Lo3m2RLeDqdEG8IjhvUtGD98vb9pqgrfmfuIekdHaiPC0+XFG3nl/R
         mJnmBJTlJgVLcUSjIW+eS8CnygDoeb88ifg/SnT1FLIeZu5UtU/y9NR0FhJBtT0zJvlr
         gCK3I5ELRj1YTTPGkXutmoD21UAohQsAtLIf5SO+Xoo+Lfb1cCtBxVRTdosa9LzOHXy0
         9MNA==
X-Gm-Message-State: AOJu0Yx3n2mCdOn3bTSawslAB+C+ZR/uG/JDSt6DFx/nZPvpkKmQK7MS
	hjJSR9hQZwrpPUujucoapUZ1Kwcx6ooaR6QmEyqU/zQSmbTTW1fIxFKgo+s36w==
X-Gm-Gg: ASbGncvQbKPY+5btHwAbCUHTclh1Mt3fv786/r3PEkJ9aEVoBZ8c4ykMCLLtFCMiAG5
	bztMog5YHhO7q0vzCZ5ANWpUVpBqz0SmbFWQuj4wgE0n+QUeIKG9NJKPT1EIVz5vJAwYczb92o+
	aR4QAIlE5STMjPjsWQHu8rpfKUib1dwdquRAjRivy+CzEjaVPEiHctgOSwnlkDlwIpNvvQDI0rP
	opiMglvamcxXcr5Bd3mGANiwo9Hnt0y1ydPJrPbBe1pgt+w0Upa7cYbuqS/3aZYkcth7kYoyzqy
	PlGdey64uoSE6EUj+y2vkMdCRWx1bJK4BC/r9qp6aYGo1r3hv2TTaal98nvL4sfFpAm/QM08roF
	QOnhhunrHJuKQCIsSaNhaqQ==
X-Google-Smtp-Source: AGHT+IFlsB1RItoGoZfUQKBHmXdop7KYZJ/yH6ZyoLJ9ErRgXY7uSAcr7temW/RZtc+RmVmnM1ZTJw==
X-Received: by 2002:a05:6a20:3ca8:b0:243:15b9:765d with SMTP id adf61e73a8af0-243d6f8822fmr9328665637.55.1756713860755;
        Mon, 01 Sep 2025 01:04:20 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723d79fed2sm6580419b3a.9.2025.09.01.01.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:04:20 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dpmin7@gmail.com>
Subject: [scarthgap][PATCH] pulseaudio: Add audio group explicitly
Date: Mon,  1 Sep 2025 17:04:13 +0900
Message-Id: <20250901080413.893596-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 08:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222644

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-atlas-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 1ab3831519..a93ef8f338 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -146,7 +146,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

