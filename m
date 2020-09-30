Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.6483.1601503962845832430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KyZOlQJw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id m34so2101946pgl.9
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QgdIr/xUpWRjSr8AZPZPhvIH0MP85pKh0u46eXVeFvw=;
        b=KyZOlQJwCxaJuGy3NRzDVwdWtRSKe+nGYjeBMXqFUEvacPKbb8Tln77LJia2eFuWnT
         lyIyv0BP7VEyiCvx49kQf8dVoR5az3Z58WoYujhtZWJExqeNH4kT5D5qUw6518m+HU4g
         uZS9ScUGsAZ01XGBXvg1jRdYTYqSB8gFFohZZO/GZN6ISASJoGW/ynxtz+FAiwqCJZFU
         p1cd9HZpFwi5We61HjpW5Jtbidly3sRKpEHzSzK7ftUiIQcfZl89RDRZPfDzj9P/RT5T
         rT5PaQ033XnbgPTxW/iJE3wjDc5NkE7dK606DkjehewWJG1KdVH8vJUN5agaK0TXb1Kx
         Noiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QgdIr/xUpWRjSr8AZPZPhvIH0MP85pKh0u46eXVeFvw=;
        b=t5Q9KgiKCCjPfMdrV3xGV8tMC+6OJYhhvArF4obtc4/biUfZg6nuksT1CR/HfqYcTm
         U+xfWfz/wuvXHZCeD7zDgIAopqb2BKNoRdL366ljbOADvaDdBSvHGZza7YHm4ZFOAibB
         3icQNCd66uBQf2eoCW8cdELZXN1JsSiV5qqH7MtUf/rhCiuy8Ew0Go5KWmQU6V0d/9a1
         Cue9fn1CgHAuojhzDNyRdql02bTyk7evu80Wa58dBAPEaMpzA5T5XFHMLohuzzV2qz68
         P34Sor6Mx8Aau+bt4Pqb7JX0CwXxKYfxrOgonDZL+WWMi6JW1+fJx/9cNU6385dm9Ci+
         0R+A==
X-Gm-Message-State: AOAM532hOq6wWwS3HoQO7tBuJVmwQhc85+OIt+qr26rkBIAN3A8PGw5h
	m9va89brJ5EgRe5LFX8h1h18Foji2Po5UuIs0Dg=
X-Google-Smtp-Source: ABdhPJyBcMn2GVfGv5f44xncRFj3+Vc/v8wYh8fyyIwbkMD1q0GGaMxspdOsfphA0v3XqODZ532vIA==
X-Received: by 2002:a63:5006:: with SMTP id e6mr3668760pgb.338.1601503961514;
        Wed, 30 Sep 2020 15:12:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/41] xinput-calibrator: change SRC_URI to branch with libinput support
Date: Wed, 30 Sep 2020 12:11:18 -1000
Message-Id: <9ef52d226a783557cdeb995df423a9ed932f3e44.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

Since "conf: Use xf86-input-libinput by default" [1] there are
reports [2] of xinput-calibrator failing because it expects
xf86-input-evdev and with the above patch xf86-input-libinput
takes precedence.

Fix this issue by using a branch of xinput calibrator which supports
xf86-input-libinput.

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc?id=2d005faff6341a81a2afae28860101ba9db51ae8
[2] https://www.yoctoproject.org/pipermail/yocto/2018-December/043487.html

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3b2302bcc1594e663183134793cf4aca8f4df41)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xinput-calibrator/xinput-calibrator_git.bb                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 4f831932e7..d2a16643fe 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -11,8 +11,8 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRCREV = "03dadf55109bd43d3380f040debe9f82f66f2f35"
-SRC_URI = "git://github.com/tias/xinput_calibrator.git \
+SRCREV = "18ec53f1cada39f905614ebfaffed5c7754ecf46"
+SRC_URI = "git://github.com/kreijack/xinput_calibrator.git;branch=libinput \
            file://30xinput_calibrate.sh \
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
            file://0001-calibrator.hh-Include-string-to-get-std-string.patch \
-- 
2.17.1

