Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.2806.1593155966922556072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z11r6pFr;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id p20so8324849ejd.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gQXKKFV2e4WerE3OOaMyA9YO4m/n2/FaTW3e0Y0Qw/A=;
        b=Z11r6pFrcrRdhxNlgLjC6F3M4baEm7EQK5xfT8pDJxK/I5KjZkvkwbgz1wu6ZsKHdz
         /JrqJxXIrD8TD9GyW5oyIbfC7R6f6j5LvWgdRXewAnU8PfHpx1korBHW2XXGWG/ykFTW
         gn4zx8DdzWnE6S5AdveWz3Q10erd46Z1HPfIqOfpabfgqm41V017BtVksU1wXGFJnYIJ
         s4iMY2jx4lbm6otnhqBz3XWq5tZEgOOpX7mAlkJM/eKTk5cwsIv4tXN437PV2WqmFDpS
         PxzhMB7VhUhR2cCggnJnhkzsM9lwKGZFwnVFvcU/Zuoz5hCSpbqqWd0g/84Xd/OqD7X/
         eKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gQXKKFV2e4WerE3OOaMyA9YO4m/n2/FaTW3e0Y0Qw/A=;
        b=ZaZwqUEl45olvACxPiT0kl2Y4gshRNaY0zWDzkY0kI0R+77WQJny4kOv3D8mKSumQ+
         iZ/fZcrO3uS0wkLOlMqSYZySnCJph3RRUzCih+6ToopL+xDzLcXDx4uZhSEE/T/4TjnS
         1VObP4KOpkUMiBfS83HeI/UvA3HuC3+67AHWN8TPHFaNF7TLSUZyP5YUizbBNBtlrV2G
         IGbsUcRXBZiJXI0LjdoeVr2z9PoSI2trfRWP+J8PKV4gioI9ue4vGomfEMcNe515r8I3
         D7iUo7k0kICW6jfTUdSwynuUQuIi63qN5MXsmg3YO0Gq60xnsjskdTJe9fpDb9XC5ers
         t1JQ==
X-Gm-Message-State: AOAM531eDkzpXQ8/Dmy+9T7c3gE5Nc0MrQV/38kBA0jpdvrRGrsEfeiY
	BB2P7n+86R4ryI5iMvigmHAol4KZK+4=
X-Google-Smtp-Source: ABdhPJxq79sz1QNmHl/jXIWX9W6ibJJqQabhAakN9ZTfAuinjddHTfAzx+rplYl0/eLLO9kBbH1STw==
X-Received: by 2002:a17:906:198d:: with SMTP id g13mr1336172ejd.281.1593155965286;
        Fri, 26 Jun 2020 00:19:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/30] libcheck: upgrade 0.14.0 -> 0.15.0
Date: Fri, 26 Jun 2020 09:18:37 +0200
Message-Id: <20200626071844.29134-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libcheck/{libcheck_0.14.0.bb => libcheck_0.15.0.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.14.0.bb => libcheck_0.15.0.bb} (83%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.14.0.bb b/meta/recipes-support/libcheck/libcheck_0.15.0.bb
similarity index 83%
rename from meta/recipes-support/libcheck/libcheck_0.14.0.bb
rename to meta/recipes-support/libcheck/libcheck_0.15.0.bb
index a88f009cdb..177c0edc8f 100644
--- a/meta/recipes-support/libcheck/libcheck_0.14.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz \
            file://not-echo-compiler-info-to-check_stdint.h.patch"
-SRC_URI[md5sum] = "270e82a445be6026040267a5e11cc94b"
-SRC_URI[sha256sum] = "bd0f0ca1be65b70238b32f8e9fe5d36dc2fbf7a759b7edf28e75323a7d74f30b"
+SRC_URI[sha256sum] = "aea2e3c68fa6e1e92378e744b1c0db350ccda4b6bd0d19530d0ae185b3d1ac60"
 UPSTREAM_CHECK_URI = "https://github.com/libcheck/check/releases/"
 
 S = "${WORKDIR}/check-${PV}"
-- 
2.27.0

