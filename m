Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86CEC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 04:06:14 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.65465.1670904367365024676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 20:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mhXbTEmz;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id d2so9636872qvp.12
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 20:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qffQ7AcUPdKJZ2Zrd1dz2yhqSAGTQzz4qf/TU6iEFVQ=;
        b=mhXbTEmzFgLp/v7Fou20LHcf51Ww28g4VNQVdfVAcgg+wJlU1EgiAL3/8rUfwkwhjJ
         qZBBu5gbO/iCpsL3rcXuGsdajTOlqODk0F7CKzby2laQaKNurDnD927a8Us5t3kKOed4
         JvHrZb8Avp3GKN9IB03gPmd9zKAVZm4NNMpUtVR1wzLDXmhWLsOV2P+kyf0AgXV43iDf
         kYYnRlw7Be/Vbm+dLKXF9NNfDB1K94vsLn9BEQ38xdcIWjwOFA9zb8XWp8df54p+7P+q
         WDw2Cldxly8idpbXWjMzi6OzXCFmgH51wOH5Cdo6qA8i+ufDLtlVGarumaKtbfDkyUPM
         yoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qffQ7AcUPdKJZ2Zrd1dz2yhqSAGTQzz4qf/TU6iEFVQ=;
        b=X5VDPRxiUHNx27WxfHqIpBU08aPT58m55neKt7l8UhXy+LQcbN6qDdI0xAZGKglNgm
         7TTXvCugG8CW6/2mSu9+APUDOK7aGeXu2RWEFLoRPyOFSofs6JXuaCKPKf/4TujP20G7
         /mDsppW4bJLmGQsFJ1+CWwhrl4auCD//5d+ebuSL00P1ZlW+1HGMPK+a7u5r5ns1oGLe
         5J3KH5N0nNoY/hkQ/Hg1Ajyhxdh7WO0ssuUjYqVhTrJELygvoZlBzvUz4eqKFbpWEqSe
         pl6zBklBKqZISH3qtHWsUb9Wdf3SXdbPVKl8J0dT22epQvnrkRgg2o9NAf9vdJMj6uB0
         UJwg==
X-Gm-Message-State: ANoB5pnn6T/DB/B1R1EktrqbNBCAytQDtSG+DQ2N504/dXsXUkf+1hUI
	9/VU5GQY/pbYDmfny4iNVpc=
X-Google-Smtp-Source: AA0mqf4h3am1hQde7XO4l+KVS1O982TGCPAaiK51LFREg+FCj7Gcc5TY6gRcOcaTCrj+JcmpZImZxQ==
X-Received: by 2002:ad4:50cd:0:b0:4c7:1c72:58f3 with SMTP id e13-20020ad450cd000000b004c71c7258f3mr23693136qvq.43.1670904366228;
        Mon, 12 Dec 2022 20:06:06 -0800 (PST)
Received: from localhost.localdomain (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a0c4600b006fbaf9c1b70sm7051343qki.133.2022.12.12.20.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 20:06:05 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-libc-headers: add 6.x fetch location
Date: Mon, 12 Dec 2022 23:05:54 -0500
Message-Id: <20221213040554.75001-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 04:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174507

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The next libc-headers bumps will be in the 6.x series, so we
udpate our fetching list to handle that major version number.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

I'm working through the update to 6.1 as the next LTS kernel,
and that includes bumping the libc-headers to match. While
testing on both the kernel and headers continues, there's no
sense sitting on this patch.

Bruce

 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 71778bb4e3..3a8d32e785 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -44,6 +44,8 @@ python __anonymous () {
         d.setVar("HEADER_FETCH_VER", "4.x")
     elif major == "5":
         d.setVar("HEADER_FETCH_VER", "5.x")
+    elif major == "6":
+        d.setVar("HEADER_FETCH_VER", "6.x")
     else:
         d.setVar("HEADER_FETCH_VER", "2.6")
 }
-- 
2.25.1


