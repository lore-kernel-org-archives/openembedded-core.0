Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.98.1603837783706414552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PggOUFcS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id x13so1745074pfa.9
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1C+zqXE+Rqe0nZ3Cj8zpXkIOAoteWDBfVUMUF1IOrVc=;
        b=PggOUFcSE1c976O9qM1qm63Dkpq6rva7pz4GcyR+vZreE+ejJcmbVUdq5ZwFq4GHNn
         spno90/t1pgxSCIVGlToHy3hbmVFG8k2fPL8keodoyeuFgI+64sZHfptHAey/iuiHgkd
         VyJki+2Z/80DLcK9usLzHYApGjRXUznd6dY+KJRB5tv7hb9iE7ex7uDNVeGaOhgUe5fn
         An2H+PCUWyfUXzWfRrjdTdHPWZBvHrjnmtmmV2GyCozazMg6O/BiY6t/D0Q+vKidU3s2
         zmLgjqke5MnELZH60S8SmpPM3dk+B8WgA0L/VGyPQp3MCBmrw3IZRR7xJe2Fmn4h9kEF
         Y1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1C+zqXE+Rqe0nZ3Cj8zpXkIOAoteWDBfVUMUF1IOrVc=;
        b=ZI8xnLvw3etsn8hN2A53UIDMrLxDjih1fdiQ0ognFVyULyILOJLfVIFfDVBygEtVTP
         k7QDl3dV6YKp7wn7FOsMUiHzaTpf1xBHBQlTGP8gEG3TdyRpXuKJhDEr0lEOejBn4Xvj
         AGznkI+e2iqPagc5BAqdqI02Mqi4HHiKDWuxD9CYVCCW7H1Crq6AJZBnrCl0SRc4a1cZ
         2nv071qYBrjmWzqpftBVkYz+h4OI+LjtwAhrmBgIA/pcIEceopZETjGxtZMmmzmjJZLM
         tlpxlSlArC4l0Tc70dJgQGX8wbGZ9Dz6J9nbfAzuiWEtMTgy7he4EaDJbE0Jo9cR8dmh
         2Peg==
X-Gm-Message-State: AOAM5300uv4k9vLy+cPfSN3oRzRTl1HBa35LsO4dE3KYmrb3LkoV+bbe
	JVWSjrXdnbL/acz3CsKVYy3zi9agY0/Snnge
X-Google-Smtp-Source: ABdhPJyZst1sAYSLaUfZIcZAbjrnLwXL255/1hPuKskMghiYOor9y0ZCGwDBWcutWPDD6IG5XZBaXw==
X-Received: by 2002:a62:7e03:0:b029:163:c9b7:8fec with SMTP id z3-20020a627e030000b0290163c9b78fecmr4569949pfc.30.1603837782801;
        Tue, 27 Oct 2020 15:29:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/16] gstreamer1.0: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:09 -1000
Message-Id: <d7e74eb1e3ae859f917cf19d7594ba08a76596ea.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index 9d92fe1439..66ad3e3381 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -22,8 +22,8 @@ SRC_URI = " \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
 "
-SRC_URI[md5sum] = "0e661ed5bdf1d8996e430228d022628e"
-SRC_URI[sha256sum] = "e3f044246783fd685439647373fa13ba14f7ab0b346eadd06437092f8419e94e"
+SRC_URI[md5sum] = "beecf6965a17fb17fa3b262fd36df70a"
+SRC_URI[sha256sum] = "692f037968e454e508b0f71d9674e2e26c78475021407fcf8193b1c7e59543c7"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.17.1

