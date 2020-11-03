Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.6335.1604419499357743668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eK2l5hVY;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id j62so11975395qtd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nAk/ZTBAPUOXsydB28aYq2fDPvc/OzM1BBMZQcl98ec=;
        b=eK2l5hVYYmBPC81IQHDVTuH4umU5JRj1KfkfzqT7sgJssvOdDFj//we5pJRCa9G3P6
         ULNv4tZZ7MGzVxCr3Td22faolUIxtpaq/r3c/VFozKgNTYq+A5naV6HMOiYHgR3dnrAd
         8BYmQT9+zuux2LYMSjL2xBhqayiSaqdkVWgPxXHwSK68ya2dVjY18w+uQ5LgCWM4gOD1
         17ung32lNnTHZBYRyA0hBJeHZGPus+Q+G2wK6AYvJiT+r2FF4p1QhSaInbwGlKJ17uOB
         2GVeNpZehFv6O2LLW7cBJoK5pAFkGaHxlPTynvrEXPwVvx9U/xQrM9R9OVw/CqOahVLm
         hXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nAk/ZTBAPUOXsydB28aYq2fDPvc/OzM1BBMZQcl98ec=;
        b=jTC7FtyT7Xt3uJf7jWNjECWEDsdvaYZHMM6rq0STJoGl9HMWs6m02RGhpogRRctv5V
         LKWpbnQMwzKmYY8xVpYiAlLw9h5rOkNXJXPFkLIPE/L/85pnud+3eE42cRW+lo8IwuoH
         0zrphxucqirMvaO9c2OErhFhnJ4h2GUDYEn4Z2RIzi4vUHnQA2aNVh1cwVtXAp7XLf9R
         2tbZhZJ5En3JFNxqXRQZ2eDn07IVCe10pyFV8drRR2k2Y26wmUhaP6kc6hChXUUiYTTz
         GqDbASofQrSdkHw06ZmNwQovlGNoconpuFPeqW6P2o/nUEdnID+F7eQ90Bx+08EgdTOm
         3SyA==
X-Gm-Message-State: AOAM531VEGBGODS15WLPrY2lJXA2wdt03+a348wl4KlPXp2furfIB+Tw
	0tMD/8OnQRxwYqA4OWvUNMc=
X-Google-Smtp-Source: ABdhPJwALUIinuYPQHz3o9cYAjXdS+KId/DQyEdUHhxyPDSH9PA/+Ukf5WLWk1yoeLZf/S8ZQRwISQ==
X-Received: by 2002:aed:2b03:: with SMTP id p3mr16311293qtd.167.1604419498416;
        Tue, 03 Nov 2020 08:04:58 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u5sm10454809qtg.57.2020.11.03.08.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:04:57 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: -stable and -dev version bumps
Date: Tue,  3 Nov 2020 11:04:48 -0500
Message-Id: <cover.1604415988.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

These are the -stable and -dev bumps that I've been working on while
the release stabilizes.

Obviously, these are for master-next and post release, but I wanted
to send them regardless.

I'll do some AB testing, but everything looks ok from the local builds
and boot testing that I've done.

Cheers,

Bruce

The following changes since commit d0152bd6f5238894eb25d823aa6c9bc8602a396a:

  libxcb: Fix install file owner/group (2020-11-02 11:35:10 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/5.8: update to v5.8.15
  linux-yocto/5.4: update to v5.4.71
  linux-yocto/5.8: update to v5.8.16
  linux-yocto/5.4: update to v5.4.72
  linux-yocto/5.8: update to v5.8.17
  linux-yocto/5.4: update to v5.4.73
  linux-yocto-dev: move to v5.10-rc

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 7 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.19.1

