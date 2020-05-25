Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.41065.1590446262193781294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zwFbM30P;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id l73so4154631pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EFnO2+ilI+LdMIN2iAvisOOaiv+4TZxGGswqO1sA0Uc=;
        b=zwFbM30PVxKn4At/X2oYYT6DEV6r/+IRfA6Ogc0SPRZpMSlxfpvLxiCuPm+qChn0Rz
         OSPssIT2H+JJw5blkFuYRBEJvCj5hn3Q8Um04uvNEHkLed5mPbItmA9vYpi9RvWGLe8V
         ndJ3gK2HaUaSGXljWLxwD6MALgnlgVQP7BMjroJaF9dgzwS16KZ/G3eVYw1nSv+OmOxZ
         YGPQGNRIdXrNgjP3FXHHJR9047MEcnVB6iGBF5m50NIs1hHmFuC8FL/h+mFbs5psNG9k
         Al7xhnZA51dBNgozRmOAbUx2mu1HqihqwvlYFtNGi/7obAFDMWFbdpqaJtl0PqWiSCSF
         MFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EFnO2+ilI+LdMIN2iAvisOOaiv+4TZxGGswqO1sA0Uc=;
        b=iKExuEyNK7eoi3I6ZhJPP5H8qWcwgdoWJgqJk8uLh4JAjbXNEbb65En2zQv7L1E9m+
         oLC7aFxJ+ZpLD8nEdUUlsXDtHAlvas5lKNaZA0tCQKMJupCh5eGd7SvftYAotJuRfs2K
         GPq/40b3o0i803AU6l9RaPYMAqGLDQtgJLnBqe5LgXSVRL3oNmrwFQQgp53tv+a4EiCB
         G2B7fSlAdfU3TuGKcR6N+oYglrsZfJIzW/U4D6O+NosgVzcwDc6dmzvI2iYKIvYSLwbY
         1iiSwv2O0zXD+0+r86ONb65IO/EbXCr/kq6PbDLl0JhoA3rPs9adaLCz69J09Xp34rg8
         5vzw==
X-Gm-Message-State: AOAM531dWljcVz1vbi7+MrKBtBwY8Ck+op7j7owqaBL0szUQU+heZF0l
	vJN2durcQPopeeFlwrI7d8Jjg5TJu9I=
X-Google-Smtp-Source: ABdhPJxwrdpj3pWsO1zZv0+b0KiDMSgYFI/Tuz+89kUo0VhkYmpLNUjVg0hqr/T2IoRe2GTKXu0rYQ==
X-Received: by 2002:a17:902:9d94:: with SMTP id c20mr30018332plq.224.1590446261291;
        Mon, 25 May 2020 15:37:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/17] libubootenv: Depend on zlib
Date: Mon, 25 May 2020 12:36:55 -1000
Message-Id: <dc5babe9472ba7379edbb17b6cbac44604606b26.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Marek Vasut <marex@denx.de>

The libubootenv depends on zlib as it calls at least crc32() from
there and links against it. Add the DEPENDS entry.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Stefano Babic <sbabic@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit db513f9ec59b7ac526b2cdc42b0eb2573e134bc4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index 3251d0f05b..fa90a12bf8 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "U-Boot libraries and tools to access environment"
-DEPENDS += "mtd-utils"
+DEPENDS += "mtd-utils zlib"
 
 DESCRIPTION = "This package contains tools and libraries to read \
 and modify U-Boot environment. \
-- 
2.17.1

