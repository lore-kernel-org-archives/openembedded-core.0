Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.9850.1620227969743653615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h1JeU3hC;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id f24so3445423ejc.6
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g+2+idrECWDAPyFsIIB6iZUVO+qmVyg05lzbnuzojrc=;
        b=h1JeU3hCoEn0eau82h+PKxf3YGCEPcB5jLIPwvg+IslkhAnCn2unVlk9JgGanq39v+
         zvbn7sbcekc5T0JL6ew/ttnEZ9HdChk59037xDdogy2oHvGv7K2Da6mlQC1VvGzF3d/J
         B8+YAQ4YcpxP/8qvQOg9wenvYqcQUNqcR6vsk2nyUCKV0g8L+kmlJrxRxGW9Jhw1BfTm
         2vLi+eSrnmIoDj+pMjnj57VCBA2lccRFVU9Xy7nGtFN/GCyMfLl7m93+54Z51t7wF8Nn
         ncFtze5pktQHszycwdQCeeDi5Ljn99jWSy4BD2Qp4LYobdxyj4pXTSebTuHrlL7f3ZrU
         BBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g+2+idrECWDAPyFsIIB6iZUVO+qmVyg05lzbnuzojrc=;
        b=cUgu4BLNrTixPZyw9bQrDKQDebGM4KSZMwnr0Ixpoh9Q2Js7XYsZXB8kzvS0yN7g44
         a8Vp8lDEnXQAIhQQ+Tle9e/GjoDCR0v5aOeh+ORVxAiAacjr3l/fCzLgtZuvytLw0Ob2
         5F3vj9tiD+Hjp1X32f57aANQha+KXFyVRWw2lP8hqZgM7mGCDuUYYrNcZpCYNTg6c4nt
         Z+8rccru1ramZWN8fLIVB/z97s4QzTLnpGwdeqcZBm1Cgq5NfYm6t/+K4llBT7N5J5QO
         5S4tUIzEcNrgeSWHEnkhS+W0dIeI6v35bdX+WVJBE6FbejVnH+LCrLQRPCRe0iv9eu1K
         f1nQ==
X-Gm-Message-State: AOAM532DMZ8b0E9U6N1btKNFId6vTkItYyz8Xw73LrlQU8tBOETBwbbm
	MIrv0epcrgQWSoMgZEbzXMHsQNA9G/r1aw==
X-Google-Smtp-Source: ABdhPJwTV5fEdkk+vhpX3QHwdVuHgrCVJtN8crXHXBpSkTwGz8MXmT7onjDu+3lXkVwyFmd2i8Q1Ug==
X-Received: by 2002:a17:906:c827:: with SMTP id dd7mr28500841ejb.225.1620227968360;
        Wed, 05 May 2021 08:19:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 41/61] libxres: upgrade 1.2.0 -> 1.2.1
Date: Wed,  5 May 2021 17:18:30 +0200
Message-Id: <20210505151850.660512-41-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libxres_1.2.0.bb => libxres_1.2.1.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.2.0.bb => libxres_1.2.1.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxres_1.2.1.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libxres_1.2.1.bb
index af6bb19a25..29a799a328 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.2.1.bb
@@ -16,5 +16,4 @@ PE = "1"
 
 XORG_PN = "libXres"
 
-SRC_URI[md5sum] = "5d6d443d1abc8e1f6fc1c57fb27729bb"
-SRC_URI[sha256sum] = "ff75c1643488e64a7cfbced27486f0f944801319c84c18d3bd3da6bf28c812d4"
+SRC_URI[sha256sum] = "b6e6fb1ebb61610e56017edd928fb89a5f53b3f4f990078309877468663b2b11"
-- 
2.31.1

