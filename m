Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.6440.1623744787632788045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GJmTYUTL;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id ho18so21068329ejc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NsrVuJlhp7ZlxqqwbYlu96BGPE252YWwdXXldsTd38g=;
        b=GJmTYUTLRCi1nW8QnBktxbWnlli8vEWVJFxwrFYrjq4oFSX0b+cGZX6ey6/zj5IwzX
         7lzuIAa8qR6Wxxm8uPIkUSjBCReGu/JySutPZ3cw3F6q4vDhBUYgXgM4TxCgttzcy1qb
         X+cfSZQoi+PzCy/lPZxwQaMExfkpJnoPLJqoaFKUg9E7ba65C8BSios0RZPMc0Rhjdrx
         mkE7ttnOKagkK5i/mmgrgXH60ttZaxO+pI3tomX+Ht8tn4w8fK29/ahqDcW8n2C07Ezp
         eEsXkfeadIx4PvgpAHiUv23uNnlDxv1/xZM7526655K85BpeHR/leaI59FibN96on/Lp
         XfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NsrVuJlhp7ZlxqqwbYlu96BGPE252YWwdXXldsTd38g=;
        b=A2C0hk6j0bG8HLJ4fLjTeNj+V4SR8lDrr0kfyg1/YNDxkCc6t75bch+QvWsKKsV79o
         9XzDZU4zsve6Si+mwGFN08NJuU/yXmUB5j21nchPPRrmB6BmGFnWVx8PGEuhkTNmSf3p
         sf7SE/BfWrBflVPdur2y5oE7zs391+D0U2QcsVfOLNZQBrLzM4k5Lo8C42bc0f8oNTdK
         /eTu+ptDSXZ55CY5+43AtMJyYv/p0tySKScb3c+0DfuBJ6HUGwlAtE5FXHIVxBOjKYDI
         HygboQnw7fVrw5A1NhH3iTUvBsU56LedupWRL3qHsHJVM9+utXZ6ulJQfCRvtD5g5zXN
         9bYg==
X-Gm-Message-State: AOAM532FrwCneh8LgR5/qlyQKCVz9lP3b1qmhuLEPi8K9008b/6LIhdP
	ttDviqM8GRcRw/dL5o+vxGWJsm+qixVFIg==
X-Google-Smtp-Source: ABdhPJzAZtM0+TeqsOFQEGu/crRUTtFOpX+JpZjSsD26t5Opi9vswlTbPCQUSgFOtsV4zMWMPkpFCA==
X-Received: by 2002:a17:906:79cf:: with SMTP id m15mr2342362ejo.465.1623744786246;
        Tue, 15 Jun 2021 01:13:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:13:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/31] xkeyboard-config: upgrade 2.32 -> 2.33
Date: Tue, 15 Jun 2021 10:12:40 +0200
Message-Id: <20210615081240.1734087-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{xkeyboard-config_2.32.bb => xkeyboard-config_2.33.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.32.bb => xkeyboard-config_2.33.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb
index daa07a4d02..197a870e76 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "1feee317ba39b91902b0cbd2987c0c73e6afbfc8f4c096367a5c86c216c036a8"
+SRC_URI[sha256sum] = "657fd790d6dcf781cd395de4cf726120a5b0f93ba91dfb2628bcc70ae8b1d3bc"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.31.1

