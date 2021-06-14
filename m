Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.446.1623703898631408124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 13:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oQ/m1qsg;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id h24so18793868ejy.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 13:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=spL/d1cHRDJTxO42BeVFWpyLypXfm5PL4i+LFXuY6zE=;
        b=oQ/m1qsg/Lrh9nef7lK6W232vyxOkV9NLjJL0MmsE/Y7DX9MtZpNu+zR8nG5FSlo3k
         FmabzSSf9zGwPmLd6JwChE80eGL4w4CnnKzlOiUEc8xvS/kVUdQoFZdWvY3wSwjtHJd9
         r6q2UpzASk1puRbPP3E7Z8f/2rIXd48a4wwuJLm68PX+myZghsjlTeWo5AeoudOHLCqs
         TXbKz9G6HTI4DNfS6Yw8w1eCg968KbyGtKzHzRVj0oxNWCggtfPyw0Sn+1kMZcl+R/lz
         4jfQvAWQyNnbRclvNfdUW7j6vYmApcUVVFTxkeJ0Yc1vF2iTBdhU5zWeF5MLWLmxBLZ9
         RQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=spL/d1cHRDJTxO42BeVFWpyLypXfm5PL4i+LFXuY6zE=;
        b=T+BzXdBpPvUgABuEx0O6COqpJr/AZaMHG+I6s8nypPO19arp39AfrYMSF81DkVgutR
         aduSY6MKpLH5PTnOltJJTxUIiv+neGpyJk8Wb208+cAywanJBTpVVJXyNOaItnBAChAa
         gFLfLOivGXDYryQWOgzxH+K3WNOPqBlI9uLGB8PeDdCJNrkqjayuOaF8TK2L2ZklJbXu
         yY/bOI+QbqAp6NCkylsuTr+m4M2rf5RL0pE8O81QbeDKi5zcuGUQH9t6aABbGPtojqpY
         CNPaEXNs5Du75ZYiqe73itkfDu31+I3kfZyseFJbnmYo0+OGKWEG+jSU4EDl8iUIPgX/
         JzTg==
X-Gm-Message-State: AOAM532wRAxAb780VeuTPnK+zo/2idnZCdHmk8mHKI09oZSpibwG2JKl
	Tb/fbkwDuX/HYsYRtoYlRK/ZF0fBaU8jgw==
X-Google-Smtp-Source: ABdhPJy8IXlHFNKyfpQQnPtbDioTWVUQ6Pn2a+5VzFheY2axwkRo/E6zWJqx5tK6ciuRlIlKgH47xQ==
X-Received: by 2002:a17:907:2709:: with SMTP id w9mr17030530ejk.118.1623703897195;
        Mon, 14 Jun 2021 13:51:37 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f10ae4125962954aa99f170.dip0.t-ipconnect.de. [2003:f0:7f10:ae41:2596:2954:aa99:f170])
        by smtp.gmail.com with ESMTPSA id s10sm8074357ejf.54.2021.06.14.13.51.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 13:51:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] xorgproto: upgrade 2021.4.99.1 -> 2021.4.99.2
Date: Mon, 14 Jun 2021 22:51:25 +0200
Message-Id: <20210614205126.1680546-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614205126.1680546-1-schnitzeltony@gmail.com>
References: <20210614205126.1680546-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes:
* Bump inputproto to 2.3.99.2
* specs: Fix type of GESTURECLASS num_touches member
* specs: Fix type of TOUCHCLASS num_touches member
* Bump inputproto to 2.3.99.1
* specs: Specify XI 2.4 as unreleased

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xorgproto_2021.4.99.1.bb => xorgproto_2021.4.99.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2021.4.99.1.bb => xorgproto_2021.4.99.2.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb
index f4b0895154..8db3e6d7a3 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=dfc4bd2b0568b31725b85b0604e69b56"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "0bce7d4fe800dcb5581cc59a99946c12e6e0be292636544221ec73e96f1a28ed"
+SRC_URI[sha256sum] = "c38878053179c6f8bc2daeeeeb4710b5fbf0e46db5b3134aee4a1977ffb06e7a"
 
 inherit meson
 
-- 
2.31.1

