Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070C0ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:55 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.953.1663362531487277163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eV9N9TZA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so560428wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=/3J1R8JFYnM1fP1FlW/Bor/iqj2wAWz0b75AxVj+gCc=;
        b=eV9N9TZAPxyUbBYxDOCOZRs4pwGQP702PnG79aMR8kawOW9No2Gd+xRD1vj//Yhii+
         eUeWEwvMK48dcvv0c4+qcLZvS2U0mtY/9C5Wqd8c4ZvwmnQCDwBPhDCCkv4AdyJOqFDY
         5exvEYdOoEUXoJYIWSnE0hnHrFEoJXVF/yqCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/3J1R8JFYnM1fP1FlW/Bor/iqj2wAWz0b75AxVj+gCc=;
        b=u/GLOmrROWaQdMYMhR7usAPacH0KeDvyV1R+7kUYyAysBlycy6HV+KD5qolwHp5RcT
         iFE5woChVT0IsYBoQu6rW15C56h3sWgpiajaO9oc+BW54PeRjypCN67rEornKiZ8BtgJ
         LaCv8Bjrrwqdx8MoT5Q/Pyzq+IKHfEA6aYbD93OUZG4yge7ibvkxTkNtFTcpQka1sRI7
         GOLEgJa6CXnDtjcuOw8Cv0A5arpvcGx7ncFUcQM+lacrVv41msb3N8KYyUoRAX22Q0Ij
         dtpTzGbQlQt0qXc8WqttqC+JTKmI5VI083PtFvXnRAHpCYbxbK5hd704yccs0Y29ihxv
         BbQg==
X-Gm-Message-State: ACrzQf2GkcKd23zL0lqYsvu7zbrRZ5MlDRJgFbqNjPQ44/lpGOXnh77L
	lFaUiyIwVnO28anyA8lkkl0xjCwTEKZ1Eg==
X-Google-Smtp-Source: 
 AMsMyM7kuIOdbo9lyPOUQqBXPxJsrWYH0/HZBNYXHlgfUPI+Ju8szTUswjXGn4Jojfz1dO9SfMRhkA==
X-Received: by 2002:a05:600c:22c7:b0:3b4:92ba:ff99 with SMTP id
 7-20020a05600c22c700b003b492baff99mr4853828wmg.190.1663362529702;
        Fri, 16 Sep 2022 14:08:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/24] diffoscope: upgrade 220 -> 221
Date: Fri, 16 Sep 2022 22:08:18 +0100
Message-Id: <20220916210818.1228761-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170822

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_220.bb => diffoscope_221.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_220.bb => diffoscope_221.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_220.bb b/meta/recipes-support/diffoscope/diffoscope_221.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_220.bb
rename to meta/recipes-support/diffoscope/diffoscope_221.bb
index dc556477fa5..c801200d7c3 100644
--- a/meta/recipes-support/diffoscope/diffoscope_220.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_221.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7873e13ac8b11b634ee3490b70b056c6a6bae9cfb794d6ba7cb43e7797b2a829"
+SRC_URI[sha256sum] = "7b1724e9b1e5ac6597cac07d0acd2661db1bcf0d6a9b2e87be21b5e3806be9f8"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.34.1


