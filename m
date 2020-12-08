Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.9817.1607440132299257237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WxRyncPs;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id l9so7431568wrt.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 07:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RGYVEh5pdMIZJ4G+X+Id3A5pqJotdfarRsBQ4inusXU=;
        b=WxRyncPsVwQ3QMEBs9veXh4b/fjL9GKM6ADl7fmtWPPw+CvS2ERVNbcJiExVv4o/9R
         nQRdiHyHrKVoKNm+rq+bk0CiTdLb26hN09Sl6lCFMNehfTUv15Cf4wUt6b5hGR5DgLx3
         jgt9lNCP06HOPY59Z5OAnG83aNHIpAqpcSfv446nCl9cfmRxx13KOZ6Al4GBJrdwYAHQ
         XdZiXGUOwDZDfnMf82mOwW7FH0ARNxlaHmNOwtSg10hw9zyyGqF3CxfKQpO8bt7afZxs
         3PwR3rwRWcELa0vA836YKzVUXt3Ey5JTR7Msk7J0F8bQjmxjbTcuXXOOqa2cZPggXG9L
         fO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RGYVEh5pdMIZJ4G+X+Id3A5pqJotdfarRsBQ4inusXU=;
        b=VnIUAGAQb1KAypNLQ4EcAdvr4vS3aAaoGd/POl+pr1HHXc62xDxcr/fk1ubqPy/mtx
         4h/k1L61NKeAbD0pUWt+MBw5zEhRpSea5G7+L17dujBK1fZdXHqwVGItDcnqfCLrbY6q
         CfUmX/HzvOte+bfE8+yL7yKOfiqJxx9iyzISGkPUhuk1CAiIuYBVaxVeaxSryfo1Lr8p
         Eglawc+wrj7fnHbpXGVlbDl2p2JXKi2lbW4CNqlfCXLCX/1N7ZbDor6MvNicQBdtolGA
         L54pwFWTw2+AhHv3tPglBmyrvzWay5SbdxvmZY3YgQl2b2drfOXNXAI+/XxFP0twAnag
         TZBQ==
X-Gm-Message-State: AOAM530+7uCveXQggKT2H//d/7zUoaZWNbbVZsQjlfdRWpRLcp3PCmYD
	ZTX05a50xk6n4ZzpbyIQaLXvg8J/2uA=
X-Google-Smtp-Source: ABdhPJzwpQfgGXjRr1GMh8zWgf81Yp8uic2VE4i9X49GPwcTA7RbKnYFRT+Sz0RLpYoc81fBkqB4PA==
X-Received: by 2002:a5d:650c:: with SMTP id x12mr17699795wru.47.1607440130671;
        Tue, 08 Dec 2020 07:08:50 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h83sm4418607wmf.9.2020.12.08.07.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:08:50 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 6/8] gstreamer1.0-plugins-bad: netsim plugin don't have external deps
Date: Tue,  8 Dec 2020 15:08:14 +0000
Message-Id: <20201208150816.744752-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208150816.744752-1-quaresma.jose@gmail.com>
References: <20201208150816.744752-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb                 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index 70aa0b6126..58604d33a2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -91,7 +91,6 @@ EXTRA_OEMESON += " \
     -Ddvb=enabled \
     -Dfbdev=enabled \
     -Dipcpipeline=enabled \
-    -Dnetsim=enabled \
     -Dshm=enabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
-- 
2.29.2

