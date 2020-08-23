Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.181957.1598214083860418984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uD37X/tS;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id m22so9265888eje.10
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iMQD7oTMvCQkJPKAasoICwPeTZB0EmrkNWSVW1hLpHs=;
        b=uD37X/tS5kTZ1pbJ5cYpy3gfvhLrcS2vMYrjLh1ACfPdw7auWFqHvd6FOwCw1b1wpf
         LOiB2Bd7GgJzy5hJ3qgWoVWG8Zik0pinBnKtWWFYToWmLGNRQrrVz9f7EBScEzpyx/V7
         xLRFu+HdUpVCz9gsyFEKiNXbEBvG3IBtNNYyHdeT6Ss4rLvidxq2lQlZFB+8sGx+8Kox
         E4Ma1k1/2LoayyTV8YG61pC8rqsLj0YAmJVdyoHIsTT0dn5HnaPaxl0Pi31Qjd41Dh4K
         zpwl5c7kqBSGg8VsC33xj1fuMMUwdCCpvH/AXOJQd+ftq57q97skjnDaivqXs5u3BMMr
         5Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iMQD7oTMvCQkJPKAasoICwPeTZB0EmrkNWSVW1hLpHs=;
        b=GEJoIRv7abGbxAA/26EtoIN2crYULm1RGW1STGDb3XsFMK7stVIE58cpn4z7MPtFeH
         OZ1kZwZ6eEWw4UwPnxZZbEmcCl9dbeGVk/MUIGbWblJv+tdHmsstlSAPZps+5WZIeH1s
         XtFoPO4l7YXYRjPQlnHTFTRWHbSfINq62DsrD5MbcgMys/qW9Y7NkYht0epy3bUxc7cE
         +2yW7hE+DPCDQsAIny0GwS0sVosJP6IxBQYpQ2ULEAhsBnF2QOVnfiw8JciIQ9zi/G2A
         3vAcUC7QnVQTAxjgXxPX1RmgS9vcSyrQiJAxwnctwvu6yhaM/GqIifpLrys6zj3AY00U
         doQQ==
X-Gm-Message-State: AOAM533VzOKAoXRTk7kvXkZ+y/blb5tZNu1kcmwONBw83l2rN7Ciq6Zk
	audD6sTDxMpNN0nKOtVrHuD7Mola9B0=
X-Google-Smtp-Source: ABdhPJwzRsRn4yPhNKtyUJuzqkUP6A2vYYy1zg7MzcaGTof9fL+l7GxYNuMoJh/fExW67Mo5Gdb+oQ==
X-Received: by 2002:a17:906:a116:: with SMTP id t22mr2763877ejy.353.1598214082040;
        Sun, 23 Aug 2020 13:21:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/37] linux-firmware: upgrade 20200619 -> 20200721
Date: Sun, 23 Aug 2020 22:20:12 +0200
Message-Id: <20200823202031.24686-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: firmware versions/filenames
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{linux-firmware_20200619.bb => linux-firmware_20200721.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200619.bb => linux-firmware_20200721.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb
index bf25ff8b70..659534521e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200721.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=d373d30188c38dabffec0d3cc87abbfd \
+                    file://WHENCE;md5=7627a0ba9a78e7e556afcf15b0971016 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "962d3ae197d226c8259f9cc7746f7ef12a9d23787cd56bd27302021ba6339722"
+SRC_URI[sha256sum] = "898c334b0da7de6ea173899beb696fad647dce0c06960d7368ba4d4e802fb860"
 
 inherit allarch
 
-- 
2.28.0

