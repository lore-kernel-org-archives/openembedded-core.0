Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DBBC43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:59 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.30943.1668892556034723571
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZD/mcT9Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so8075333pjl.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wX2/TYn0xPtaXKjQhGB74R9yhOS852hfNPhU2peJ/Rs=;
        b=ZD/mcT9ZXks458JItt3xpWITtJC9WzQeFDzsw1Id82xdPhySTQi1xJNsTPh2GAWJzx
         hqac1dasYZf6VrUICmWNDFlpCFqQahd3N/MFl1Vqo/6F89fikzXKLz4+fi5mdethXUT4
         gCeuauTYco3AiK/HHpmIbZmR82h8bcCTmjlD7QbxXT1rpDdZzYpKKNHRBa8r+mjq0C7Z
         b8n1xm0j3rKYWX9g7IlRty2inCs7GJvBGQhr+F4XyeW9rd4YhuSUCqJ4mw7o9hn7v+uJ
         movZUPNZFAxO3+nNKV4mGfIh7rdJjMhwp6HMU8ieKL+sEGrHdLJf+kldwRI3L+CMDHFL
         RuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX2/TYn0xPtaXKjQhGB74R9yhOS852hfNPhU2peJ/Rs=;
        b=NatboLcsthOSSw8sDP3Yty4XNhRIPaFjtdikcOTibpbOxRF04HRb1dOCas0VePbvM6
         Gw9jHGG6MFMklasgpV5gCSbcy9iX7tMeY6tnlUwv+x9n9iktNWToPv3WxVQkGdZ32wf+
         YVYW08VYTU7Q1VNsp+4luTbmmFKudJrCE3sQrcXZNWRhxSKgDn3iysVKX+INOGig0fYz
         STdMekCdqJEwKIf2C1BnChHCzfjgAfcnXedB0JRWLMLgP4bMjo2LnI2KnnpqBKAcqnpk
         6vb2GsRavpHcHoJ6eyD5f2i9j2PTGTb/6sbk72hxzX7dGOjCwK+f3h18vu69hTdP7EpZ
         n/Pw==
X-Gm-Message-State: ANoB5pluK3Qc0N2aVcEyVCFijQKBrpdumjTauskAzneVFMpyan4kDS31
	guGVeNgIu0UD1I1O/y0O4OAOX+TKOEmN56YBL9I=
X-Google-Smtp-Source: AA0mqf6y9Sj8NRohu2cgZn2irPOJ36Sf9p2Wu0b8021H2xCxahtqVbzn2knf8S06tDOPK5QEM9Fucw==
X-Received: by 2002:a17:902:e294:b0:17c:620f:13ac with SMTP id o20-20020a170902e29400b0017c620f13acmr3202749plc.9.1668892555074;
        Sat, 19 Nov 2022 13:15:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/35] kea: submit patch upstream
Date: Sat, 19 Nov 2022 11:14:56 -1000
Message-Id: <bf79cd69a6027218a90b5c43a153faaa710247b1.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173557

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8f0e3a01262ecb83185ec5e84e6f359d7d64d1d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 78f475a495..451b409c88 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -12,7 +12,7 @@ Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
 Because they are all commented out, replace the expanded libdir path with
 '$libdir' in the config files to avoid conflict.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 ---
-- 
2.25.1


