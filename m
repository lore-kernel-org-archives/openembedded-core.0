Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.6435.1623744778836178409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UYq3krNA;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id d7so1834397edx.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qAXvIl+pc/faemSHY3U+aCoLw/RalNXSdf9CNeuJdsw=;
        b=UYq3krNA4HjqcOiPKPoXbIXE9RS02NsjIOC3hqT7UEI3VeydN6XfyIvmeYydfzfQGw
         /0c+bdns8CLyby7tWOoXLzYayXRmYfg5/ake/NUkmbrukJXsmskQBOa1VPh2E8D97VXa
         mvpctwTltQ8yszmO9qMtFfWm6aPOpI+XxGfxOncAHf46q+lcCf2MoIHce3/vPS8+jPH6
         +8mVmR75/pRCrwgfeULk0O2ynk9FytN7VMQ4NlfOVIugB3/UkExasahMMQlf0n70TkAw
         TJnIvuDIVcKkzySP/sXx2vgOVhLD5D9Z0Rx0v1IgaxHNuhidf9zsxFncoYnD7czGirGb
         /mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qAXvIl+pc/faemSHY3U+aCoLw/RalNXSdf9CNeuJdsw=;
        b=qv2SXH+XrJ9y8CzuIHzANAGYkfxf3bzEz3iozwY0eV/7pYURfv4UvKeKQwuvs3zOiq
         nU+4x2kT0NnVi+YjSanM2/aesmpQ3tFJBGx1WmXj0F96SfMjnZHuw5tT81YbUiq60i58
         fFa5RRB6EuOwtFl18/qrmT+b85JKZbeInzRMJSoDuFis+Fd8eJiAxaLxy4AGUQBGKVfa
         NLng5mhhzQt6+kXIFbm8PHR7aGtsit7b4FSegUMa9vrv+oSgkDSbRR39od9nUgUozuJn
         meWHr1x8FlFbW+FHqt1JU/UxbD+U3lzoefKAlC+PCIDhdQ/B7Mjdq3vK0/f2uAtYhe7c
         zjvw==
X-Gm-Message-State: AOAM531IcW/bd6n6fd5bu0iyoLB3TgxPXustC7ArGdWgu+nrFytyorvt
	GqsLjHi+8SuYBgxJ1vHu0Ea9fL23/hbbSA==
X-Google-Smtp-Source: ABdhPJxvDxmIDs3OD81+/9+OR3jVT6+yfmtq+kwzp4IHJplQ02/hap22ASSF2s9+6KtRlfVlYXPlgw==
X-Received: by 2002:aa7:d388:: with SMTP id x8mr21221955edq.338.1623744777467;
        Tue, 15 Jun 2021 01:12:57 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:57 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/31] libksba: upgrade 1.5.1 -> 1.6.0
Date: Tue, 15 Jun 2021 10:12:27 +0200
Message-Id: <20210615081240.1734087-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libksba/{libksba_1.5.1.bb => libksba_1.6.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libksba/{libksba_1.5.1.bb => libksba_1.6.0.bb} (93%)

diff --git a/meta/recipes-support/libksba/libksba_1.5.1.bb b/meta/recipes-support/libksba/libksba_1.6.0.bb
similarity index 93%
rename from meta/recipes-support/libksba/libksba_1.5.1.bb
rename to meta/recipes-support/libksba/libksba_1.6.0.bb
index aa296c6b9b..552007d6cc 100644
--- a/meta/recipes-support/libksba/libksba_1.5.1.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.0.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "b0f4c65e4e447d9a2349f6b8c0e77a28be9531e4548ba02c545d1f46dc7bf921"
+SRC_URI[sha256sum] = "dad683e6f2d915d880aa4bed5cea9a115690b8935b78a1bbe01669189307a48b"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.31.1

