Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.3369.1594933714843749230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ibLmSYT5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id r12so8503144wrj.13
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=En3d6DfrdG2pOqjIxa9RyEFlF2/jE81fAjDNWLRHcsU=;
        b=ibLmSYT5foHzNMwnHeFUpo7LzMNHQI9Ed3BQebSGmtVnnT89caxAMSL3Hsc2JpDcd4
         TzFkv0z4fg7Y+iA8sh+t7rDdHHK5hvIgapmt5+DWGePsMwDqnAsZVw8/Ykk/YG/POMxu
         PdI8GIV1qHjy/oYjDKV7aqdWzX9O3tJyOqgFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=En3d6DfrdG2pOqjIxa9RyEFlF2/jE81fAjDNWLRHcsU=;
        b=eww6suHFGk12uMkF3xLVagiXY8aAqqWuORwgyP4dtrSd7YVY9RG1ixQ+C4slQah/5n
         oc6Cc98p37gYbUMMLbVfJt7NZxA7ibDr7WFxOQZ2TZexqy1tDDJEtfHUOHZfmWY15QXC
         Uz234+71KsIwBvenabLSohkPjQJNzajm0Pj3MoEH2cUBBjOtua9C7ww/GSPFd6PTE+Aa
         uHcOq9aEAih9LEY3df8F9tSq0yaL/kkfUxQ79isxfuuRLIr0RKtVMSTq1DPXPyYHnRUI
         Qd2oiD584vv9r0+U2YO0KCDy+ittF/5teHcVBxwBBJfz3pEv+z5RgqXdDGd1Hl/eCMcs
         ZZ9A==
X-Gm-Message-State: AOAM533HT+b37nDcCzM2Wzkt9y/Yctu2Nvxt1pMVf9xhDQtjs20ODXvH
	quFV1b5odl3fNtjUP5hwiZaWlKP1Z171xw==
X-Google-Smtp-Source: ABdhPJzAAJn4uXj0o9X+DDZG2dgO7cvoILxD9OhpL8SpFhHHf/2XsTFQG/3Qjw2t3ZDTC5T08h1aJA==
X-Received: by 2002:adf:de8d:: with SMTP id w13mr6633712wrl.129.1594933713163;
        Thu, 16 Jul 2020 14:08:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:32 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/20] libgcrypt: upgrade 1.8.5 -> 1.8.6
Date: Thu, 16 Jul 2020 22:08:07 +0100
Message-Id: <20200716210808.7438-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libgcrypt/{libgcrypt_1.8.5.bb => libgcrypt_1.8.6.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.5.bb => libgcrypt_1.8.6.bb} (93%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb
similarity index 93%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb
index 4e0eb0a1697..ac09417e89f 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb
@@ -26,8 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0003-GCM-move-look-up-table-to-.data-section-and-unshare-.patch \
            file://determinism.patch \
 "
-SRC_URI[md5sum] = "348cc4601ca34307fc6cd6c945467743"
-SRC_URI[sha256sum] = "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3"
+SRC_URI[sha256sum] = "0cba2700617b99fc33864a0c16b1fa7fdf9781d9ed3509f5d767178e5fd7b975"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.25.1

