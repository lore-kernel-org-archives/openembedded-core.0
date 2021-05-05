Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.9830.1620227972940735358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fG3TZD4l;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id n2so3454406ejy.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lg27Tt77Is8KWdqlRWp/EFonWqQSp8piPJbENy6ZmBw=;
        b=fG3TZD4lDEa5yqEmAhritnA8TZ4NvVnZU+99fARxT17WrJ2M5TbOxHELuF6OoPCFTr
         OvLu8ca05KrKZAxFygOt+UiilUj9TWV/3HddEE0p+ePu7Ur1rJZvwGORvRLGI8FQLJLi
         e6EXXO652GwfOdJEt38LsYZ3BYlZv+fHO1nhLV1QLu/0JQIW41st1E/JX9JXhJ54eS4x
         Sct1mL19mZ5gJ2Y1I+mhmbBpJ6KoQNGUCiyvPg+sTKNCU8pc5F/3EVpuPXo0ZGV561As
         wgBgFaE4Lz2dUt8hLsD9+VuUc7gBogW2kcIeD3hvfPDSIJBMa5a8mTxMn0BapaiYVgFK
         rkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lg27Tt77Is8KWdqlRWp/EFonWqQSp8piPJbENy6ZmBw=;
        b=fDrmzIIePc4TYVn5N9XHZR+XHoGcqNVq2d4bCML9o1vkjnQ/jeHVnuo0A/08wC7B9Z
         3YEiXXXC6E3QEbt1UpiUxG4QQoCAGtF/mDLFOOF8Tl5NR4mIOU5av6ZR3Xyad9QNwsxG
         9EAo3E+jfCdOI7FEJvbDoNlg5eaXCUTA76Iw51je2hffv8081MP2O8Sp7gjZQoHkK4e9
         NbJVSdlWGQrGBjJ7jSCYWw4HSKtRrUG+qXhoNICfNGVzkVXEYWE28MUanLKHceH5/RjS
         a6UFMOitLESq7ZTMXWZFS7MS+wm1jx6vVPYtDs9l+PNUBQB62sSlhy3S9DL/FEkHJSdc
         yCWw==
X-Gm-Message-State: AOAM5314WpWep5et0Psi2YVnDZcE5fqNnDf47xTfjC8phoKnztG/wvNc
	ujDYKpWEDG8RyvvKaMoS1Elv9kuVF01XmA==
X-Google-Smtp-Source: ABdhPJz/ZTQN1a0njjSU/qAgbKUKA4VbSvmrlg2vKLk6NnNAVvgmXdag5D/Te5cNH+0xiBrf4l4K9g==
X-Received: by 2002:a17:906:f6d0:: with SMTP id jo16mr18332974ejb.461.1620227971556;
        Wed, 05 May 2021 08:19:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 45/61] pkgconf: upgrade 1.7.3 -> 1.7.4
Date: Wed,  5 May 2021 17:18:34 +0200
Message-Id: <20210505151850.660512-45-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../pkgconf/{pkgconf_1.7.3.bb => pkgconf_1.7.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.7.3.bb => pkgconf_1.7.4.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.7.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.7.4.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.7.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.7.4.bb
index 12496c3849..93832105f0 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.7.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.7.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "b846aea51cf696c3392a0ae58bef93e2e72f8e7073ca6ad1ed8b01c85871f9c0"
+SRC_URI[sha256sum] = "d73f32c248a4591139a6b17777c80d4deab6b414ec2b3d21d0a24be348c476ab"
 
 inherit autotools
 
-- 
2.31.1

