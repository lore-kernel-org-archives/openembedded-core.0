Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.8367.1620831557206818560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TeUos+Pp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so14488006oth.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=v3FP4BEtQKxSjVuN0mB6JSCehYmr18/RK6NvBQdSBs0=;
        b=TeUos+PpRqmome3siVjsfUuAbCyfM1WXxaUekzd3MZaLcvmA6cjXrf2lJgR2nBS26S
         0dsJfaeQftyzmA7AhDX5lRGvPuI+Rifyp/9zZ/N4FE71H5RjrMz0sQ+cbY7RD8gaxJCD
         lsvfvx9Gh784sCOEvy/u3vMUEkDKbj7ikb/1gN5p64BAVmlZv9koE7xU9hMeLIXmKv+C
         SwI1ZJcygldNxkJDUNDopB0yljgLCgk44C9puJ/WDvpXJFJMqhocMuD7ENzBLGpnq6oo
         mnCBjBv+rDziAUw+/95ZWZ/US2OT5MIHvITcsfHMn/lJGAj+gNQPda0XywmEGcivXOoF
         Db/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3FP4BEtQKxSjVuN0mB6JSCehYmr18/RK6NvBQdSBs0=;
        b=aDmlP+Yvx+vJ22qpRA0h9odcVN8wdb7QiOhAwNXg7LC1AGsArFPqKMShlsxOk7F+05
         pPf/rQAik61k6LWUTvDsAoLMLtK4l6T+zFNU5RW+FXaQmnF6wsnLyL1nrPQDjdlpQddI
         zn4TjYMijoXk/m9wJlLhhxv1wbs2myW8QRj0VkVeP9R4WHdUqwFOcPsFw8GXuZCT9hK0
         5X0QD/tXanXVP1ULiuTdbmPvQlmQKb769qBcfaPslINv5HiZRhR+gjtLEG/6UwSEGVVF
         6J6BBdqNosjX5i1y1qS9E/MUGrCujfl09UeMfu4s/k9Rr1tHyM9ObQpB7OpLBwmRVRyP
         ZyNw==
X-Gm-Message-State: AOAM530qWDoi2T2KzulMkGU43CY2zBFYNcP256YZVag/v5yT8/cUFz2v
	C/QnNrFqk472QhPCFQEquEHa5n7/PK0xKW0AxA4=
X-Google-Smtp-Source: ABdhPJyCekVSMwO4n39aPD4M4geA0li9d76GLboK8UWDIqoLpyRL8QcETgrygKe6f7OwaENrkOO/Lw==
X-Received: by 2002:a05:6830:1205:: with SMTP id r5mr5231930otp.359.1620831556138;
        Wed, 12 May 2021 07:59:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.59.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:59:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/22] linux-firmware: upgrade 20210208 -> 20210315
Date: Wed, 12 May 2021 04:56:58 -1000
Message-Id: <09ab54d3b81019bf0067211b70fb1dc8019dfa64.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
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

