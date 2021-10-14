Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522E2C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:18:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.9052.1634217505406880476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=f7lGnmHo;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id y26so26889888lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=awJbcYLmcJ/Aca+NdTHBXqu9b+8/SMfxoDYuc0BVeR4=;
        b=f7lGnmHoaqB3WPs4uIf/Phko+i2/7fHIIwPOur6kPv0R0kVZ5bfPo4cuNnGwK7m2X/
         LZgjLNmEkGE/pebUAltnkUBvnL0aOyAGH/30ldRKEm1BQdyTlv15fl3grghwg3S79Dit
         dMIIyBILQTPa44LkwEZr2WVYneD26YcREKYx1nj7kNmvOg27cmoDLDGwXnUFDjwEI4R2
         wUnbi9jHQix8USsY1ZTNr0OxIx2Lu0B++o7fSrkI9kNNa28x25qihUx8lSUIKRFnlD/w
         Y+zp5io6ceRzAtT4e3KtU7QF7a0PCtK4JVXLQKgKTTuRiI0Z32SiYKWcjvvSjrzCvzTh
         IMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=awJbcYLmcJ/Aca+NdTHBXqu9b+8/SMfxoDYuc0BVeR4=;
        b=PEZHRjfmu/JaNq4FloodKXpGsS2oMHRQomayL2vbu6JRtZACoojbe5Gw0w73vkDXWw
         Oi/Jg638T3/C51WgyUkWmWz/3pYWbjn9864nxTPqeeWVvnAjXvOYFyQLzb8/hhSMmJot
         /X4asEB+puwL0KXKxdqpNPOK+wi3W6p1w9td4pXq6LgOkPsVGAVRogQ+QAkY59uU2hWT
         0lnaKggJbyO3BWb6+9zLOdISCu/yjSCPB0+UAvrsbVlIv7yzhdVitcv7OVLiTwJrW/2w
         D117DXRJLHR7kSApLBsZQLoqVd6hcUShdpRLhGtTLjg8GEdMCt314mLlsLNqSRzH7S/J
         WblQ==
X-Gm-Message-State: AOAM531ycEtS4szCwdA7PdVChrmO/n80YrYQo5MfkTCV4Rm71lWod02o
	HQ97I5qg4ORblDjvrtaVc8/6/JwFbrRiQg5O
X-Google-Smtp-Source: 
 ABdhPJzH8QqBrkIpCGwDQP50jBbSTPEpqJcf0MwV9fUO3voH83/tA1UAb2o8l4AGQ0VWsdg3eYpUdA==
X-Received: by 2002:a2e:b0c6:: with SMTP id g6mr5997183ljl.496.1634217502878;
        Thu, 14 Oct 2021 06:18:22 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id l8sm226886lfh.57.2021.10.14.06.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 06:18:22 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxi: update to 1.8
Date: Thu, 14 Oct 2021 15:18:17 +0200
Message-Id: <20211014131817.2386864-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 13:18:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156951

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libxi_1.7.99.2.bb => libxi_1.8.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.99.2.bb => libxi_1.8.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.bb
index 8afa9aa527..83101c5736 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.bb
@@ -17,6 +17,6 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[sha256sum] = "2ce90ebcb7fa0c3ed671924f1268b8f4c500fff62e1284699fc413e182a7896b"
+SRC_URI[sha256sum] = "2ed181446a61c7337576467870bc5336fc9e222a281122d96c4d39a3298bba00"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


