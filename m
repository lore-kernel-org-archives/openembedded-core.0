Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.17617.1590940441466255570
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N8Q4quyn;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id e2so6838416eje.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h4EYv+/WUCcoBv00z0cLnMjBo3hQ9D06oUV0hXOVmVk=;
        b=N8Q4quynXE3sequigY6rnO7+39jTnB0TW2UzXioHkzf6v53ClSC5zX2qtvWUJ0wN7q
         b1BmIKfjEI5dWCu7RXMxqQc98t856suhxhZ40BRygSH2DaXn6WC8aMfQF8NGEgtXSZDG
         0vdQncUSP1h12ZjBCzIWm2XcAkb/kc7A3/1KAKfHIcUzC4UQt+EHxbPrmC00lfSvToa6
         1zvPBevHf5qJNFI8qjItJMN+J7q8gIZc252zLIT3fAlzv42KuPZOX/mROqTacRY56n9L
         AJ4xYBsTz6evxAJFF65LlBCU/KuAbZsfcTdevqgYuQ0+O4ObY/wY8xP7lG6HfVmUCopB
         5qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h4EYv+/WUCcoBv00z0cLnMjBo3hQ9D06oUV0hXOVmVk=;
        b=XfmGaRopZvwiq5F3XcjWqHn1G019ZkioAaiVQXVAwcHIRwQnriBnM/Zn/rTA2HhnFq
         nB7IHw+49E1NnAYcqXDhNY8wzw8tq0kV2rHBXadsXGsYSSUvJnCqmyC1hcarTWS8W6sn
         HdNLmcwh+HDvWCKaGC+j5ZwPu8T1Hfaci10fhSKjlwSU//NL0Dz6zFSKFzXxCU9PQeJG
         MZowakwhzjF7uC8vzx13KZHsGYLo282RuTIYEfIYKvADUp9k+KoOrTFETsC8zW1UOagx
         tZankbZqFnPjFf7bYqHDkuJdIzkO4D8F13Kl8x6vzlZvoiW1Kj/DUzTQJdcoaSpFXUmn
         s2oA==
X-Gm-Message-State: AOAM531O7kD1QW56LMg65yOfujF/76SvbkhZRvIwvf5s707lyxa6oRfs
	f43hphBYjx0ArwLw7geNQEASGDnH
X-Google-Smtp-Source: ABdhPJxLK+SPpgVqC4g08VcOnwrosDgeFim4gvRdOeSmIVQO0SFKRrMt6jxfX3nF9/rkQfbcgik6Vg==
X-Received: by 2002:a17:906:1c4a:: with SMTP id l10mr14918273ejg.499.1590940439679;
        Sun, 31 May 2020 08:53:59 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:59 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 37/70] alsa-plugins: upgrade 1.2.1 -> 1.2.2
Date: Sun, 31 May 2020 17:52:21 +0200
Message-Id: <20200531155254.10283-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years, formatting
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...lsa-plugins_1.2.1.bb => alsa-plugins_1.2.2.bb} | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.2.1.bb => alsa-plugins_1.2.2.bb} (93%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb
similarity index 93%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb
index d092b158f2..52dee30126 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb
@@ -13,16 +13,15 @@ SECTION = "multimedia"
 # license for libsamplerate, the samplerate plugin may be used under the terms
 # of LGPLv2.1 like the rest of the plugins.
 LICENSE = "LGPLv2.1 & GPLv2+"
-LIC_FILES_CHKSUM = "\
-        file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
-        file://COPYING.GPL;md5=59530bdf33659b29e73d4adb9f9f6552 \
-        file://m4/attributes.m4;endline=33;md5=b25958da44c02231e3641f1bccef53eb \
-        file://rate/rate_samplerate.c;endline=35;md5=fd77bce85f4a338c0e8ab18430b69fae \
-"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
+                    file://COPYING.GPL;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://m4/attributes.m4;endline=33;md5=bb8c6b2a67ac15156961e242fec33e50 \
+                    file://rate/rate_samplerate.c;endline=35;md5=fd77bce85f4a338c0e8ab18430b69fae \
+                    "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
-SRC_URI[md5sum] = "5b11cd3ec92e5f9190ec378565b529e8"
-SRC_URI[sha256sum] = "4d94de7ad41734b8604a652521200bb6554fcf0c2c00fdbd302b1710d76548da"
+SRC_URI[md5sum] = "8455e3c6fbc47f62f070afabc14ba575"
+SRC_URI[sha256sum] = "1c0f06450c928d711719686c9dbece2d480184f36fab11b8f0534cb7b41e337d"
 
 DEPENDS += "alsa-lib"
 
-- 
2.26.2

