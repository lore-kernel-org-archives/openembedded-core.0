Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.1261.1596529577297550510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 01:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kSkMu87C;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id c15so19532283edj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AwpcC3+nxtD1HptA+Y6jatvl/g9CU/czwfh2viccH9g=;
        b=kSkMu87CZh1gFrhYka7PtAe0oypFzrgBHcCYWN4GUh/j2rgYuAhmiu0cWaX28nfO6z
         moU7hHJFf8qxU3AS6T9+aMBAtyPLLUz3u04bQAhlstAruCYXhejpGNoe/sY/NnO2uHMV
         WHCaB/Px9BC21hEuhJC48kXouEKcm3jKq5AZKFG6vDHl4unfBJBnqNqlFren/Q/RlGiN
         95JE8WVZxK4RNXVd1SApCD6LaACdJidhjKrY08Bbz0JCHw2uPvrWsAvoSXFzCPgBtdVz
         Ul+RkbPd9tiy2gZS7l4ikHcBEaJG2Gs5V0sFzCbiA44uxh/Zu7n31cf/APezpUYZszIc
         Uciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AwpcC3+nxtD1HptA+Y6jatvl/g9CU/czwfh2viccH9g=;
        b=TFAl9P8lZ6ir5TRScsR3gttjm8DGv1kWa3e9SEC8Oi0eiguO8QXryf5a7oBA/2MpWM
         U+VJII8z5xpZoBvJX3J7xIix0OVsYG//VT/NGv/4U/z2dMmGt00wfhvH0iA1kSHqYg9u
         D/KzjLzgaJ6HDmGC3FnapB0bmn6tgxmM7pv6gqbg5odruc6DjcMA+3CiOz/CyVCds94H
         M7Kex9P+WkulyQWm9sOtL1Ab1m2iF/hU+lH1WAUwWCvuKQD17g/zC4uc2jlKBN+Wh08n
         qYrDnOai7NHGS/RhVSdBWP3Vs1gZUk3KobVpc6cv/W0N51cViRrzLOHDluwqoHSuJpXs
         FiWg==
X-Gm-Message-State: AOAM532+h0rZ0PQoKqifMsqrh7eyiqF6brAVbX3NBw1oEhP67FtbI7rO
	JEy7uhDSB92Spm93dGHdnITMo5vL
X-Google-Smtp-Source: ABdhPJyXMHOYp1ASQxfzbwiZSaJrh0ubPLsD42qy7Z+ivM9oTzrEHH6pDGS/D+dLlud+EW8UKn7GTA==
X-Received: by 2002:a50:a125:: with SMTP id 34mr19477463edj.306.1596529575598;
        Tue, 04 Aug 2020 01:26:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id gh25sm17809531ejb.109.2020.08.04.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 01:26:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] meson.bbclass: add a cups-config entry
Date: Tue,  4 Aug 2020 10:25:49 +0200
Message-Id: <20200804082549.23381-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required by newer meson versions in cross builds, as
acknowledgement that the tool in PATH is ok to use.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index ff52d20e56..83aa854b7e 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -98,6 +98,7 @@ strip = ${@meson_array('STRIP', d)}
 readelf = ${@meson_array('READELF', d)}
 pkgconfig = 'pkg-config'
 llvm-config = 'llvm-config${LLVMVERSION}'
+cups-config = 'cups-config'
 
 [properties]
 needs_exe_wrapper = true
-- 
2.28.0

