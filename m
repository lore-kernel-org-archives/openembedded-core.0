Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.20369.1607112483047221969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=czr+V3aD;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id f23so10467447ejk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tlac0hPVbtKXyo1hTySh+2hZX2Sd47tNz3fix7CR6wA=;
        b=czr+V3aDq3qYCfMxQtq6ldJf96V3CUY2+lxmBR69UBsxqo5sOUf5tw19l7yzLwV+Ow
         hJWoucXPqW1R08UFtkAJdr9cA7wNul9U/uRCFRy7zIUBxP3rSDmf0ga5E48QnMTA32r9
         oo2Fs8wB2UHcgjPYS+RXqBRT2npfDQN299hbACIOt6EzePAPQ01uK+/UBhHuh342uLv3
         EfaWVqp78VEQdV5Yd+hN7bk3CsFilJhHs5ENZwjj0JN0fabofcPH4b9i9mjmlcHDdlN7
         JWQfKf9an4Q5pQB/IuFSVaNeCpKcwkgtUoIezo/VtlKmb4VMQZJxfGpE+IQ3uToe6+Og
         gLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tlac0hPVbtKXyo1hTySh+2hZX2Sd47tNz3fix7CR6wA=;
        b=J1x2vxHtWqvUvXU3JPU4R7ckfymQVnbC9LSViJI6ONSurop7dIyCOZAqw3agSbE2D6
         IFxJy04wr5XZPUlEhK9JapYiWYM5aT0IHIFnbtaL7kkH6BQmBHdHxbAnria91rMLjla5
         LUhupVzdPiFq0LJYijvHw5LIYzxoBf4srB+aWh18iC1yaB/eMtY5BXvi6u5NJLHdh/ra
         vDiINn+OIBiIGdK8LDJVMiLYiE7qx+H1VxKBdGZz0PXtVD2FuUFv4/XIjFqiw6gJwuK5
         I5pkHe8SEZ/2Ff5MJ+L7+/PVRq6AF4U4MVqC89FQrGQujw8amsQ7QVecFhmIyM2yx14v
         Rz7A==
X-Gm-Message-State: AOAM532rEZXphBhNMELS7pZfWVIpC6hsuZv1JHhoDy0h0eE6p/iJ9MKH
	jo+5Dtsge/Sbs5uXFdBOtBUVTUlNLqkbVg==
X-Google-Smtp-Source: ABdhPJzjnkmZtxyfrUf+y87hwsn19Okqbgam6lElOvahbGZoQUxg4sQl/aI3e8QQrKIw1EnUwJIVAA==
X-Received: by 2002:a17:906:2b50:: with SMTP id b16mr8459962ejg.255.1607112481464;
        Fri, 04 Dec 2020 12:08:01 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:08:00 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/23] xkbcomp: upgrade 1.4.3 -> 1.4.4
Date: Fri,  4 Dec 2020 21:07:31 +0100
Message-Id: <20201204200737.7072-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-app/{xkbcomp_1.4.3.bb => xkbcomp_1.4.4.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.3.bb => xkbcomp_1.4.4.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.3.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.3.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb
index 2fa79c8438..44143a04ca 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.3.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb
@@ -15,5 +15,4 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF += "--disable-selective-werror"
 
-SRC_URI[md5sum] = "6e4751d99373f85d459ab4dff28893f5"
-SRC_URI[sha256sum] = "06242c169fc11caf601cac46d781d467748c6a330e15b36dce46520b8ac8d435"
+SRC_URI[sha256sum] = "59cce603a607a17722a0a1cf99010f4894e7812beb5d695abbc08474d59af27e"
-- 
2.29.2

