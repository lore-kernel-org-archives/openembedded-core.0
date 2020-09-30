Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.6585.1601504127597489398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1s4/QaPy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.193, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f193.google.com with SMTP id w7so2357226pfi.4
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ioyzo+RU1rUL7xMWL99lZpectLxu7UKHrY8VPJzByg8=;
        b=1s4/QaPy2ehKxrNwkBywU7d5LfTqEXSF8OfL24e9R+44HZzRSLa+4W2rJR3qIi0Gcy
         zISN8LP8OaaulYikvguzMD+2e+JgAFeybb99m/TeG/NnFm/S5iEAC8p0rNS3v9BYxtMf
         MfNyMKEnCscyZNQKmwxlq1cxuwLJBurVKfHGENUFhn44uUCCvPYZxgctNDmiF8IItinZ
         1qK2EMXbawqEFQdlJD3tCDK8lQpkFQJOh9nEkVylarEy45iXvGOUGludUUdrQl9E0NM4
         2sgm5IOER2HnCniOnayghKikMPOXZLQMwoPMlue5FQbqY+93mzsoLKqmnhGHBIb82hSC
         dkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ioyzo+RU1rUL7xMWL99lZpectLxu7UKHrY8VPJzByg8=;
        b=e57Hy/0opLGOo0ZFKUT8UgNlKJajflv2XK7vCFlr2MepWL6leHeGUsb4DrpuDJQ4kn
         dkKOLZjYNrjcya6AFz1+xZsEO02xeMHM6HxMnchhSkMTsUhW3D4C2mDv+cPn5P2d6CW9
         pf2Fj7oZbnGFOHfmwi2y5VbNzbw/wvGRXcS53qyMuUSia0UuuFjA7B35CmqMnPDsjCBX
         6U2kro7uZ5ptGemilgLJP+Iy//UFjsxNH6jUc8bbBuXypcTJeQ9zKJFHcbUKE7LimbZH
         fKBq8/TBAjTz9jW70A1isLDSJqTaDteWK14YFMRR4iSdx5EdrrLOb55Ir23O3URWI3Ht
         oZzQ==
X-Gm-Message-State: AOAM531/UvQv/hKxGCtnFQpIhre1Lezi3IroeN5IvEkMD9lT59+z5zzw
	IhDYpEVZ2DnQL59YhBa6UZudDzei61Q1QKUNlic=
X-Google-Smtp-Source: ABdhPJyVde+4gDPIS3x6nI5sANtPH6HZMqOkHs2HUkJRkpmhE+6BPm4f6VWROp+iM+U04sJuLUWU3A==
X-Received: by 2002:a62:1e07:0:b029:14e:d96c:9e04 with SMTP id e7-20020a621e070000b029014ed96c9e04mr4169012pfe.58.1601504126708;
        Wed, 30 Sep 2020 15:15:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/41] kernel-yocto: add KBUILD_DEFCONFIG search location to failure message
Date: Wed, 30 Sep 2020 12:11:35 -1000
Message-Id: <9f0e7c1a17542aa36d4245f15f6ffbafcbaf9bd3.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It was pointed out that since the check for the existence of
KBUILD_DEFCONFIG knows where it is looking, that should be part of
the error/log message.

We only look in one location for the defconfigs, so add where we
checked to the message.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d4d80be41d273abd1fb6416976603d924457973)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index cc8bcb909a..ec5fb7b1de 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -148,7 +148,7 @@ do_kernel_metadata() {
 			fi
 			in_tree_defconfig="${WORKDIR}/defconfig"
 		else
-			bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
+			bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree (${S}/arch/${ARCH}/configs/)"
 		fi
 	fi
 
-- 
2.17.1

