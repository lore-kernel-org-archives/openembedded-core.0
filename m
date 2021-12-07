Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E39CC433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 20:16:47 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.2483.1638908206301755252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 12:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pSm4nDtH;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id x7so354079pjn.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 12:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fAGYY9oeHKP3/YQ2nocrCCL3/zU1QukM+lWkOYu+xWU=;
        b=pSm4nDtHQfZgSKw9I/5Q4Nj8FoRKlbXYHS6QJiEIQw9f6ZS9Y6u6olxNvtkLjv+ZNa
         FGYwimYNv8PmlkNw94roHzPecPQpzV9h5Xz3PsCRaV+WfWLApYFQqCG62hKLr6amaKMR
         iFsq3qKJECistPn8cVz1q2/mg+wn3QQpmNzLfc3S9/D4n66tbPMXDKnqJyz7K02mR+W0
         H9V4QxOTeG8Q1IzBWBV6zpf3pIW9dEWo80MZjUoYfCiyiMRtAd9l20OK0sFiSWXSOZBL
         ryYWaAs9E9CUlzvuaD56AMFswbYkIPp5Aj+exvmkndIhBTNDMA38plhe+h7XWCpScsHp
         tBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fAGYY9oeHKP3/YQ2nocrCCL3/zU1QukM+lWkOYu+xWU=;
        b=YxGAJ4xpB4NL7bhmNrYpigLXnHzIvE63pdWAUc0Ce5mPuSvJasNf+zxsN+XMP1ZvHm
         4bXalglz/nzSRYCUcM7FdwcVa9hDU3694HEQD8dVdt3TtjREUZ4L+KPHnMm9upCIEOAE
         h7K2eHhEva9WhWbyp6auzvUIo2HCYAFyeuOlyhSejA3TYM+kMjYM031UeQY8/rP8dfgK
         ROXQUnTVS8slKNWx8eYB8tS9WLp0wSy6qpSMFhDCzS3djmEczDSjbMKsahE2PyaWfsN6
         jNgCB0ylYZ9dhqQPB6a1TQzNhh3diITT1LlP1tnyXJkks4+PVv8+73F/LFghC4dELvYw
         +2Dw==
X-Gm-Message-State: AOAM5339754bPwhKyupWtiqo3+cghSnpoFCK16YRRhyFfwBU2vWq42Lf
	ed+YWsI5zoa1em0TKPoDkoG3IKZgwlr3EA==
X-Google-Smtp-Source: 
 ABdhPJx/23fAlcZco43d3oGbnPNBcul/8OcKsl4ZhovqN2DcKbv+BM6ReuufXYHt8UInMZOpiNaE2A==
X-Received: by 2002:a17:90b:1b0a:: with SMTP id
 nu10mr1706606pjb.35.1638908205663;
        Tue, 07 Dec 2021 12:16:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 h3sm3626946pjz.43.2021.12.07.12.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 12:16:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mesa: Define broadcom packageconfig knob
Date: Tue,  7 Dec 2021 12:16:43 -0800
Message-Id: <20211207201643.1112088-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 20:16:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159334

Fixes
ERROR: mesa-2_21.3.0-r0 do_configure: QA Issue: mesa: invalid PACKAGECONFIG: broadcom [invalid-packageconfig]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 31ff38dfdca..e601eac5810 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -125,6 +125,7 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 # "egl" requires "dri", "opengl"
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
+PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[freedreno] = ""
 PACKAGECONFIG[kmsro] = ""
-- 
2.34.1


