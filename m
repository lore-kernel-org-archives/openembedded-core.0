Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D69C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.4649.1642588916081961809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fc/aqFXH;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so4913498wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U7x3w3m+oPsfzzIWtDBIev6yaIqZPb2s430JDqAXAqs=;
        b=Fc/aqFXH6Ao+tnugtN38XsMNunijp8+6hIr1bpnlnwXao5eiY0x6En8VMYfzjh3tMb
         SyW6TVdiWFKKDRXHod6XWRHPPOfJ2Ns+2EQt0S1UgXjYKJgR0D8YLPsQzN0+1zCPa8vy
         dJIP0WKwdkouv9I2uBw/howSAFiEaXuRk0yQjMPgKGQMm5f5Uv+Zx7dLMrZyakxkZvd8
         vHni7MUqrovtNmG4ChzlA3S3xvJ6nP8zD2Cveo/R3vjNDhgMX0YRoHd4moBzrevFezJF
         zs9r7/td7C0E3q36Ss2YRkfDpFexDJxH5tEhtYFJYND1OGUp93z0x4wMHEDWVgV9ptuq
         ngRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U7x3w3m+oPsfzzIWtDBIev6yaIqZPb2s430JDqAXAqs=;
        b=CciajwcZmfHaozrFMAtJ8k9QqIYMoSwPcJzeoH1PioUPxe/VGeHizzfFkKAggJAKrM
         DRA67bu02cTU284OLcP89Ax4gDMkKKRdtCDNb5Tg2nf6aoi9CZFHj4fUf3do1FueDYNC
         WDIoJgEUSuJveFmANs3lDn32X/Yxp4/IrdMVf8ccopKQP0F25PshLFfI0p1C6Q4HHSdr
         aDqJiLJ+dtwm4EIj34faYVav2j8AP+HX8/6UXwyu0Ay6Qb6xIA0KyO2FcqPQFguQuN9o
         Qk1EriOeNB21OJVsEzial8db/cHDKKrLoEDSn0neC4isJrwjv00XAOEZmvKV2erGk0Ua
         oIgA==
X-Gm-Message-State: AOAM531S2szmjTLvyazCXr/p6olXSB0zBi0glZvTuQkqpVE5oxnMln24
	cpClzgKItyzU+NFcd2MVeGISXRt8U9s=
X-Google-Smtp-Source: 
 ABdhPJyO+5QP0SbZ7PG1L4nb0pEXVZexF5daYx59BxUL5oRhnw/R0L3BkrUU8ycdIaz2lkWX+oZRTQ==
X-Received: by 2002:a5d:6e8b:: with SMTP id
 k11mr27602024wrz.102.1642588914754;
        Wed, 19 Jan 2022 02:41:54 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/39] p11-kit: update 0.24.0 -> 0.24.1
Date: Wed, 19 Jan 2022 11:41:17 +0100
Message-Id: <20220119104117.2120127-39-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160731

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../p11-kit/{p11-kit_0.24.0.bb => p11-kit_0.24.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.24.0.bb => p11-kit_0.24.1.bb} (96%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
similarity index 96%
rename from meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
index 7fe3c37fde..59cbb67961 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https"
-SRCREV = "34826623f58399b24c21f1788e2cdaea34521b7b"
+SRCREV = "dd0590d4e583f107e3e9fafe9ed754149da335d0"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.20.1


