Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.2049.1596012391162428274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 01:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=DtveHceW;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.173, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f173.google.com with SMTP id g6so11528794ljn.11
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 01:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CCkmI1dmFKxLOdeBaqKuSvIgPJiSqorW0qIZvU2j2bg=;
        b=DtveHceWWoipXHYgk8CaBuAbxV5wu1st87jDqvcB1fy4rKhpVSaw2IAzvinwE3DnoC
         A7A3bWQ8tFsR1FxtPf7CXy1vK2uy9mvsmtvJ8J6+diJh3AdFgRZy9YPXifKY8WHjXfMF
         NVNE2sLZhUwK9EdADAUPcf4UEOzORf8QqC8hDCnYEdKWKIgr4xVPy5N6P/QnfJN2ij96
         6IQ0C8ixFe8WPWNHcJMHAv3an8BNgG9v3DAwdzzN5ZEqQzb5wfx59wnpO46QxVjqhmZv
         qVfxGhlXxeqPJtNjX2KE1njtBf6vexkMMdcW8VH5nE6ssFCC1xM9aGk1urp8mbI9OFXO
         R36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CCkmI1dmFKxLOdeBaqKuSvIgPJiSqorW0qIZvU2j2bg=;
        b=W4YkCwYNr3s2+DuGlfppR/8LMaYAtN+k6dabh4stUMR9U1Q1YfSVj5Ifu6abl1Lxd7
         UVjE37tXeMxTn8hRzG5+uFPxaJIWDCLYvHwOOWZ1Mk6OwSCRDzqq9w9aGMgShAPj7Jp2
         bNjesdAS3b0NTLrrRuONDlflWEhc2pQG/rwHIgVgEfAqGHx8JCTdx6S0LtBk/CzBnl5L
         JG9cfEOf3dovkxWSjh6JUIsMRGLqPq3IZMvygOE456qCbAQUdIizWsCUrDTWY9hp/89G
         zOrnrCiiUUI9sMZbgF2T+jU7nPyd0f3J9yh66Z9ffQ/rtvCDSYgs7j9t1K2PLoW0I5Ay
         k4uA==
X-Gm-Message-State: AOAM531GiqXr9OqDboU/YnBeSVFn27Z+otJThSVugeku0jVhzRFXkkH3
	mJZLbd6bc7GXfjiS/ZS2etjQzSDansM=
X-Google-Smtp-Source: ABdhPJw9GcobF9lhtUrp+3GSuHjOtmcjMmR0wDz6gl0fd92B/RAcDJLklZTJi/QTdfQeTXlh2kO0rw==
X-Received: by 2002:a2e:912:: with SMTP id 18mr2492605ljj.429.1596012388958;
        Wed, 29 Jul 2020 01:46:28 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id z22sm300881lfb.93.2020.07.29.01.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:46:27 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libwpe: update to 1.7.1
Date: Wed, 29 Jul 2020 10:46:23 +0200
Message-Id: <20200729084623.2748596-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-sato/webkit/{libwpe_1.6.0.bb => libwpe_1.7.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{libwpe_1.6.0.bb => libwpe_1.7.1.bb} (82%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.6.0.bb b/meta/recipes-sato/webkit/libwpe_1.7.1.bb
similarity index 82%
rename from meta/recipes-sato/webkit/libwpe_1.6.0.bb
rename to meta/recipes-sato/webkit/libwpe_1.7.1.bb
index 09c74089c9..e25d9404a0 100644
--- a/meta/recipes-sato/webkit/libwpe_1.6.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.7.1.bb
@@ -13,6 +13,5 @@ inherit cmake features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[md5sum] = "6e8a2c279dcc3617db5ec7ac4c03d628"
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3587c6b8a807f4bb76b268ba74ca82c6b395b90235db41ad8252224456193c90"
+SRC_URI[sha256sum] = "a784b7fa0c658b28071100f6f6749b0d85bbcddd82de028e07672ce13982d340"
-- 
2.25.1

