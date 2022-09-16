Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE9EC6FA8B
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:44 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.896.1663362508609705737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cla9t3KA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id n10so7349639wrw.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=L3/MtujIrQvYHVyWwc8XAOwrw0Rxx5pr80ckufdLxac=;
        b=Cla9t3KAcs1u9k2FkKClT1XOddtURtAcGUJAwEzXoDoCwgjkzJxSxDrxvp+4FnWe5U
         smc8MJdJtOmCxHpctupg/98kjdXIs7perzRGJr9Jf4MKyALLAfHVH7svmwQjJqWOn3x7
         cHHWhfkZ3YedQDJuqr/UztPGPl0yYN8TrPoE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=L3/MtujIrQvYHVyWwc8XAOwrw0Rxx5pr80ckufdLxac=;
        b=GHUxMPd6RgoVlfgoLzjjK3FP76TjGxnv2pRkPKgRljs2akZdRi/9YN28gejmcLZ2ik
         DJHr1XS8jdpyKUDjf6XozQGc16x69omD38Hs6M79z6p+HJ8UHjbJLr/Tk2baTrfQbzjw
         4K19cEpZITdA5n3pM9Vu0nMp0cjEhPhtOjaGLFl7sMlhWvi1Qx3u+/GrjcrOPtqWFqHL
         1HKOuBTe9b/GqnkqOza+Jh4IPvqg8CO9ylk+s0kbE2qFvdQQu+2qKQZiQsfQ5104lF8n
         g1c/5abOzl2ukWwBuJiu1NIHfSPG7rZPbL5Fi9dWpKeFMvUoLy9KT2fy9KyYFzRUdRlx
         J1eg==
X-Gm-Message-State: ACrzQf1GWfnObHtpWVmlQ2www9Wak3F3S+h1nPwo34fosrPvenLMV9ll
	HpyIZ3vsAWJkjs6UKh07yuf0xEMPM7LFpQ==
X-Google-Smtp-Source: 
 AMsMyM42cE+WN5YmHng0QuXaFVSz1GDkmXbM6GI89KPAxK9GnPkoJMEgoPvnMManRnP+ZnNVOwyxhw==
X-Received: by 2002:adf:e310:0:b0:226:d19c:de22 with SMTP id
 b16-20020adfe310000000b00226d19cde22mr3958098wrj.314.1663362522681;
        Fri, 16 Sep 2022 14:08:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/24] ffmpeg: upgrade 5.1 -> 5.1.1
Date: Fri, 16 Sep 2022 22:08:13 +0100
Message-Id: <20220916210818.1228761-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170817

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ffmpeg/{ffmpeg_5.1.bb => ffmpeg_5.1.1.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.1.bb => ffmpeg_5.1.1.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb
index bb507b4974b..2306fe4a42f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "55eb6aab5ee235550fa54a33eaf8bf1b4ec66c01453182b12f6a993d75698b03"
+SRC_URI[sha256sum] = "95bf3ff8c496511e71e958fb249e663c8c9c3de583c5bebc0f5a9745abbc0435"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.34.1


