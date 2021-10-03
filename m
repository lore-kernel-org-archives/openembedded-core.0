Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B23CC433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:23 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.2541.1633304542264920429
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MFSiwhTz;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id k7so27100894wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sHagPClMomokOVT04eIRHSClXDuvm5c1T0HfsKdA0wU=;
        b=MFSiwhTzFHuiZ9mGZxl585mHFKAt9lsX+MHgDcDp3HWv89GaCSh30LKTMsaaMYMktn
         f9erAMbvDi6zHDP5YV6/ClvbjQBsd/KoLQzwYnDH30bCu93WkEy1qmPiUoDce7aUAPXb
         B44Edy/0iyf2TZNs0ao0PZFkgH32Bhpn1vbzKWX94IJfrC4LMg/JHz7ahVYftljwrow2
         BCwpu/369DRw82WBvmqZd4LEYlYHpw6JaGByxTSCt2i6A6YrNPRSA4Uu6oyq84hc+jaV
         pZdC9mwGXObfpzcNBXjEB83ehmItInHO9E1MlWvHdf5S3qIZDxFqAT7iF3TLBA8dehbK
         gVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sHagPClMomokOVT04eIRHSClXDuvm5c1T0HfsKdA0wU=;
        b=bbWqWctGJk97gVNQVwg1jzt7Xrm1bDa3osId2NC7bv2A24+OmV9D7Fr0TtdabIhK+b
         8J9lnAJZOjKS2D7237LAqfBAJk/HYcbEiIRY8Odze7+/9wDdIwwhwV3SUwhxMpXyQY2p
         b8KPCV4K92bKjC/swZj+2ETPmbQo8FZhWO3DhHJ+me3rDDNKO+IW+eiq9gswTIKukS7H
         73Z64oXLd7aK04V/3ThlYr5Xrx4y3OWjQ3gK4lpr4pmQvDxGfGAxbRgrkY/sbAKn6Ty8
         zfT58nh7f2DPq1Nxv/nNFco/nQS/o8zTzXyOBzroL4y9HA70+XmiDUhPzNqF1a9yfpfg
         EWcg==
X-Gm-Message-State: AOAM531m7pfo7fCqQj1LecEtGikHl1hWI/k3+a7bRysZ5lcXGkgfu7FE
	W1n+HlTvGGWq5qPx+HzfnVqi/4qm2+EJjA==
X-Google-Smtp-Source: 
 ABdhPJzLWTf35N5n4vAbaBuLyT1J1/gMOvWlFr1khnShmFWNJb5jvaA22KWP+XbQQb1xoK6biYG8Pw==
X-Received: by 2002:adf:b353:: with SMTP id
 k19mr10860724wrd.325.1633304540652;
        Sun, 03 Oct 2021 16:42:20 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:20 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 08/12] gstreamer1.0-vaapi: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:42:02 +0100
Message-Id: <20211003234206.949967-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003234206.949967-1-quaresma.jose@gmail.com>
References: <20211003234206.949967-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156572

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...streamer1.0-vaapi_1.18.4.bb => gstreamer1.0-vaapi_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.4.bb => gstreamer1.0-vaapi_1.18.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
index 5c9025fbb6..9a68a3fadf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "92db98af86f3150d429c9ab17e88d2364f9c07a140c8f445ed739e8f10252aea"
+SRC_URI[sha256sum] = "4a460fb95559f41444eb24864ad2d9e37922b6eea941510310319fc3e0ba727b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.33.0


