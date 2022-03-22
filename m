Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35822C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:33:11 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.528.1647981187967588877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 13:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ax2MGbVi;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id r22so18647800ejs.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 13:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C1Nl+WuHBPqLaWUKbaEVbmLpNOpfoSVv/1DyCzgAPRM=;
        b=ax2MGbVib6YSqNzu+/+R8wVJvz/qDRemHZoGnkULX/1nvfsgZQFSVVoN4yUqoRt4lm
         nWpJqiIoCvxxpujrONG4LWcJfF4mepgAH8P0j+QlIv7ELC/s4eH+XidFNACOcEjB1nJg
         IHT/lLsLbT3mZwgOyFQRSl2+xtSvBDc+TMWq+OBSjBfPuq8y2jeK5nh/GAvGCFES3Odd
         WZgVOdE1yMfJG7gw21XsT+uYEiM8kmw5dvvsdha1abI8uQ+nQr6MKU3FI2UKX4QmJe1p
         7K2/XGsGXHgRB/95zUKh+wA2Nw4PqR82EDw0KFBqYnIRWHHuLzpNf0VrTRjPKMtvGpP7
         cdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C1Nl+WuHBPqLaWUKbaEVbmLpNOpfoSVv/1DyCzgAPRM=;
        b=NEK519bzakMdt1zTDLgKczqEqp8PYnSxJPQNr5cVms7vfv1ROWXg8uVpHvvky0ZiVY
         H4mIImLmoqaAg19K3CxCdNfHGJLvkCEr+aSKY5PgielGmOmiAaxtHKcK6W1YpIuhLcLJ
         s2PnKiPi1372d4XMWvoxckdo7QxhAYXZF0ZwP1NATwezZgW712K1pqWJntv0RJILSgNg
         a1GIksh/4CPHP7Tul4cY1VAtISixIlgYBBCZkZlrizCqS1m6Yi/UBOop52Qt0XX5Ssix
         AX2D7CAlJPebcZuUxk7C+kxzL5Fh4DDd5d9PMad/Op/3QVlClZ2VIprPZ93fe21CPHTi
         8Iew==
X-Gm-Message-State: AOAM530x5T9j7jA5UluaejyKHdDhHJiafizu32Uw16QLJ3ReU8Yeg/HU
	hGkopZUjx2wEZHLOP/NGCkKp7ePO+HelevfN
X-Google-Smtp-Source: 
 ABdhPJzoWglu7Gfh+aenGx3jNTt2jjpcp9Ma2JYT8ny7GRn7jWb9EinzLQ73JyyfZz98yCajFQuLWA==
X-Received: by 2002:a17:907:7f8d:b0:6da:b3d6:a427 with SMTP id
 qk13-20020a1709077f8d00b006dab3d6a427mr26601219ejc.509.1647981186188;
        Tue, 22 Mar 2022 13:33:06 -0700 (PDT)
Received: from localhost.localdomain (p54ae16f8.dip0.t-ipconnect.de.
 [84.174.22.248])
        by smtp.gmail.com with ESMTPSA id
 x12-20020a50d9cc000000b0040f70fe78f3sm10544998edj.36.2022.03.22.13.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 13:33:05 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH 2/2] virglrenderer: update SRC_URI
Date: Tue, 22 Mar 2022 21:32:52 +0100
Message-Id: <20220322203252.66605-2-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322203252.66605-1-flowergom@gmail.com>
References: <20220322203252.66605-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 20:33:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163575

The git repo for virglrenderer was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
index 9ddf6cbe78..ad3688e300 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm virtual/egl virtual/libgbm libepoxy"
 SRCREV = "363915595e05fb252e70d6514be2f0c0b5ca312b"
-SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=branch-0.9.1 \
+SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=branch-0.9.1 \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://cve-2022-0135.patch \
            file://cve-2022-0175.patch \
-- 
2.25.1


