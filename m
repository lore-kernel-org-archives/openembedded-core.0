Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.1015.1613177968263430560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 16:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MAbKZA4/;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id b3so1460618wrj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 16:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lvQbxdWsJ6GhEoefA+JHuZqIUcCTUaa07YxeFNT8lAY=;
        b=MAbKZA4/leIXlTqA2/hywX5tzpKmlRvHp7iANBgIdjdIMo2S8D+pT67ir4TrN8XQL2
         QPg/F01+Kpa17mQUSK4ftTnMFFH6qeMv8rqCu1FdLS7X6GMtNWiNqh0qoUzGA9LwUtG4
         FVbZn3p4VXVbgqf7Bm+brsQDZDIwgoJqelVM+3Pi9EcDukQKi+ZRsk8DOyO/OtR/24t4
         KfmB2tDQm9srQr7x/u9cjOyBB1Oz0tp2U4wWZOQmBnsrgnwW3O2VqjkV8IILCq+lo4ID
         RjDRblnYx6MXhstE119JKTWOuzTjJB7SIYuFpVQVqzEbc9LhWAlHp2MihewnEvoYvxZo
         IxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lvQbxdWsJ6GhEoefA+JHuZqIUcCTUaa07YxeFNT8lAY=;
        b=G0wk/AYDPyK6LenI9+wMwvJAubJes0azYAtikOUHlzpSJIDeXuwWISphPpIU8sjDmR
         7JycmIw8taGntEXbRsF4YmPx55gNrDtn7il6KmNGDlDuJF/nYo6p2PRvcQpiYrei7Wmv
         KDBN4TrVteSSwA96/4Ysb1IJwyHxJpaOVh+T4mTeHOvMFZY9ii9+GuVtdCFZjJnvPIjQ
         E7VMatYFSf2G1ZGvAyD72BGLbo18e9XshQP37NrEIQXVelXXi4xxK+v0m7w2vP2UypHX
         FuUYpdzB4dRXguy9nxmEvcB+aXHo7oQqdnvAudLznynyDln2NeDoWO4cH74uyv1OEPCf
         ezDA==
X-Gm-Message-State: AOAM530PEh48lOau0/39wOnVbV3Ga+wF0LCwGw4t1wilTDI4SOP1IGjT
	Y4lKeqCj1VxeKqcTSPVvzi0XKukye2V+vg==
X-Google-Smtp-Source: ABdhPJyFmMwiAsB5iRCdFtywcSn906Uc21UYexAa9kY7rY0Ha0/h7p4Tx5uncgBmrv26hp+pcjLpKA==
X-Received: by 2002:adf:a1c4:: with SMTP id v4mr6332958wrv.104.1613177966924;
        Fri, 12 Feb 2021 16:59:26 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b15sm12259195wrr.47.2021.02.12.16.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:59:26 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 4/5] glslang: add comment about unversioned libraries
Date: Sat, 13 Feb 2021 00:59:21 +0000
Message-Id: <20210213005922.180552-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210213005922.180552-1-quaresma.jose@gmail.com>
References: <20210213005922.180552-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/glslang/glslang_11.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/glslang/glslang_11.1.0.bb b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
index 9b7c098743..53d90c9165 100644
--- a/meta/recipes-graphics/glslang/glslang_11.1.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
@@ -25,6 +25,7 @@ EXTRA_OECMAKE = " \
 "
 
 SOLIBSDEV = "glslang.so"
+# all the other libraries are unversioned, so pack it on PN
 FILES_${PN} += "${libdir}/*.so"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.1

