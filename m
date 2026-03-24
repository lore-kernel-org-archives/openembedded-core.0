Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27328E9A769
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:55:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16765.1774349714993642320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TSoE9Jws;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fb14227cso11392155e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774349713; x=1774954513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G2gjQqWV8W//8EisT1uf4+hZiS3RNr6/siBhXeJchRk=;
        b=TSoE9Jws9ZMi0xprGwHQO8B21bEk9y49zqA7Y7rOja1jjNTCbhTrYLAhY0kwyhchxE
         SOiTW1A+97K/gjQbcpPMmTVspGoid422uIFosA5IDYPVHetHFsB9983VKVif6iL+Gext
         RtJ/7qabA0cq+yCaVKaKUHUhXR0HwxDKnJUbJRfJhq2uk2thaplALQb5GrI8CKa6K5n5
         dICqmIjjxTDs1xs1TKztE7T7h6pKcs7xI+fdkhhXQTB+S0eDiulpIzLn0/SFTg5yorHQ
         /pUSE3NbSsSsF8r/JtpcXKe8ghMddnEwww2CicrlGTM4qg2cjDbFYzIVSr1iLUhku0iT
         KAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349713; x=1774954513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2gjQqWV8W//8EisT1uf4+hZiS3RNr6/siBhXeJchRk=;
        b=A2+KJYF2doupti2TRNlYAX9kKJ+m9gvcopU2aVQn7FycMxPQ1zZH3xTF7xbGXQuyOm
         uqe8gKmLoXOE60O1Pz2MUOvxfG5M/rAS0vqANELnsSBHqDXOz1JiebYUkIyFXbsy3n0S
         5W6/9Qdp7u+Qi3X+S8LrkfyeE3NaNEwyyN8SaTGHZi98GKG5iCtRziC4JAjUKw16zj/z
         SsMeEzAWJ2dvvM8zbOqsuGRQIs+hCVpANAt+G3DsiVAJ4U20C5viYoCK+0C/8cmX++sH
         HzTLuGvY8/gG28IcQ4/cRnXrVC/Droe93q7gGS/tGtrMqmT2v6qnGbc8T3Kqr+VFeWOH
         xcdQ==
X-Gm-Message-State: AOJu0YxBalXYqkJxd/jAljoeUMJZf28tmRQAMIAb75CGoXn3/Ww5egjj
	c0L3QMw5Aw4PNAGtKmUyxVoM/RdgI/6JF9PfwDu3p6kQyytf4cGWOvlyMDZiXg==
X-Gm-Gg: ATEYQzxxllq4W1pZJhgj0dAIPCyAOuS7LzF1cNcsqJoQdt0pdjswhXuhbL5H41kN8eA
	D+iDteBIef0zeFgSAKCJ+DD2WePRTD/whra6mtmMAUiTH1NeexuDdO9FEXuN4M/kY5YLYYP/g3K
	Canbqh5Skd1vb79+Ok3pbZ6tC1fH56kQ7XjZmNMFL7xO6jcVBWNlZ7xEk/z1zNtqHn1toLvec59
	AqkISrQHauMj+6t1xSnSxoTh8PHbsFDUP8qDGdgoXK/lHgLT+DCyVLiShUHGuqKv6wENo/z5paF
	MLGw+OOSVUBmp6gC4OnktZ7Mzyq897LNE8QsXttNVPgAh9xKoodpYsSfFhx8u90z1qTdmn1M9N1
	C9ugKIbkI/j4bJINPrdgyPhcEZVMA6vdW3nZj6LoVBPjBrn3NMbNXudtxyd8Sy9v2IEAbqhPCit
	6KskbQYSKvkRQhUw==
X-Received: by 2002:a05:600c:5250:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-486fedab733mr221724015e9.4.1774349712973;
        Tue, 24 Mar 2026 03:55:12 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee514sm51180835e9.13.2026.03.24.03.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:55:12 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] mesa: Upgrade to 26.0.3
Date: Tue, 24 Mar 2026 11:55:10 +0100
Message-ID: <20260324105510.2896915-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233789

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a95adfc960..6ee8d87c4a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "973f535221be211c6363842b4cce9ef8e9b3e1d5ea86c5450ca86060163c7346"
-PV = "26.0.2"
+SRC_URI[sha256sum] = "ddb7443d328e89aa45b4b6b80f077bf937f099daeca8ba48cabe32aab769e134"
+PV = "26.0.3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.53.0


