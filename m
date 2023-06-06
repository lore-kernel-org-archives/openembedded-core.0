Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA97C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 10:04:20 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.4983.1686045851182501132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 03:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mYa1mslP;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53f832298acso3433217a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 03:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686045850; x=1688637850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoj0vwTMWALxNBRiOKEoAKNZt+juP06AWS9Shi6kKBY=;
        b=mYa1mslPAKuSbhr+JQtfJpAvGJIRFg1V3mkhW9ZHUcK8fHzVxkbMLYlwhxUq4I3lOh
         he7xNszwBhN+QBSMDxEvYWWajR9s2DAD0kWCepeG7giefkmA5iZKvOIYJZZHKbAdqwDz
         rzPsX4W13e5zkYoBRTLohnpYysqwlN+Ao9Y6hhaD15gyBdXAPU46yUVHc2Go+VXKAXy5
         p9Ofug0ce3vxPvgyTMRKJZTnhnfBAfb2J9vpsgFE9k8288vNf7rA7H4gIzH69EtT7Jm1
         hahicOlDPrrxsHG/Ymv5xT0uw+XkuUyulyYalWp8CN32WT8KH7N29xE/s6UcE+TFqB0p
         D2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686045850; x=1688637850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoj0vwTMWALxNBRiOKEoAKNZt+juP06AWS9Shi6kKBY=;
        b=gUF9qd4TiZWpwRjf6caUYGmRY8RDJuR/90ix8q1LzxPuelT9ADEccpMlHJ8OUSIDO3
         Lgc9JjiEU7cjJc2yMKQIABfRHJduCzZu7aWIJJwaJcCbBwNq6k2zB08RTXMVhwwNcE17
         IEWF3gqO7yT6s8WJqRwu7hbUGMsv+ruuR18wq7tdxNI3nh1RVUhz/h/pSKAK5YBJXjEg
         bH5DUN4XV0C06fAW1LKD9Fa5eA+cO7QCMOzU6YEiGEzwQ9p66CohQTEEGv4wBZoVzcDx
         CbI/yENxrd5+Td0+MXhUh+SDTfRccpq9mIZhbPLKRx9DICx5+72oTx3sw3/EL1cwCiwQ
         a0Ig==
X-Gm-Message-State: AC+VfDximuT9gRgOmNZiTVkzf4dAyG0ImXe34e4iu4ZEvwh3FYQsk/O+
	qCTLbOajYO5KZc9kM7nGGlLxnWHQPGkVkA==
X-Google-Smtp-Source: ACHHUZ7/NVsAgpMe0xYGcJ6sssFovDi1Banm21SBqEo/u17PXBuQ//kSakRBuUgTCUDoL9i3SgD5+Q==
X-Received: by 2002:a17:902:d4c3:b0:1b0:348f:c48c with SMTP id o3-20020a170902d4c300b001b0348fc48cmr1302850plg.2.1686045849958;
        Tue, 06 Jun 2023 03:04:09 -0700 (PDT)
Received: from localhost.localdomain ([103.97.240.70])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090311c300b001a69dfd918dsm8151233plh.187.2023.06.06.03.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:04:09 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Omkar Patil <omkarpatil10.93@gmail.com>
Subject: [OE-core][master][mickledore][PATCH] git: upgrade 2.39.2 -> 2.39.3
Date: Tue,  6 Jun 2023 15:31:32 +0530
Message-Id: <20230606100132.154482-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 10:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182419

From: Omkar Patil <omkar.patil@kpit.com>

git version upgrade from 2.39.2 to 2.39.3

Fix the following CVE's:
CVE-2023-25652
CVE-2023-29007

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 meta/recipes-devtools/git/{git_2.39.2.bb => git_2.39.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.39.2.bb => git_2.39.3.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtools/git/git_2.39.3.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.39.2.bb
rename to meta/recipes-devtools/git/git_2.39.3.bb
index 222e545f60..54a863acd2 100644
--- a/meta/recipes-devtools/git/git_2.39.2.bb
+++ b/meta/recipes-devtools/git/git_2.39.3.bb
@@ -168,4 +168,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "fb6807d1eb4094bb2349ab97d203fe1e6c3eb28af73ea391decfbd3a03c02e85"
+SRC_URI[tarball.sha256sum] = "2f9aa93c548941cc5aff641cedc24add15b912ad8c9b36ff5a41b1a9dcad783e"
-- 
2.25.1


