Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.11334.1607008126408463916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bjQ2/Rq5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id f1so1282098plt.12
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zd2zW+xftbVhgURuAEBpZIZNHJ/xj7qgLPEsAer35jQ=;
        b=bjQ2/Rq50ppebpLE8jJ6MfLa3beZMmHrvhM/uykus6NKXrDaJh9BCjTw+Tse97Isqw
         A5Ulity2K0nCa85bNvHeRvBfafYpGippPAWBBjPisXpaFcm7qoqVdNqJ3wvh10JTpHxZ
         Vy8U5EKJdXhGtqHneByEtn62ua9xBrsTypul1lW5/0Vd0qv4d/Ao5wYZGO+d0gTbWvea
         1883cYIN5AOLYKcAROrYJ4fDy61LSFXH/U1yPeS2NFofa1YjO0oe8vouJ0YQYVUgcHhS
         +B4efpf9y+sQ6EbBVKCRHmfYN7Zdf5i09ZIjYidkHglsOlpmBY7C5ANaEwROWDT7gjE8
         9sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zd2zW+xftbVhgURuAEBpZIZNHJ/xj7qgLPEsAer35jQ=;
        b=saLI7mCF6UfbWstxklbo908bHKqaqcgnbj+RsOfwl7awoEocV2GM/qNLH6PLZzH3l0
         4OidBUZLFuGK9Bbv1qErjz2pSru4v3+mQum+S7Dm4of0J6QcpK/6NvMWl6gYLQTN3Ihe
         9Vhqo12ozqs9ra8sTrX1umPmTcNeJJz/pYaxXqEVwf9obwsIRsquAAO/TOczcfoPL7Xu
         HSSKDM8SCRXQJZQmwpGpOpzCHtCIoxub0+zo2eUzXacVJB/gBSFa9V1CuoOcyipHthss
         rTa/Fy/LC/alera4eYqFAwxjuub3zlI+YA4cbN3C513kxuEh3wGQ+h7C30N3x8LJweak
         ktbQ==
X-Gm-Message-State: AOAM5322h3ZEIk/7TWsKG0o1VVAKOCudqXbbSPkchBipXNCw/0DpMbf5
	UR7fBnfrKUCjBTx6Wu/IOL8Y/YMLkcVMUTC9
X-Google-Smtp-Source: ABdhPJwTIB/xQgO09LmrAN7qSqskM0yV2O0ATrO2/db2JzglM5mQt/tn+M/2cmT5RAVpdUPiIB78Vw==
X-Received: by 2002:a17:90a:6809:: with SMTP id p9mr3323836pjj.112.1607008125573;
        Thu, 03 Dec 2020 07:08:45 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.08.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:08:44 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/28] pseudo: Update to add OFC fcntl lock updates
Date: Thu,  3 Dec 2020 05:07:53 -1000
Message-Id: <333a22e9191ff121886717b6d326654a9349c8e4.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This adds in support for the OFC fcntl ioctl lock flags, removing
warnings on some more recent linux kernels.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 234168f803bee2e5b0955aabaddb1d967349fb82)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index fcadfd96ac..9a22304bba 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "067950bd9415fafcafb2bf32c0e10df4f2ac936c"
+SRCREV = "8efb082863ff0ceec7b7e46f9a44750e12f48039"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.17.1

