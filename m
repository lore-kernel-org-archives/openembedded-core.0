Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.6014.1626265587098383606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pbKJoKvL;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id l7so2979590wrv.7
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5v6buZDID9sP3NFU2CctqvoMZhQEU1vy2kVRKQxt6OE=;
        b=pbKJoKvLuCQr/Lz5oJuxE/AvxbEYeMzIlnTpQ/q/Z3RSNLH/MeZCeL3ZgV6+eMw1Nl
         v5OT3d0rScP2cjZfRK+l4Xm+KWbNKLI1JKWhSWcPDVT8my6mNHWJrxToqbVG2+8wQUNw
         ldA/WOks+l/dWYBz7jQgsGvr0cihaAYCdHdE3I5ZSZRZ3snnP5WCPPRS+cjL/5BV9SqL
         aXaSbSmoiQTgQKkBlgSKPajn3sm1ZAeuPx9yFpqX/EaiMPQ28ShuuuXHwID/tW+ltNFN
         9iDVJzpuA4+acXV+APTJfQSVpVSKkYtbqLB/0E7Cf1RBP4djaOMcEla06QsKXNdnm0H4
         EhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5v6buZDID9sP3NFU2CctqvoMZhQEU1vy2kVRKQxt6OE=;
        b=N0klMXTMJEhvYhRQDZo7T/6SM+mVJuyH2NkqMEYd+QdHbV9SIm+xQm5+c7+bOJ6AN1
         7EZuIOrD/dcCKZR9t45xrLVG3ftllSRtWg9OGzYyv1lyTu0IcHwHXJ9rLlkcXub1lnep
         woyXveF388MvSmRjlX4sKu8D7PdUYJcrIF8G2NPdDo19zrHTl5mFIDBF+SbOnTbcQ++c
         CSr0Qpwg1f+TAJ2aMTJQPySqRjmQRdEVDj36/Ohpu7zcHjF8lNuoX+weCd5xdQs1FXjy
         rm19SnfgvN39urG3aSSrS9IiqMuBqfIO0KTrblcegkEby/Lra6RDcnAX3oNR/ZgHOhGr
         8IzQ==
X-Gm-Message-State: AOAM533YAdze8DRtUNcXQ3bI6TtWJc6LFuoL99yDF+hPzB4Dgq+ygFt6
	zIn8+GnyTzLaOSOZorrmBdCkhRiWk/4=
X-Google-Smtp-Source: ABdhPJwskO30G8BNVK3xHzxYc67vp0pzf236V71Px1cjWaF6JqOlt66TgZEqBtnY+RN2CVghfIDd+g==
X-Received: by 2002:adf:dcca:: with SMTP id x10mr12422445wrm.59.1626265585727;
        Wed, 14 Jul 2021 05:26:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/21] xwayland: upgrade 21.1.1 -> 21.1.2
Date: Wed, 14 Jul 2021 14:26:05 +0200
Message-Id: <20210714122606.605142-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xwayland/{xwayland_21.1.1.bb => xwayland_21.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_21.1.1.bb => xwayland_21.1.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
index f5db7cc5db..794a7bd98d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "31f261ce51bbee76a6ca3ec02aa367ffa2b5efa2b98412df57ccefd7a19003ce"
+SRC_URI[sha256sum] = "b81cbdd5ad60b8b7ad8c3ecc7ec2a28c9bf021448670735cebb501f08bebd18b"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.31.1

