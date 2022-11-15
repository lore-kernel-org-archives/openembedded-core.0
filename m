Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC141C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 16:51:47 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.8038.1668531104429304215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 08:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F8sOVSoQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id b185so14612847pfb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 08:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pam9M5DzOClYcbiIq6YZtZeTKrY3RMP7bl0WtxwY70I=;
        b=F8sOVSoQO7xKVeUVticcOUqyoyYyHCInuNFq5VKX36zepL5yBDJHUBjE8Pnms0/e2h
         ikzlvwkn+7QCaZghKH89RmO5mhFkahiPJReJ3ITNSds1qBaC0vLCcPw1u21LTqTmQJvb
         wLt0TZ2ZLpTCJKtb1AFczlVGsCAn5UGDlRkvAx9VCKbJwIfTksx7IYF3lqxFX7KJ7q2r
         EnRmlWYC4ErULZT8CvLdV49JzWFxGw4Daw7wpjGEQQH3mTc7msGgbkFc0qIxeRTi2WBX
         49/EVfDCzcrvxHwxl9PxDuwCsoDbBFTnhn2dzLvxCPPohF2sBxKQNfgPDOiG5nVMAnDs
         IDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pam9M5DzOClYcbiIq6YZtZeTKrY3RMP7bl0WtxwY70I=;
        b=Z/ztMK6u9QrQo+Ka1zT+lC6ZLjMSQWOAuJqnsCkvHV2Zkx7iLdAxcfuNSMSVbhUAxS
         w0W9G14C0D0RLpyFdoFTjlte+zrSnjA84TXbMMOsEGkf7/Myq5haox2kQ8Kc9ofcyGvW
         TW340kYInAhamloViq5wkVYNrPt4cgDEqDS+Q7nBSsQ9LmAopMCqNymAP4aPgY9Fy4OD
         zHphiz6yXQttnM+CbrOEZXGsA0nSBybfwLiSvrGfHxXrLxbj5a+NUmZAxpDQZLyJXlZk
         Y58YXIb4DPPpcj2JvR5SKny3go2WTF1Q7FYhxQfBrTIf8ECUZfOd8sY8LeN/FZcDoewU
         68Og==
X-Gm-Message-State: ANoB5pllniWTqlGPLME5TyeOjhUEbkalXLnixfAMV6jBvIURR0Uol5OL
	MKR7Sed0XzemML3IRYSrvkd9NMqozWD+DQ==
X-Google-Smtp-Source: AA0mqf7M7Lpi5o70/E+m7RWjPrKCZj/ZZDTnQABzkePszUyKdkcHF3o+Hz6pySKAypiDsxUyBeNB7A==
X-Received: by 2002:aa7:8649:0:b0:53e:beae:5a9d with SMTP id a9-20020aa78649000000b0053ebeae5a9dmr19160429pfo.74.1668531103394;
        Tue, 15 Nov 2022 08:51:43 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:3432:b2f1:7e8f:a50a])
        by smtp.gmail.com with ESMTPSA id b5-20020a170903228500b00176ba091cd3sm10176062plh.196.2022.11.15.08.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 08:51:42 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-hypothesis: upgrade 6.56.4 -> 6.57.1
Date: Tue, 15 Nov 2022 08:51:34 -0800
Message-Id: <20221115165134.2827042-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173352

6.57.1 - 2022-11-14
This patch updates some internal type annotations and fixes a formatting bug
in the explain phase reporting.

6.57.0 - 2022-11-14
Hypothesis now raises an error if you passed a strategy as the alphabet=
argument to text(), and it generated something which was not a length-one
string. This has never been supported, we’re just adding explicit validation
to catch cases like this StackOverflow question.

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-57-1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-hypothesis_6.56.4.bb => python3-hypothesis_6.57.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.56.4.bb => python3-hypothesis_6.57.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.56.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.56.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb
index 040ecaff3eb..064d7014d54 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.56.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "313bc1c0f377ec6c98815d3237a69add7558eadee4effe4ed613d0ba36513a52"
+SRC_URI[sha256sum] = "1d8ed5136f368e343f39172b06f68aa7fd1312cf643c332ab18a75d56789fa90"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


