Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.24748.1611512817641262340
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 10:26:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hKlZ6nsq;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id 6so10069971wri.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 10:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aASLy6h1dQUAPXmn4jI+8/6Y18KDAlhh5oVnM3k0xCM=;
        b=hKlZ6nsqJEUAbkclP9T7iwKSM3wEdJGDAoe9oKvMAh1XPJG+rAEnj0KoF774LHQKag
         xUyoWD2LsaJTojBXIjFqUDRdrR82LGO+vh2fV3QQufH27Q6qfJo9Y0daqsPdswxU0ht9
         oWtSPlimyafkCln5YjiXARaqHe1FmkXEVHZZMBbaehsfuhFHXmNogmIKhn2AC1v+yBfa
         lTOW2Brd6J+FM/eNTCBau/bjFIwGqd/K60rMNwWl/5q5tejpp/RkFrgHp7+EknPLTGpW
         MhLFeHw7+XQVPYNq2uFdmADm6hHiPrgiqjEIaMv0UTNzcjIZr3RFYqqtymbkUUW5bqj7
         Qs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aASLy6h1dQUAPXmn4jI+8/6Y18KDAlhh5oVnM3k0xCM=;
        b=PMy4WbahtEAXlPQho7CZexV5wvKNWcyLSzwx0LHjZeUlLEJ9iJG3GvTaS5k3xAhh3u
         gN9j9ChC2S5GDmr683dCFgupzhh15FlPcmbHab5hckICVbLSLusWOyJ8qfDofnG7nTQh
         J80/tONqASA8h77ezQRIuvncZo4wdnVwdrvulXU+kQXuAEHV78Ba9xX67tk8oPO2lFHs
         kf7diLB1P5E+f9mh0Hv2JMu5VpCbyrrJghLJmy0Yy7/yQCmpOqfZ+Qq/o7Lmepaj62AF
         L+7DJhJnSgt47l/MyFvHePPpR7aqvlxffAnY5D+yMpqKWjhDOCuSIoD1RhpaeSQQztOg
         zitg==
X-Gm-Message-State: AOAM530Pl5uTCkyZIA2Q/Iu+L1xxt1n3Af7Y2MNcDd76N/WDMeicrJTH
	b+fetK9xTpat2duH8wnI2CAUr0EcdGqhCw==
X-Google-Smtp-Source: ABdhPJzoL4/DF7vCY2dTIaYtYD1pTMXQjGN77aLutqVWZVUOWT23C1FIdR9Q9ZlxD0twEGrqU3oHkw==
X-Received: by 2002:a5d:4b8e:: with SMTP id b14mr2013725wrt.130.1611512816344;
        Sun, 24 Jan 2021 10:26:56 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id p18sm18365509wmc.31.2021.01.24.10.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 10:26:55 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 4/4] shaderc: add spirv-headers as dependencie
Date: Sun, 24 Jan 2021 18:26:47 +0000
Message-Id: <20210124182647.1613511-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124182647.1613511-1-quaresma.jose@gmail.com>
References: <20210124182647.1613511-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/shaderc/shaderc_2020.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
index 18a08ee6c5..8658a5737b 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake python3native
 
-DEPENDS = "spirv-tools glslang"
+DEPENDS = "spirv-headers spirv-tools glslang"
 
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=Release \
-- 
2.30.0

