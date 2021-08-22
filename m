Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.9784.1629636708564565152
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LkMcFTZg;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id u16so21800124wrn.5
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zGlhGANkxTGxi2OX5W1mCpOfKS55Cr+E9aimskt35h8=;
        b=LkMcFTZg7eYkmmzt539ztxWax/ho7XOqXRE1vuf6L9jkkp+fnCtODRL6pFmVefl384
         HkT7yaN60OwssU7Rm0CM+2rH/hfiY1zHvapMvPRF/TcIN57el+kgT9N+Q/FZQYc/fHPy
         dFvmj1amQVaWQQMNjadzRNS1nZkw/J51NysodEPjENhdgyLgRmT67VKGnJmvBOUIaBrG
         up3cJPBAHQ0S/fk8bggm1vp9YLciUgcQ3FlZVuW2etEGjTM7NzVwPzZoGDRRxMJOwUNd
         hn8U7wsAyiTUEyZyON+B0ZI8CL7cvteDzE4VZGUBBdCoOFAaUjRlgQQrNI5e2+da/9mb
         ULUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zGlhGANkxTGxi2OX5W1mCpOfKS55Cr+E9aimskt35h8=;
        b=suXGbtlSuvF0p1HaYoxoQWKVqKs72GEJcrOWoFXS0FWNoQ3vujuYcBMJUSo/K7NCv5
         79OnCGL6//4VulPRagPynpieWob+u6WoP9dSPtZt9M+9+UpSILZHvYz9hb6l9ytvICnV
         gSIHnnI3u1odOPe2pzBVuj/pWUqmI+txh728XrJZM2wG20+OauOW44LB0+dQulJBZ5+V
         XBHL31t2v1GF/oyh+W8rf9waz6JvwpGSyK7y6ifelyZYsB1XAcKgxl17pG6/yAiAzGv1
         LdZvVKLe5kxqAnC+ZYbdNd2brWg2dxUF7/xaCFspCdcj0q2wtbnlcakmvg6lbt3vyww+
         TPKg==
X-Gm-Message-State: AOAM530LVNYBdkAxaAqpSnGJv8OugMx4qq20x/ht+ywZVlo+eR95u6Lj
	wMeNfDxHnrS564/lX9iv+KgkGUSR6Cp8bw==
X-Google-Smtp-Source: ABdhPJyW3EslkbRTk37EBVlOgaJJicPith9YiZnHdX7pVkNyQnp818/6n0PoqssZ+dsqYAS+0BuouQ==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr8575692wrt.172.1629636707231;
        Sun, 22 Aug 2021 05:51:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:46 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 53/55] re2c: upgrade 2.1.1 -> 2.2
Date: Sun, 22 Aug 2021 14:51:01 +0200
Message-Id: <20210822125103.310416-53-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/re2c/{re2c_2.1.1.bb => re2c_2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_2.1.1.bb => re2c_2.2.bb} (91%)

diff --git a/meta/recipes-support/re2c/re2c_2.1.1.bb b/meta/recipes-support/re2c/re2c_2.2.bb
similarity index 91%
rename from meta/recipes-support/re2c/re2c_2.1.1.bb
rename to meta/recipes-support/re2c/re2c_2.2.bb
index 1da944e901..9a0968a984 100644
--- a/meta/recipes-support/re2c/re2c_2.1.1.bb
+++ b/meta/recipes-support/re2c/re2c_2.2.bb
@@ -8,7 +8,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "036ee264fafd5423141ebd628890775aa9447a4c4068a6307385d7366fe711f8"
+SRC_URI[sha256sum] = "0fc45e4130a8a555d68e230d1795de0216dfe99096b61b28e67c86dfd7d86bda"
 UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

