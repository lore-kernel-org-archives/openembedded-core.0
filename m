Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.4810.1618701109452323163
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Apr 2021 16:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=eRE6Grtq;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id j18so50360178lfg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Apr 2021 16:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PZ388moZ7wLmWhHuC/M4VHlqnQ6DcK6DywwdopheglY=;
        b=eRE6Grtq+OrocAoiqz4UyLi0HVFD6NmWcW3ocFujYtG6dL8jHLKN3FMcTKT//3Ai0T
         nwvcLdontdpiy2FR9zwRVY51V974/kPxSdt0ttPFDRBcdcYDja1XTlIvPtscg/F1Edwj
         DHziTRtXAolhGcQfAEB4C2eek60quF7Hp5S9kVnKdewEEV/OsYi3sw7eIsvARBRw6xIB
         SsKcUT5XCGOJSOEyS/qnaIGhaoNMMNo0Yokw6Bt0gTCso73zUjDVLY7s4ZKg6wECJzMe
         23iWue+d+rQ3pOQxwvuwCULdxke4zXcrQ7HAOSxg9xUQqiBPLjSnNMrM65m+7UQ9zEw2
         LLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PZ388moZ7wLmWhHuC/M4VHlqnQ6DcK6DywwdopheglY=;
        b=oEXKm7s1ZIrJMzqYEzAUvJz0CCIzrdTG6SR3g+rvFduMCHdqzG95A6RcRaE4JVMkQY
         Wxh9zzmpQjJEwY3Crt1/Zr1E2qw4X4QQx8oIsaPL9IXItRxS739tuKWoObRHLHmzgkhD
         AT1moouqzGxU0MVw44Lp1tqZW1CvapcmSPoBexLiDf1IshSrglc+iuK96+SKvkJFQMsq
         Ae2IeZX5FsReQ6a3EdCE0wxW8RD/R9CBZz/3uJvjwQDmyu39u2PuSph32Veg2v/lHTcI
         mC4kKJx+qEAya6ektVgO41S6/qO7ucDYmx5xdCf2M6x68f8Pgo1u80YieTzgF79u0dgG
         IRuw==
X-Gm-Message-State: AOAM532WeJuPZNHeNYLMsBo7rjLKxURmOeCkorL4LsUnp/PchmkOIx7k
	9SxsWVLrTu9W0D9B5cpXCpKw+T7AyDUPSEQX
X-Google-Smtp-Source: ABdhPJzmv3+rOECSRa+jGYwpvi136ixtKA8pXESYUDm1VfeyWNwwj84O+3Xsv4QCbgDG5J+TOTWijA==
X-Received: by 2002:ac2:46ed:: with SMTP id q13mr7259180lfo.543.1618701107301;
        Sat, 17 Apr 2021 16:11:47 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id p20sm898118lfu.306.2021.04.17.16.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 16:11:46 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] autoconf-archive: update to 2021.02.19
Date: Sun, 18 Apr 2021 01:11:41 +0200
Message-Id: <20210417231141.407616-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...nf-archive_2019.01.06.bb => autoconf-archive_2021.02.19.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2019.01.06.bb => autoconf-archive_2021.02.19.bb} (78%)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2021.02.19.bb
similarity index 78%
rename from meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
rename to meta/recipes-devtools/autoconf-archive/autoconf-archive_2021.02.19.bb
index 13593d7bb3..54079b5f09 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2021.02.19.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d46413c8b00a125b1529bae385bbec55"
-SRC_URI[sha256sum] = "17195c833098da79de5778ee90948f4c5d90ed1a0cf8391b4ab348e2ec511e3f"
+SRC_URI[sha256sum] = "e8a6eb9d28ddcba8ffef3fa211653239e9bf239aba6a01a6b7cfc7ceaec69cbd"
 
 inherit autotools allarch texinfo
 
-- 
2.25.1

