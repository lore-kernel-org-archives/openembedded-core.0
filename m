Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.10572.1592494947213226086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Mb3LdiXC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id n6so4902274otl.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MIPc3r0GpozMdmzcuU3Hihe1kxmvNCzRA+IceCIMd20=;
        b=Mb3LdiXCFqPV8dfS0OUW+B78IRb280kMh6Tv0rNbtpwwy6RTJJEXyi4OT9vgVb5d7b
         1Xvckf0PpkMWsWfT/4UQHDHYB1H4dON1L/KIBp8XxeDCG2fMbtQ+toOcrXyc5A/tfJqH
         dpjAtoJ1ZjuoD+jYSXZKAnBELkrcGBZF2IYLImHA7twDVHTvmI/FCPLXTnY1AaPah/be
         9iFJJ00OWH8op8rAd3H9RC1/3fTZvFTYiLySi5FlXc8vylE/0AzH0BhBqr85DQrDDV8w
         3qHD1fdWwMZmJltaiVvl7qMlG6xsPrCmsNva4DAw/Gw/6XYiC12twEFYFVBaPLZKGALK
         0bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MIPc3r0GpozMdmzcuU3Hihe1kxmvNCzRA+IceCIMd20=;
        b=SSg+3ow6vwy26J893xlPvy4r1cVxPUxQVapD64ebhkvwIcUp4MAPnk7zC6L+212DFh
         4ExYF50csxapUVYAl7OGcOM8brGszYpVqgK+VBTqSTPiotQsMQUHtMEL+uXvjXxXwwVk
         FIU8uIb5wHh83RrZk9MMFA/pi/+q/zpKZQzWfhbx6jx4KTvQOgOJailM0w9cJxeMwEQs
         IjH/smXxpmcOISXLnFJmDbq6MF1vc7Hzvyg9x/+TJCv44qNcc9mozef9kP8Pxt7+RvmW
         Wn0SWsjFYFkn17ns6Io8k2SMZYo6ktJGzFwKzga/6ls5aa5nhZs9TGOuTEUdFdGP3WCC
         dmqA==
X-Gm-Message-State: AOAM533tpHpBYyOiERXxmzUQp704WvijPOyYjnOXd7uI/2oLMQfhTWsK
	p1KAQd6gY70XbDZiCYIdvzanpabQF1obfg==
X-Google-Smtp-Source: ABdhPJyd1qEXk/8nmKBM3kgTz9qKrrNjHhVJtobk9BRJ4fx1jIlvwc2JZFf2gZmS1Ar0shOlDYVTeg==
X-Received: by 2002:a9d:823:: with SMTP id 32mr3932229oty.314.1592494945926;
        Thu, 18 Jun 2020 08:42:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:42:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/21] at-spi2-atk: Remove -fcommon
Date: Thu, 18 Jun 2020 05:40:41 -1000
Message-Id: <a4f975a0bca892a7c0f0d496b76ffb30e469914a.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Adrian Bunk <bunk@stusta.de>

This was fixed in upstream version 2.34.0.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9562c93799a37cd18aceb6f24378ba02a69865f0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/atk/at-spi2-atk_2.34.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
index 6947559200..c297912588 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
@@ -20,5 +20,3 @@ FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
 FILES_${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
 
 BBCLASSEXTEND = "native nativesdk"
-
-CFLAGS += "-fcommon"
-- 
2.17.1

