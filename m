Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web09.10536.1628177875581197637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hULkX8BN;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id y18so7902949oiv.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WYnSIYQgJIuQtijbX0B/h7Je6iwiKZFo+CryvBUOIFU=;
        b=hULkX8BNOiB/GCTIHKbGjXYvRPCi0/VTBG7P2CKSopP1ax5BPHZuDSpc4o7UGi7D4S
         aYkoS3xmUgh2dvU7kRWhmp4pE08t/ChwlRolizrh6zsbDb1bukaWNM41I30efFbxaeQV
         9yviN/T5jVVJcfeUPQjODulqTgoW93J1Q089xo/JMVyrL3DbrwAOt0rFMw1zR8RDj4L9
         Jt+JBr2SJfqYjY3DOq89g62nklw25PKGelLipF++wcm8OujBDYkp9w+9uchbuZf3Lh9m
         RB4jiFP47Sp5/dbDCCvtFmJyjzacas9Y2gV2Ap7YRMMzSMtrUVISqdHYAJ/m+XDlSvNW
         +p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WYnSIYQgJIuQtijbX0B/h7Je6iwiKZFo+CryvBUOIFU=;
        b=Wpv9KVmao4s6NNwN/qqW6nC2QxeyJWHk4tiiqtnJ0RYFY/NwvbevtVuRuH0g7X7Y+f
         57BAWKqEAGnQRxSwSCsdr+hxWqfIuJf2St+2m39gbEfvY7EhAeHTauwyx/aCsB+m77wS
         DwqclMoHQB42ximra1awp8GtKdMdOb8MOwZmEGYv0koLzijs1CY3oMFurXkNa5hMB3rT
         NKXb9QUv+k47DK5p5AkXTm5m8QGcltCLraEK2Fo7zb5zsrIT+B/hGNIsTe9E8jMiuBUZ
         Ousi5ZkkBg2Bt+6/wM9IZ+fgXUhFrnac9qxkx/awDy+Aheb136kze2w5Qz4Y4e5iL0Bl
         MwTg==
X-Gm-Message-State: AOAM532hb3bZlJe4e7wH6z670RAaNzWXIDXfpBltvmvud8fgRTkSSgpl
	HKoynSo+8Vj3M77Zb7XDmYYxZA/8KMUH5YtC
X-Google-Smtp-Source: ABdhPJz8kARoL8FIqdWPdz7nucNoVgt5JG5KzUctfDCdA+Ya+VlX8R5Eau3AkbTqkhr4ScybaB4Cbw==
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr4091231oiu.19.1628177874520;
        Thu, 05 Aug 2021 08:37:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.37.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:37:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/33] checklayer: rename _find_layer_depends
Date: Thu,  5 Aug 2021 05:34:06 -1000
Message-Id: <d6618f92fa3f589c1d155081e85905ffe5e39a6c.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

What this function does is really to find a layer, not a 'depends'. We
are using this function to find a dependent layer, but the name is
confusing.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9b7690ab30d0e7c07471034f6cb89ccc3168a11)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/checklayer/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 72d9df0a62..e69a10f452 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -146,7 +146,7 @@ def detect_layers(layer_directories, no_auto):
 
     return layers
 
-def _find_layer_depends(depend, layers):
+def _find_layer(depend, layers):
     for layer in layers:
         if 'collections' not in layer:
             continue
@@ -166,7 +166,7 @@ def get_layer_dependencies(layer, layers, logger):
             if depend == 'core':
                 continue
 
-            layer_depend = _find_layer_depends(depend, layers)
+            layer_depend = _find_layer(depend, layers)
             if not layer_depend:
                 logger.error('Layer %s depends on %s and isn\'t found.' % \
                         (layer['name'], depend))
-- 
2.25.1

