Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.1521.1588648864954856456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vX/2kTQp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.195, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f195.google.com with SMTP id u22so218320plq.12
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KMEcPzthvLhUiOaBzc14IDO3+r8zJVDqotxjClV9yJo=;
        b=vX/2kTQpGymx1bCnqpViZH2N/YLsAdg/CUw2WugBIdVK+XC5WjZUwAnZvRD6bEltMY
         ZjfUMFA+FDZi+DUOyPIDQSvs7OFKKpB8eja9y6vzSlG74K7Ja4tg6XDZYc1x/VFM4E0W
         BbMvRKZtKmIwOwWoqM2wylNQfhRGKOVhXHrCelsGuQMUwXi1exDTPz4mJnMXYhUUXbkY
         0loXz/mCeJbbRXNXu1g8nwCazGD/MIhSgM4adFWyE5G4oIWc067oNG0jreAZZ/sIM0Xg
         PSg6WWW4XzBRYnjRn1Miw7Ut9MkmhnHRkQobSmRyM69dsxGYDfg28cGIoYX3uoYsiUeb
         SRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KMEcPzthvLhUiOaBzc14IDO3+r8zJVDqotxjClV9yJo=;
        b=Go4vniNizZApZefIdv1KnWqF6StmdBBRxgS5WVl1Yk7IefMBfhp88725A/jUbZJg5t
         LL755HHVODwY6+EkkVOChd4L/Cjmvdk7YImcUd8Fj6N3Ti3DHVvQ1dNxM+tYWH9Hj1ce
         9oeY//VS7L8PZvei1ZGjLb38X+yn/fCO+r+smPx6L7flfgUusDeuku8NqIMDzTrbumyH
         ygJ8B74eifwdCk/oOxZwYywebief3Wnc07WWKoC5AXpc9O//rjKNaNm1xJ0yhk97N4pa
         nAK1GvPM+FrIsGMhpD0TyrEuEUJ2LMI6L62Um+BD0ECY6kT3usLC9580mjQavOhg0rCB
         ghTw==
X-Gm-Message-State: AGi0PubKuil8LQrRvC1BFPmweVbwAseBgwAbuJub5Fc+NTotebdqRQSn
	7mUBRit5RpAFrrGnWeCPGwgd3g08rlyEsw==
X-Google-Smtp-Source: APiQypJ/58yUYyLOGDD2clOjIkSJAp0FT+3mZHDklMws8dEhxUzcKeDJaf/FJKmb+xPQRCKnN9DPtg==
X-Received: by 2002:a17:90a:b884:: with SMTP id o4mr419682pjr.8.1588648863958;
        Mon, 04 May 2020 20:21:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.21.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:21:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/28] buildtools-extended-tarball: add libgomp-dev
Date: Mon,  4 May 2020 17:19:17 -1000
Message-Id: <a83904481cf85ad4a15209017ab04f690b7779ed.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is needed in particular for newer versions of rpm
which would otherwise fail to build due to absence of omp.h header.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index e38967af3f..c32d0107c3 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-gettext \
     nativesdk-libatomic \
     nativesdk-libgcc \
+    nativesdk-libgomp-dev \
     nativesdk-libstdc++ \
     nativesdk-libstdc++-dev \
     nativesdk-libstdc++-staticdev \
-- 
2.17.1

