Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E43C71128
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6325.1650022683347432821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ld+pLp+9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id u3so10388706wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+1qavZj3IFa7xngPlsrHipUkLwFYqksKZp7RPXC+yhM=;
        b=Ld+pLp+9I6zslYb24ixwKFubL2/xRV2GPM670tDniINAwMwSXYvY9fS0otYSWRPED1
         6uXY3ccrSvD6/MBKs1W5h0MknrRs4wbKyrkVEal5iKY5RlbSePZltoeiOlHRleQqVPMh
         6baxljnU0zfv9kxvaZw8kcz3OYaHl6kmt06uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+1qavZj3IFa7xngPlsrHipUkLwFYqksKZp7RPXC+yhM=;
        b=zuo1xtJM3EguJlU3NoOBMMy6Hf0gNuc+ToK5asYejGr6E3jlRZyok+fo1RpcNE9WQT
         NKC8WldhxW3KyiFVAb3peW9JRCTv5Lg2HzdvOvx3zsbELCwduW36/h6TtITZLDtP+e9u
         MQnKEezX6r0q9tBgtwSoqzNOm5Fu0KVq1qeoMv//h+1STuIIg8WD8j9RbPcoSwCno951
         ya3K+X7jM3OqdeSRtksg5rkB5ZapOChzSLRQHVE+6pQNTPXnL1RjTb6LlucZGChK2vON
         T343GZ5mJhMKhB8AIJDTgYVbSQl/MvmI11jpaqrRFkCME8vglmsegnQZ/Qz8MzHlSs/B
         NeVA==
X-Gm-Message-State: AOAM531l6ARd7N3iXL4fTLvwwUhL2NEBNOTyJ0gJJlWL4HU5x9B0KBEA
	kfKWlkdind5IQZV0i8u858PxTcaBx+o74Q==
X-Google-Smtp-Source: 
 ABdhPJxXCaPRKgURGRoJc/cepvP0Csgko37X0sAG7fLXnxshsi/JeuiXqMPw5WVeGw9pkrSWsHoAIQ==
X-Received: by 2002:adf:f2cb:0:b0:20a:77c2:3958 with SMTP id
 d11-20020adff2cb000000b0020a77c23958mr3717648wrp.589.1650022681322;
        Fri, 15 Apr 2022 04:38:01 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:11b3:ac79:b941:ad48])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a0560001acd00b002078e242847sm3776574wry.97.2022.04.15.04.38.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 04:38:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] libxshmfence: Correct LICENSE to HPND
Date: Fri, 15 Apr 2022 12:37:56 +0100
Message-Id: <20220415113758.2290861-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220415113758.2290861-1-richard.purdie@linuxfoundation.org>
References: <20220415113758.2290861-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164424

The license in this code is listed as MIT and whilst it is compatible with and
usable as MIT, it actually looks like HPND. Clarify the license field accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb | 2 +-
 meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index 062d6a7a058..ad9f475d151 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Test recipe for recipeutils.patch_recipe()"
 
 require recipeutils-test.inc
 
-LICENSE = "Proprietary"
+LICENSE = "HPND"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
 DEPENDS += "zlib"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index f465266672d..b0b6cb6b567 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -6,7 +6,7 @@ using file descriptor passing."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT"
+LICENSE = "HPND"
 LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
 
 DEPENDS += "virtual/libx11"
-- 
2.32.0


