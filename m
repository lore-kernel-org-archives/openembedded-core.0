Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2532C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.7.1668103985679797768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lfWYA+NO;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id t4so1628032wmj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDp7n5GXFbIXH0Q8g660Mc3dG8JJnR+MaKaFg5laxC4=;
        b=lfWYA+NOy3yDdnkFbb+KaZAtNlqT6AQLe6xEzy5/f7SesH2NUpAK6t/4QoB1Ne2MOz
         knAh1os/oEMK2GLfDygJkf0DEhRwC8t3esRb826vNoRYpS2kTnn5kA0QdQvzJ9lZd/wn
         uj7czzGRsTgp5BDrzTN+NCZ3lp9wMHgnukVLlSKh+kUoTd92LFwS8Pv4ltZd0/sFB1NK
         MPK7/Q+d0IE+H6KzcuHLkhkZUZRjzOwdBGZF6LTlvNQWRzEIT2WBq4jJdMdUO2MWXnFo
         jEc6tTef+8Wq+j2AXOieiTZjpEHC2vLIEl2qzldQdx/FL/4w40Ww14ItJaSToIAbPLwS
         CuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDp7n5GXFbIXH0Q8g660Mc3dG8JJnR+MaKaFg5laxC4=;
        b=mWCMKtRPlYX9lt8Ob+c73KuFbl0jY58CV+rVb9yUb/w12dMBONBvJ/E7n9zr+cLNeE
         FuNc5HUAFYGP+DmYBW8ZeD5Br9SC2/r0/Milwd9UyFGJsi4b2WnElrUIkY8cXwm65GxL
         JSIVuN+3DhMem00Z9VQkTUPtjcYCfTaLKBYIBvlfOQoMIQTR7vfZV9CB1H/4f6Z4T3bs
         Fx4g3HjDm6Kr6b+x4Uyz+EGdfcO0drN6b0ZjIP/a2xTwtLeoTQoTRa7xZbs9v8YNS1et
         0BRT49V/Zdi1Y4gdcodbZ2/zlGQR/ooYMRK3vmuCeD5yplvVPtRK77Nl9XyCWY3E262y
         ToIg==
X-Gm-Message-State: ACrzQf26vW6hQFHKS0ccBpkEoB3DDXbq+zq83qi6Mlyvwcvu0gyyANv4
	6xJdisFzDwWIX2v1fZa25vpHJfgUI4k=
X-Google-Smtp-Source: AMsMyM5T69Tx8d3W7ExTOrYMKN5DQF3ahL88iejOXufMBX4DJLEnuLUIx63hix/alyJn/y6wA/V9ww==
X-Received: by 2002:a05:600c:21d8:b0:3cf:69ec:9628 with SMTP id x24-20020a05600c21d800b003cf69ec9628mr1083349wmj.79.1668103984070;
        Thu, 10 Nov 2022 10:13:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/19] libxrender: update 0.9.10 -> 0.9.11
Date: Thu, 10 Nov 2022 19:12:36 +0100
Message-Id: <20221110181249.1240200-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173089

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxrender_0.9.10.bb => libxrender_0.9.11.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.10.bb => libxrender_0.9.11.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
rename to meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb
index 35763a5a26..302cc56e86 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb
@@ -18,7 +18,6 @@ PE = "1"
 XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "802179a76bded0b658f4e9ec5e1830a4"
-SRC_URI[sha256sum] = "c06d5979f86e64cabbde57c223938db0b939dff49fdb5a793a1d3d0396650949"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "bc53759a3a83d1ff702fb59641b3d2f7c56e05051fa0cfa93501166fa782dc24"
 
-- 
2.30.2


