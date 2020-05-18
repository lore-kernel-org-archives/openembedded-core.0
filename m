Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.811.1589820571663866851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Fdf/+JG5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id y18so5208884pfl.9
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=iCh0eCmL+X1YjiUZDVHrNV4yP3YPsFghMxuaGht42hk=;
        b=Fdf/+JG5AsRfA8Vugk0o5XRUzyn2/VOO4nh+gXBSzM0c5XyRW6w8t5Tl0eC7mcrbRi
         BKxgtFGKIvr1zFoWEfwA6mBV/uiCjrJiPwsI4aHNxnehyolbxR8Npt37hECL1MkqROFP
         /BmUqQt5jX2HxinpBq/MsGueraQW/sKs9YcGDtMCGAbRYKZejMdDjV/mRdu+ojbmcT5q
         GwnQl+9REe+2DHxIIX9jdcjLtkXLSc43qdIWLjuxo6cWSG5FkRlIG4ubQBT0b1Efgxtk
         69v6m93AuFyVFNwq3Xsg6ACzaucHQwJ5D7URfdj87md8dipdMtVYvpJFK8+KKqszF+I6
         6hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=iCh0eCmL+X1YjiUZDVHrNV4yP3YPsFghMxuaGht42hk=;
        b=beHFWv9IpbmuGq1JedK9+8T4OWYJ87oH7L/kBiTaIlQnKDP/9CA+DUot8yKjexZ578
         WxMmKzFDs71fkFiYpgYic16ux1xPalF35j74EmqmIyY50uv2W7TnlEYq/aTmOqqoWeeW
         UXPPJX5D7GUhMbST0m3asFCAVhz4pakVGiayXCBVTm/U1BaIel+JnycYRhxEG6L296DJ
         LhxtgYoT0CMjdCt8+4kKMQYgsMHNKRkq6YLRILiKJ+Ka5WXtFhtQHHxWR0Sox+Rp+O4y
         EPcSJ4eMfpFSL13LjPoMO7r6grGIiofQ5/Yrgs0OEno2pc+12+fb8HFXDtAhfovRUcCI
         gEmA==
X-Gm-Message-State: AOAM530nyNBdpizFfc+aq/I+7haoMqCBIFanOyLBUhqpGBMU2/2k/yxW
	H9G8Qq6iV6/UYc2M/YUiA4sxj0wytBt0Hw==
X-Google-Smtp-Source: ABdhPJzAryfm1muF7dMfIo/FCQjpVRXtnHmwNgudM5bCbocr5GcCOXSmDp08inauyaUWxVDCx6BlNw==
X-Received: by 2002:a63:6f07:: with SMTP id k7mr16613139pgc.274.1589820570763;
        Mon, 18 May 2020 09:49:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/19] python3-setuptools: add the missing rdepends
Date: Mon, 18 May 2020 06:48:30 -1000
Message-Id: <5733811eeba9fd88f4a621c705a2de61b197c3d7.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import setuptools
 [snip]
 ModuleNotFoundError: No module named 'json'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index f7c3202fde..58267966ba 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -22,6 +22,7 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-distutils \
   ${PYTHON_PN}-email \
   ${PYTHON_PN}-html \
+  ${PYTHON_PN}-json \
   ${PYTHON_PN}-netserver \
   ${PYTHON_PN}-numbers \
   ${PYTHON_PN}-pkgutil \
-- 
2.17.1

