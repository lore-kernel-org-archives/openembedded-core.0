Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.1183.1604335798379318970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VQT5A+1t;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id e18so3871412edy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dYgx/9hlSYpXYORslKgpZvHPWEyQ9wwSBgfhF49AhmA=;
        b=VQT5A+1tPySNH+N2HXvpDbyDMcjJdmlNrGmXWQ35Y2bJWCWpR0jqd4dkec1NNWT21K
         fxN/gM0y1LGVLw+5MQmcE8zq6Seyya4FmN0ySWpEmpm+llalfW9M8W3XtdyUe2aK4aT6
         I9eSQ2blutAKAvchNZrCymQDpwFlJPlyG36bWr33taAG7B+9SdQ+E1T8pKXzd51pZ9x9
         zVtV+eT+1IZyvcO/XHHDKGyV6d5cBY06PnwkGL+XcSnyoLJMeGQg1USwtm+HQkhV2jKe
         rG++KizJgn7w1mQtJR8gu2O0OtOKtxEjv3jjbL8Wn8HKPHdnGyu8a2p1Xr7I9D7mjp4j
         evpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dYgx/9hlSYpXYORslKgpZvHPWEyQ9wwSBgfhF49AhmA=;
        b=lRK/mv1NCoEyw/VEQgqZSdZQkN4QK3q3C7J2Jy910uF3lRw1PzuwK5VjG1dr4F67IL
         hAVoumqEaHcr5OUK0YfzAVvZch08krewlZyvkhuakP+ZdBTWT5oXcE16SAuB6f0Qwp7j
         dcRV5jc9ynqLmCiaFp78i4mctXhqsM2415YnG2A+GMdRGrkCYG4V9yDsMi9pBnf4efF3
         +1QcfmRBJ2KG3vg/LtrzMAq6ZjY/P+XH6oQ+LsS91eyE2+psKYmMaQnk0Y5rz4VMKdeM
         vCh04oRjSzIQvcAjjAKDp+loJMaiQGTVVlhMXkxjaIhLbZ9HXSgcoI403tX5S0NFvr5g
         xKPA==
X-Gm-Message-State: AOAM530oz6syNUuJBthohGjvWNP+Fu1oY/o+IY6NDHRqZMMZ60faZGge
	/uBey7X9hklcPyKJ9OZZjZPxP5Y9WVjzqA==
X-Google-Smtp-Source: ABdhPJy2SdVMLN7BJyupdca1Be8+DnciyKk9m8oaUBeO3tw6NVv7Za3Dn86ppUnlqgRRYixtWr/WwQ==
X-Received: by 2002:a50:f104:: with SMTP id w4mr7162091edl.381.1604335796718;
        Mon, 02 Nov 2020 08:49:56 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:56 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 44/80] wpebackend-fdo: upgrade 1.7.1 -> 1.8.0
Date: Mon,  2 Nov 2020 17:48:31 +0100
Message-Id: <20201102164907.27572-44-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkit/{wpebackend-fdo_1.7.1.bb => wpebackend-fdo_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.7.1.bb => wpebackend-fdo_1.8.0.bb} (85%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
similarity index 85%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
index 519762d125..69d6098d36 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
@@ -13,5 +13,5 @@ inherit meson features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9b980a73ea4e3762266c48f81ded56d9dcad4acf32bad9bd05d0dffdd454c6f5"
+SRC_URI[sha256sum] = "9652a99c75fe1c6eab0585b6395f4e104b2427e4d1f42969f1f77df29920d253"
 
-- 
2.29.0

