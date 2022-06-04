Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF74FCCA483
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.8748.1654338393761404912
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M1NCa00m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id m26so1857940wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nAL+b/7yd5r0Xec27CqX2g5YuUU07Z6DUQcKkSEo5eU=;
        b=M1NCa00my1CR9QgHVwCMsLQb1uT5MLl1jHWfvtsc5CJQxibyFLONjc/HXeF37Uo2Eh
         Iim1BHOEBT+g2oFFD7ekWJGkQZa4kquc1c+/cjTWkfwgQ5IgjLRDbIChAC3U2DkhLUkN
         0rc2thms/N9j2gIhSoSYFqPVqzy2WTcTgsY5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nAL+b/7yd5r0Xec27CqX2g5YuUU07Z6DUQcKkSEo5eU=;
        b=1OGDEVnOUEzVZOtTnQ1luYaGpdhEwv0LNCkyT4oDK3CfujMlRJV19Bl1eNU3MeE56t
         vShAgQNdFG0D8+FHKNpOH0S6BljgruoyiG5oUsQl4j7AOoWCSD+9olUJ8vD+kEpmAtzq
         FWlEIByNCk7wwCuORvrA86xTfNrB2Exi0glhWxCaR+JtN4tUInwK0xv6yG5axF2IX3sk
         02mn/risUwRqOBfjGMXHYK+f5OJ+hRZdtJxQV4D8xEuH+6PjIL+GMPtIlUx6Q/2+v4yq
         agnPdnhrSsqgp55FgghDgLZYTm4iz76s+kqRrw1Zrd/Uums2nfJCTyaI7LnlRPY2PoMt
         EGsg==
X-Gm-Message-State: AOAM533yxwZ3BUyZiKc43szy2AshbgZkC5OsUN4nrTjZ4QS+cfQWJqbN
	0B/r28NosV3ZB7//fv/gfYgVLfGrFlU6tutt
X-Google-Smtp-Source: 
 ABdhPJw4xqjZysoEK5AKrk59p7Ds0vIi9twik+6HsEdKgryKy2QEpa7oZJ0Cf67kqBvNMInNEIY3Mg==
X-Received: by 2002:a05:6000:1542:b0:20f:f809:cf89 with SMTP id
 2-20020a056000154200b0020ff809cf89mr11976630wry.361.1654338392115;
        Sat, 04 Jun 2022 03:26:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/17] alsa-lib: upgrade 1.2.6.1 -> 1.2.7
Date: Sat,  4 Jun 2022 11:26:14 +0100
Message-Id: <20220604102625.199845-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166552

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../alsa/{alsa-lib_1.2.6.1.bb => alsa-lib_1.2.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.6.1.bb => alsa-lib_1.2.7.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.7.bb
index ca6bedae976..1832ce71a49 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "ad582993d52cdb5fb159a0beab60a6ac57eab0cc1bdf85dc4db6d6197f02333f"
+SRC_URI[sha256sum] = "8814e61f7ec6812c76e23a85cab00e0b0d3bba40816af36b726beb1bc04c74a7"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


