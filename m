Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.234.1612800041462591199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 08:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kh106Jxt;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: akuster808@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id y5so13198483ilg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 08:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Vn+O0LSMq+Gnt0OYDO1JxeRebf6NVDp7P4QX5QOAaGw=;
        b=kh106JxtxPUyNWe5ktQlg1FJGVCLcGGRlZ2FwWBn8ul0sRcUuNOu2WfAstEGbpLOWt
         Uw17CvtU29LZ7ewChhixge9rt9qmr0Ub7n759J2v8X0zkN47dcKRzFV3v1709mkyYUJ3
         Lf/EOc1nJQ9EZ/1XsJ+TiEGuTNj4jFESsWFmqKwqWMb/tGlB7bZpVtl3Fif/EGlxW/WJ
         BSQwE/y/5oCztZrdFnLB6o6qBjt/yOyPepEPAVOrPHpax2l9z8eslObsA3if83aaHUlY
         BsWFp/0PEulsmJtiWfSYQOV80rpT6COU16QJZONw6Bswr0c1+srtMKnPvGpeL5IkBOGX
         ugZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Vn+O0LSMq+Gnt0OYDO1JxeRebf6NVDp7P4QX5QOAaGw=;
        b=jK8j5RoTiWB0gtz9SrQIDJX1tDjUsH/D/8x93HbLTDA9IQMKZJGGd83/ed6bV2HJZH
         XUaI8rAAh4xWCfFAUdY+gDLvu1hnIfKNKwe5smML3s+1F/kQNE7szU9Hf5H+BQz5FtML
         /+QSB1Y3lYniKfm6Gp5IP0xOT7QynU48QNGclT0rfzSPM0tc6sDkzXgNbwNDVSnTVL7y
         V0cViF4rsKqNIEMc4pBVeRD9naYTOrgsJ32IuTw60RpK7Zi00IS+feOxUvaVwbKrWh/U
         GWFCgNE+91iFWf3rLC8H1WE3q+r3RnUjwPA55iHFPnEKbI5CCBrprBEZyfrs02+whFul
         CJ6Q==
X-Gm-Message-State: AOAM530qKiJoa8o51sf6ixTw2sP46zgotvENCcuX8CBVornpNP5CHCvx
	BV7f9yD5B87q9Erb2tZFXjfQQCFNCslviw==
X-Google-Smtp-Source: ABdhPJy3R/2cNY4ft4GmKE0UTNmehb+JxIcHiGZrR9KgTwJkMFlSOj01/aAA3yWIqeCFhPMDHZrfWw==
X-Received: by 2002:a05:6e02:152e:: with SMTP id i14mr15991407ilu.247.1612800040611;
        Mon, 08 Feb 2021 08:00:40 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8024:4784:a3c:6cf6])
        by smtp.gmail.com with ESMTPSA id f15sm9001926ilj.23.2021.02.08.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 08:00:40 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] p11-kit: upgrade 0.23.20 -> 0.23.21
Date: Mon,  8 Feb 2021 08:00:37 -0800
Message-Id: <20210208160038.22410-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e811db2f614500f16415fc09801f229968428e7)
[0.23.x is an lts release, bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../p11-kit/{p11-kit_0.23.20.bb => p11-kit_0.23.21.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.20.bb => p11-kit_0.23.21.bb} (94%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
similarity index 94%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
index 4ba93f998a..b1fd2334b2 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
@@ -9,7 +9,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "762cdaa2cd5c5ec09cc844f9a6bdc551c7f6c8ed"
+SRCREV = "fd8b56f3ee971f94dc6fc95411fc01e1c12153ab"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.17.1

