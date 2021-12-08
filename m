Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAEBC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.3097.1639000810103739799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N5lHuuQu;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso2754282wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=br7gZJmtSo3OhmQAk5PT6gzucBOp975hhjdFGXSviFE=;
        b=N5lHuuQub9UmhUach+ZVhPwKkByfn03mF38DoAWZOU1NTWD9JppSpd2XfcidIIQE4a
         Lxr3vaVgWYCLqdpW6/BLt7zXw9RzXZRG/HnH9kLYzW1Z4Ra6l8kMDWjcvn6qhj7dvSCV
         JGYuuHWXHK8rcPyFkstn9vflfm4mDrZEmaLtyJxapAOFgEO5pRkHuA4NJjt5qtLCU+YT
         J2sGjsuIW1Gwy7iB6YzV6CWk/vQBlesyln6g3o5yOXeHhVN3/YyT2lZ2iLrX5EtuvIOg
         3l/1rGG+bPwFCs70NIRVKL8bLIT3MkR32snhjeC9YPJ1919QVWz0OQ8edJG16ZEH3HyU
         brLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=br7gZJmtSo3OhmQAk5PT6gzucBOp975hhjdFGXSviFE=;
        b=Fw7CODCVvIU3n8kfIYFEPkvi6PpusuGHsUV3fGoMT8jFAqtnNwYsgiZj+m5INIu3vD
         UsSOPeBSGw+oaeXr2LMHkzn2CutuMDutBQm8inhUtPBE5n5IHLxLnS15M6vdqeyF2+PE
         FTREat5pg3PfcQZvhhSP0OKc1YSaiva/MAQVVBPDs6dRs8Td+yukSABh7TKsY0syb8tE
         +GvF0HpA8wXojp2G0scvhKDKYJTntnRWiaktAZ/AGNHrzq7LUtUKITwPEPoafzPkfLkQ
         sjgE/26BQGtk0iJt8qj5JmKmI8ezPLqZSk9aooFQ0QW0YC6p27V39D/dgQ0clyXEL0FX
         kWfQ==
X-Gm-Message-State: AOAM533/WiqgPKlucwUeJuzoK45aVhqutO29lq05hJEpEJ3PCA1K2x/H
	v3K5NG7PTjzdchBpOd8yjWUA/YV2kqdcvQ==
X-Google-Smtp-Source: 
 ABdhPJxfNBGrsgVsEcons9YwV3W2uS+5pq7I18XvIlL/DMLR7EWH04mdCohTnRZpikHdB2MKqQGFKw==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr1704991wmj.166.1639000808703;
        Wed, 08 Dec 2021 14:00:08 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/29] python3-setuptools: upgrade 59.2.0 -> 59.4.0
Date: Wed,  8 Dec 2021 22:59:35 +0100
Message-Id: <20211208215947.1979470-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159383

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_59.2.0.bb => python3-setuptools_59.4.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_59.2.0.bb => python3-setuptools_59.4.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 4958e8e63d..c3ced74918 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 1f578f993aae157f42923624042fafe4b01add10 Mon Sep 17 00:00:00 2001
+From 61ebf2a12a308a2d99023f51c9da8b1991bdc164 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.4.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_59.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_59.4.0.bb
index 704f58abd3..5ae076a165 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.4.0.bb
@@ -13,7 +13,7 @@ SRC_URI += "\
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
 "
 
-SRC_URI[sha256sum] = "157d21de9d055ab9e8ea3186d91e7f4f865e11f42deafa952d90842671fc2576"
+SRC_URI[sha256sum] = "b4c634615a0cf5b02cf83c7bedffc8da0ca439f00e79452699454da6fbd4153d"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.20.1


