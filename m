Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.7548.1624360893954233597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cxCF7Td1;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id r7so23080287edv.12
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AbUQAOSiiYE/oByLAcnts4qxibfsWh+T2V/v1NexEOQ=;
        b=cxCF7Td1CfJkxuUraGFRvYsrsoLKAatbHtbjGgiy7EMSb6lGZUuv8uqI6XOGKrIofX
         KZExD1IHkY24oRJlLvlcEljfMPWn0IFHZULYGFz7B6JREUdai2q70CAsm1ImguOc4cCS
         dE1iCQqbLhZzTvfY69dOOO4quewjuCjqlCCWfaV/iLG18O1NGNJdAgvbgIC4nvN0cLMH
         Rif/Sv3EaYmSrLw0SiHe2O5l/RD9fdYfiqqcd+H1PCHjiqNNZAwAztK1apAy9haJ8yVo
         YbcZhNSNb5H8aNw7APYuMGQOPsBGJCsM2ZhbSmAapc4QRJd6N8H3w/XP+0RGzQtMM1El
         GaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AbUQAOSiiYE/oByLAcnts4qxibfsWh+T2V/v1NexEOQ=;
        b=p6R2Mk9LOA0Xf0Bo9XG0XufQXGzRkIFq8kf+bDptwTDnltu8ORqJLHs9SpSwirCmDa
         sgde1ukL3V9V0WBcEcKtQiOC6TCYrlxHR/QkkV5tAWIgaIpjmr1bQzkk1Mx2DH7Kq74S
         J8CXG3KZYhB+tk2GcVD2b2dyE3yDjiVeQXqqDAudyN1XuhrM+fI2JH79RtZAqynjkcsg
         pC2HArb2VH6J/8KHZzAk/c4xyfoIyROLwCULpyhJ0wpeIIT+Sl3skOg+PeXMKfZK7Sce
         xdWOnjqG7XaYJzbPRfYc+aBPxLyNwU5IBOLiluevccHosiOUV5ArFMUZTjXQ68YJGGgM
         GIjA==
X-Gm-Message-State: AOAM530+YUfbJlb8EK+v36dFgYzzz17mk9xFK5joEFUOyWloKjCi46bC
	BxpIg3/sXROa32zgNAvUonSHPMFYC0w7GQ==
X-Google-Smtp-Source: ABdhPJya11E32CUR7SPyMCgRGtk9n6jGx+bSFg2W4rNrNRtKWtIvBFOKVuGC4GFR0n+TCSl9sKjrhw==
X-Received: by 2002:aa7:ccca:: with SMTP id y10mr4347779edt.258.1624360892481;
        Tue, 22 Jun 2021 04:21:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/19] gnu-config: update to latest revision
Date: Tue, 22 Jun 2021 13:21:10 +0200
Message-Id: <20210622112126.2026646-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 8d7d6ac3ee..420363415c 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "92fac9b5ceb9f111a04d7f8f98831570e77886c6"
-PV = "20210522+git${SRCPV}"
+SRCREV = "4550d2f15b3a7ce2451c1f29500b9339430c877f"
+PV = "20210620+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.31.1

