Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4552BCCA48B
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.51637.1658306688917300151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jH6zO1qM;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id bp15so31838847ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j5RUgTT35FSuvKZkoHRrPMBfQjfbrFvjF4iypwndAXc=;
        b=jH6zO1qMMPdyisPJChG5y5eKsdZPckWuJsXZFjyitRlq7p5feKiaApCdwlXP1oc3L4
         z36ksLtk/Ra9Gku1iKEGylGssY+ojeOZ7XsCnhsTH6d3M2trBJGhzRJU37xmhlU8Tp7n
         ezel74TML3ED9+56WsarXjphAhgddYck2+j/TOR7rdaZy1mcaOaFJetFcxuaKGJUUYK9
         wR9WYvZdpsxSU+Fl56gVaCC4BbEHH8q5EITfhlc7cCtUtKEoj2x+IwccCfRfWiYNRLv6
         WaSeoznfVhnfPJbyBH2TCVnMRLtdIDdrUf4WUZJvvhmCftLPZHqEY3NHCvcUyZ6kK63G
         soXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j5RUgTT35FSuvKZkoHRrPMBfQjfbrFvjF4iypwndAXc=;
        b=QsQCxb9q7KQaie0w6aAReT0YTkxV413XDpblmUjBhpWhDVSMvMYVp0ks4fuBbzwDWY
         lVkcH3H6lVI1mTIskkyRUtc6euqvHHzsJTinNxTMmmhmZAmYaYmKySFXyL2o6K3DxjO2
         HVBNEH7QsvwzezFhWprlhQkV4niORwXbnAbvN4fRZt4asg09rnVmXqToX0yOSCSY5caD
         6vExPUN1Q2cc06drq88JHACncVyXWavXZm8YkekDs4ON1f9FkCfAImS9PEVD1v92C4h+
         +6EdzS0n9K90HnqBvFiaVueko3C3BBlXFVLs6WC32X3orr7iLahjIVRxwoFoqN+9qye/
         wspQ==
X-Gm-Message-State: AJIora8uPF69ri45WZj+Mudhd+bLFG+hL6gY+4qDCTQn+NxVu8SJr9qk
	TxhugGgW9cFx06w4Gn1raNAjU1agx7I=
X-Google-Smtp-Source: 
 AGRyM1vDCakiKLnwivQwW+8uASorcA8r0mE6B+MixRafxnfmzWZQtwHPoL1ZXzOU1mGUEBVIVY8P9w==
X-Received: by 2002:a17:907:16ab:b0:72c:7533:7262 with SMTP id
 hc43-20020a17090716ab00b0072c75337262mr32732762ejc.288.1658306715127;
        Wed, 20 Jul 2022 01:45:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/51] git: upgrade 2.37.0 -> 2.37.1
Date: Wed, 20 Jul 2022 10:44:17 +0200
Message-Id: <20220720084442.2940187-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168319

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/git/{git_2.37.0.bb => git_2.37.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.0.bb => git_2.37.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.0.bb b/meta/recipes-devtools/git/git_2.37.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.0.bb
rename to meta/recipes-devtools/git/git_2.37.1.bb
index d3bd0619af..5d2524a1da 100644
--- a/meta/recipes-devtools/git/git_2.37.0.bb
+++ b/meta/recipes-devtools/git/git_2.37.1.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "fc3ffe6c65c1f7c681a1ce6bb91703866e432c762731d4b57c566d696f6d62c3"
+SRC_URI[tarball.sha256sum] = "7dded96a52e7996ce90dd74a187aec175737f680dc063f3f33c8932cf5c8d809"
-- 
2.30.2


