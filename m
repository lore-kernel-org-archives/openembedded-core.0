Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.181508.1598214082253848299
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XpM9lywl;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id m22so9265864eje.10
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MDdjra0I8cQrwsdNY39xEEx24lyrwGBPTjD8oobyNCQ=;
        b=XpM9lywl+hj+3JcsJplW4pb67NmoLzdkHP3CEgAIzqt1BYIf28q7Bh2uc+nXhFcRIp
         VGRdKSOyf97qvlMY5wahNzj42vvgBxZTlLZ1EE3hyIaQKLhojwmmH3xFA5yQIkTtqDfo
         m97glAoOjvutRpvXuTfYf/QWJMnuea4dDFe37lu2trDVfPu5p9+vr66RAbKpshL0I0ds
         GW0jzqrQPrms2vlM+BwceNAY0HafpF0Tuh0Uhmdce45vOnQDO+F+5QsqE8NsIN89llfV
         RJ5of3AuXsvpe9m3V4Dnddktu+RuFcP6XtK8ynpKjKI3HH9ATztBGICG/qhpFTNt0wpR
         c/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MDdjra0I8cQrwsdNY39xEEx24lyrwGBPTjD8oobyNCQ=;
        b=EX2I1cVyBVgdm6j6lI4uHsys2aZDnhfuNqID8/yjyMxaF5XIrn9HZIaE/gQXBYNS5f
         2jJlBOABuHrXTBE3yjslZqbnD4q8dXuX/t7Ll4RYt+iag0JSo1aesK74oF3stf+2iHxw
         grckQz8hHELFKD7i58nXG5jkCXynqwaNi25EqAIDmwkdEN+JxHT+MejbvC6WdnJN6K8j
         KFhCkK6sMtmDI+IDdWxnnOyEdyeD5U8A0EVPGHYG07npR8FpJxPuT2VrvAVlBVLKPYKH
         GsXKQP34x2ACMaU/LUsHorHao0LysAHHcRymbD1TNqFnPS9vMsIlcf70RTMKYOkT6Fzz
         iBTQ==
X-Gm-Message-State: AOAM533H/5tiHyL21x0g1h+DxxxFA0s47Sb/CFHEZnO4vSsm1odHarFo
	gyuREj7FtntlKmiRxevjuignbVCb/3w=
X-Google-Smtp-Source: ABdhPJyC88h6xLFbMYB8Wumk5cWWGmh7HH1CWiVwCkt8+G+Tr0P4NpIvJoifskgyWfuCOJ80QUlxHw==
X-Received: by 2002:a17:906:37c1:: with SMTP id o1mr2651023ejc.279.1598214080572;
        Sun, 23 Aug 2020 13:21:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/37] libpipeline: upgrade 1.5.2 -> 1.5.3
Date: Sun, 23 Aug 2020 22:20:10 +0200
Message-Id: <20200823202031.24686-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libpipeline/{libpipeline_1.5.2.bb => libpipeline_1.5.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.2.bb => libpipeline_1.5.3.bb} (78%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb
similarity index 78%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb
index a182461607..ee15fd0644 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.3.bb
@@ -7,8 +7,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI[md5sum] = "169de4cc1f6f7f7d430a5bed858b2fd3"
-SRC_URI[sha256sum] = "fd59c649c1ae9d67604d1644f116ad4d297eaa66f838e3dfab96b41e85b059fb"
+SRC_URI[sha256sum] = "5dbf08faf50fad853754293e57fd4e6c69bb8e486f176596d682c67e02a0adb0"
 
 inherit pkgconfig autotools
 
-- 
2.28.0

