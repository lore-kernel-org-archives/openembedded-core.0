Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.921.1599081257529700373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YNLHs7QK;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id i1so318324edv.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=evL/rVFp3lx4GAl9Ih+IoRJ/cgD1g1hc8Cqbf+gRV5w=;
        b=YNLHs7QKT0zLYJKeFw1ttK4G8m5+tCqlQtLBKoygiEiOp0ji2EB4xh2WdEyOfPY6s/
         1ADHrij054iyUX02Do0tAven/+okW3brWnazQZ2ZDnKrNxS5mxQSQ385cEUVzko8Vzop
         Q2t2TM6ik4+ZGvn2RsEcfA6gz062pdq932avvA/u0iiRtlb8softhW66wG4S0IByyVzd
         zxILLWcxjoKuaS4Yt3JDne1JgCsss4gyTahDoF/8fAywFjAk3QnlOxiF8bhXwebKg7GK
         /y3u9qbO0JloLhFYL+7JmNVk3G5Kj2kiEZczpJo5UdsdOB86cBGgNJsQoSNPPygorVLY
         yc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=evL/rVFp3lx4GAl9Ih+IoRJ/cgD1g1hc8Cqbf+gRV5w=;
        b=jl/awCsQ3TgCBr8BD58lrTCZhsMgseP6SLgkqDQrTV3l3EKHHOKGZP10lXC4OnS03w
         oSOPVPkeZsWLMuqJYo/gd9iwDzM4Ysgb942KgxPp4ksMHRHjbQHX3L1hoOrGcKT2WvNZ
         rzWV413STjCC1QW9aYLevoMO9v5WcKD6FbiOyWG95WZ+sXcRmJLnoqWbktr6+516rG7b
         zW0egKcisD+NDXxOJ40VHRI+y3PSIXBxjjPAR79mgNiVdnfDJbGjPn94eL1GITFtKuyf
         LRGH9YuCRQlXb4raez3ct5S/O6PZQydi3FRJBemvsvjT0RQd4GD7DKnyFzfXCg1SuH1H
         6HUw==
X-Gm-Message-State: AOAM531v1LBkSO9H4g1AwOAcezpIXFX3VsAJouVhyVBhZGY8F6zdXc+Z
	CU218LgQnTBUlVp6eedlnQGrcWATTMc=
X-Google-Smtp-Source: ABdhPJx/hUPfV5xGRA6xvdZrqN5dAEd5ho8KRIj/EISiREbLweYNrt7c+li/Xf7AefEMFI6fjBt0ew==
X-Received: by 2002:aa7:d593:: with SMTP id r19mr2056886edq.331.1599081255770;
        Wed, 02 Sep 2020 14:14:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/23] xserver-xorg: update 1.20.8 -> 1.20.9
Date: Wed,  2 Sep 2020 23:13:29 +0200
Message-Id: <20200902211330.4853-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{xserver-xorg_1.20.8.bb => xserver-xorg_1.20.9.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.8.bb => xserver-xorg_1.20.9.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
index 8c19692ded..86d432a7c4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
@@ -7,8 +7,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
-SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
+SRC_URI[sha256sum] = "e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.28.0

