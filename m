Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.25181.1591602509152603585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nJMYMD3d;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id p18so12577501eds.7
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LppDgY+gnET43Gh+PQM4xue2r1IDOm16/TAUVJ6OeIo=;
        b=nJMYMD3dA7JGSEu8m7F+sDC8a4Lbg8ks5/XOctCgu5uwGaUjE7NaO5vn8qEjRIYj17
         iZH6qjKPepPdVvVm/qLDTVQ7yAy+OVHIFaS+Q8cRx5PvaDe7bIjgrMluX55oz7ZXVQQr
         aHmrqLJZ0SHLDutHPsQID8Fdry02Gl32dB3io+RHOVp7eYYGnmz91YcECvenlBQuPw1h
         Cbr1gSAILErfwkIkyESIKjq0+VmXF1D8D9tfv0RZz2VHZZqRpNXJZUm5MC0RcZZbR9q5
         E37mp60B1L2zPpi6tFBQ7zlhSSifOtkxdJ7DhwOb53H46RJpxY67EDIVRr0lsgXuJ79/
         RLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LppDgY+gnET43Gh+PQM4xue2r1IDOm16/TAUVJ6OeIo=;
        b=IJQKuDdr5a6aulU9WYpFLCz98GXyCfRGNiNa5KhzcYVzCv+uFk07beJQh5YEaWwsSB
         ocn3TdqXu/EUJsPDuMNHigVNNa8prFDRFrfPo5dCgxhfKHCWx4pA8dyfJl0wQqF+lmv5
         74LnIDJSHTMRQYtp/AOZT3lj20wc+WXFWMGIHzFLPCxwOxtPaMro4YR9feWwllsndflQ
         PVpdb0/98rhJEO4ISmpECI8U3kGX7BazqsAKjYvt5MohVuxmCrShITMNOJRnLZtUYodJ
         RDj0YBbIXrgK93SnhiBqKKLEF6mAnGoWm3f5apjNgXDPDto1KjjvjnLnqqOqVlWaGJZT
         cX3Q==
X-Gm-Message-State: AOAM532AH54IMeb38ueMj52S0djS6qBPuElTkDKuaVCK0CdLy83Y8TBz
	E289XoK5vai0SSUNJT0vUPgF36n3dyE=
X-Google-Smtp-Source: ABdhPJwywmYjQopVHdFCCmcV92LjOl7/TazUOgYXIauU2pxYs5lDdsUutupznP5ma67sKQ14a+dbiA==
X-Received: by 2002:a50:f983:: with SMTP id q3mr21765528edn.259.1591602507568;
        Mon, 08 Jun 2020 00:48:27 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/42] libdrm: upgrade 2.4.101 -> 2.4.102
Date: Mon,  8 Jun 2020 09:46:33 +0200
Message-Id: <20200608074659.7051-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../drm/{libdrm_2.4.101.bb => libdrm_2.4.102.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.101.bb => libdrm_2.4.102.bb} (95%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.101.bb b/meta/recipes-graphics/drm/libdrm_2.4.102.bb
similarity index 95%
rename from meta/recipes-graphics/drm/libdrm_2.4.101.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.102.bb
index 8ec566faa9..fb9a94207f 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.101.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.102.bb
@@ -11,8 +11,7 @@ PROVIDES = "drm"
 DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
-SRC_URI[md5sum] = "e6a6f1b88963210b3d62acd7310a1cc7"
-SRC_URI[sha256sum] = "ddf31baa8e49473624860bd166ce654dc349873f7a6c7b3305964249315c78a7"
+SRC_URI[sha256sum] = "8bcbf9336c28e393d76c1f16d7e79e394a7fce8a2e929d52d3ad7ad8525ba05b"
 
 inherit meson pkgconfig manpages
 
-- 
2.26.2

