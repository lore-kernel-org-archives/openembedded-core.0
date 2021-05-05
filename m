Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.9801.1620227972545191822
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i+cG/Ioi;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id i24so2484792edy.8
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lyauEWp5Ejz9Cc1oB3z/iJ0n4fSLWRqlZwRVJ6plrWQ=;
        b=i+cG/IoiMKhWtlRYpawCiBY5i+IIibLSMkLFke6Xs/Xta/wsgAgmVrU2102R+2AWLe
         O94kI7YqBaDRcOzziUx+ODrAZgjqw5woQ3i+2NNkjKUlVlD52pO35aJqhY9sD79/73xJ
         KGHw8azSE28Xnhsuxgph5X+VG5gxEKYd0CM6VxA4l0EhUljVDmcw7nXgqXh72DHmsZh1
         ywbP0z1XzSULyrFA5Eezsd7gn4wK3f51n6/PrvsAe+d78ALPOH3peEnGDK9nCCyKmu2U
         gyHOIyha0M/NwkklFd/0oUPqxkntnAmINmk/AJkY6IXI+/9DmXLmuwheR6yFvuByrfIj
         GlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lyauEWp5Ejz9Cc1oB3z/iJ0n4fSLWRqlZwRVJ6plrWQ=;
        b=MK8W+7Y1yUgSp6OlHFOBdyCL0OnFZW9bC5IpRNZytvhYTFDBlQnaklJmk0d+V4JvcM
         72IOKuTvd48Omj6ysjj9/ks5kt0ddcXMV223JhTsWp1kjfHX65SBYip5QX3sXo0xK0nh
         +JGrMMGQhqms+MxzrXevexYzLNDwlE3XRewsO4YuGKEzPyB6yF4oeybbpxAhnPjtDydp
         gWidPirIUJjl/XmdbM4k0rxhX6NQ7s5NmVvIfyirDL+VsbueytbNKjLHaqPEyf6XN/Fn
         i0wyyC1+cmKzXnE30CnQ0wN4xwI/MMjq0IxyUQVESZX5Ser9ZE+C96nPnlgRpomy8NCs
         LRwA==
X-Gm-Message-State: AOAM531LWkVJH4eMzFeXhFvbyI9v7DkCglceqogqM02ow5FjRtD6RY/V
	LPv8u+W1cdeppFLj2MqLja/ZM0D94TbpSw==
X-Google-Smtp-Source: ABdhPJwKn1JCnZil2nU02xQHIPvQY0f3gY2ZIuS3DjtHdT1gxB7ADQv6L6b+vs0xOajbn6gHv/5JiA==
X-Received: by 2002:a50:fc0b:: with SMTP id i11mr34164109edr.259.1620227966160;
        Wed, 05 May 2021 08:19:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 38/61] libfm: upgrade 1.3.1 -> 1.3.2
Date: Wed,  5 May 2021 17:18:27 +0200
Message-Id: <20210505151850.660512-38-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/libfm/{libfm_1.3.1.bb => libfm_1.3.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libfm/{libfm_1.3.1.bb => libfm_1.3.2.bb} (93%)

diff --git a/meta/recipes-support/libfm/libfm_1.3.1.bb b/meta/recipes-support/libfm/libfm_1.3.2.bb
similarity index 93%
rename from meta/recipes-support/libfm/libfm_1.3.1.bb
rename to meta/recipes-support/libfm/libfm_1.3.2.bb
index b6f9df0c55..eb0949ae7d 100644
--- a/meta/recipes-support/libfm/libfm_1.3.1.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.2.bb
@@ -18,8 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-Do-not-add-library-path-to-avoid-host-contamination.patch \
            "
 
-SRC_URI[md5sum] = "c15ecd2c9317e2c385cd3f046d0b61ba"
-SRC_URI[sha256sum] = "96b1244bde41ca0eef0332cfb5c67bb16725dfd102128f3e6f74fadc13a1cfe4"
+SRC_URI[sha256sum] = "a5042630304cf8e5d8cff9d565c6bd546f228b48c960153ed366a34e87cad1e5"
 
 inherit autotools pkgconfig gtk-doc gettext features_check mime mime-xdg
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.31.1

