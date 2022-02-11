Return-Path: <purushottamchoudhary29@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D71EC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 12:48:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.6765.1644583733655595059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 04:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IAUxQ9bS;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id u12so4578461plf.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 04:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=pqq0sMj7VbZcjZuwpJCLV7snXxpM6y5GIO3znCaRerY=;
        b=IAUxQ9bSVrO6Yz2EHIlm6GEg5fP4fHuUwvIViQwy+8MH32sthPqJ7Wjj7CGQYm8vog
         yDQxPB4um5koYxtiUxqEX1T4XUD9t8UYUzfvGPqvFwvWW2pWG4v+qsNupg/wSCmpF+J6
         FP8P/U69cdqxxjNIIV+5ZvElHRLIYZcDv8nXvRt1SIK36OS8xpN/bX0cPsOo5cesKBVA
         RY9qRBzTD4uBNiJ8ja0m5tnJbFpDXs9vQC/udpA5r1H2rnlOA+AWxKmv0XVLX6BEUT66
         18k0/UWm6DbrF11Cv9UxfStRfE2vg5w4HB3NwL0v9KkIzxbXYrULp3FOC3RAwBObUFzq
         MMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pqq0sMj7VbZcjZuwpJCLV7snXxpM6y5GIO3znCaRerY=;
        b=SwCE3AstOCk4MvEtTWV4WlFzremAh/ikH1oYtBv+DHMp9Ht7OmFIevmDbw3ieQf971
         RVIm1CzgYywCOgRHCnhyE8Yv5wIJ7MXDPO4jCgFemUfbeKZXhWFhGanAXPULApAdWfiP
         +clCZ/E6zguZ07MU5H9LDd0wFMu69uLyiBuFKvhTCALFMLGd1h58MTa0vKmFp68pY+TC
         kyFet+/huXr/t5t6LJ8WPw+uNYV3kgLHZSZzIQXiddyh4AgliesPLI34AzCLPgtIeaXt
         JrUi4txb7jx/Ju9BercSSXu1MLdYYO8rAw0Pv+WO4T9R5E4+73g8EQ1QHXNC5h67EnT0
         nFxg==
X-Gm-Message-State: AOAM533BfhyEi8YSHQoIl6a3qJnkHEqgr4R11tIw0IZORGkVoJy8TkZy
	viRREAvHCx5Lzhf0TKKLCE2ecF3UAtujUw==
X-Google-Smtp-Source: 
 ABdhPJwi7sXzX1aCWq0XmNmcqfp6Yu1oxJ1F2+RK5/afwYEdOjrttbQY14VhW9zSSEC95WIozqRL2Q==
X-Received: by 2002:a17:90b:1c01:: with SMTP id
 oc1mr175419pjb.161.1644583732202;
        Fri, 11 Feb 2022 04:48:52 -0800 (PST)
Received: from localhost.localdomain
 ([2405:201:a410:a06c:9d54:8ba4:3c36:8927])
        by smtp.gmail.com with ESMTPSA id
 lk15sm5566821pjb.31.2022.02.11.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 04:48:51 -0800 (PST)
From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Subject: [OE-core][dunfell][PATCH] freetype: add missing CVE tag
 CVE-2020-15999
Date: Fri, 11 Feb 2022 18:18:24 +0530
Message-Id: <20220211124824.20911-1-purushottamchoudhary29@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 12:48:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161647

Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
---
 .../freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch b/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
index fa8a29b798..31f9e32dc2 100644
--- a/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
+++ b/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
@@ -6,10 +6,13 @@ Subject: [PATCH] [sfnt] Fix heap buffer overflow (#59308).
 This is CVE-2020-15999.
 
 * src/sfnt/pngshim.c (Load_SBit_Png): Test bitmap size earlier.
+CVE: CVE-2020-15999
 
 Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=a3bab162b2ae616074c8877a04556932998aeacd]
 
 Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
+Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
 ---
  src/sfnt/pngshim.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
-- 
2.17.1


