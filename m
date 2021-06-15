Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.6423.1623744782197866272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a8ssiLBu;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id nb6so892278ejc.10
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zsFcQB68Z82Tx64cnpa3XlC4ZvwMp3opS9u7u7oKSVg=;
        b=a8ssiLBuNtoIqO6yjh/QPLoqBp6TSIyGGqa2DVJxdlAW36F42MsRPNQfPUuxHfB0rQ
         BZaNzs4+NwxG+HsDh0HdVCNcoIoz+aAyypzNqD/GvaH/mNkE4rMbQRTv/6aHjmno790J
         tFXcsVjYOdcF4wMk42qOLsb0+AjVVax1eJ0YlryZXHtsGf6SFo83rDTb1LqY88jDMxwL
         nSUyva7AgJTm7M1wtIZboWYQyUQ1IzkKQXcuu4OBcw6XJ6KqaMFeX+Ug1KSMXa2XYN7m
         LpsfoQeMrbQobysYT/MdxwDutm2Ed7pNuODrlIGlVE1f4yOwxelyVPxhR7HPKaHjRoTl
         wWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zsFcQB68Z82Tx64cnpa3XlC4ZvwMp3opS9u7u7oKSVg=;
        b=otMY4b+5YB1dic9C3L0eHICG9zLXElA9lr7r2Bakzwp2lhuzIn+h6N7fQ/LBvz/E0e
         DIMHoPHq6B2puimniwhJYeCFhQ9vCvLK+B/LTVCfQSk9O2x3u2r0av9HtpkjHs4KEjY7
         s+FFqTWFp3oF3VZSK91kawzsP4wq+TKIHqPzrNdZYfs7v8gNl7LTM2lPJlAJAYBBfanL
         25tIi1DR4YUDQARGR7gBd6UczjJVsycLDm1GWi5ru7euzuZeCIS7kqSfnmksBSIv9+bB
         Oiux+yfL945DF16ShceLWo4zgsXp8vFNIaxdO+/IwKX8iUYEJQJ3ErhTOG3Mom10Rb8s
         5/mA==
X-Gm-Message-State: AOAM533vrVih62bRmcFVJO35/vCHsKFLJNTMYILzNF43mqTbDzsvrHmu
	JTqOaLT/BYgQ0MVQduqFdLFocCnjcrhtSA==
X-Google-Smtp-Source: ABdhPJw7LLnEu/rvGfoukZrIpaVAkXoIQSxZRgKzRZlTeMl4K336djcyl98E4Ll68FffGPn/WOSNlg==
X-Received: by 2002:a17:906:c241:: with SMTP id bl1mr19470417ejb.536.1623744780817;
        Tue, 15 Jun 2021 01:13:00 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:13:00 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/31] mpg123: upgrade 1.27.2 -> 1.28.0
Date: Tue, 15 Jun 2021 10:12:32 +0200
Message-Id: <20210615081240.1734087-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mpg123/{mpg123_1.27.2.bb => mpg123_1.28.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.27.2.bb => mpg123_1.28.0.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
index 9a91cc89d6..143a59ba63 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "52f6ceb962c05db0c043bb27acf5a721381f5f356ac4610e5221f50293891b04"
+SRC_URI[sha256sum] = "e49466853685026da5d113dc7ff026b1b2ad0b57d78df693a446add9db88a7d5"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.31.1

