Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3CFC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 16:35:15 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.15.1700238910241117663
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 08:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b7zHTWeT;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ce656b9780so2307835ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 08:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700238909; x=1700843709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1J3+bbEz+AkQPlPo5v9CtYamxNFzIY21iEY0zczH8s4=;
        b=b7zHTWeTZTwWX/d4Ci/sk1eLwSMyGt+Yfu9/GoOwnm+MzTIE0K441idKgPClNOSlVU
         O4LLFCchaXvIBawUoWQN1Mxfg4y+reAigXTFwHtVrXXgmZqIR5y/pDTy9xsvmxLARVhv
         5C1z0tJppl6/H7A+UoWy5Xh2102yB/2KKAsZ2d2Ev5KXpD3sf5elfZOSCSeEzYcCBgw4
         rNyohNg8cwgVl1q9jF6AhADtwSqyL3rcEZL8pf18UVb0J0VUzLbfaqQwE8GCAiIvtWGq
         zvM9JF3xV338pEchAbM/K1SHkk32SCSaATa+1eTftI+au020xicvOLheULTfb6E9b0x9
         jBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700238909; x=1700843709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J3+bbEz+AkQPlPo5v9CtYamxNFzIY21iEY0zczH8s4=;
        b=cL8f6e+zE7VTLjXsOqaUX2ELz4NQkFyhQ9x1otp12vSQEKt8UTLpTp2B7hqjRM07bp
         kXlRqK2NcEmj8i73GEd2DxQG0xpNItQIR5lPMbOOlBiBhOMJZpUJPefnKxtGqlltiGpH
         5xkEKEKf3REftZHcbFYYzixVuPQAr6Z/yXkU8YeAlbmX0g9AgvCGiNOfOQx0DkDnoPte
         SyP7wMBXOz76I0FKkcbtoofA01a5n6PVwcUmuxjL1sB/G8dAW3KBrcEkGetSV0AuWCM5
         2deucRmDj/dgRqWcZAIbTkxXKI/1bxR/MYQ9FfQmLpT96yYLp+Nz98PGzk799uaBT06d
         oUvg==
X-Gm-Message-State: AOJu0Ywfjhfmth4yuJrR7f4aFghgITlpGAGw+yuiJYJErMBzo4sKZPEe
	WGqQ+FKPZVuziP1PQaxys5HJv2caTNCQSQ==
X-Google-Smtp-Source: AGHT+IGL7YitnltKe2EpgbJRGCNufeZFhklym7ZmiyVRk49V7dB8cQle88Nxxw5ofPjoTVQnUXTtoA==
X-Received: by 2002:a17:903:228f:b0:1cc:3829:8355 with SMTP id b15-20020a170903228f00b001cc38298355mr135176plh.12.1700238909256;
        Fri, 17 Nov 2023 08:35:09 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:3fa:1e17:52a9:6eff])
        by smtp.gmail.com with ESMTPSA id iz19-20020a170902ef9300b001cc32261bdcsm1583439plb.248.2023.11.17.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 08:35:08 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-hypothesis: upgrade 6.88.3 -> 6.89.0
Date: Fri, 17 Nov 2023 08:32:05 -0800
Message-Id: <20231117163204.67243-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 16:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190854

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-89-0
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-88-4

6.89.0 - 2023-11-16
This release teaches from_type() to handle constraints implied by the
annotated-types package - as used by e.g. Pydantic. This is usually
efficient, but falls back to filtering in a few remaining cases.

Thanks to Viicos for pull request #3780!

6.88.4 - 2023-11-13
This patch adds a warning when @st.composite wraps a function annotated
as returning a SearchStrategy, since this is usually an error (issue #3786).
The function should return a value, and the decorator will convert it to a
function which returns a strategy.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

Alexandre,
This is on top of the python3-hypothesis 6.88.1->6.88.3 upgrade in abelloni/master-next

All ptests pass on qemux86-64

 ...ython3-hypothesis_6.88.3.bb => python3-hypothesis_6.89.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.88.3.bb => python3-hypothesis_6.89.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.88.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.89.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.88.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.89.0.bb
index ef1be95d6ab..035809c3947 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.88.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.89.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "5cfda253e34726c98ab04b9595fca15677ee9f4f6055146aea25a6278d71f6f1"
+SRC_URI[sha256sum] = "9168bb12cd29001067e66b5f25f1bbdeff08b80c29c3909e19fc8205d8b9aeed"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


