Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F17C48BDF
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.7187.1649904757199658047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DMgQbGhJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so4412989pja.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sXH/Rh4+GVlnziYvxFzW09pK07OrTgmi4lDx71PIJ28=;
        b=DMgQbGhJzaW4URnu+XcPWVe3eqB7PYGqRqqv5JiMm6rUPT6djZt6k/xnTbWL+FNjPZ
         l++st0b+TauHpChHDb8GZ4JJ0tPeHFysaM6iSK1MbSW6xoUPkBs02lV1iQbcmKtYF6tK
         cnCNxnLCN0KHUSIw9qM/MCBedvU5Rj+XXGnEP75+wuHvgrozs/GiqyzWj2xktE8JGpFE
         JRdLYqj0EitEhotW6SJY6hzVcUBTKi0AU2KKEzYx879cOF7lwxFNbX3yyvGuic7aovOb
         Bkt4BmDymHESQT6HUr1O5ayT75Kr37R7vtak1W5f3p+E6xTUQmSfB/mgATDuOjxDH1CT
         s3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sXH/Rh4+GVlnziYvxFzW09pK07OrTgmi4lDx71PIJ28=;
        b=z3wCACvAEV5l9v2HNKvxYlX7luddP61wXGJtiBBddZfjfESDPqHL6EE/QXjDKrEBWb
         AqMfmKUmgmRF3GbacK67qQoA4VjHIXsJIY8CpRblcX5bt/dzBTaLvZlIKmE1Rlmzcb+3
         enkFz6I7TZ1OdoHa67eBDWnBW0lW8qbtZhyQ/bhj0PQJ65qSVYBrtpnhhHZc7BHmk3xA
         VhxAE5K66yn8vitfio0q1Cv3yFOherIYY3DdNX9ju8GGY6BuyzaWfKZPtTK2eU1G7naz
         //MPFauVMpxVRSI2dS42yqVVjh4nRAepWTnhU0NlJ/ebFzYAK9wfh/P7I733CjdizNjR
         HD4g==
X-Gm-Message-State: AOAM533KvUcQin+PAe4kC8UkQmnitkH20/nWnexLdsUVaRWyGM8vDFTM
	0bhgm4JRk0ajvtBSZzjg58L/7AH5JaE1lA==
X-Google-Smtp-Source: 
 ABdhPJyNu5HYj4d4f/gUsRd993VerSOnklgxZklpw6dJgSg6GaOZ9PSTB/F/qd5nXVX9j0BOlG3/6g==
X-Received: by 2002:a17:90b:4a46:b0:1c7:3b81:fc6 with SMTP id
 lb6-20020a17090b4a4600b001c73b810fc6mr1282261pjb.243.1649904756533;
        Wed, 13 Apr 2022 19:52:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4307])
        by smtp.gmail.com with ESMTPSA id
 81-20020a621754000000b005082073f62dsm453735pfx.12.2022.04.13.19.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 19:52:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/6] harfbuzz: Upgrade to 4.2.0
Date: Wed, 13 Apr 2022 19:52:27 -0700
Message-Id: <20220414025230.1166825-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220414025230.1166825-1-raj.khem@gmail.com>
References: <20220414025230.1166825-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164380

Changes in this release [1] [2]

[1] https://github.com/harfbuzz/harfbuzz/releases/tag/4.1.0
[2] https://github.com/harfbuzz/harfbuzz/releases/tag/4.2.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../harfbuzz/{harfbuzz_4.0.1.bb => harfbuzz_4.2.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_4.0.1.bb => harfbuzz_4.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb
index bf77a5e56c5..44d42e6904b 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
+SRC_URI[sha256sum] = "f2200f177768bdc21445aa09703326f3bbe8114ac083d081fe1a79d305c7ae73"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.35.2


