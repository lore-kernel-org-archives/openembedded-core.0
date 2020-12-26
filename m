Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.19118.1608974869488872886
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b5S8WIGf;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id b2so5588348edm.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+rzhGLaijr0K5hYFYbMWqlon2tNWFAYmLr8w41Vid8c=;
        b=b5S8WIGfyKLPId7wa3NpwvCMHrog7ieScKJpJMwlqsmLMEw4C4Q+/M9edq9j74OyQj
         t12hoV8JqqdRgH0ypXCVb7GYlZQRMHmQkV3hPh1XzZ1Sf9D0fNU60gsoD3fAUzVr/MFN
         L2keK0ddNT7WlDe1YFgOrVSr1jlpEez5jN54n5OPbd+kYT1KppPnlUlBmgwdOlPiXZq1
         BA/E486Halk34BWT6i4lO1LvWKmYmh3iLyKj+Cz3EhzzgVh8BNUMaTFaZvBgXY2IICOI
         Ahrd5GaqlaFKle+iv3s883NuAiM4XQxQDrx/WpetbWsegHzA+B5/VbLI0oEW2/yJwYfp
         ULmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+rzhGLaijr0K5hYFYbMWqlon2tNWFAYmLr8w41Vid8c=;
        b=cnY46/Wiig8VTfV7qnNFcxRcB5ZI7G9lmnR5s13DhW0ojroM6DrfK0WBKaiTvR8Ysg
         YhtVkQuCZqAM0SBkTfmmryCg6bgvSMPDdRzAoHt32zTOCLscHohPl3+zkhDxCX6T0g/6
         JfksGxacxlw1tNJrL/xRUhw5wwoYp1WAgbcgt2fvFIwjXO+T4FWOUF/OobreXUTwNoUL
         9VE8pHhERDWQJ1rwLI4aV9TwnTNghE4/z06uIGGiZOF+MRzqkxA5GEZHXhtsXhZpMvql
         VOyWMTx+yZtM53d3FBkHL9AvBoRZZiBbjAo8ERJj4mwE5y0R4obm38hEiQ1F5LyDppZH
         1N9g==
X-Gm-Message-State: AOAM53159aDPk8on9yb3uUqPbN8cAVmAMBDFRYnYW0tuEWDvUer+sgkk
	8OFmezY4/cfmcvN8lkdVNkaYXT/BWLQ=
X-Google-Smtp-Source: ABdhPJwXNJ6Rq30x1CqXQC43/rkx4UvJ59XYbOfOEA/Fd4jyIPfxxTMd8QHj5yRGGxL7juC1VjWarQ==
X-Received: by 2002:aa7:d407:: with SMTP id z7mr36312330edq.234.1608974868177;
        Sat, 26 Dec 2020 01:27:48 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:47 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/48] epiphany: upgrade 3.38.1 -> 3.38.2
Date: Sat, 26 Dec 2020 10:26:51 +0100
Message-Id: <20201226092732.52323-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.38.1.bb => epiphany_3.38.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.38.1.bb => epiphany_3.38.2.bb} (90%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
similarity index 90%
rename from meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
index f9daa8bfe2..70148c96d8 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
@@ -14,7 +14,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.sha256sum] = "59b7576acb11fbb52eaca6dbf6fce28664de5c915ca2580c47f0b08ba83d2843"
+SRC_URI[archive.sha256sum] = "8b05f2bcc1e80ecf4a10f6f01b3285087eb4cbdf5741dffb8c0355715ef5116d"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.29.2

