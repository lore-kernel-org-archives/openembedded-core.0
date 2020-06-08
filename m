Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.25180.1591602508291959213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RrvxvC0w;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id g1so12577716edv.6
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cw8c1tdyzhaKHJAKXIhe2YqbLR9yr1Hb56MJ6uBFU5M=;
        b=RrvxvC0wGjObrl7S3VAmngBeYLVuuu6aewynYHbNvVpc5p/YdVr6ATIze0aS4fVwbg
         RYtL340B3fKzevFScEkyJX9zszhyN6roPjiS8NeELttjtQjHgYKCK2QEAxkWnduuy4qH
         pkBth28jKXliSH1YjlF5k/GQ6U/HOZKRb+fqOIaU0i69vpfudMNEVCbTbBlksA+q1deZ
         LH62Qx5ry/14aYZsJFxwXbwRdzxrR4a/P1dDYWFgjfZmaxmudkyS94zfJt1uBoBxd8b6
         +2SfqXWpMtkQYCdU0bQLlxAwli+w0S1K+EYNiaZF3jdjK/PX7NMjJ1XSmoRo5W4lOTjA
         vETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cw8c1tdyzhaKHJAKXIhe2YqbLR9yr1Hb56MJ6uBFU5M=;
        b=XcwUZpY+uL2r64UHEkdjxvIkVCeuURhqDsthZeXlm7C1OlyaJRBnGp0Z5pX2saa0x2
         D06w5ayOS/Kqj7yE0Ww2TKk6FcvL2aB9xSVBQ4ChpCogsmAkFCci23Fb4gTO/UtIByqU
         ERG3DbIp8YECjrVD6RvDdh5IM8fEDjWbFhAcy+vtEZcAQ7EqZ5Nm+yU8XgAPJeMswP70
         inu0fz/YJfF6taPrQ9DzWG8cL1jgQqCI6ZkH87dpQqBtKOh5dastNwMpHPEuLNlu+Maf
         tpqolxg8lHHLD/veX18ZlChzdJyBliIWtWRNuGomdnQ5FZvh1N+EXXZBx3pAuYYECygz
         AaEw==
X-Gm-Message-State: AOAM531CdCHAmfqhZo2yvlPzYi6MtgFiJh3tTl9tDY7hPVK2Y4OmbM9P
	6+wEdyD0+3Bo6/tmakcG9cfNPPUBRgw=
X-Google-Smtp-Source: ABdhPJybC+A6v+gTjLtIKpxWdj7KhMFE64qAQijhtyOmM3+g0B4KQvWCnmrko+FjGfDSRkHldqBT7A==
X-Received: by 2002:aa7:c245:: with SMTP id y5mr21322849edo.189.1591602506708;
        Mon, 08 Jun 2020 00:48:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/42] cogl-1.0: upgrade 1.22.6 -> 1.22.8
Date: Mon,  8 Jun 2020 09:46:32 +0200
Message-Id: <20200608074659.7051-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb | 6 ------
 meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
deleted file mode 100644
index 86bbdbff69..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cogl-1.0.inc
-
-SRC_URI[archive.md5sum] = "7bcc01edb5462d4d08d01bf893feddb0"
-SRC_URI[archive.sha256sum] = "6d134bd3e48c067507167c001200b275997fb9c68b08b48ff038211c8c251b75"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
new file mode 100644
index 0000000000..78f6b0e7a3
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
@@ -0,0 +1,5 @@
+require cogl-1.0.inc
+
+SRC_URI[archive.sha256sum] = "a805b2b019184710ff53d0496f9f0ce6dcca420c141a0f4f6fcc02131581d759"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-- 
2.26.2

