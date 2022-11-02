Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF00C4167B
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:19:02 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.2243.1667359137794589082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SaI5GxbS;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id b29so15216056pfp.13
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19kvxFicGVs4D2j7gXQNn0rvxFXztz6gvinoDiJAxUI=;
        b=SaI5GxbSuWZ5dGoYOAcM96aVeG88TlPRZXxrvyzJq6YG0Aab5sV1+8ffdEZsZ1Xa2V
         65LNarHeJ5Vd4BSBZM+z6Dttids81o0gQpJ3p8tnXO+w4r1ZjCCzG6T8hQImzkkY0BVw
         Ie3Ds0rwnnBU8bv1sgiJOYFGN1dJ3+ijwFBnJQFQeKnBAIK2lcpgYU0PwPn3wYdDrue3
         cwQKiDnTawhJR8zTy6LDv9ZMMLTkvgJnkHk0SpacyVNnKOFcb54U815zYEXlEXgRW7qw
         ZKsCECoIoG/g8vmgTQn7DqrjSLNbSicxUkCBLga3em6T8Bk7knCV7bqGT0K7b7K2zr59
         AbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19kvxFicGVs4D2j7gXQNn0rvxFXztz6gvinoDiJAxUI=;
        b=Skg42ffmdtLbMlGWR2QFMKAA9a6Vb9rFXj1wZQxh2GVwSvGFPlwzBgnmY1RxSIdWfL
         eRv+aSlrF5WurozkDv5s/uwVM6PVGeE+J/DnHIcT0ZObNmJxwtEfmjkIXYbYNQudX4AN
         n9pmm8YlgFj5f+OoMPyru/aBwWARTN2LTprxgx/VXrwoloo429Jq6uuEAQAddMgwToNK
         io5zOxi3PVg6PTlw00q2/74SQ8ziLJ+DiA5Zx5E8FSe5zim2w1kWP95f2ojv20CY+PMo
         vw49rRaW90kkqBLtZ3SXm9bKEzWtFR3Bz7WCMRMrzXQ4zdqHWlxSN/7dW0cAIU7olGnM
         cGCg==
X-Gm-Message-State: ACrzQf3YF66Je1kmVFqzCaLqrPW6qX2IQsgAh6/GgNYNoJnwqvMyeJCz
	KWod13pGljQZHCOYCsae5Hk5RR3XQ8lbRw==
X-Google-Smtp-Source: AMsMyM4bf7a1QaLa6t74G0TY8WrqEfurTlAmO0l1beniDiYdM371N11WoDppR0aFMJZBHvgdJX/hQw==
X-Received: by 2002:a05:6a00:8c8:b0:52c:887d:fa25 with SMTP id s8-20020a056a0008c800b0052c887dfa25mr22741942pfu.86.1667359136678;
        Tue, 01 Nov 2022 20:18:56 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a16d600b002139459e121sm269644pje.27.2022.11.01.20.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:18:56 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 08/11] python3-pytz: upgrade 2022.4 -> 2022.6
Date: Tue,  1 Nov 2022 20:18:27 -0700
Message-Id: <20221102031830.3606777-8-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102031830.3606777-1-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172570

https://launchpad.net/pytz/+announcement/30743

pytz 2022.6, containing the 2022f IANA database, has been released.
There are no code changes.

https://launchpad.net/pytz/+announcement/30736

pytz 2022.5 has been released containing the IANA 2022e database
release. There are no code changes.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pytz_2022.4.bb => python3-pytz_2022.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2022.4.bb => python3-pytz_2022.6.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2022.4.bb b/meta/recipes-devtools/python/python3-pytz_2022.6.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pytz_2022.4.bb
rename to meta/recipes-devtools/python/python3-pytz_2022.6.bb
index 330314f1bd7..9631f592883 100644
--- a/meta/recipes-devtools/python/python3-pytz_2022.4.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2022.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "48ce799d83b6f8aab2020e369b627446696619e79645419610b9facd909b3174"
+SRC_URI[sha256sum] = "e89512406b793ca39f5971bc999cc538ce125c0e51c27941bef4568b460095e2"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
-- 
2.34.1


