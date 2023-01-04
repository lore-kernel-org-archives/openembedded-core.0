Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD8AC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:01 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9354.1672830355694061789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UWIQpPWG;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id j17so27209889wrr.7
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1NYqNWP8+LTPVsM9PGfGAYSpz3NKKJIn77ei3cSAmw=;
        b=UWIQpPWGt3hUoHOEi525EfS1L++SojBKyu1WqDRM7JhFEMlR2zHbOSe11g/2U3X27t
         0lPM0CwGZi/oDHvQXZSbq+wLAr7YloRThj8+5w9eM8bh3mDnorDJ1UFK5r+Ts19NYa7i
         CODviE38w5uAkxY8NZax04zWtojF4ATRNnYxGZtTzi6FigdLNNfagXSUylcScThVKJst
         +luBHPsqIaGCyXtWOwl+uu8dTdB9M2FwFUPd2OeFTiJQ0fatP+YV7zvPsa873Tl/JOIl
         mRcu9i2vCzNrxrVn9gEaRq7lrC/UaI+3geBtrFPfiY5inw5SVLnnjk8fyZ2mEJyML+/t
         CShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1NYqNWP8+LTPVsM9PGfGAYSpz3NKKJIn77ei3cSAmw=;
        b=R2WDtvz5XGFZOkXgf4D8UCO3VzWSauAWX7CwOUWvuw1/en4+TYqZNfkW1pFnqPnjWY
         LkU4AEbFHNikhFIpKnFeFI+yFixyIa9VpIhjMaYRFPP1/LUXYxDxXOwpUFqr7seHbYwO
         bjW/Yery8T1r/VHyufvjqFQnkkWxe93jIg94KiLPjWig3TDcxhuX1XRIPwUCfj0PJQlr
         dc812ZN6gkgnx4yJTIxhe8uVIYchEKLfjm4yC5M6eja2pgCQIxda/JCLDdt2aBs/clmF
         4xFOGByeetDWd+Xzg7CIsPZ+3snLEdSOcd0nbyaYhBUHYLzEmj0pWV/SM6mwn1kurlpJ
         utfw==
X-Gm-Message-State: AFqh2krZoJUom+7VQW9bNScxX7Loemr8dG2dzQEjQKzVSgRqZ6SwdJX+
	SOTtjFqd3sNEVYkJDqfIeFTAU4Q+rj0=
X-Google-Smtp-Source: AMrXdXsS2DNjAGSUBMgwaCEZ5OfIfSsmFI2akLc9zbGQl5c5x0dPc4nESPAu3/NNsG8ZOLSKv/40Bg==
X-Received: by 2002:a5d:4705:0:b0:2a1:6ad2:3cac with SMTP id y5-20020a5d4705000000b002a16ad23cacmr2618385wrq.17.1672830354130;
        Wed, 04 Jan 2023 03:05:54 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:05:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/77] jquery: upgrade 3.6.2 -> 3.6.3
Date: Wed,  4 Jan 2023 12:04:33 +0100
Message-Id: <20230104110548.2537259-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175387

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../jquery/{jquery_3.6.2.bb => jquery_3.6.3.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/jquery/{jquery_3.6.2.bb => jquery_3.6.3.bb} (81%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.6.2.bb b/meta/recipes-devtools/jquery/jquery_3.6.3.bb
similarity index 81%
rename from meta/recipes-devtools/jquery/jquery_3.6.2.bb
rename to meta/recipes-devtools/jquery/jquery_3.6.3.bb
index fe6c57d206..93f87f730d 100644
--- a/meta/recipes-devtools/jquery/jquery_3.6.2.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.6.3.bb
@@ -13,9 +13,9 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
     "
 
-SRC_URI[js.sha256sum] = "a649f609466685e49ecacb18c37bcca75fb1cae6f89be7be40ae2c42c92fba8e"
-SRC_URI[min.sha256sum] = "da4ad864a87ffcf71c851b5df87f95cb242867f7b711cae4c6133cc9cc0048f0"
-SRC_URI[map.sha256sum] = "f46902fc1b81c286e51f4eb4812382ee9eedba0e9fc855e4dc3af59e0c57f404"
+SRC_URI[js.sha256sum] = "9d02ee01919145c20b03ee9d3013af7118793dedf5d2c0696a773af90066c953"
+SRC_URI[min.sha256sum] = "a6f3f0faea4b3d48e03176341bef0ed3151ffbf226d4c6635f1c6039c0500575"
+SRC_URI[map.sha256sum] = "156b740931ade6c1a98d99713eeb186f93847ffc56057e973becab4d037ed53a"
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
-- 
2.30.2


