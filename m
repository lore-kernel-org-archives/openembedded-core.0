Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.6075.1592864165141837636
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RUCnRO3u;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id b15so110275edy.7
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 15:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LDIVJPKZs9h6mkrVGDwvuSK+Ek/8muG5zwGQSZhktY4=;
        b=RUCnRO3uqD+eLQqQojVphyHC3pgGFN/G8tfDR9n2wcL2TW2EVPCh6iKC6DzaqeEG1L
         4RSDaVEiKbLc7gPE8qgg3XIW4TzXw3Ecvf//zUid96xL0LRTAmTCFO/rTTARivqqQefJ
         lNQlhTaJd5v9wljdrqbvPqo7wWMf2keO0r6qZNRz8VRfZhR5RW/2BGpBxX1c7r4gqQ5g
         3mEX2stkxcP6I/xcMcchDcAZhj2nD4he6kRIH0HAY8tUBHezW78P7lMBJjARoY6/mS/I
         eFvkXK5Hk3xAy0cY9j9jsxq/RzjKgccY1dLPt1uVKw+Zkb78YWk7R3xsKhs7uzQLYbep
         /5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LDIVJPKZs9h6mkrVGDwvuSK+Ek/8muG5zwGQSZhktY4=;
        b=FqBl0Rct9/xdssyL8RebOCRmfoTLrMLs3YMQAFQ+9FRmCsASSiE9rPmkPBPuhJuJwH
         3iANQgI/opnJeVM6xN9hBsbx69S1/qpi8NiusdNCKSzuM7Jdbn2umDrAsHsc8gX0Bygk
         Ojjsumc3QasbBbYemBZae0OxhnVh9ijs7PAe4jFrQMGaiJb9fF9rAiWf4jJJ/d3M5wXa
         5NCmugrBnodS3tdrGTZZwQL0yxPrTUfXes7ILVHaZIdYF8XPdLIxg2/g+k2cVBo7XZ3Y
         Jj84z5vhz1fuWc9xmjUm65lUeFW1H7z1/EDDGU3fNm83gyGpfBdgPhf/02oW//JZEOPl
         S9HQ==
X-Gm-Message-State: AOAM533dsdYGAHr4EEkqGZfBeFJ3kuX36NNAKS6dWSGDudK8BdiAYo4G
	DSbDXIPW5P0yXNdlq87Yt0vyGQb6
X-Google-Smtp-Source: ABdhPJxbS7GkRzSsuhtlG/CnafKCHlDl+g3ZMOn4rnuV2cn991+d27LZ3NP3DsMUMt4MLBPNcY7hMA==
X-Received: by 2002:aa7:c5c7:: with SMTP id h7mr18583093eds.177.1592864163031;
        Mon, 22 Jun 2020 15:16:03 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f481d60137a2e45bfed0e33.dip0.t-ipconnect.de. [2003:f0:7f48:1d60:137a:2e45:bfed:e33])
        by smtp.gmail.com with ESMTPSA id n16sm3703803ejo.54.2020.06.22.15.16.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:16:02 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] libinput: upgrade 1.15.5 -> 1.15.6
Date: Tue, 23 Jun 2020 00:15:47 +0200
Message-Id: <20200622221551.1530869-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../wayland/{libinput_1.15.5.bb => libinput_1.15.6.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.15.5.bb => libinput_1.15.6.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.15.5.bb b/meta/recipes-graphics/wayland/libinput_1.15.6.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/libinput_1.15.5.bb
rename to meta/recipes-graphics/wayland/libinput_1.15.6.bb
index e56f181bf5..f81cf7f031 100644
--- a/meta/recipes-graphics/wayland/libinput_1.15.5.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.15.6.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[md5sum] = "c9a1b15bb932eaf22f840efe4c3f84eb"
-SRC_URI[sha256sum] = "a90efc8f423c3094f2f9f372fb92381b2f3aad62e8b5882a8abe333aa8249c97"
+SRC_URI[md5sum] = "b2388a1d6f0dcc944b49bc7239a53be8"
+SRC_URI[sha256sum] = "aeedea216a6317ddc6e27c3d54f26b987078780db6a8320cc09e19c25b307f1c"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.26.2

