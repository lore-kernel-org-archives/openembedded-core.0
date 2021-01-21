Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web09.4289.1611217053986309151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 00:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 15so1305207oix.8
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 00:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KN83Wb+Wglu8WTXJX5OguCGmkW5HrQPDAHEsorOIBsA=;
        b=VW3I2Vc62PyjksYey/KX6dai1/s2ldyhJXgjtB5WWUlEhbY7Et056ZV2myaTfHbzNb
         ORmuDToUI3JaChXWXyY6a/spPM3F0IuUMAOgqMPD2aBUp+rn07vWa+seA18qqrna0yIR
         Vtcfg5dor6tY+mWbw5rm4GaGwKy8VjTer88HRnMEafcFfC/RT/seVdX81MrZCtnK40Vo
         8/AagLoAmU+7QD+IBS2RDMVHaUUUle0+TGBZUAD8DaOxQJCeudDgaTitcMdJwQ2cw8EL
         0TNU31EXxMI2Kbg7/XZZcplJcfvZ8jl25Zduy/C3trYBHbIBdZRbwcoaZqxqpZ4QxHZo
         ZaQw==
X-Gm-Message-State: AOAM533DpBhO/s1DScffDoP43e7ozETSHo+W1aQwZl4z0PNUjmalUam+
	bV7hnSsFR/V6ZmeNYp+dr9bGR56RpkeOgHVS
X-Google-Smtp-Source: ABdhPJy8vwgCH52b6cpZLFdA/jF/sbY7elSxF77q0uxWbcWF9R9Qf9yPW76H+nFoJEnkgTrTBvtK1w==
X-Received: by 2002:a05:6808:219:: with SMTP id l25mr5381025oie.4.1611217052933;
        Thu, 21 Jan 2021 00:17:32 -0800 (PST)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com. [68.201.52.49])
        by smtp.gmail.com with ESMTPSA id r10sm865892oom.2.2021.01.21.00.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 00:17:31 -0800 (PST)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [OE-core][PATCH] newlib: Update licence
Date: Thu, 21 Jan 2021 01:17:16 -0700
Message-Id: <20210121081716.3715487-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- libgloss:
  - (22) New tcl license for csky-* targets
  - (23) New license for csky-* targets, states itself as FreeBSD license
  but text matches GPL (648365e0)
  - (24) New BSD-2 license for risc-v targets

newlib:
  - New license for csky-* targets, states itself as FreeBSD license
  but text matches GPL (648365e0)
  - (53) arm targets FreeBSD
  - (54) arm targets BSD-2-Clause-FreeBSD

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 meta/recipes-core/newlib/newlib.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index c1d8687380..0aba21fae7 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = " \
 		file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-		file://COPYING.LIBGLOSS;md5=54b778d585443cd7fbfa1b47cbd63a89 \
+		file://COPYING.LIBGLOSS;md5=7b7615de0ecda0ff8d705966ac3b8950 \
 		file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-		file://COPYING.NEWLIB;md5=ac17c68751aad7a5298ce3f249121070 \
+		file://COPYING.NEWLIB;md5=b8dda70da54e0efb49b1074f349d7749 \
 		file://newlib/libc/posix/COPYRIGHT;md5=103468ff1982be840fdf4ee9f8b51bbf \
 		file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0 \
 		"
-- 
2.25.1

