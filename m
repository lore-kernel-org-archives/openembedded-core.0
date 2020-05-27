Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.2153.1590600417521748171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 10:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=teb27L6K;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id l11so24911781wru.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 10:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhSH5St5k5QSobMiIvrjivNyzxcHRzgloon5qqbm9mY=;
        b=teb27L6KyXcfy8dVKIXjbThw44p91rwBEV+b+Bl+DJ8znfzFkZ+ULl6FAO5tYykVeL
         BZUeUNPvoCbDalyJNhIWANNaDbyGsTw/qX6z2ESglfIe1hcr27sUaBwi5+BcRmuVDWPY
         a775ksK5e1uF/zMciXe9S4xjx5qv7p5R5vcMN5fKIBcTCLAEHT1q3sCAa/E9fmIRXE8n
         0zgs20LX0NX2P+Gjb5RANetOypYo25dgpl6iaK4EcjVQBge5H5Af5H/4rqH6XpUFfOnL
         9L5WnH//gXuwrI/9YoxkLZdI+PP5unt9mbH7wxKnZi2qSflD7xSAkafXkVtdK8Kws5ZC
         gBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhSH5St5k5QSobMiIvrjivNyzxcHRzgloon5qqbm9mY=;
        b=QgMSppsuTkC0M4gi84R7c+/JRCz3ZXwz2v68dYeRPsFc189jUIbtGqSHz0BVlE76Ad
         egkrFyd1KzXhIsy+xmqhbU/jfIu1TjTxQb214rWA7iywtxvtEKQh0IGCsB61/byJlY2o
         fnw3/3LQoGckz/Q374P8L+x25akcBWe/UAivZ8qZ4usQ1YXDINj+nnEXi/Dv4K8s4oL5
         w3pvII3D0tKx1xTKLnYNxP/B4I0AtMwER6Pdv3KPlprr7iVmcSpgZ06FfuD5Os73GT2f
         w2amVTPmxD4qNDH0DCyojSz5cL+jmm2/GqOphRwLkAu4SL84J1BYertzX4zuPhd7CXre
         hHyw==
X-Gm-Message-State: AOAM531Hs/ia7T8pr33i//7YmN0H5I25m/o6sbbJODdUT8BJ7u5xZ1Cq
	dMfL1HtNASH/TgGKWC545KiM8jCZ
X-Google-Smtp-Source: ABdhPJwWO0/7mFzQ3FJMayyRsTOTaWwxURuJx5OrbpNxOp8ilD1i47u3x8fXjMUfupRFXLQ4fr+u6Q==
X-Received: by 2002:adf:ef47:: with SMTP id c7mr27980238wrp.57.1590600415749;
        Wed, 27 May 2020 10:26:55 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id w10sm3388147wrp.16.2020.05.27.10.26.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 10:26:55 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V2 0/2] Introduce UBOOT_INITIAL_ENV/coding style fixes
Date: Wed, 27 May 2020 19:27:39 +0200
Message-Id: <20200527172741.4319-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Changes in V2:

1 Introduce UBOOT_INITIAL_ENV as suggested by Denys Dmytriyenko.
2 Add fix for some inconsistent coding style.

Ming Liu (2):
  u-boot.inc: fix some inconsistent coding style
  u-boot: introduce UBOOT_INITIAL_ENV

 meta/recipes-bsp/u-boot/u-boot.inc | 76 +++++++++++++++---------------
 1 file changed, 39 insertions(+), 37 deletions(-)

-- 
2.26.2

