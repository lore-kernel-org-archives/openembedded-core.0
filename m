Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.2218.1596649816153178421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 10:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=afJ3W+eX;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id w19so12709206plq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6v/xgvnbzQ2VfPqMMniH0iqYQ2+jqadaR02YOVDNBxc=;
        b=afJ3W+eXBNCQiu9SXNuTR1Y4VcTpe0VaSRe2oVm1SpSHI7mZJgHsMPfo9BMYk0Ez88
         GjkMbKIoAN//dTB9ulLBt0zDRJ2nbStqFh3+HKXoqcu9XFuvQKPF/s5F5eVLqSZWu2kg
         snm3h4QO1S9Gd6ycPYw2EKTVRxngVI942lQgFZC6Ns6XvmIicpeOgCX1fLSMDRQLikZX
         MoBgsWIUm3R8jqeXbYvZ9RnlQRb0W31EIZvnCVjMWIDYyukdc4j08NbIwYSCCZgzKqLx
         jxaimbjkHvKfhJpQlWFpYdaPBoo5EehIudnEMya9fp6gNnRF8jdzfgFPhCQMZhCpncKP
         WVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6v/xgvnbzQ2VfPqMMniH0iqYQ2+jqadaR02YOVDNBxc=;
        b=ZbWOpjAb1+28T+0efL7xuVs2Mc9AMZiKBugl5114ruaVGMmgwdr3tPm0enJ1TXQHMI
         M4YCYLT3LPIIElES8ilz0OVc8WYqcnopCYmcyLYWYB8E7HdntUJkYIAweNVAxppt7VUd
         5T30fv+cWFznCpeuHi3WNfYl9UxEXJzNTH+f1HunJ3RLSta4T+o8mBuSJjkgW1VjNroy
         Sb6yJQNRP41llxyKyrD7FLCDEt0F+OzdPOgAqHzESI7HQ5yzWf5/1fk/+d01qmoIp/cr
         jrMphcVSoYp7M/oLZZ2r3WCE25HyLOinsTMNT1yy6e2kpTqR4OoJ2zfiMXU9JtTsYuvX
         hGvg==
X-Gm-Message-State: AOAM533yR64g8VIg68mR2Tj+3tuHr+qotJ3Ptcg7ykgNssWnWRF1PaIl
	N/12dRSqQQcDpEFP8/+ho0UaXlPJNkU=
X-Google-Smtp-Source: ABdhPJx6xkFbH7sRp3Ll5mSo+498RZPvy+SDCSPohDcJlnF7k6LuRek4QQ965A0WT3kvUq63ORkDjQ==
X-Received: by 2002:a17:90a:e558:: with SMTP id ei24mr4569131pjb.54.1596649815453;
        Wed, 05 Aug 2020 10:50:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id v77sm4711115pfc.137.2020.08.05.10.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 10:50:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] libomxil: Use -fcommon compiler option
Date: Wed,  5 Aug 2020 10:50:09 -0700
Message-Id: <20200805175011.126156-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200805175011.126156-1-raj.khem@gmail.com>
References: <20200805175011.126156-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that when compiler defaults become -fno-common it still
keeps compiling

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 271c2a30a3..2061c280e4 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -26,6 +26,8 @@ EXTRA_OECONF += "--disable-doc --disable-Werror"
 
 PROVIDES += "virtual/libomxil"
 
+CFLAGS += "-fcommon"
+
 #
 # The .so files under ${libdir}/bellagio are not intended to be versioned and symlinked.
 # Make sure they get packaged in the main package.
-- 
2.28.0

