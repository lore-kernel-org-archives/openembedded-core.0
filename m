Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.9796.1620227966128140233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cWcsi7Lz;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id w3so3463200ejc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PeX0AoWv6QMn1x+fHQKy8UnmOE4G1Duc/KZHIldQkg8=;
        b=cWcsi7LzxiTBMvdqFhj8k6mpbsS/WVtG1ajuzJb2AqkG6wkRx0H+X7YdqAZPKL+Wc7
         jO1Jkq8LDxI3RpAoGYLOXzRDz64/trq2E5lFX2Q124XnOwvAHO6oqpHLJ+2WYT1RjrtH
         7hl8+PmcwWnZo+GS8v5wg5LH+OrPzxb42gSXqcjQp//G0X/986c5CK7kExd1PAFmcQcD
         4ZmZmMHbXLinBjkaLBr3WCf/OCJ+Z4ClCZjxY0gxDqW08tMH9rJqgZZnYv65Eral7Y7D
         bluE9C/0eQ3vf9AOVlUCqfWQ/XqWl6tWVOuveJxVCcSfVupMxAKGLMdVUynOxJORjMNS
         KYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PeX0AoWv6QMn1x+fHQKy8UnmOE4G1Duc/KZHIldQkg8=;
        b=odeJDIPKMp3+YAyR8Ux149clPow8LJW1VI+SiOZJhIw6/OTJa58i9b5eSydefivv06
         XV7Iygi72s5B/g4kAc5D0NGe65oK6umduujg6ZTCuBwKXUMBQvuAEz/kLPHHBRAL5HbF
         lE1mybhJccvdgd34WaTf04ht0HHz+WY6LXM5aIJqfekCY1rPCBjlu8nPF8WhAMiftRGa
         HaXDI6GeoRy1iGQfVdxlLbCP42NhV84K2ZPj44QWaqdmKzEtz+oQr442ui4alGfZnhlW
         QOW//iZLi/cTU4sPCmYCSd5+r7LxxrcEwzOU2IKycZkAHQ9FaT4T4Jeywu5SOWVRB7jx
         B6jg==
X-Gm-Message-State: AOAM531A+9jXNL0rqssdPSDlOiqvFYLlzsbM+0g9lD+8d/GxueAtgC4n
	3x/0Ozb3Uw30NNw5w2h6J8fBAJc7LHAXrA==
X-Google-Smtp-Source: ABdhPJz/z+teLVM/KYRdeib2EnqKzZb+VW3xyT1LAhrxl2SMsZ+racdztFictBxvXTpmandNfvilwg==
X-Received: by 2002:a17:907:628d:: with SMTP id nd13mr8549896ejc.299.1620227964772;
        Wed, 05 May 2021 08:19:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 36/61] harfbuzz: upgrade 2.7.4 -> 2.8.0
Date: Wed,  5 May 2021 17:18:25 +0200
Message-Id: <20210505151850.660512-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../harfbuzz/{harfbuzz_2.7.4.bb => harfbuzz_2.8.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.7.4.bb => harfbuzz_2.8.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb
index b08f60255e..6e3fed7357 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "6ad11d653347bd25d8317589df4e431a2de372c0cf9be3543368e07ec23bb8e7"
+SRC_URI[sha256sum] = "a1079fd021adaf5683351f34587a255975cc3bcadba31246ae40ebebb95ecd42"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.31.1

