Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BEAC61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:40 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3862.1676835090903327185
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZFGvIN8v;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id f12so971144wrr.4
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laEeFVLhGTROBiT/JUu7Csz3nI2BA//sSb7jeOYPGJY=;
        b=ZFGvIN8vBEIX78MO1DB53SJ9oBAUugzBF+0Y8yVroDn6AuLTd8ny9c9Ph0tGV0hfqj
         ml4IoMGRsTuDx7vqzMlqvjajmsidgm7BPu5/waaJsReFtE7HYXbXb6wGe5liEwMST+v+
         oPa+NJEVSP9WNQ0kaRNbyK+Pr17BgmcKbOMPFjjkMAOluHrkgu2CdHOdo6w4mJVMqXF7
         40DyQhEPnTJMTNFDnr8GA6mB1PLhdyND0FhDcPXp4uNcOrG2QnkpLx7REVNHAjUEHCtl
         MyCUrLQ7i8yMi3nefXNwZ6Oa56v52US+/Q9ywzBLOEJNFvXiZwU6De7eHT2PaxFuK1bR
         Qvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laEeFVLhGTROBiT/JUu7Csz3nI2BA//sSb7jeOYPGJY=;
        b=0kzzpA5MXys5P+T2V6CWHFGGVREVGX5uUb498PRdWaBoumGEL6FG1tcHCsYWi9UnSD
         ciDZX+6njBzmYmNnjPt55yme4/iBbJ4xoydH3BDGAe7pxatcnCtMWIy53xpUC37C4Ham
         JIM3vPLWZ4Cv/25EcoWK0xpF6AktPs6qScwCNB6+dCJRGwahdtINqLja73yTno30miXi
         9u8KIuAtRvhOLoa/qKC4T1a1fjwh44rJkBrMpD0cY/fsixYbHRcY5c4bJgw2+vLIKILl
         a7JkNcL6oDxI2DldhmbzD4w8AUfR1qrWMq6NyFEyXVAQGbB40EQn/2ivo7D8PMOGtGuJ
         DCOw==
X-Gm-Message-State: AO0yUKWn05ZBXKmYbRpU3brsMhncgQuiE9dUoH2iqc2YnaT0gt8DHaHe
	THz2/qYq+GCkMRO8LCnigOLubtOGN7I=
X-Google-Smtp-Source: AK7set8dfFFeIkCsiORt95Ww4VkEjpxMc0qLnwTt1U+uTurdeRGvcdQXH+NzrIg0xoleR0UaAlWNgA==
X-Received: by 2002:a05:6000:1b0f:b0:2c5:5ff8:6b02 with SMTP id f15-20020a0560001b0f00b002c55ff86b02mr253612wrz.0.1676835089496;
        Sun, 19 Feb 2023 11:31:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/39] git: upgrade 2.39.1 -> 2.39.2
Date: Sun, 19 Feb 2023 20:30:59 +0100
Message-Id: <20230219193101.338397-37-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177380

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/git/{git_2.39.1.bb => git_2.39.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.39.1.bb => git_2.39.2.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.39.1.bb b/meta/recipes-devtools/git/git_2.39.2.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.39.1.bb
rename to meta/recipes-devtools/git/git_2.39.2.bb
index d8137df561..222e545f60 100644
--- a/meta/recipes-devtools/git/git_2.39.1.bb
+++ b/meta/recipes-devtools/git/git_2.39.2.bb
@@ -168,4 +168,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "ae8d3427e4ccd677abc931f16183c0ec953e3bfcd866493601351e04a2b97398"
+SRC_URI[tarball.sha256sum] = "fb6807d1eb4094bb2349ab97d203fe1e6c3eb28af73ea391decfbd3a03c02e85"
-- 
2.30.2


