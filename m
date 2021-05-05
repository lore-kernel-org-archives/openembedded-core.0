Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.9832.1620227950106122536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pZ56nvjQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id w3so3461867ejc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UAWUriA/h9Wb7RHTv9t9PCtMZ4krzLJwbha/IAnhQ28=;
        b=pZ56nvjQW5Bi8jFcJ4kOB5fr2cotGu8NQqeD6ccfWOVE+KISvboXZOsamso6E+UESV
         8K77Qi3JScX3I7OUqMHnrEuSzF8bHa5imUE1OYNoECMf82zD1ObMZtkdp2qzv9GKrI7P
         3FqnJu11taUsTnUuOby3uYGpnA/8WRzSQHWpoFwML2i8sesJRUcEGFS5wCfIppiuXntE
         TqSEajGyxWBt89IddNDfr/xLVrgu69HrIGqtMc5uSc2SKxn1z1KxcPBB7gL4nMHhpmzo
         /BkGB/P3ufer3Z9UD0B+cdj3KDs39LMZBK826MwyoG+BZZYg/t2omGaSDuBwQirB2pp6
         2I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UAWUriA/h9Wb7RHTv9t9PCtMZ4krzLJwbha/IAnhQ28=;
        b=CC1QjcKFmT+bp2eNHHnDGtAt9EVe2BuFv27HUSJsCYA4miqjoJgAWNVss44mBSUNOg
         g6NE5ZoAaZWY4oX7W493gUradLHu/SToj/spmK1M0cuO/D4V7RKSOCNi1JMxzg8ViUaB
         CNFeZ1zERT59FrVbeNRboM4aZLcMPF02kxegTzCAl/ruxXVhbKUl3zEl4mHuhhOe8/oV
         PKzUV+4P8k0tZB+I+uiUTKztN2tgUQyrk7zRNu/QmFNpxHKSf7wUvMAGia5Ot1GcNNTr
         5ZtxxBUV1+4Sfwvo6o7fSO8sJ9azrPHxpMn4nxCBlGlG4uLb6Q/Zj8idEYtvE7rKl3XO
         3OzA==
X-Gm-Message-State: AOAM533654KIjKSFgiWJTYthplaknntgXeRm3XAKw8WJ8gmDSgoMo++u
	+A9ixBFiyEjGrV9Uj+mggLYVynPaHeYbOg==
X-Google-Smtp-Source: ABdhPJzr5vxNj1xN8bpX3oJ1zXXhDONRvzYGiMlEvQvcpuL/onZ6lzSCj/w0BEFgsBoJp/XWJOAY6w==
X-Received: by 2002:a17:906:2e97:: with SMTP id o23mr28260124eji.315.1620227948761;
        Wed, 05 May 2021 08:19:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/61] libxkbcommon: update 1.0.3 -> 1.2.1
Date: Wed,  5 May 2021 17:18:05 +0200
Message-Id: <20210505151850.660512-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libxkbcommon_1.0.3.bb => libxkbcommon_1.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.0.3.bb => libxkbcommon_1.2.1.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb
index 99f55f4a14..3df90f7c3e 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a2202f851e072b84e64a395212cbd976ee18a8ee602008b0bad02a13247dbc52"
+SRC_URI[sha256sum] = "e833a7d3024c9bb9d5eb2b20f6d5de08865541f21bb7ba227c83cbd236691fb3"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.31.1

