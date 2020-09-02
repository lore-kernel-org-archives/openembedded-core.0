Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.907.1599081253190584502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iQEq9Owz;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id j11so766935ejk.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YJbwMN1yyCBtXWDnm6EbBr3Dre0F5+yvKymWQoaGG8M=;
        b=iQEq9OwzaTZUPWsgJU2OgfIP+uiCe4BlLAmQZ6I790VfZqLjbiNKIkuqeKQSdEFjxL
         LLuncNrfBFJzDzCcet1L36KqXtmh5/GR6VnXBL3umDi7u7miWVycQeetzKla/u1x+Z/o
         9+FZaWYhgFOwIz/P2JJt5JyEKho4Lh3caLlSNC0ddUzKLfQYr9sUNJ0kgo7qRXJ2JXcv
         laegxSqgtbGpvcblChjd7S8TXQx+XsBaONp0TALAeZutB8CjndGScIIjuNNbRbng2sIN
         682UTsFbX8dXMC+/VpM1lORZuGcpYDfsCMglcrV7fqupHm56M/yD+mCTVPeFlMPy35gD
         m6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJbwMN1yyCBtXWDnm6EbBr3Dre0F5+yvKymWQoaGG8M=;
        b=gDtliUaAz4CA5MPGRsaNZHsIl9FKnzZ4GGQ1KLVeIFtAMw8/ukfw4vGaUzvi7tWOry
         yCNKxrpsKoYquow5vBan2arszrPG9sUDn5mGZQTXzqsD1H0hKWcXBTPgDjUvrnZfiv3s
         T/l6dmnAcn2NUoQgIKA6iGYafsNktCF2+liXimb4Amo1e24NqJQ1i5P9BwFljH82rz63
         ftQl44qY0BNxSjYCnrEyOfMKPR2wjF2Rei2uMiJ6DeI0UlHzQNZY56Z8/xa9zUpk6FbY
         gy+xdlR2xX/QfxS4aRrHcOIDywt5EQFGP7JoQ4FUnyF0nmfbY6ev15DCzPZqBBJHyuvB
         flBw==
X-Gm-Message-State: AOAM532qjEL1af+zwz5Nc+CMImhNS2pfxoB7PA15Wl8DP6uTY8QWj7IU
	8liuw9dBFmf/+I7lmvc327HsUPKELNQ=
X-Google-Smtp-Source: ABdhPJzR5DICm25iwKlJSXU08I8qJzYO9xGXRRsZ6SZ24Kgxj3WEdh+QwOjSgmPDQReH3Zvalbm9uA==
X-Received: by 2002:a17:906:8c8:: with SMTP id o8mr39951eje.91.1599081251415;
        Wed, 02 Sep 2020 14:14:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/23] gnu-config: update to latest revision
Date: Wed,  2 Sep 2020 23:13:24 +0200
Message-Id: <20200902211330.4853-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 200b1f1856..ae03a99a61 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "2593751ef276497e312d7c4ce7fd049614c7bf80"
-PV = "20200721+git${SRCPV}"
+SRCREV = "0b5188819ba6091770064adf26360b204113317e"
+PV = "20200831+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.28.0

