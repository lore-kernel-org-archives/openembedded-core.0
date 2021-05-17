Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.19533.1621260902635827141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ex4pzSGZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id t11so3779232pjm.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=v3FP4BEtQKxSjVuN0mB6JSCehYmr18/RK6NvBQdSBs0=;
        b=ex4pzSGZjLqs3SyO6gcBK7b+vTHNX5offzbIr7FN1Cr6vfTknzZe9GfT+I9E6IDOf3
         lCVNLTH8/lvfKe1yvyY2JJ3UEDfOILDEHmh7YwJMNKOB7aMBF6ijXCVT0ChJPG9DYuD4
         b8nL6shzWunoVk44bXksNewtjgPU8jm9LvZYFAXWPpZrZuskra7DwIqq5Z600L3jc5BG
         g1P0/teIM5MI38JKEtycP9pc5pK3TX0ZmsrugZjaEzYeheRno8StoGwm+7C/PSEQ+wjn
         vJ/T6pLb8C6c+GqkuKKfW0ENde1xCLG1Bn0Ct2O1qBynN9mce801iEWP9M6pHjlEJPQF
         xVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3FP4BEtQKxSjVuN0mB6JSCehYmr18/RK6NvBQdSBs0=;
        b=UDDsyyzRuJPfpEUM0aAmFCKaGNUJuRGYyyLcKaIeNq9ZRqu9V/eCB6b5xEd7pXidcT
         SLjWSmYTaikvGrXRSUg9k0sGQAE3uuo45JBsW73cbA6BcYEt7smM+lVLA6g6yt41Y1a0
         UP6d1xePi2BxKkSLUOEM/OXpvtyczqq9FZFQpb6yI5bZtH/T4nwCv/zn6PZpOoJTCQoH
         gVxNTWCU2Co3akWuBONhx8xOdZPMVlgX/E5sV1gzPosA8mqLr9l2g1RPmGS5Efe6iVmY
         PAQt+wEd/mlcKApvwWEmGnlC7bPxI1jWNDgMQsRIyMA13m6XI0jO9KkTf3Xd3CD+uZkw
         hB3w==
X-Gm-Message-State: AOAM532C8PB7i8v2157r6ZKIAI5r9xZwjomOfBPpbHfYgkRvX2TCjQKl
	3hERsECgBvpuBPAMlfSxKS+fV0u/FjA7W2FLwn4=
X-Google-Smtp-Source: ABdhPJzeK2KUJqmGGI859uAlc4K17OvJCz6M3aJWyUXggntGZJ1Fa5GsXKIB6ObkZhDxG08/+YXJhw==
X-Received: by 2002:a17:90a:55c5:: with SMTP id o5mr66836358pjm.169.1621260901787;
        Mon, 17 May 2021 07:15:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.15.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:15:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/35] linux-firmware: upgrade 20210208 -> 20210315
Date: Mon, 17 May 2021 04:13:35 -1000
Message-Id: <c3d35ca5ca70af56956425cf0879ed3fa2970179.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmware files, version changes

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f10b9dbb4fb8ccb9a427883370fbbeb6f394551)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20210208.bb => linux-firmware_20210315.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210208.bb => linux-firmware_20210315.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
index a751b92a2f..892455b039 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=ef0565762eac313c409567b59dff00b2 \
+                    file://WHENCE;md5=e21a8cbddc1612bce56f06fe154a0743 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1bcb1a3944c361507754a7d26ccff40ffc28d1fb93bce711d67da26b33e785b7"
+SRC_URI[sha256sum] = "a2348f03492713dca9aef202496c6e58f5e63ee5bec6a7bdfcf8b18ce7155e70"
 
 inherit allarch
 
-- 
2.25.1

