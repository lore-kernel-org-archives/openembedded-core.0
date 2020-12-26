Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.19460.1608974871833068501
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pSxdBBZF;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id p22so5529782edu.11
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+1DUs4l6Jq4TzZpx0ZH/uZaKhjJhRlBcBKnacxFDEY=;
        b=pSxdBBZFnxAoei8QHk6vhejOY0fXKIiTKKXW2285lvLni+MNTLHzwHJdc5nxbOpGbF
         Hfa7tAuFWmonUc/dHqYEt5qd9NRXfl/9qkuOd3hXdRnuQmmR1djQiB8C5qKuspRJNr3X
         AYl8vmAH5h3e+qGcK7L3t8oKfAZeCIEoieXPJqXZQVlIE55QT9WCfyiiIuMvkLNBBe4e
         +6d6dBfv4bMRWbsSpIqbfjKf4ovt7U333Ih1MN5PMY+Pfyplg102dkUYwjYFUNRElIrD
         lTJZezwubgK9BFrPAHZM5ufwGcGzfX/v14ZfOBaJxsLQBmWxYP9hN1Ja0/7t73Un7LN/
         qQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+1DUs4l6Jq4TzZpx0ZH/uZaKhjJhRlBcBKnacxFDEY=;
        b=mtTd3u96R670FKwaveHY/qboFuVryMbUfo2HgkyuukmrD75CIxRCZxptLHq5k77kdI
         swHOx4elRVdF/Llrzj+Lv2oSZ/vWjIio04641dznS94QZ7TRSFxGtsqr3Jju6oaMo6H4
         SHTvJDPgYizd0BA7liK2iTmfPSnhmZPwAny5OspPeeGOKkpxiGpwnOsACaUduEwOQE5d
         rLe1PYi8WldXDtbhFmJfvXyhtKGiwUaBPHb3IU1o7PvkHqh3TMsiFwucwqEFoy+mGqJf
         l31lcIXwRn4pJrZmk/ItXpWwWxk8cGgPQtzJTzblhkpxWl+Fp0WJLHQjkLU5itpoZrMx
         Phow==
X-Gm-Message-State: AOAM531bicQ1aovamqK1jkqy3muOxZKoxO7myBVdz2vYCxBEhW/fqz0b
	z/yueGlX/1NG+F2K5djDCHaX2KoLrWw=
X-Google-Smtp-Source: ABdhPJwXSkpI1F+ThAWcjKOVVf1RVPb2aC23BiRHkWZWJg9t5D2uQWxmwzVhMuJ+9ejJ63kTBZKEcg==
X-Received: by 2002:a05:6402:d0a:: with SMTP id eb10mr7488799edb.305.1608974870514;
        Sat, 26 Dec 2020 01:27:50 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:50 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/48] init-system-helpers: upgrade 1.58 -> 1.60
Date: Sat, 26 Dec 2020 10:26:54 +0100
Message-Id: <20201226092732.52323-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{init-system-helpers_1.58.bb => init-system-helpers_1.60.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.58.bb => init-system-helpers_1.60.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.58.bb b/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.58.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.60.bb
index b591f412c6..33977e66c1 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.58.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
 
-SRCREV = "6a1860c6f5ad295af605ddf588933544e7c24ce1"
+SRCREV = "dbd9197569c0935029acd5c9b02b84c68fd937ee"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.29.2

