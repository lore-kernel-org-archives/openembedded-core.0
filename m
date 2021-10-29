Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F5BC433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 16:52:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.8210.1635526348242035956
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 09:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OhbS95Cd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id v17so17119658wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2tM0OK6oyxGoJB8+MaiE7G1+eutLcQgT6wuCdATRdJY=;
        b=OhbS95CdxMAtE4YWRigEKYvyln+p3L7EV/KRET8XUTfFHmytde5loT9XOT+TWB7T7n
         48Rnl8Cwwi0aQgl2XtHIp69OOnoUlMCSxWAAHQGH4G0P0EirBfLH4vsp1P1i65Xd5/SX
         mT6AALTzNAqWPdgqPY7TLS1nycltE8NzJOrEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2tM0OK6oyxGoJB8+MaiE7G1+eutLcQgT6wuCdATRdJY=;
        b=M2ghA2XQ8a/ETnKls0GhrFr7kwZ4weM71cncwpWUddBpnzl1tP5hipxP6rTb+fR4Xy
         jDpXQdwIoGCkeB3Cit12RIuZq+Y67eezQ603N9vqtncTcJZUEGw+7mLREoLUlCq5JcoM
         Apew3JwtLEI6IKQcPlaZYl8AnzT6Ur6QUz1rv7Ys2KnWYyUEhs0Jx6l/j1l6nPYBvTCK
         sUDvQFkLE9MbIzogonz1VRsf2o7tpbxbcDWyJtKp6soHt9ybp6xe5kmJ8MVKBvuGJbvL
         XFMKjqp//ywlLHZQL1SIfirOV1tdw9T6jln3nTrhjeOvIABJrg/5vRMuXRLwvqNKy9sL
         2kwg==
X-Gm-Message-State: AOAM5309rKBPM+iAvGcNu3BV1T63d0GaGWBN8/vRpbUrvEwsWDb4CTJw
	Xal6ISzUVAZJzOHag2JJOheGw9fmdDAMtw==
X-Google-Smtp-Source: 
 ABdhPJzf0Rca+wy16OpGz8k4UH0sV0H70fX5cEtBfDF1gT7rTIMqRohhGLLkbZZY+R7Zo9de8Hm9yQ==
X-Received: by 2002:adf:8bce:: with SMTP id
 w14mr15225293wra.391.1635526346464;
        Fri, 29 Oct 2021 09:52:26 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f597:af8e:ac:d124])
        by smtp.gmail.com with ESMTPSA id
 l20sm10862013wmq.42.2021.10.29.09.52.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 09:52:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linunistring: Add missing gperf-native dependency
Date: Fri, 29 Oct 2021 17:52:24 +0100
Message-Id: <20211029165225.3430572-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 16:52:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157625

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libunistring/libunistring_0.9.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libunistring/libunistring_0.9.10.bb b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
index 0a7b18ed08e..589faacb05a 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.10.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=08287d16ba8d839faed8d2dc14d7d6a5 \
                     file://doc/libunistring.texi;md5=287fa6075f78a3c85c1a52b0a92547cd \
                    "
+DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-- 
2.32.0


