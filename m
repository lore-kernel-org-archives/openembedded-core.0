Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.25224.1591602522081437374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DbBvFt9e;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id y13so17159113eju.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hr4gqDYce4XzaFNuQRWZJPLpHDQgqV+qmFCp8Akuifk=;
        b=DbBvFt9e0JwJPnTg5zhKlzRXPg524d3rqq0w/3j6yHNczQqDKUBMcZCp5889Rj7Bw9
         aLRENaAIPiJJoHQsBeDTIXUQYQw4IYZLFiIdtgFKoV208ceX4NOlFC4hLzbWhHPFb3DY
         FwXnyx3XlD0BtR95OM7sjperKOYe1sdilUz+S/bKPyfs1IXd7qI8uk7py5HJvjFYz8vg
         elsv2+zmm13qqSPSWQV0TjcDuPpHp5Kvbq67SOC48wgUPQLCczJnN7dwI/qz+6VSNlGq
         H6faW37qY5CRnYojnzagWUL6NjpGgG76WqagjueSR2lWBZEipH/xwkRzSsxSKVr6fCPy
         c7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hr4gqDYce4XzaFNuQRWZJPLpHDQgqV+qmFCp8Akuifk=;
        b=fc5ZmGvVI520gYYJ8mvpfyfi/r47erVf+eAekvhuO1lIEQDLNWz/EvagPDxk7Sahmv
         Z/J0pEoP37WAOyH3/XpYO45dar5Q03WFqlNhLB1msdf4FReLLVtwcMjFkhEEsM+Y1AaW
         UVpYZ/u+ezJF/Yxkmid5+8aUyrlVaEuD1f40PJQvh+JAdZxgLNasjuXAvVKZgRZzQ7Il
         8+ePwgsRUvBFIxmLsNUzHrcP8QUJI67PzS8VowgiO6scXS0Z41EvzqOHJxwEKrxWa/9G
         NMxdvxDTOM0OyTtakN/zEJ1JdcjTClNeNP5lPw2JDPYxyNtv1oOLjGV5OAycE8EKQAl4
         RHjA==
X-Gm-Message-State: AOAM533X2LqDHDxxYA8pvh47XklIB0cMLSfJasRypIS5PUw2c/sCFbQI
	GY+TgAe6yeM7gqrqYx3JWLHm6sKlPG0=
X-Google-Smtp-Source: ABdhPJwm5UZBiekXGejDqChu8KX9mALpUPB505vEqP+/DjRH5pxkdqrNLA83HefVPhGRVJneE/P35Q==
X-Received: by 2002:a17:906:7212:: with SMTP id m18mr4118126ejk.29.1591602520441;
        Mon, 08 Jun 2020 00:48:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/42] go: 1.14.3 -> 1.14.4
Date: Mon,  8 Jun 2020 09:46:48 +0200
Message-Id: <20200608074659.7051-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index d729b65267..1050116950 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ".3"
+GO_MINOR = ".4"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-SRC_URI[main.sha256sum] = "93023778d4d1797b7bc6a53e86c3a9b150c923953225f8a48a2d5fabc971af56"
+SRC_URI[main.sha256sum] = "7011af3bbc2ac108d1b82ea8abb87b2e63f78844f0259be20cde4d42c5c40584"
-- 
2.26.2

