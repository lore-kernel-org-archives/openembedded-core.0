Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.9829.1620227943982871731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SKJBqI1o;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id t4so3531118ejo.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jgcvh5T5Sij0BsO/80/69QQuvgYjDacWqC5q2/nFmcI=;
        b=SKJBqI1omoesaEK79w+9wonIFZFmJg7FjjYQpaZa4H6MEeHoZjG5cLaskviUiuYIJv
         5D9SgEU5Xb4wkWXt9N1tn5IEkBza1ryhivGA1bkbeD2H5QBNUgCnXLqGKgFuzpB6pbGw
         39UTqRRILwpRTPz80zIRuCPYK5ZqhKi/4NcI9SHUN1TwVJnxAfdVHp5XMiRt/50SgUv7
         3p6mduuO9X1QPK9g2vqw3dnUKwKLkPWzBoExGbAHqZIR59+VdJXeJm5Hc9U/Z6tfhXjm
         v4fQi4Hzq6ZeLzhFtQKaVx+z6l5tr5mR8R/qYBuXrWCy7h3B4ztASY84Z59aM8ixKB2F
         U6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jgcvh5T5Sij0BsO/80/69QQuvgYjDacWqC5q2/nFmcI=;
        b=ZWbD/vvgRDhEBEYXIRpgTu7DIEwQOtAWd+84BhSSjXNvJaxYMOPAsmyhAhfvnUJPNr
         Gm4PPeTax6UFfPSJXF6/DDnKF8YNIoNSNqI4nE1nLi9HdhLG9d1v3CnuiOK8X2WfOEBe
         2tX5DlGqzLabLY+3CwdUHZhWFGPXOe9QJPB2epXigsvQ/A3gXGjNKFkhrIFusivyGUyp
         T5nhE2zlvy4iOcwg79fJFLzufhVXa0epk0hgU2lxiwT0XrfVE17LwBNURqHDjfeTzPLd
         Q2jnrCxgMzaB3pAWLQ4MD9sFdj+qqmlRaba9PrAkLHlKdSiK5I+/3CC4qPrueyaLAIcY
         xIgg==
X-Gm-Message-State: AOAM530DgMuheozVQbDS0Ji6VDpAZX0dJoHpqejjtURzx8MqYGj83voa
	r4zp45PiuGNS9JsYH8dZ7zYgcKzE0tS7Vg==
X-Google-Smtp-Source: ABdhPJyfkyHQTLYow8tGFpV98dDWqyr1HStwa5SWzlLkf/lQDPU7CMUkXeEkQf0o3LbR6+aQa6l4oA==
X-Received: by 2002:a17:907:3f1c:: with SMTP id hq28mr25994990ejc.349.1620227942575;
        Wed, 05 May 2021 08:19:02 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/61] gnu-config: update to latest revision
Date: Wed,  5 May 2021 17:17:57 +0200
Message-Id: <20210505151850.660512-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index c41177c72b..d4ec4593fa 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "6faca61810d335c7837f320733fe8e15a1431fc2"
-PV = "20210125+git${SRCPV}"
+SRCREV = "277b4ed1776f721145b2649d888f1deb445fecc5"
+PV = "20210424+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.31.1

