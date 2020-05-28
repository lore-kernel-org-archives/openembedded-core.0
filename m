Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.10995.1590669656243225061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 05:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iAsuhWSN;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id o9so1490107ljj.6
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lix0uf/p5wO2Oj1gDbFG0/6buv/x52OzFXt9AfVQT+U=;
        b=iAsuhWSNnQc0/ZY/uC9OYR7u7crx32r/WBiZGec1RJW7y21Vq9DxbXkhMul8Lp5m9v
         dylEo1MHAbHSZSiWlkZuNHWffoY75eqI8fIykTDxnAvGqgzKNT/Un5X65SGHQ4878kl3
         d6taShntjefghSVEYbrpMTYKNrj+qOoBxcKt6fAUlsxPVgByPk0xbdmGln5TYh05VXHL
         1FIHO32j613q2rtqMvtomWsnQHEDyR6VdVXLnTznu/CeGMP7lKzFiWbn6RW+l9e1a97q
         nu2GjWCLj73NKI1dw4CvVr8TAhCR7E3BdajjyVzzg80tjpz7qQfiRsflTsg5/AgUoOKF
         Dx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lix0uf/p5wO2Oj1gDbFG0/6buv/x52OzFXt9AfVQT+U=;
        b=Uhk272U/+pvTLvpsBrCDO2k8vOoeIAHcCBdEdboLW0vw141bWYaKzIr6PeeVM8j6tR
         RL5D2Y2LrMCA+BRXdGvW13IROe8k6pO8aN1W283J5B/yN3gTW+wBCCXVQpcRKZXri15J
         hw2lRVQRGM5Z7O8JBfBB1IMCjpUDeSXy6V16Hv911iJ7A+h4yuobwwoMoGawS8Lmmog1
         BeICFx4M5OBZcNLbZVxKmy0Xk7G1xf+NtR/TizMQ5Nsz+uQeVsjKjaXnAihTttrtHonJ
         eAqOQf9b0jj1bJBgEqh+ACDXypgnJcc55KeomeKlpj5f6x1ld1qXRmrsmnwGhrS1SmsK
         bqzw==
X-Gm-Message-State: AOAM5303FlA+tbTv4Clg6iVp8yZe8YYos+aG302i4xYAA05tVYV3MAj5
	6q/e7VXtLdeHWRiL4Td5enBLfoLc
X-Google-Smtp-Source: ABdhPJwE1SSjJA0vNA6CBvYnR7wv1apMyoTGMPaOkzXjUsPdZ+3e8Mcf8XyD22V3ogy5j4voIaqKBA==
X-Received: by 2002:a2e:2c0a:: with SMTP id s10mr1510241ljs.447.1590669654179;
        Thu, 28 May 2020 05:40:54 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m83-185-47-112.cust.tele2.se. [83.185.47.112])
        by smtp.gmail.com with ESMTPSA id f14sm1412061ljp.118.2020.05.28.05.40.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 May 2020 05:40:53 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	denys@ti.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V3 0/3] Introduce UBOOT_INITIAL_ENV/cfg files fixes/coding style fixes
Date: Thu, 28 May 2020 14:41:26 +0200
Message-Id: <20200528124129.15100-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Changes in V2:

1 Introduce UBOOT_INITIAL_ENV as suggested by Denys Dmytriyenko.
2 Fix cfg files in case UBOOT_CONFIG is enabled.
3 Add fix for some inconsistent coding style.

Ming Liu (3):
  u-boot: support merging .cfg files for UBOOT_CONFIG
  u-boot.inc: fix some inconsistent coding style
  u-boot: introduce UBOOT_INITIAL_ENV

 meta/recipes-bsp/u-boot/u-boot.inc | 120 ++++++++++++++++++-----------
 1 file changed, 74 insertions(+), 46 deletions(-)

-- 
2.26.2

