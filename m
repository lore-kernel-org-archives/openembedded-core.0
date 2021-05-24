Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.20722.1621847650800858488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QH5ylWRk;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id f18so10508846ejq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6yfkYhYqtMa7NFg92pJBDTlUY9mPREO06wWy0j8jCC8=;
        b=QH5ylWRkbkTlO9SfS0XSfXdcpptirBkkaN95hnwzluYDATpVATNS396sa09W7U4Wnc
         L3+A/iO9d1U8qsCpm7bF+2mzILOKQ1cHo5OPpCEaO80nENoFucate/IAH+ycDiajmlE5
         wzM5Gbyumn2dsY6LWs+BbTcDUeFzrvYM9JWvliCnX2ZLjNRCsoeuQ9PruH81NSNhSoxQ
         DzGxR3CaJvE0wDysaLb4aQV98aG0nNPnrg8jBynvmSBbeS4I8ZEAZS+jXYtnd76QiGAY
         0of/hsSA+GGQycyRI0fpFakbKerxXT6l5y+kk1Tav70weGWE6D/iUFM2njMCloqrCqBG
         XjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6yfkYhYqtMa7NFg92pJBDTlUY9mPREO06wWy0j8jCC8=;
        b=Y8bSrI1Lmr0IFsc0z6bjzxC75MdhMP/endxGoeOX20gVrtVcTAzRHvVy/6WtQgfpCZ
         xiV1omkkdms/gwLMAQJtrPHYnT0syAkzCMi/7Gb7oikt4l/19p6hJKpDxHvvQh3szu7g
         FbgnMrg5gKya2drTgjtS5iPIgV5xHGHGnoeDBRwWkkPXFOW5a+EJ9P/dyMLi14GEoa66
         EvFCvQK6QYGl6vYKlDyL9lkuoF7pCZCUW3CeglQKKu0uqfAMXTx/yKK+rr4A8jypC3zq
         HLA22glh8pFv6YwM3N8gPE0SP2syXjq42odOXC0SUexxjkGy4N5PMLiPu3FseempGIyZ
         IHKw==
X-Gm-Message-State: AOAM533v4/+QkQAgo8wQ4yMXC/0aN8RkWKaZf/gFOFfWskRId7mnhUUc
	bq8cqZisMg/aTELhs9Nvgm6ufPyJ1M8=
X-Google-Smtp-Source: ABdhPJyJLXYMQbMJH6CAaMd7Kr6iflsDthkd5yy76i8ScSbNzsO0XDDazm0f+kGPZSlB8qv1+xbXiA==
X-Received: by 2002:a17:907:9715:: with SMTP id jg21mr21805117ejc.52.1621847649450;
        Mon, 24 May 2021 02:14:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/21] gsettings-desktop-schemas: upgrade 3.38.0 -> 40.0
Date: Mon, 24 May 2021 11:13:35 +0200
Message-Id: <20210524091347.419253-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ktop-schemas_3.38.0.bb => gsettings-desktop-schemas_40.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.38.0.bb => gsettings-desktop-schemas_40.0.bb} (85%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_40.0.bb
similarity index 85%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_40.0.bb
index cf06af57d6..89751a8637 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_40.0.bb
@@ -13,4 +13,4 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "5704c8266004b296036671f223c705dc046aa694a1b1abb87c67e7d2747a8c67"
+SRC_URI[archive.sha256sum] = "f1b83bf023c0261eacd0ed36066b76f4a520bbcb14bb69c402b7959257125685"
-- 
2.31.1

