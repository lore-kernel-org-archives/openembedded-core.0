Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.9618.1629636700880606812
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c9im7zXe;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id n5so9435688wro.12
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Z9vnjG9EsAyFJ4Ygl8+HTeo3bUn52T+uNfLAvbfdec=;
        b=c9im7zXe2+LLqq5WnniNHKrXVW4+YtoVDJSwgJMMgvdOcN7tjzVfWPgsOa/MBBkTw1
         s2NcoeSzpTjKTJeP3VGG/5l5Kurogw2HpoVLzQhPH0Bjt2DMgtHcEErSaOJi2//ufsq2
         Gfy9hhlQLc9nWdgLAgzsKCRdMg8sW4RdQq3zn4Suov+Zm07IgXMvkb+MLvnvjCVkh8y6
         0RgosQPy4Fd3CQZ7awZvs3ZsIJ4dnDhftqGkiHW+GR8Z2ffo8e/+Y4U03FY1R9foSMiH
         JjsvAsdmE7YXI5NLaIHlUou67EjsE5WxoHnZlhYv4BucnAs7C64tsp8hk/EDwZwM8Ves
         7kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Z9vnjG9EsAyFJ4Ygl8+HTeo3bUn52T+uNfLAvbfdec=;
        b=MjNCgxBkfgM4grG01DspdTOJUpN4m80qG99Qhf+cLYQ7AY+MwxoNQ/aaT/Zcq3OfAK
         w2iYHo5/HSrO7oiJaJqKaXxjCfUbA34x4Io2NEoy5GFNiPwIqm+SzW5xSGrWMKb9dBeB
         eUGcpJKYLRxtVIlmxiBiJ826IlKXHVvbZ4/KgypNkTiku6DNiVz0Swj5DFCfg3EJL2dY
         1GfyNAEGBjFa9wNCvpDv3b4stG8RC7CL+QsgzXq5AyL4WqpSJV8UuiygEMhtXviB+nPk
         yLI5FkTVKmJ0A6Bgjsc9VNEu2AKwl92/pyl45x4VgrEkBp/I9iXJ9imf6UbC8d+61EqM
         SekQ==
X-Gm-Message-State: AOAM531wd8lJunof8m4W74ogdyRIhsuk+Js/nEBARaflTS7yGCRXfZtT
	6lpLIXeJq1aNav0eQDrrRyCVrwnXTZapLg==
X-Google-Smtp-Source: ABdhPJxP4+MI89okHGG3wrvgaFZpkhg+ljBz0qHQnz+w9lG6PMsNrPo84t4IR4yAAcg284awjKILfA==
X-Received: by 2002:adf:f552:: with SMTP id j18mr8419270wrp.273.1629636699521;
        Sun, 22 Aug 2021 05:51:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 42/55] libinput: upgrade 1.18.0 -> 1.18.1
Date: Sun, 22 Aug 2021 14:50:50 +0200
Message-Id: <20210822125103.310416-42-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../wayland/{libinput_1.18.0.bb => libinput_1.18.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.18.0.bb => libinput_1.18.1.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.18.0.bb b/meta/recipes-graphics/wayland/libinput_1.18.1.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.18.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.18.1.bb
index 9d1ac811aa..4e9be5e37f 100644
--- a/meta/recipes-graphics/wayland/libinput_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.18.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "18c6a286583268d39841348e561fbb4713bde0c643b360f5d8a3f27800afdb9a"
+SRC_URI[sha256sum] = "9ca14021fbc2523bc0610582c51f368321592040b6ca63becc2fa1ea11f1a7cb"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.31.1

