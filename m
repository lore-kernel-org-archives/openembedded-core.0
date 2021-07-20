Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.5167.1626770536301911266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 01:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O0QOC4n7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id p15-20020a05600c358fb0290245467f26a4so1576124wmq.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 01:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YQLKWbCJfsR7/97IR75i1+mAuKE7YD2sf2i+jEKurYQ=;
        b=O0QOC4n77ENrUcrrNqPG4L/nFIwnAON+VZAnmJ6H+oQfy74CizGU0LAq0CyFWIP92m
         JRloJ8MNnNAOuJFT1IDLyJp1lqZsXmotS9asTpt33AyptNS2FwyKa4wMMSEX96gbzN3R
         rxMUdC9vxKeLn3/mkJ5M1V4Cg/+w3i57ftuGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YQLKWbCJfsR7/97IR75i1+mAuKE7YD2sf2i+jEKurYQ=;
        b=ozRT3MsiYejYmIBd5Yq71yb7M3WgWiEp6u+rFYQTZGI/r8UAG5vPSwu6U4Km24H6cY
         M+wESqDdzE1l3dzCY5LNaN//Z2RQNyHB7A+vUhVvsxHXwUGzLlmLXe1876tK4LXqHOMn
         30sY8gTaBpWHSk9OPkbWu/vQa0t5AM+XScLfuwt86Er2IF7lsY2qzydopK7DPzDWaV03
         e4h1JZ4mBk/640sa/vdItC46UmJbaNEzFo5wWcE21j/TKbQEka+LTN9ZJIlby8jUOEXi
         7AfZ8XdurBTVPNO9HNT8MlcXUzREmBkEQ7yXlv92uFxgN3egUiy/L4oTgV2mhHiQN2o0
         +NTA==
X-Gm-Message-State: AOAM532hiKJYuxwqBbDP56iiRJDQbn+ILO2VhGixrXJyDJGDbhtX5VEO
	yZPC0NmBFPGiO8ZxYYZt9D2XjWAOLox44w==
X-Google-Smtp-Source: ABdhPJyo74XSs05NJjyxJLa2i8jklWseCy44EzgTbfMW5LK9MxP4JYb5BOqXBqlj6wfIFUS/HwGNmQ==
X-Received: by 2002:a05:600c:1c07:: with SMTP id j7mr33800124wms.165.1626770534477;
        Tue, 20 Jul 2021 01:42:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2cd8:e78f:29a5:f753])
        by smtp.gmail.com with ESMTPSA id s4sm21582372wmh.41.2021.07.20.01.42.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 01:42:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] buildtools-tarball: Add lz4 and ztsd (including pzstd)
Date: Tue, 20 Jul 2021 09:42:13 +0100
Message-Id: <20210720084213.3032232-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210720084213.3032232-1-richard.purdie@linuxfoundation.org>
References: <20210720084213.3032232-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we start to require these for builds, we need to include them in buildtools-tarball
so that older systems can access them easily.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 9da81d55235..b5dae176bfd 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -29,6 +29,8 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-rpcsvc-proto \
     nativesdk-patch \
     nativesdk-mtools \
+    nativesdk-zstd \
+    nativesdk-lz4 \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
2.30.2

