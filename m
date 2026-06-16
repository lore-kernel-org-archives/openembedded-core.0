Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD21BCD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:50:32 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.149133.1781595788576671229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 00:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BsI2nOyN;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: nicolaie.busuioc@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bebde89cfd3so514543066b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781595787; x=1782200587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qw2fLZxJyXchrTq+i4rH5LMaccGlhtdk6/knGxtCyak=;
        b=BsI2nOyNPNSRtxeSuXDHpMW/+Z9g1FP7HvQ6AANQM4nm9zFz5frV9/+5y/Lz+P2KBY
         Ubb0Spt3mu55Liessw3tYIrG/UMGxouxubvt8VWLgichYKBtoxkStdoAjhkVvAMDbKdX
         kLBdTRxQiQhUvk1X4iFlyyF518fC0qC/z6DdFVFZ7vXAmjL2D4vMViGjq0iPmGRnIyh4
         FFrws1q4/ZGW3L4LsQKnubZu/qrUIptT4Fno9uti+LLmzO2k0NbmyWJu3uSQwNenUGu4
         dZe1GQxEWRZ5huEA9mH57ITL6bD87baYc/R1AywgsmFTE6sagSwm/mKsGn9uv30JVp8h
         qnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595787; x=1782200587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qw2fLZxJyXchrTq+i4rH5LMaccGlhtdk6/knGxtCyak=;
        b=hmMWRAg1eCUchoh7yz3NhznjoYrAmk+Lq2hZAxmwjMsBW1FcoFhOkugtIW/XHGyMJh
         ELzWQj3zzR79f5MdoTmhDngf/DZ/CJmNPoL4dYCUba4SR4V2VJfaWlfaQ0AHjF6c/JFl
         bNCs5Y8sEOaOBS/+QmNEnYs2SOyMzb9gbbM1jXwiUXE2xbSnSHdlWsegb0d/UF1GPHKR
         n5bEELhhrF6v7q1aD8TLo4Zk8gPGPgvaIBh7s97gelolcspEvVirN1jZ71ZClQJESW5s
         PG72czNkHn7qmgvWTpQyFxMyJkbskEhGa3mmfClMh5Dby65769g/c8JGr2KU+ZQjCm51
         171w==
X-Gm-Message-State: AOJu0YyDae1A+D5YeBb1cRcbI8GZWYW3Tz4FHijWTG3+4/4ZClOczfHV
	ZspDENlgtDJhsu87JyZZjKY/mV847plQyaNoLeOqxrrTMyihjBMjAGiS4hZDrY3s
X-Gm-Gg: Acq92OGyZn1n8MCKLkKx6op77wm1SG+dytiOa+QdffMmxmS5S3H0bgX/W4P6KapAAMW
	RcdvuI2MGSwdTsOw1Av0tdAJR9tE9daMT4/ThChYXnzdFwg1m6i7TRadiuFj9fajrIScxICkFDW
	TxsQciWJd37+xN7D0dNxNJGNSOyVbdN1ClFaZdYcU7wbDEAkg2jklIK187UaasjC4UlXEyZspmy
	1w/1w8PSl/Bf7/d3zbZBPelkgiEol7XlmusYlnIkwKBTTed8DOYI79gjghwzhr5thDzJ+4WlLHu
	wCeokdiGXuHsIU8TXB/u7mU2vSjWL7pKeLLIOn8+7bgi7ZlEM7hUGE2SD2C6wGm3YJngSO/uYOD
	NP+u3TrYRFYhRmXf2wJdGVdYHuCtqi1ifGjLts4MVJfQNfDTutv/kDbiw8MtlNFLl66xOYyTpE1
	jmzp158WL9S9FsEVG7mtjImQDQGHBTIMoH7roKoeNVVEnWMxMufg==
X-Received: by 2002:a05:600c:3114:b0:490:c2a3:3304 with SMTP id 5b1f17b1804b1-4922ffc8b64mr34011685e9.35.1781595469146;
        Tue, 16 Jun 2026 00:37:49 -0700 (PDT)
Received: from LWI11014.lhau.sigaut.org ([217.175.200.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3dcsm39706104f8f.13.2026.06.16.00.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:37:48 -0700 (PDT)
From: Nico <nicolaie.busuioc@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com,
	Nico <nicolaie.busuioc@gmail.com>
Subject: [PATCH] systemd-boot: remove unused variables
Date: Tue, 16 Jun 2026 09:37:40 +0200
Message-ID: <20260616073740.95662-1-nicolaie.busuioc@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 07:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238876

Remove the unused re import and target variable from the
anonymous Python function.

No functional change intended.

Signed-off-by: Nico <nicolaie.busuioc@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_255.21.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_255.21.bb b/meta/recipes-core/systemd/systemd-boot_255.21.bb
index 397316fe9b..71b553eb5c 100644
--- a/meta/recipes-core/systemd/systemd-boot_255.21.bb
+++ b/meta/recipes-core/systemd/systemd-boot_255.21.bb
@@ -34,11 +34,8 @@ EXTRA_OEMESON += "-Defi=true \
 # otherwise install as the full name.
 # This allows multiple bootloaders to coexist in a single image.
 python __anonymous () {
-    import re
-    target = d.getVar('TARGET_ARCH')
     prefix = "" if d.getVar('EFI_PROVIDER') == "systemd-boot" else "systemd-"
-    systemdimage = prefix + d.getVar("EFI_BOOT_IMAGE")
-    d.setVar("SYSTEMD_BOOT_IMAGE", systemdimage)
+    d.setVar("SYSTEMD_BOOT_IMAGE", prefix + d.getVar("EFI_BOOT_IMAGE"))
     prefix = "systemd-" if prefix == "" else ""
     d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
 }
-- 
2.43.0


