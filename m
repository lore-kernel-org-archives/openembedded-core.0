Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.3912.1603919192192692398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l/H71zLX;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id l16so975832eds.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HQV5EZFmicA9RajJHbWW4Upw7xmbCWcS2maq1KwkkxI=;
        b=l/H71zLXJt+wpnIqPAmYki4eFZgNfciVGhDGGXrwq77jt1KE4ISuL3tqqxj/bdyOQn
         1x2oI/+hLhSiUJADYHs7ujwyRnIHRhxih32TbhdnPj6Vzp4VYOoQr4+Q1dr/yAqJoFDg
         j6tEGHtnTH5antBu6gLFmUDkB40gAP+flLzDklLm38Q0+hEqrXhYflUs+AyPrRJx3eYd
         L5oMFXu68ji2KnHRweGOG4BMN+yDcv0tD4Wnk/kltvvlVhdlCRiTkbwUwPLsIdm7HDNb
         8Me9EqpctWy4jzGv3m6m8eW7u+94H7Zq4vkYpmBuqcfnfubn/FceNNas6+ivaCRyJO7v
         unqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HQV5EZFmicA9RajJHbWW4Upw7xmbCWcS2maq1KwkkxI=;
        b=OjzyLLK0HWTjX9UN85YTnBeUEgDC7j3uS6XF91lahBxcSYPplgAFOn+9aye6u1jTU6
         U7BYT3hsf3eVbvidbbvLfnFRYkWYv1Pdu2oWy+fyIyiV0MbCAwEvb1udJEc9ikyuBO3Z
         VoYGPlMZ0RN7iZzffBILc4Ii3TL/H33n0zccoOMm5PMfRUi49uTs2JoFDAQa8OhraZIY
         Rtolh1MjDfeamh/h1MY20ptmpdUA/hi/clgwIAvPH1x0BwI2H+qbdxDhGxJhm7HZUlaR
         ndwcubYOBRWTiXIMIGzC26wg+6mmAM1JzECUbGd+4v5OgC36axZSF+LCixobn+BRGRN1
         zdVQ==
X-Gm-Message-State: AOAM533P4y5xQMLLqRl77AyUCubox0IsBj4FAKTMrSDt3sIvxzSAHbly
	r9mn/L2mncPKCsy2z7w4nEKmb1pk6mKQfw==
X-Google-Smtp-Source: ABdhPJzkTxFqv2lQhMfX7JjT5khWXLdHI2eDGlGV3rUeD26B9XhPEKKp0vzQ0Pkjlf+07gL+LXKAHw==
X-Received: by 2002:a50:f0c4:: with SMTP id a4mr787835edm.289.1603919190603;
        Wed, 28 Oct 2020 14:06:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/33] gtk-doc: upgrade 1.32 -> 1.33.0
Date: Wed, 28 Oct 2020 22:05:53 +0100
Message-Id: <20201028210558.21070-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch       | 2 +-
 .../gtk-doc/{gtk-doc_1.32.bb => gtk-doc_1.33.0.bb}             | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.32.bb => gtk-doc_1.33.0.bb} (94%)

diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 5ca4e3e086..1d260aa72b 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From 657310f3842c84d28f6b77e8ad4d9b93472ca5da Mon Sep 17 00:00:00 2001
+From ebb0f7313a0931f646e86badce2627eff2fa37a8 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.0.bb
similarity index 94%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.33.0.bb
index 1eaf370ab0..3f6358271f 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.0.bb
@@ -18,8 +18,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 PACKAGECONFIG[working-scripts] = ",,libxslt-native xmlto-native python3-six python3-pygments"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
-SRC_URI[archive.md5sum] = "07764836262e154e94922e5f2aa476ae"
-SRC_URI[archive.sha256sum] = "de0ef034fb17cb21ab0c635ec730d19746bce52984a6706e7bbec6fb5e0b907c"
+SRC_URI[archive.sha256sum] = "d5e3b3f837174d246fa8482455740627efec1e5210aa15d0c7989ca68f72bb51"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
-- 
2.29.0

