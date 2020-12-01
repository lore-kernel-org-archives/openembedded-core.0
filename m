Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web09.2936.1606782972858643779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 16:36:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UQn5qRkr;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id z1so21141858ljn.4
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 16:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TcYX2gX1WbLPdw97enDm59R3i7bTlrD+SmiN6+1qB6I=;
        b=UQn5qRkryH8ZuP6IDmglE/ixndXs+eXNiAitC7lWGRfhkC0tAJ6b1L5d25YOdX59Xk
         NWRO2N1e5M1zqiawhls/iKEG1aAYwAN+Md8is4ymX1WRVsq+tMrmTZgwFd7kEXGub7mE
         Uv5EFxylS3qG/ysycXmyjnu7aPNg5MXGaeLt58QjMlSapT6LHjiEaOo9FmCEj+PJ8ECD
         OKEbEqzUO1whZcZ/YkcDRqYKIaiHJQEkIRUbsV+f31sAPiVuqC3Pg0ZgpKx29kN+azDU
         ncSqEBQIhzliVikx8GOJJ1XccbCXsU+Dlzyp+UQNYFLPq4yc5BHgMO5B9d2Qi5R3rws+
         XRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TcYX2gX1WbLPdw97enDm59R3i7bTlrD+SmiN6+1qB6I=;
        b=l9/ALJjtTXAvxtCsXl1l+t8x5ScmRxLWdDRTs7NZSxov1g0Y8zZOwYYrEHz4zcdu/e
         zB4tRc5FWw6KoA/ilqVvwztakeYq6ik8XBkMyJhiwHZsV9GqAaNMBKxN5TccNmdDKkdy
         Yek/0a7kB8v6lflos5NopP7M+kahOzBpQQqR7OCMoVk9Bvn73sPVe4RpXou96t1/dJHJ
         yP2eHBNJTXGLdsYggQoszinJ7SabDRO0IHv/GmBt322umvDEFRnQBiMXcX2pnD1LXvCA
         XVWRrWCMO0zROXBIooHEHzT6UWoCMk72Ti61iNaYWW8cIyI0tCGdThNNU71enRnjjvsi
         wb3Q==
X-Gm-Message-State: AOAM531Sg5MN23+IXYrUKg3xCzyd8StqwP0RitGzGWDQafqnpI03gg3S
	Q9Pzup/0AY+Hc5AMEgf4WBOZ+n4J3NY=
X-Google-Smtp-Source: ABdhPJxRtdqlCDZxx3KMDchtXxkz363UFcBe8tXqvD9QFsQC8VaiECtbEbluVKDVrdt78Q3qz7pLIQ==
X-Received: by 2002:a2e:2a86:: with SMTP id q128mr103631ljq.158.1606782970867;
        Mon, 30 Nov 2020 16:36:10 -0800 (PST)
Return-Path: <dbaryshkov@gmail.com>
Received: from umbar.lan ([188.162.65.76])
        by smtp.gmail.com with ESMTPSA id m21sm25037ljh.82.2020.11.30.16.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 16:36:10 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 1/2] linux-firmware: upgrade 20201022 -> 20201118
Date: Tue,  1 Dec 2020 03:36:04 +0300
Message-Id: <20201201003605.768732-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

License-Update: firmware versions/filenames
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...{linux-firmware_20201022.bb => linux-firmware_20201118.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201022.bb => linux-firmware_20201118.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
index 93b9d5308aa1..5de7157f3a84 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=daf28db5d6353de0a886f08106cffa22 \
+                    file://WHENCE;md5=ef221e03fc58f4d34a132b801dfa1d68 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bf586e0beb4c65f22bf0a79811f259aa0a5a7cc9f70eebecb260525b6914cef7"
+SRC_URI[sha256sum] = "863d5a31da725b856a917280d1e3014929b3bc3d4e6e5faecf530c13afb7e2b9"
 
 inherit allarch
 
-- 
2.29.2

