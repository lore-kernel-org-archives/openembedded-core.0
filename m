Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.10572.1628177782993953062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=O9T0O5Ip;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.41, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f41.google.com with SMTP id z3-20020a4a98430000b029025f4693434bso1420640ooi.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0mYIkzSPKvdrtm/0L5F15GMbz0sx8NkaE4qg4mVyjTc=;
        b=O9T0O5Ip7xhBHg+nW+GCnVZMp8Znlex9YV3+/ZJcyeAL3AF41D/2CuYSV1OH+fCCRc
         t7X/JXWfuWbhPLwyrNOdXJXyTLTxW4TxcXzlmxPVlrNxdaXLJ3fVjFE0UKkG+VyqcnDy
         sDc5uLdsXSV9X1BCC/zowII0/qt+2JIj98qrr7l2Nx/uSNVGE+z9f5jvBnFPH8xY3jVJ
         AJBa02cRFSGMXoorapCRO82T4jUuJFssqsYesL6DW7p5hWb7wh6jNS8Fq6tEHQLTOAZu
         wwmRh491YU9VKJ4FRmyS58cbtM9krk7o99sYLINCwBlyJF/XJ7EHhnZ++SUs4416RImn
         915A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0mYIkzSPKvdrtm/0L5F15GMbz0sx8NkaE4qg4mVyjTc=;
        b=MT7jgOSdf04oxDtTd7EpSy/xro4iTI9jyl2NbzoRiehvsnNcRknKoNRabd3x/TTtHq
         j0P0wHI+CbGEbgqsi8vH09MSnjt4eRFMUBM8SmT9H6ezMS6mcf4MVCbceYZPvwHrDfUu
         /TkcRfmivC+gMuMTIXw4zqhF7UZlkqHI+gteEjBWH0+atGFVPsSPBLkqObOOQ6imzaAr
         zQNs+M/xfTbQpv466k2rOt9tIMnXkfSInDapkDdhzzcw6pxnM5Ab3tpRZV0sZgp8GjM2
         K2dbE+FM0cjrvg6ZywGoO1/BZc+xmDF+vqdStgGLzLqfWHptqDG95nArz8vbU0OdVQsF
         262Q==
X-Gm-Message-State: AOAM531LI0d6ih4tgtVT1Kvd1nHY6D7ReBr29TxHc5tYeWkv7bXVz/eS
	ELDxGTwPehZcazzIyB/+tOUz/abOAmuVB7RX
X-Google-Smtp-Source: ABdhPJwQNKNJkDa801qgDOP7SIWmm/KocVIapiAIR7KSuFX8xOqewSPqO2D0O75H74CrRtVTO8UYLw==
X-Received: by 2002:a4a:dd04:: with SMTP id m4mr3644985oou.69.1628177781968;
        Thu, 05 Aug 2021 08:36:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:36:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/33] yocto-check-layer: Remove duplicated code
Date: Thu,  5 Aug 2021 05:33:51 -1000
Message-Id: <aa8e0928bda4a01623552084fc0ac0658e495b53.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Nicolas Dechesne spotted there was duplicate code I had introduced with a
previous fix. Remove the second statement since the earlier one is correct
all that is needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3e8d9f0e53e73de5498fccce81d049a88f6473b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/yocto-check-layer | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index deba3cb4f8..84fb0011e9 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -152,8 +152,6 @@ def main():
         logger.info("Setting up for %s(%s), %s" % (layer['name'], layer['type'],
             layer['path']))
 
-        shutil.copyfile(bblayersconf + '.backup', bblayersconf)
-
         missing_dependencies = not add_layer_dependencies(bblayersconf, layer, dep_layers, logger)
         if not missing_dependencies:
             for additional_layer in additional_layers:
-- 
2.25.1

