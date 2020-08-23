Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.181955.1598214081302332909
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I0zVDheM;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id c10so6263185edk.6
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Iu79848gZ/JWfsd/Yp+JmtknrcTk2YMDJGDTQTb3fzs=;
        b=I0zVDheMHDqsAgL6HOoVpaRxNFogb4Vo8dLIKSIXxFAsk7dpvDUDMmCkXnFAdD7LA7
         7gxRte4YtPcspf735mCnjsfY9uwhXgsCUuH4JrHNhW4rBjR5uEIAxFBMdnbJm5HXT5aO
         OA74QEQYJ5S/b8ay5ycLPwilBrq0L2yZnEuUkwiFfqh8NU+PIfwc4NjlkLHSIdPNvDiW
         J2WfnVNE6GK4caszThovSYQJF4TlfygGTAKaDGWAfWE30U8kHNstY4NXUVI1W3TZwHOi
         ja37Yd8+n77OWWUwIkonPkQWwR0zkPFzKMkO3Nqj7dtmhT+xiMtRJX2JoadhWXueFJwb
         R8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iu79848gZ/JWfsd/Yp+JmtknrcTk2YMDJGDTQTb3fzs=;
        b=I5+S/jW6Xdj8jDNfRFMbNMxay0uzslUhynG7xfvxG5TQtZzX54q1yNDTbY71n1z9Wv
         Q/5UgIF/2rMwAD5bG5JzSt44lxe4nqMQqk9q8jwyavetmtX8wusSutbNuJKgbeiZ3gpS
         UsGQVX57jiWbq0EyHZmJk0B6XcopPVHIwzLWnaMeSaFhhCNDzqKSetw4QCvAJERcfN4+
         2fzK9TbnUIYiPMY4iBUrVFpYdBhCSsb1jDxD/m6+O/bvhwRGgBFLj5JFIvZedfNwGDDc
         OsPCiXR0o4zqJI7KW48IPDOqXsGNYrLd6A8j8RWkd3PZFF6lfY9OfcX+OIqUjR12YBpe
         xUqQ==
X-Gm-Message-State: AOAM533suJuZKPc0wHymhFCToWNIQcTaebFsZCe9fwwopJYRLOqkEeaB
	W7U7iRwZnmbgtDIh/kE3Pkwd5Plcj+E=
X-Google-Smtp-Source: ABdhPJyKok/iLt0kcwcVF4i2/4fHIPZaSwGVmF4CnJoATxL9E4pnMAdRSchzs16Xp/eDwVVffecy1A==
X-Received: by 2002:a50:8709:: with SMTP id i9mr2638864edb.141.1598214079556;
        Sun, 23 Aug 2020 13:21:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/37] libinput: upgrade 1.16.0 -> 1.16.1
Date: Sun, 23 Aug 2020 22:20:09 +0200
Message-Id: <20200823202031.24686-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../wayland/{libinput_1.16.0.bb => libinput_1.16.1.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.16.0.bb => libinput_1.16.1.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.16.0.bb b/meta/recipes-graphics/wayland/libinput_1.16.1.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/libinput_1.16.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.16.1.bb
index baf5c1d167..1497609183 100644
--- a/meta/recipes-graphics/wayland/libinput_1.16.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.16.1.bb
@@ -16,8 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[md5sum] = "b518dae7f603040872739216971ee97b"
-SRC_URI[sha256sum] = "83f6d0c94e5e0dd87094ce73f0edb631919617d24a60ee0ab9bd9197411d76e8"
+SRC_URI[sha256sum] = "7ba7d1aeedd15168bb21d17e9e628aa1c27957963a423a3fea3938a501758539"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.28.0

