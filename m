Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web08.3854.1603919168770859766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PDwCrDKY;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id k9so957264edo.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xxwvAmjODxetpdEKjwFlZO6ajNue1Qj3wEXZI6J0X8=;
        b=PDwCrDKYSfF6fxl1o9zRNjKFIdTBtPrkP2XtkRLT/K0ASnSl6Zjv5ID3Hst0k3YCq+
         3mlHFEZ9xvdqfXq6yDoIk2kztIqG9cPSicH2vwBklpEKANjusV07H9jetTZeacNu/7mN
         pDwesrMrDtJTEDaratv/deFzbAhiRa3RCd4yut5MpVNxi6OPKs0Cv9cifjgUeU2B8zQx
         MAZQpf10qRa3Rz9wl1sN7Hx9ASfx1vmAbedZDpjx6RC849AitKdI8GW1tZULzbe+Py34
         VlBcek2BfyT8HxOvqDjneikDtuP4Q29okNXB4LlkbCpZfHvfFGomo28oGQhysqh7mLu5
         Ib4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xxwvAmjODxetpdEKjwFlZO6ajNue1Qj3wEXZI6J0X8=;
        b=TbKg0NjJn8zDMr++Lmq3FM3Ql0x0kaFUKl5FX30LLS/5v2JXk42kZhG40vq58zRJT1
         qRPzFZXpPpIPRDxfRGgnEZHDqDNb6eEcA+sIJI83x0xTYLHpsMryptOc/kZyUrm41bG6
         DU2zP1WeTuoS9M8Z9UtAYbCOSROpNkae/rX3xhBon6hHmb3ljr9mLzj21dK0W8AxSml3
         nidiP8fdyc30G6ekYbVeSaZoM+8Hm4XX5EIHnnJxvLycpZbWrrFc3YxCBUJOMsgPv2Ev
         K1PnT0Ir7Reiq8n6CzVZeltbUEaVYD7FSkMSUrlb99yghL2I2YViDnaXQ2xqyopwtMUK
         Fdow==
X-Gm-Message-State: AOAM532TCKGih43zXBUMiF1XModauCh0ek4lbSVAeCsndxOouwWU2S3X
	nqTlSBY1b+pU38yRAK1pc0Kxi2wbiN0HPQ==
X-Google-Smtp-Source: ABdhPJyK80PrJ4qeGuolFkn5hlGuJu92wmH6CYMxXSCn0oe4QaF4n9EMWFzEJZfqFU3vC1ZeHH7Ixw==
X-Received: by 2002:a05:6402:1d2c:: with SMTP id dh12mr821020edb.256.1603919166995;
        Wed, 28 Oct 2020 14:06:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/33] systemd-boot: upgrade 246.2 -> 246.6
Date: Wed, 28 Oct 2020 22:05:26 +0100
Message-Id: <20201028210558.21070-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As systemd-boot shares SRCREV with the main systemd recipe, the version
should be kept in sync with it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../systemd/{systemd-boot_246.2.bb => systemd-boot_246.6.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_246.2.bb => systemd-boot_246.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_246.2.bb b/meta/recipes-core/systemd/systemd-boot_246.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_246.2.bb
rename to meta/recipes-core/systemd/systemd-boot_246.6.bb
-- 
2.29.0

