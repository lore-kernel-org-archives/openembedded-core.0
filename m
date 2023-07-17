Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89531C0015E
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 08:40:45 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.3910.1689583239229478894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 01:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PpPkqCAW;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-666eef03ebdso2673057b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689583238; x=1692175238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TS7N/QCw5nqvpx/xuoq7SMYhwTdFGSG8n/X/NPh66Y=;
        b=PpPkqCAWxoG2or1s+QcCX+/klA70WrE5IrnpKP1Ze2de13D3gjjjEtqymQj6UGum24
         Ew7gISFZ2bekJm3NY71L0VPzzb+282lExA2HkjzffSknrA+EEixs+E9UwtlIgmwAxc8l
         f49k30RUFlKHW08GxrlzHotBNVZN8R4jj+THwb7vzLy6vcgW7DxEtH2RXFXasoqe1vps
         SjwIaoEkESu0yKwFLvx7NEvE4NYsLspbpvW6DSbh4emOakbqwukZqorZvvV+32asK44u
         K+Y6CI3Coe9tCXvB49RzZljiEMYPxdvn+JW4rJrazxMVMNN4lXYE7AZfGOi+ZP0NgSMs
         piZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689583238; x=1692175238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TS7N/QCw5nqvpx/xuoq7SMYhwTdFGSG8n/X/NPh66Y=;
        b=bfsNIASD8CBUW9p4m7fePtfaP109CLk8rgrR+hMPZzmvzaygWcOnETYxZzHT7rHZkm
         56Bpui4WCvzTjFbVWlAjtt2S/UboG0Bde6jPtFCJgQQlii7jpNdXeRYigtnWi0AkCVzQ
         UwKLkhA6HcwT/PWyTgjINMuJ/KR4MUBwWUdfQx6PXrLjFPqV9QcclG7Hv1fAdoOn0Cy3
         ccmyHTOm5b5l6JW/ne46nUrLPpAupRJQplGdojItKVCPotlTa6E8KXO1/K4RZbm+pk5q
         OAlJQz0HsE6MyF2vi+Df7nX/y9eypza4yZuA5syOO3HXdsLqhpUFiK2Q6KrIlpvtDZuw
         NgnQ==
X-Gm-Message-State: ABy/qLbFODRmX0in3LospY+f4b+SMqYb92epSMfFSHZrq7nBGmaB0nUE
	2+j4dKAB32AiW2h/sdu7jgL75GwSrR1O8hYT
X-Google-Smtp-Source: APBJJlG/u5C9wxb7aYshjSwC2kOlUJfZjUp7ZFPxiOmatciMETGGH4qivkham92fh+MRw5+ew8Hrcg==
X-Received: by 2002:a05:6a20:9146:b0:134:1b21:b2e9 with SMTP id x6-20020a056a20914600b001341b21b2e9mr7418630pzc.21.1689583238160;
        Mon, 17 Jul 2023 01:40:38 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:148a:d9eb:c4a2:7201])
        by smtp.gmail.com with ESMTPSA id j25-20020aa783d9000000b00678cb336f3csm11836295pfn.142.2023.07.17.01.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 01:40:37 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-hypothesis: upgrade 6.80.0 -> 6.81.2
Date: Mon, 17 Jul 2023 01:40:26 -0700
Message-Id: <20230717084026.1087836-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 08:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184436

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-81-2
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-81-1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-hypothesis_6.80.0.bb => python3-hypothesis_6.81.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.80.0.bb => python3-hypothesis_6.81.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.81.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.81.2.bb
index 82f855d4b7..93bf638759 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.81.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "75d74da36fd3837b5b3fe15211dabc7389e78d882bf2c91bab2184ccf91fe64c"
+SRC_URI[sha256sum] = "e35165a73064370d30d476d7218f600d2bf861ff218192c9e994cb36aa190ae7"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


