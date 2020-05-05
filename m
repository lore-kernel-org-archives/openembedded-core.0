Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.7080.1588683731108655445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rky1LEex;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id r26so2262855wmh.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZxITdvdArW+aVvkG4KFGBfyrnWdMPZm0pClAp0jxpSA=;
        b=rky1LEexEAcaJ3YoQ/P2RNJ24y67/T9id2d3vNvDdhpcngI/dJhaESMJs/JQCfg5a7
         Kfku8gj81Fyp2M6cKu2KwatKF4g+ENEJ/3Yhn7bzPzm29qwWWU7d2Y1sKSkK4ZQpw3LN
         KGe76lx7cTMJ7mHWsEdzjfY2IitYtVPboLqBO95pzTLyvk5ZkeFZ1bzrAcBEMj55acEk
         8vqPi4Ug7xC9lfG5KIbWWUPcU4LcaXuT7my4LIeRiMOUP2ggTs4xF3KpaddzIaQVWM+m
         HtEsf45dDYU2TxWtE516hAy/X2+brPtfeMoil+TLs8J59eFDsbYd3f4faearIQB8dNPC
         546Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZxITdvdArW+aVvkG4KFGBfyrnWdMPZm0pClAp0jxpSA=;
        b=gJBYsPQLXCG4ghKrr9Rnvgyy4AsgNG/Bu0qI8sBIFysAa9ZtNiF/5FDlPFyu23SkjK
         VxgKn9Rt/71cnLuSldgaghMOS9ygJWJw96UNoS2XOZ+kU2ADsHXH6x/wngJdLdKiEm4E
         S/01OEOJ/96x4AyCL7d/KCz5ylCFwoWEhxIbLpwVTBeEF3ElaPECY+KGnDbmvtl/wahS
         dTS9p8KDI5vKuzbcSjrJc61sSBwFG8+g1uHwAEtrFRlsm2BBHuEzGYeOTNQ0sGR6GQrh
         qbRVtPd7O6gSfxeLKMmlLYiXjSVPM8mfAn+9sd9v6kjB+vlm4WYvhW9bolU6crYbYtv7
         ousQ==
X-Gm-Message-State: AGi0PuY/V5ubaRTkf+CDU1HC1HIYE5zxe4/XO8wSIU7VKDNxAmYtSOw5
	pz3h1vDoUwlFTvaaxUyV5SHss4sZ
X-Google-Smtp-Source: APiQypLhpwH0WGZ8nyvmqM5oZ2c+hfKEAyPvZsTTfyzhQFAAcC2tqX9iXyi+PJqS0Lqc3KPBNzG3Lg==
X-Received: by 2002:a1c:4e16:: with SMTP id g22mr3215794wmh.157.1588683729445;
        Tue, 05 May 2020 06:02:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/24] libdazzle: update to 3.36.0
Date: Tue,  5 May 2020 15:01:18 +0200
Message-Id: <20200505130133.24930-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdazzle/{libdazzle_3.34.1.bb => libdazzle_3.36.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libdazzle/{libdazzle_3.34.1.bb => libdazzle_3.36.0.bb} (82%)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.36.0.bb
similarity index 82%
rename from meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
rename to meta/recipes-gnome/libdazzle/libdazzle_3.36.0.bb
index 1c8b2c86e0..25ccee2e29 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.36.0.bb
@@ -12,8 +12,8 @@ inherit gnomebase upstream-version-is-even vala features_check gobject-introspec
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
-SRC_URI[archive.md5sum] = "e796a92dd3f529616ed388c15208359b"
-SRC_URI[archive.sha256sum] = "3d981cbb9d9bb87bfaff7bfd44d9847223b3ef81e69225e4d1f6ac725a669505"
+SRC_URI[archive.md5sum] = "154be45a6aac020e7d59f477bd7cafcf"
+SRC_URI[archive.sha256sum] = "82b31bbf550fc62970c78bf7f9d55e5fae5b8ea13b24fe2d13c8c6039409d958"
 
 GIR_MESON_OPTION = 'with_introspection'
 
-- 
2.26.1

