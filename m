Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.7943.1596636793298836110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=gz++HRo8;
 spf=pass (domain: qtec.com, ip: 209.85.208.195, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f195.google.com with SMTP id w25so12404719ljo.12
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xRRXUjeJJs5rUEVzDbnlYNySRso+rAbDE6w00UwQpOk=;
        b=gz++HRo8fXy1Zck/ohE5T1rVoEFXv6YO2jzIgpA9kHvgEjd9jm8KqX4SgtPHDWbui3
         9Rkb/AsFoQJc1OhH10PVRho8PkQCu4QtfRqwZZT9BxDijJhBTz4uYTmhi1siWHyliDcp
         F5T7XxCWzGOOlFanZd4QukDDOfnFQr1WzM8z/AbwGqHK/kQvW5BKEMf+SDtJBZQyfVxs
         CJzbxqizUbHPej6bHhmwQab65kjHPpaImFTHhqPMu4sDoy8IJ6jvYmKxqL9fPMDxlO3i
         9oo2KRWX38BVLruKNvH/RP4AnjM+VEhDIVVvzze1BSQvEYQ0EhSvMxmNYzHbEGA09PgT
         F2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xRRXUjeJJs5rUEVzDbnlYNySRso+rAbDE6w00UwQpOk=;
        b=Voy7dgh2REAfh5hSGnaZ7eFVdr6KCqSOcfWrNl5pHOl7PS3U3eBKeYiqDoGX5AFtg/
         PqTiAlG3Bw0HjoDl5cXYVOZsWWeLqTDB6YqUf1aWgqqOJQGD8wD6n8EJGKCw94XHjWxE
         oMZjGhMnedIs838WeC190A7CParZHm71IwsNVH1EXe8mgWh4oijPyJ0D47x0a+Jo7Ecf
         gyYpud+nz1HDCF37jzGd120BJU4WUzQpvHjzb7/MCfNpcDS/QXJaif94P42jdlvMTFoA
         1N3QqCYJ+pdlCLuYxfP7QuguhC6yiCjjTNwpbWBBwVpQzZrnva2wCzA2u8wRKE7OImFF
         vVxg==
X-Gm-Message-State: AOAM530wnC+P8GdwZVE+BGcpCtG00QDt2Q4ncTrco43nYWRfiuIVp3Zf
	DtRLqoUTWeKN4nlaH5CFPNNGXiev2gJdg+lVjuqLbragE7P5Xf6m8L0n7IHkAZga+Za9qGaHm6X
	FUurV8y0JsxHs9WqvLGV6hwa0hiIk0GZYvjYcjAH77tcVfs99OiQ01vu/gcqBHuVO0GvhP7lIAr
	mR+q38bl9ctg==
X-Google-Smtp-Source: ABdhPJyoIVZOLefXbhz36KnaNHHdYG3P6UnVXfgbRipLTLAUKw3vXjtZyc4x06ilXWmHSKG0yP5U0Q==
X-Received: by 2002:a2e:9d1a:: with SMTP id t26mr692931lji.297.1596636790815;
        Wed, 05 Aug 2020 07:13:10 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from turia.fritz.box (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id r19sm1155244lfi.58.2020.08.05.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:13:10 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] allarch: Add missing allarch ttf-bitstream-vera
Date: Wed,  5 Aug 2020 16:13:00 +0200
Message-Id: <20200805141300.624367-1-daniel@qtec.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

allarch is missing in ttf-bitstream-vera recipe. Add it and include the
recipe in the SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS list.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta/conf/layer.conf                                       | 1 +
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index c115c87043..1a01d02fef 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -71,6 +71,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   grub-efi->grub-bootconf \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
+  ttf-bitstream-vera->fontconfig \
   gnome-icon-theme->librsvg \
   font-alias->font-util \
   systemd-boot->systemd-bootconf \
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 70b32cf8f1..3e1ba196b5 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -9,7 +9,7 @@ LICENSE = "BitstreamVera"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
 PR = "r7"

-inherit fontcache
+inherit allarch fontcache

 FONT_PACKAGES = "${PN}"

--
2.27.0

