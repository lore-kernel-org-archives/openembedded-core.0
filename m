Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.6540.1599512015508364804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CHB+yZVs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id c18so16929280wrm.9
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3TjbEbWjiIwP6J0+jsNZKjHCrrEoL7YWkXPSkPD9Tgs=;
        b=CHB+yZVs8DGpg3UBZovAoVZ6Y8xeu/E1gxtQNx6Ok6b42eu1KaQ8jUo/UALfw4Z9ZC
         fcmarD/Ef3El0p4HLnMaG29EhJfLzNuKxvkD4eskgwj1pWh/7IfEsy0ZHRGl6ka+OhUb
         b51Yzkgh+wTHPmnafnIZkl5Z1EDeoiz9vnulE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3TjbEbWjiIwP6J0+jsNZKjHCrrEoL7YWkXPSkPD9Tgs=;
        b=oGCEvZrRH7Hd3Yd0Hk1+V8PuLJ8Aems7UJdi9ALQV6BLo9vGqSyINGSUdTqX5e73F2
         7Q0JPnjY7tHx6ZsaftHzd7TW6clLdyODUeuPq4MvD+x0T8vJkUHxbkP5njHJehLksyJo
         6eIdB7mzhumDl0WssyllgbU9IeZPQ1qw7vXnevVUksoN4PEK3lCfcKoaIZI5doJngxZ5
         CJQbp3qPG1w9CwGUop4kUrk+42UWAEHq6H4csbeX1CrlxEDG9VCW6D4hIz7+UoZXwyOm
         DYs3pNGZ5SS1/QE59182vJMCeewXv8te9fm3IysjcCVYRKat4jHsJS/jo/87Cod0TmXl
         P4Fg==
X-Gm-Message-State: AOAM5322M2Seu6zhincwE8tpI10Xat1BjDnljASWjuzFKiOtesmOR5AJ
	dbBkiyENbRMnCYg4WBAWkz1/8x5zfgNOnw==
X-Google-Smtp-Source: ABdhPJyD6VoW/wI1RvJYoDewQiPvNiXcz713fAMBYtP3o7MgwfBos22EAl7+0Gc7epDh+99kB5q9LQ==
X-Received: by 2002:adf:a18c:: with SMTP id u12mr24197826wru.90.1599512013776;
        Mon, 07 Sep 2020 13:53:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH][zeus 13/19] buildtools-extended-tarball: add nativesdk-libxcrypt-dev
Date: Mon,  7 Sep 2020 21:53:15 +0100
Message-Id: <20200907205321.1941682-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

virtual/crypt-native is assume provided in bitbake.conf, so
buildtools-extended-tarball shoud provide crypt since it doesn't
use the host's headers/libraries.

[YOCTO #13714]

(From OE-Core rev: da948b25d5ef452fb35275d108e18d2a2829f4fb)

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 32a10198c93..94ed57585b7 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -28,6 +28,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
     nativesdk-python \
+    nativesdk-libxcrypt-dev \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.25.1

