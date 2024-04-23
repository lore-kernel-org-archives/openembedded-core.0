Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2B7C04FF8
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 07:35:20 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.13169.1713857717288143988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 00:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fdwX8Qo1;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a559928f46so3446917a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 00:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713857716; x=1714462516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/nbRBDduyhgi+uh6kkZdNVglSjqA+QzerYf3KuwLPw=;
        b=fdwX8Qo1NO3TRAgtv8XlCJkapnDkjwTWJYNnVKT7G4+u6AJsa6fn+PZesXAU2oX0eG
         /do2CRvdY/B/46y2Wsphq7bESSCUeTurryVecPDN2MnK0EcDnYMLF+QmqA0RdvPQoFpG
         kApeJY7iwZpvTGVQQsZu+QhxgED7+oBi4UPrXJ88OD15d7nk11tRFB/KPcCzc7C/F1Md
         3MDGCXNRrAZ+JC/4UuzyBFFpZR9khL2AsPVdVQANNEAFvvzUinELuA+/hAdKn5r/u2mB
         1dw1PHfZGg16X+osN0L7qrNLaNRFOsO/SnWFTr11OaC1eqUbgRb9woouVT3mw2jCKCD0
         FeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713857716; x=1714462516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/nbRBDduyhgi+uh6kkZdNVglSjqA+QzerYf3KuwLPw=;
        b=Wlu5nxJnUeDTO8jiOI+0Ub4OaRK6LvVEtXhvYEFQsoEO11DEpL4jc1kJDo88Js5Avs
         Ptm6tWPLog/ICVYM66NTPOqk91hSvfkKIUaqsDhDRJ6Y4RCYdubEJWIdkN80klFD3wa6
         zoS8xZY/n7iqPnA3VQxKKNOUj71TRlD8zAX8iO2EQ4NXEEVETojniGTK9EUHz4EBMWQC
         Oub4jhPiNRpi7CafcMcyllGgZ0r9iXuYPmj7VBBUNDXeMObzzyEyUSTGAWYlqe9ZdP3m
         JL6Z0knVW7LAF2dyzNhaFJYTQ03coXMt7P342aeby3NpPa1iYhrmR4EwVGa/kBh4YSdi
         IdXw==
X-Gm-Message-State: AOJu0YxUoqaySaBY8y/Ru5JCVuUZeqrfETvLfb+39KsfXoKGJ3cGxnPT
	Iq73giUg4UU2usyHQ2D2N7wvBkdBsN+OmSORqnumlvqSd6d7cBIYZMe1+g==
X-Google-Smtp-Source: AGHT+IGinlSs/i4QDI0cFxkZfBauGdP1v4Q/9tfIgEMgl2mm3vcL0goQS5BvFOtC3bpIDgZuYsdSpg==
X-Received: by 2002:a17:90a:af93:b0:2a6:d3c0:28a3 with SMTP id w19-20020a17090aaf9300b002a6d3c028a3mr11301585pjq.33.1713857716187;
        Tue, 23 Apr 2024 00:35:16 -0700 (PDT)
Received: from L-18076.kpit.com ([223.233.81.5])
        by smtp.gmail.com with ESMTPSA id t13-20020a17090ad50d00b002a5dbfca370sm10539761pju.48.2024.04.23.00.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:35:15 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Subject: [OE-core][dunfell][PATCH 4/4] binutils: Mark CVE-2022-47673 as patch
Date: Tue, 23 Apr 2024 13:04:42 +0530
Message-Id: <20240423073442.48274-4-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423073442.48274-1-virendrak@kpit.com>
References: <20240423073442.48274-1-virendrak@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 07:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198609

the fix for this issue seems to be the same as the one for the issue
described by CVE-2023-25584.

Reference: https://ubuntu.com/security/CVE-2022-47673

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/binutils/binutils/CVE-2023-25584.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2023-25584.patch b/meta/recipes-devtools/binutils/binutils/CVE-2023-25584.patch
index 732ea43210..f85e9c08de 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2023-25584.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2023-25584.patch
@@ -1,6 +1,7 @@
-CVE: CVE-2023-25584
+CVE: CVE-2023-25584 CVE-2022-47673
 Upstream-Status: Backport [ import from ubuntu http://archive.ubuntu.com/ubuntu/pool/main/b/binutils/binutils_2.34-6ubuntu1.7.debian.tar.xz  upstream  https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=77c225bdeb410cf60da804879ad41622f5f1aa44 ]
 Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
 
 [Ubuntu note: this is backport of the original patch, no major changes just
  fix this patch for this release]
-- 
2.25.1


