Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web09.2571.1615661494153649373
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bbqsP9gB;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.51, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f51.google.com with SMTP id h3-20020a4ae8c30000b02901b68b39e2d3so2381213ooe.9
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AOUvaIgJG2PCvyWATVMK91zkW9NB2HPr1+LMjwcqvn0=;
        b=bbqsP9gBN5qSIcOkC8yLkaIItO1D8bL69tyDubMvXuL6CkmDPHQC85WOlQTQIfac6d
         eMhN7fiZN/QYg3T4eMXoRTabvtqwf+fsd78iMC7MB+uh7A/JNsMiR8+uFsGLL9kWfFEh
         PVWjsF2mrX81m66KqJBTVHPAwqp9SQXsxGM13wv/k8+rqzK9faOKMw0IotrrBYfZcZ11
         zY/QbqG8sdUcRIw7yqTk1emFyswKn80qgbaaWfnYkBARhqvF4MNLxLF+qOlO31n69f1I
         zKMiRbk/Yl6a2/LQQlT3DJouAGja3zOtgljJMI3Mt4hPZBbiKmdrXDd+Y0ZSmG2CrtfZ
         BoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AOUvaIgJG2PCvyWATVMK91zkW9NB2HPr1+LMjwcqvn0=;
        b=RrsNwlAHpjoPJ0Wu0RpRbTn8aBC84Vf1DMoVO6AZ1g4m+8GxnQdaOS1ff4lLk+SzLv
         SbJlQBoUZkUI55JF9UmRq6fuU4qhgnOJtU7ftB9IrnBIRA8Kes0+X/Oxjp7n372dBGsp
         Cau4rzM96IrPwfJPfASwzVaxvC32RfTswatZ+SEdmVE/Nw7edc6O8k0wqZc6tJzbgi7l
         QuQ/0xJNpeMWvnuH2rDtzXLGg5Hr9y+c4np5J3y53wd0Jb7I1NKacKL6nGnSvfaoWfAR
         SXJOch8dy4VfSGJ6AgwQmfrUy2zJyI9Uf7FkJwCcMmOYcM7Q35JZ0KQZHHF+j/g8B0Ur
         aYew==
X-Gm-Message-State: AOAM531ddu05noWE9iLWtKwS/2hS7lodKfNWBacozjKC/1AkZPmAHv9+
	fMq2T3sOW5cxbEuqNw3jP0CRcptZBk2yNAa8
X-Google-Smtp-Source: ABdhPJwMk8qKnfBrkpf99DC9nTowpKnxf6BNOe2RMxH11DNTOpk8xkkPd1mObdg6B9vdAz/4MU/3fw==
X-Received: by 2002:a4a:b987:: with SMTP id e7mr7948639oop.92.1615661493088;
        Sat, 13 Mar 2021 10:51:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/38] meta/recipes-graphics: Add HOMEPAGE / DESCRIPTION
Date: Sat, 13 Mar 2021 08:49:09 -1000
Message-Id: <317c817231d343e2707759bf9e3f9e986f4ee27d.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5ab087950ceaa960c29b0cad12aa716a50b50c34)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 3e1ba196b5..b75bd4c51d 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -1,4 +1,5 @@
 SUMMARY = "The Bitstream Vera fonts - TTF Edition"
+HOMEPAGE = "https://www.gnome.org/fonts/"
 DESCRIPTION = "The Bitstream Vera fonts include four monospace and sans \
 faces (normal, oblique, bold, bold oblique) and two serif faces (normal \
 and bold).  In addition Fontconfig/Xft2 can artificially oblique the \
-- 
2.25.1

