Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.32562.1620657108716936162
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j+FjCzuW;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id y26so18955356eds.4
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8LpyExWLRcHj08js14NZ7uVhGujLHJFa02XLXlR11qg=;
        b=j+FjCzuWXJUYJAAew5kOJzH1PRsD7EfbHe/XotSLe9yX+xTAirbmRBpdHsHSfzRrIF
         FyJs9fcUSm99sUM05MKKxG0QWOCHX4eUsM5wT8Axb8zJDKoFph2EHTaxLF1Wi4soRNhm
         iUsoNe9sSfeZYkwLw+ER/DX84K9LVukDVMapGvQl3tX7F2MIw0meosE/YwjcxEIXmDQh
         DwDiZjnXWQtM+14t+6V2qswVir8ybD5KYQzcthRtXlOM+U+dv4qU/qVnPiBZgmwrqN7e
         GvvYkRf8Be+U9AH9Uriyx0XbtYutk01p/sPBN7WUJ2DlsDpdFNYju+zho+q8PELeEiNy
         v8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8LpyExWLRcHj08js14NZ7uVhGujLHJFa02XLXlR11qg=;
        b=hTcraB5rfRbbegPLYTSSyt6W7iJwhhiYhB6wS4qs8B+fXn9ov/kmruCk2cH//QtBim
         eQ3qqBYmHz25Yu6zBDgo9Xq5IKBcTisL07gyBfPLlAPBk1gX6+3lEaQzucLisHR/9Fmd
         hPBSI+mYHR9udFh9LuMjQ2lNNf0nSQH6gg7mDj7feZtpdgwnF/IBgIvylhgV06m95wu7
         Iu55P3lbg9vXm9zBlEFY5pH712QdlvFiHKVTVd86QcCDe5U3vbhvQguNZya4hiK7fnmv
         xyBERMLQanjWEhAPSKp7B94TdeDVlw1CG50l1LKioo7MMxP+GOgXCYvuQ8v3HJkslFFp
         OC8g==
X-Gm-Message-State: AOAM530RVy9FuklO1s6py7qtfUllJYoMC6ygcYbZjBfmCvVhmy7k6/7S
	+SvUqaYFyK2Lx4tY4gfThJIVdFtbeok=
X-Google-Smtp-Source: ABdhPJxEkFEQaPkyzA/v8feoaRJBs+epokaBjeTZl9MPzYrXATffghRDUKh6JuHsQvIkXq20yT6F9A==
X-Received: by 2002:a50:9d4a:: with SMTP id j10mr26899723edk.378.1620657107193;
        Mon, 10 May 2021 07:31:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id cf19sm9519306ejb.24.2021.05.10.07.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:46 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] liberation-fonts: fix upstream version check
Date: Mon, 10 May 2021 16:08:06 +0200
Message-Id: <20210510140806.942211-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510140806.942211-1-alex.kanavin@gmail.com>
References: <20210510140806.942211-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb
index 53f4252814..e33c4d1520 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb
@@ -13,6 +13,7 @@ PE = "1"
 SRC_URI = "https://github.com/liberationfonts/liberation-fonts/files/6418984/liberation-fonts-ttf-${PV}.tar.gz \
            file://30-liberation-aliases.conf"
 SRC_URI[sha256sum] = "26f85412dd0aa9d061504a1cc8aaf0aa12a70710e8d47d8b65a1251757c1a5ef"
+UPSTREAM_CHECK_URI = "https://github.com/liberationfonts/liberation-fonts/releases"
 
 S = "${WORKDIR}/liberation-fonts-ttf-${PV}"
 
-- 
2.31.1

