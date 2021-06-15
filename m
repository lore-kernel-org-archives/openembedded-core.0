Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.6439.1623744784437717545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rn6xH730;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id nd37so13329742ejc.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l3txzr9//btdw8p6OQMFlaxQNcHckjinFg1mKN+hMdI=;
        b=Rn6xH730TtxbL5FB8uBvg3YxQ5UJEx+sxh3X7fv0uQ78qKOsYOV+Nu9p+UIi6O41Fp
         dh4SU0qO6ImAHllyqHc3qUCVeKd05srZdbYcK+xhU9HnIT0C2rQn1GG1Gx4sA83J1//q
         6IoZNL4qJ3+hJW7JKqiGluBeFPERcDfQqR4HihlzgKL+vb8trxhYTt+EQX2J/SDZ5HFv
         Ihnk419LwcDy0kFy8xf3xVvDzazChHTOONw6gbcrbIj+QZ0HYwRaqX4JDxevHJHSDJxz
         cCjLxdWEFunq9lvY70l6RnRvx3ytXWUuZSTPzUHjwL8FLg747W95pZDiKoEBgaZhjj1c
         hcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l3txzr9//btdw8p6OQMFlaxQNcHckjinFg1mKN+hMdI=;
        b=bDvpY1rCBt0VJgNo0ECrhfDUspvTj810rL9042dBxRYfCNmLTn6Suiu4bUI4lmPNqC
         EpUd0MyIHo5Ma0SsTqj1sEmlY8JYXm0TDfxHg7o6QeLq0tlZz1BN2+wFnqBeda5rQtCx
         PVsN0WAgHGU1a2N21+kS09uOgdPL/s6JGMh7QbqMSkOgYzVmLNfcvY+b0DMgEfs6N7nH
         sNn3Bo9SQsipnUx+T7xi0BotPcfUJDUQS0WtoViRoAEMh9Jfg0jlpVkz+VaiNd+vkLs9
         tRpE/nxTo5SAGQnCO4DN6o1sSq93SjcM3/Ufio4HNQDn6zKDXgAesNOHmk/sWd8m9JjV
         jv1g==
X-Gm-Message-State: AOAM530xGAvLoyZx2n0ti2F93VHluC+3vwk+R4JiGLXFnhbt7LN/+CCN
	4gW7IIzAg4oLgyfi0hA0eakYqX4IMJP4GA==
X-Google-Smtp-Source: ABdhPJy6DYlt7DJixFidoyJ2D7xF+iL+vMgJvh2DrUMWNpokxtTcGOR/4rPVHBzPr00xPN6e5KKENA==
X-Received: by 2002:a17:906:6bc7:: with SMTP id t7mr19977125ejs.267.1623744782891;
        Tue, 15 Jun 2021 01:13:02 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:13:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/31] python3-magic: upgrade 0.4.23 -> 0.4.24
Date: Tue, 15 Jun 2021 10:12:35 +0200
Message-Id: <20210615081240.1734087-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-magic_0.4.23.bb => python3-magic_0.4.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-magic_0.4.23.bb => python3-magic_0.4.24.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.23.bb b/meta/recipes-devtools/python/python3-magic_0.4.24.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-magic_0.4.23.bb
rename to meta/recipes-devtools/python/python3-magic_0.4.24.bb
index 4ebae32569..a54bf2431c 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.23.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.24.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "python-magic"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "88f71d04fde4318da32fa03930362f1c6127caa833614563fd53a0fd3438cc3e"
+SRC_URI[sha256sum] = "de800df9fb50f8ec5974761054a708af6e4246b03b4bdaee993f948947b0ebcf"
 
 RDEPENDS_${PN} += "file \
                    ${PYTHON_PN}-ctypes \
-- 
2.31.1

