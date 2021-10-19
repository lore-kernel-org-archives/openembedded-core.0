Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561F3C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.11513.1634657688791679806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qbTZWbFh;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so3396957wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QH+y27JMbdjWpa878I3vqJ6D4qATov4dYJUMJ9lqdcA=;
        b=qbTZWbFhDUYEbcA1rOpMvXop/YMjxACFK9ZZgnCPvVr9Z4U1E+yIAXiKY0OZvAEK+p
         a8Vo5wDbXKNgUNMejvXpybeda/rmZAvr70Rw29g9fFJq7rkwYgF9Dt8Sg9PBCL66HeMf
         ZElwS+JVw4uTZQFb5JzhE/xYuBH2w4/QE7tXKJWzckhcUUoXkEAhKrr1f901R9Xiftkg
         QfT8+UiSYi1UyLpF/+32Q96yuFYkM77+Qtush3rvES2C69W+w2/Kv2TVynA5g222NkRN
         tz/kgc2hiup+0x95+ufSwVseiQGEwUzA1hT2iQw2tU/KNZrSXtvV8sgChRa+Io0iafZW
         No9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QH+y27JMbdjWpa878I3vqJ6D4qATov4dYJUMJ9lqdcA=;
        b=UCbkqO2Hx/Y/bwK51cyvcJalma8PXrdbFTTkFszW3NXvGH4ARquQHjU5RahuD0rX9h
         CEJzO6z/NcGP0l23uNi4NAhm4HsgNm8/QrKfv2M2ROKTiuHo/JO52cnzqlDKIUXjMgrv
         +7KFs8NG4rAuVneMgf6K/wxaYhWhX9wXTgHJ83KCEp2c9P0/BJawejn1vEWVE6rExt6s
         WGLiovywEK7DxPS2VJO90LRJe5sFzMx9RWcFMWFCqwQh8AiOABVoX0yrkHH6x14BV5lJ
         XOmhGekahNxmPKwSDOs51pomT5yMpr7vqEGe3ECxiHQrLCe8bxfHzFUgftf6dT1knqxP
         4jUg==
X-Gm-Message-State: AOAM530IXOGBmoQFQhSFIROwP99IbaXX69Egi9TS7YP+G1sAfZ8PL4xQ
	sNYAIYBbyyS55nppRdrRqwtxCiUDg94=
X-Google-Smtp-Source: 
 ABdhPJybVPED9ZuukkhevyaDOSjSkh4pJiLQhLmDZfVrwTgui3xj7iEzY691PMB8E4n65vf4i0smmQ==
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr7153043wmf.61.1634657687432;
        Tue, 19 Oct 2021 08:34:47 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/65] librepo: upgrade 1.14.1 -> 1.14.2
Date: Tue, 19 Oct 2021 17:33:47 +0200
Message-Id: <20211019153419.3319802-33-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157152

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.14.1.bb => librepo_1.14.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.1.bb => librepo_1.14.2.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.14.1.bb b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.14.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.14.2.bb
index 8676452587..e7f8c08e03 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "c5fe6b85b47f2e4f7a37cff3f3214205d1b54db5"
+SRCREV = "3b9a8d17188ba602d139f79b6e61305030f21109"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


