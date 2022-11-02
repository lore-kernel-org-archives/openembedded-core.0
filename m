Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2302DC43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:19:02 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.2288.1667359139443413516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l02uW3bI;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id g62so15241909pfb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoQzT/YYz0wszO+zzLEosPvt7/1HWUwIy9DpTdUu8Cc=;
        b=l02uW3bIo03He8P2kQwANd7CneXR8e9apTdtEu+dCZitcry1OOYVJMP9NMlkh5oFj2
         Z/16IQgo5c7HORQbIS5+JCNLNb9mBgRfGl0ziFeQjOEg2/O4+IDJgwmvpizNh7LHyIrF
         UIpCuyAH8rZfxDnzWvvZqRbNqmoUHsTaJdCHb5wncYUfwe18nW3qawXy4bZ6/1eF9Nia
         bpIXP3rJU8X9pDeEko37itHELUmJmWMbxdM6c8xLrWXeFAP+fG/E+KNQvSMgHL/e89c3
         ZZYA4+D6VlmWwbL3OmtT5ZC6B+oLqSh0fDH2If40/974xxC0egbLvveISafM0aGp7z71
         NMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoQzT/YYz0wszO+zzLEosPvt7/1HWUwIy9DpTdUu8Cc=;
        b=DuoqLCsXHEp7aFF6HKu449Q98X7eZVzwSbg2JW3XOUWUsC8d7zVi83VEBzAjnECxrb
         qSzsmyBnBAQQxBQxEQpuu1xMrlGt5K4EJ+tY/CCJjPUoLugrvAws7u2yhfwgDb6B2gqH
         M1DNO15GlHMvHQ2aTOMRJOYbRdU5Ytw7YOigFFcMbwT3Kkvg8Qdd3JZSZvPfTvvKWEMx
         w9eS8BwTZwjYuqytIfa/i5j7PWyUfqsZJqO2ahFHOq34ltQNI1AxMRag9tY7kzi2osUf
         g5jMnuxGD16DwamYTPZUfrMgiafz7wHPD/b1tup9z1+6yFyxlIcY5j71j7T8l5l+l2Ru
         spMA==
X-Gm-Message-State: ACrzQf34JCG4hoBtrdDgRFMUWE80A7CsDYLv1F5dLUclzo726EObfGWr
	DMnl/sO8ncOLcOPcezKCNJKB4ld9Os304Q==
X-Google-Smtp-Source: AMsMyM7kDn1xPxtZw7TAqAL+8FL2/dHQwzR3pl8/RpMCXbJBHWBDDUEcMOPo1FfknNgIfsa6GgLxeQ==
X-Received: by 2002:a05:6a00:1a04:b0:52a:d4dc:5653 with SMTP id g4-20020a056a001a0400b0052ad4dc5653mr23067188pfv.69.1667359138509;
        Tue, 01 Nov 2022 20:18:58 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a16d600b002139459e121sm269644pje.27.2022.11.01.20.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:18:58 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 09/11] python3-zipp: upgrade 3.9.0 -> 3.10.0
Date: Tue,  1 Nov 2022 20:18:28 -0700
Message-Id: <20221102031830.3606777-9-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102031830.3606777-1-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172571

https://github.com/jaraco/zipp/blob/main/CHANGES.rst#v3100

v3.10.0

* zipp is now a package.

https://github.com/jaraco/zipp/blob/main/CHANGES.rst#v391

v3.9.1

* Removed 'print' expression in test_pickle.
* bpo-43651: Apply io.text_encoding on Python 3.10 and later.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-zipp_3.9.0.bb => python3-zipp_3.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.9.0.bb => python3-zipp_3.10.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.9.0.bb b/meta/recipes-devtools/python/python3-zipp_3.10.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.9.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.10.0.bb
index 00c55cbe7fe..56d8e706c8d 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "3a7af91c3db40ec72dd9d154ae18e008c69efe8ca88dde4f9a731bb82fe2f9eb"
+SRC_URI[sha256sum] = "7a7262fd930bd3e36c50b9a64897aec3fafff3dfdeec9623ae22b40e93f99bb8"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.34.1


