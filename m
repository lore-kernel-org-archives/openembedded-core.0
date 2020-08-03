Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.12806.1596464864106974219
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GnjFbjcC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id bh1so7639715plb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pnocu2Y86SNa+Lh7mU3O//vbiFNgSPsMCprvn+KUihs=;
        b=GnjFbjcCQVu1ayOTDYom8Bo1MhLunzYAxrVThKsV0O8dyFUJZ6ZSB42V/tszC/zs/H
         PxHdZXfddIwob5qR38DQd8+UVraQM8qBkrKj/BLynSjNwHuHCfcOYq6rnx49886O9HRn
         t77wIwoqwocahc75oJMb4q5HjcZQR7r5v4htvXN+H0H8yQAYn9czaLuYOVSC9UgTKj0L
         kF6y79HnOGrqUrE9WCAinLm5t1KLapf87Sry6sydf7BsoYFAfzCIWEzSgWgCP0SerRfY
         dMNvaCJlLT70jyAHNw8BqGKA2JpU+Do8qwGIqLfSVNuZ8rec1Zm8zwxWOeGpToQl9LsV
         smkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pnocu2Y86SNa+Lh7mU3O//vbiFNgSPsMCprvn+KUihs=;
        b=qEdoS7zXB+iWNOG4Ho+mgPhokDikPaP5mewL2aNcIQPZ4wTogugHOKLZezuKdjyyKK
         zHBiW8rNKtMRdUMWmnwiofFnA7oFlR/LDLJP5DeBltFVX+/AhzSsaLWI+wDDaYsUyFtn
         fUk8hgNMp1V8Td5cya8xLvOLcakXVzWRFJobyrDmpYKRjV9lvXUmDbbsxpj0fpf4KVxk
         sYYUDhVCeKqilMckGra2J6k4jPTPQcjI51KrKW5VrcZndEjKOmAmQQ1InPo6blmYhMCv
         JUV00bQMCLaz87qkHHHdRKyVzOVu3hQ3DHN6Vx0D2t7HYyR9fOg+vsu3T24T8QZRWNRx
         vNXQ==
X-Gm-Message-State: AOAM530+yFUbd2OkvB9rQvvsPU3lHR/A/vPQgsbYxQSGMFuC966+GxYK
	2juYUDmy8sN5/euujw0tYSY3ftiYyuY=
X-Google-Smtp-Source: ABdhPJwgwHNRT6K7CENY/IkgVm0r4Mp+cYH2b7ztXtSveCuUv7Ui2lVaKO3wGBuH7Q1UxLGdxnW6UA==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id lb14mr5428756pjb.228.1596464863191;
        Mon, 03 Aug 2020 07:27:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] gnutls: upgrade 3.6.13 -> 3.6.14
Date: Mon,  3 Aug 2020 04:27:02 -1000
Message-Id: <26f34bf4f4be1743c03099b842916f4d607e7ed8.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Security and bug fix release on the stable 3.6.x branch

Fixes CVE-2020-13777

Detailed list of changes at:

https://lists.gnupg.org/pipermail/gnutls-help/2020-June/004648.html

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd88c81804a4a52b9875f2244c9f35911539be96)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/{gnutls_3.6.13.bb => gnutls_3.6.14.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.13.bb => gnutls_3.6.14.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.13.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.13.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.14.bb
index f56d42a613..a285e5a1f1 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -21,8 +21,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
-SRC_URI[sha256sum] = "32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38"
+SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1

