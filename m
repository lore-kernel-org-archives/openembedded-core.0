Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.1062.1603478626812237493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cTCCVcvo;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id c16so2993035wmd.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PH0Nvm7opN++8HnQyW6A2zGTwXDX1M7bWAaG//y+TM8=;
        b=cTCCVcvo7LtMuEo37yTSxLD7dPIPDWoL742FdLqBudotiZx34fKOk8FXZqHWIepJtd
         yBvOiOzcKGx1KssAsc5mCZ2MwJ7Tel0GhkhHciwCQclelM9U0xrb1l27UBbFQ15OMG7Y
         O7bp7hAmFfjuW42yrkhhIHu7rFO2psWKHGu4wvUAE3kab252Z02drOdhgvfoFuzLLSDL
         iKNB4jEJWlWeOwJH+1Cp+K/eymvDFWGbh6dXfigBGXI6Hmmn9X5XE2ohdgXTwdFGBMNs
         dsUJoXiZON38EowryM7FPfxnZvooueMwjYFHP/eZJHQIb0PRPJH6uDzHd6+BytY7K8U0
         o9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PH0Nvm7opN++8HnQyW6A2zGTwXDX1M7bWAaG//y+TM8=;
        b=cAzuO/9RxxamyvseZwP5f+Q/UPd3o4MPhGS6rsV5au7gRj1E0CJf0k0rWzzldlOWc4
         RJLfVPxfJaTAMW0NI6EP32BTDmYYEynD7so6qsbqEZbUT82P6KBWHPyQEGAYx5zqi/S+
         is1R71kMsM/9tNTp2zA759Vo2IvvACI8oAj8lzSfaS5SeX6VO+fIhAfDKPlaFlvmYuVC
         V0oMIs8Wu2ol7gzIXelqX8mVYZ0YgTSzoFHAMGATBA7+zs+DF6mUX5kGAD+UmWSpLm/J
         3uuKjVc+xiLK36plEDMtKruNHip1TB5BpTPKAaymIfM5MX2AwKJcrNRZPuvXaDjJLC6O
         7LoA==
X-Gm-Message-State: AOAM531+g6CVDqUvwAIHD3UmcgONP1898W/hAyVBNwLqKLfOcYljsLel
	/or4P9/MqLOJFpl5eYlPnXfJ99sqwp/GGw==
X-Google-Smtp-Source: ABdhPJx2hljuuQ4VkNTkxiNMrvjHz0txnE5TmmDtF3A+zPUjrab2zzsLouHeTXeXzj2OHg/b/N3VEw==
X-Received: by 2002:a05:600c:2312:: with SMTP id 18mr3517114wmo.187.1603478625235;
        Fri, 23 Oct 2020 11:43:45 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:44 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 04/21] gstreamer1.0-plugins-base: add new meson option as PACKAGECONFIG
Date: Fri, 23 Oct 2020 19:41:15 +0100
Message-Id: <20201023184132.3208737-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- gl_winsys have a new meson option to set egl

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.18.0.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
index 7fe5a480d4..a04af186f6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
@@ -68,6 +68,7 @@ OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', ' x11', '',
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gbm', ' gbm', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'wayland', ' wayland', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'dispmanx', ' dispmanx', '', d)}"
+OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'egl', ' egl', '', d)}"
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
-- 
2.29.0

