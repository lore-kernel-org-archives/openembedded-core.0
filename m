Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.33585.1612781985522794941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OVMKGhGK;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id sa23so23967305ejb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=auLhzO6iP0we1KTJLKM4abhPPwWLtN/+5/h1kG5l6PI=;
        b=OVMKGhGKrfX0jx8zLI0Us4xZ00gmld2ZL8wYvQuvq4ZNQ/Ns48fcTy7nC0EBmuchZO
         s/Noi1wQZNbGMi/h4Ft/EdvglbVYBneq2nbv5KvIPo7SEmcBJTXndQLh2odaWYgWfK62
         xxK1FlPzswUImP7Wv7WVpkcxYLiDHQoOgXDEMaPicS8b2jJAVBH2KnWQoELohu438NnN
         P2ZBdRsMRyEH8Da4eqtKhb+g/8j4Mf+fRodMQKYGNYtD/fW7gp2RsKAt/fkMonA2Xjs5
         KqgmTKQGU7D+mI24DNZ0lUQQ6+FNbB4LC9J0IISDHdzrFJkR8CkZSao7eSoMBH5S1V9y
         pcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=auLhzO6iP0we1KTJLKM4abhPPwWLtN/+5/h1kG5l6PI=;
        b=CsYyK2UQ8QAhWbkUgJMdbqtoqf+VRMb+P3WwmCi3yg7AoQwPaFAhjPgrK1pzLwU/kA
         diYYlmCKi+Hst3zIsIppotMTsab1hS70xWbhi97NXOp9ZB9pmsmOClsKDFFS1t8w1C10
         C71F2j4V06AhRfKJyJbn+PFp/CKkWd5FAOoOe0FfGisv9vc6UFWrWvZ+cej9lr6s5cen
         jDpDsCRmdwc9dxpcTrmszdXMJBWQXpwKzegGBuykkUyJeMIXM+2nB6pbRkxHz2J4T5ss
         rDLznrhqYANQhfr6FtfBzcUZkTYvZp50kYJpaUpHyHLRU4OQ3w+/8XFAejcZ9Ho6vEkz
         RMkA==
X-Gm-Message-State: AOAM530H1yPKr82hVqf5Wql3c/p65Fbbi+D0dGUEwsQCuLQvumxVgN2c
	bTK9oSKnb+/+N7BX1n+RUF/bmuynN7r+Ww==
X-Google-Smtp-Source: ABdhPJxrFhCrunjyowUc3Llt/jqt9gMa1+Waron/eIJ5potnEB5hsPCu8WxK4LekC509fr7EVmE7Mg==
X-Received: by 2002:a17:906:b84d:: with SMTP id ga13mr16259958ejb.112.1612781984190;
        Mon, 08 Feb 2021 02:59:44 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:43 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/12] libhandy: upgrade 1.0.2 -> 1.0.3
Date: Mon,  8 Feb 2021 11:59:28 +0100
Message-Id: <20210208105932.347925-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libhandy/{libhandy_1.0.2.bb => libhandy_1.0.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.0.2.bb => libhandy_1.0.3.bb} (77%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.0.2.bb b/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
similarity index 77%
rename from meta/recipes-gnome/libhandy/libhandy_1.0.2.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
index 4daa3c1a54..4d2037411d 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.0.2.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
@@ -2,8 +2,8 @@ SUMMARY = "A library full of GTK+ widgets for mobile phones"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/${BPN}.git;protocol=https"
-SRCREV = "465c00f8f80c27330be494ed7c0ba2ffe26321c4"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-0"
+SRCREV = "7126d2e8da9dcdeb5751e60ff6a74930804f9637"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.29.2

