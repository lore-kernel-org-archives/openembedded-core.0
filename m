Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.10070.1614349668459029557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yRQGVYrC;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.45, mailfrom: steve@sakoman.com)
Received: by mail-io1-f45.google.com with SMTP id u8so9749645ior.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nrraLnNj5BKJyoKSrqpWB3hBf5s49wuF0hNzkuDyu/o=;
        b=yRQGVYrCumu316PEHaG0TykxgkH2d03y9Ty9js8zwW1mt+MpMRFaqJsCbkjskLblJV
         6bj+602wn6+cjcFK06+u90sZRuxYhCzSobumA3UriguCfi/gw5f/dh7k8kWiKd/AueVZ
         1oftsuVo/pBGiGxO4dqV+F9+VzXgiut4bJXdHXuQsQwDy3fDouq2EqDgSbVMbdO1o2aA
         PTLgDZSAzsut43bM9QwGV6C1C5f/Qf72L2YZjbW2wNl8HBY4KFN2pmdMLPA8tTAPEz0X
         n1I+BqMPzmAvrm3HgZ8qdbf6STzstbyiP4ffuWLcyOUWRDreFrxa8q0Tty6nv0drCj3b
         KZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrraLnNj5BKJyoKSrqpWB3hBf5s49wuF0hNzkuDyu/o=;
        b=ljPf32NBaZrF/CE07E0cS+zkxjcWgRnaNPJO++Je28rp3bRyFAc1zCGLxIiO9dIe0E
         T8fCCa834ui3zc50zMYJ8xS6XzoEnpKhqtPk2LZz8/Bi2vpr3o0GLpjUhXdUs1A0KLs6
         FJVZ898nBnkQqaIJuxL03Q/rFkyuzgtFDksIWSzjNaM+vYobBI6BaCT4L6x5UGcSfhuk
         Gm9l64aNEf0ADBOHdRtBt+ynhbXDCrAE/Bya+8LbvqDvEemI7vprnmIJ5q2xKoweBMOd
         5kwKI0I1R1VC6nB+N35/4GMD+JR6nLPQCINbaHYjBJUGUfLT1Cy4Ckyou7YcJnemG43/
         w0nA==
X-Gm-Message-State: AOAM530IzE+zaM0Jwy+d0fO4ln+sZ7pW1BMi11VmYhWPKKeM+CsRtUFG
	0ayQhL5P8R5zIgMsj6sV1E4ykdFvfP8UpteS
X-Google-Smtp-Source: ABdhPJwRChHAxPnSmgFoffqBqJrzu+5hOyVhluSW1C/nvyTAeE4taMJA0J/TjBNz1IYLov+zyeYU8g==
X-Received: by 2002:a02:77ca:: with SMTP id g193mr2887996jac.41.1614349667342;
        Fri, 26 Feb 2021 06:27:47 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:27:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/40] weston-init: Fix weston-keyboard path in weston.ini
Date: Fri, 26 Feb 2021 04:24:16 -1000
Message-Id: <5b9cdcb3884fd999896fc18c55d3dc31c0f62f4a.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

The weston-keyboard executable is installed into /usr/libexec
instead of /usr/lib/weston , correct the path in weston.ini .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 56dee47a5ddb1da66d30f894a282d0658dcc930c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston-init/weston.ini | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
index 1e6dff68fd..40c5195887 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -42,7 +42,7 @@ require-input=false
 #path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
 
 #[input-method]
-#path=/usr/lib/weston/weston-keyboard
+#path=/usr/libexec/weston-keyboard
 
 #[output]
 #name=LVDS1
-- 
2.25.1

