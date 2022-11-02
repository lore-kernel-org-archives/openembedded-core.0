Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220DCC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:19:02 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.2239.1667359133695696290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lURwJg/K;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id i3so15225150pfc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSzoMK6dpvFQI1Wr7/BHZYqNPyuAlEYsSEIjPYhBx2M=;
        b=lURwJg/Kz5u8/q3AqacMjqpo8AF5tKqxkd6kQpUhp+hogxv7YvW6I0MCbhMbULMkdH
         SANapMj9VUaPvnmHw1LiiLtCHFOhp3LoLuADJhEKA5/iLqM8QNc8TCJLAbtoS5MhRPo9
         t6WmJZ0+EnvpfzFXJdXz+5yLqWRolaDU0pHIVceYx+wcSDEy8WHNQ+QdtRY5DBghQNc+
         BYBeNgD0YqtcN6Q643VJp5eA7huN8C4KwQyw8LHuE3Z5N9EKek81iW6mxN++gOiGl2XK
         acewFVEQBhCIgaRzykGUZtlb4fKR5nIGhgY6AVx9qQiGCJ35F6ss4yyvST+hZtOODKw9
         W4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSzoMK6dpvFQI1Wr7/BHZYqNPyuAlEYsSEIjPYhBx2M=;
        b=P7LDqjnMLOgoDW0VVkkJWoyK/zc8Wk8Rbo6rru7fJgDoh2bnEYPueW+10UHqm8AEum
         PJKveEj5wtZcoKY5kVLIbdkUy4JlTPBeUmR/IHkOCkEp0EbulWQ8MWjJBEOvTrTc1+c2
         uJylnCvFiquzaq1zNwgWr4gKTsm09GVP6vP0OMfRBemg6aTQaFrOZl+VFw7wTzQ//mi/
         Cv2L9RalgaPbvHCaun0beYEuUwFEJcUqPEAN4MvkFCjZLd2wXLSn0Vue8bFjt5LHRFr7
         IFH23nrzWGsf5r4MzjDUp8lWYCz3S+2IQkVgBrFcQqJip0qGn9F76rnrS58JINFkJobU
         2kvQ==
X-Gm-Message-State: ACrzQf33y3GEPa1sxETwfD4hKWB6Z5HB0QeGg8qP7P8P62ueDJYW6SAT
	2CgYZYFA8o8Jcd1VLQTEUXtk4DcSCoM7SQ==
X-Google-Smtp-Source: AMsMyM4Xmzc3Np8RoyfvcMvFTU9trgor3VPoreWqFoTN9eQqHkpF0pHHocyv74odn0S3zlic5MV8oA==
X-Received: by 2002:a63:4a43:0:b0:46f:be5f:ac6d with SMTP id j3-20020a634a43000000b0046fbe5fac6dmr11640709pgl.540.1667359132724;
        Tue, 01 Nov 2022 20:18:52 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a16d600b002139459e121sm269644pje.27.2022.11.01.20.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:18:52 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 06/11] python3-hypothesis: upgrade 6.56.1 -> 6.56.4
Date: Tue,  1 Nov 2022 20:18:25 -0700
Message-Id: <20221102031830.3606777-6-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102031830.3606777-1-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172568

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-56-4

6.56.4 - 2022-10-28

* This patch updates some docs, and depends on exceptiongroup 1.0.0 final
  to avoid a bug in the previous version.

6.56.3 - 2022-10-17

* This patch teaches text() to rewrite a few more filter predicates (issue
  #3134). You’re unlikely to notice any change.

6.56.2 - 2022-10-10

* This patch updates our vendored list of top-level domains, which is used
  by the provisional domains() strategy, and fixes some incorrect examples
  in the docs for mutually_broadcastable_shapes().

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-hypothesis_6.56.1.bb => python3-hypothesis_6.56.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.56.1.bb => python3-hypothesis_6.56.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.56.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.56.4.bb
index c16daabeefa..040ecaff3eb 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.56.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.56.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "cefdaf6143170f1aa28adf4816d12547ab60f93c143f7d5205507d9e4804fccd"
+SRC_URI[sha256sum] = "313bc1c0f377ec6c98815d3237a69add7558eadee4effe4ed613d0ba36513a52"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


