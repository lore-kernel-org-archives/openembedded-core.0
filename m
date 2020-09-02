Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.920.1599081255059264107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HCt+tdop;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id p9so700320ejf.6
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=41xJ44vcs8gj6dHPKKtH9oxeNNPnqZeNo7PLWeO72wE=;
        b=HCt+tdopwIIisN8eztLCXykulxczPRfqkAVvTKEqg4Iv0L0dbu9DBxofaAFhmCxv8L
         yDGGV6UYXLj+6XB8puYFJkQFGlwx7/7FaBLcbqzmf6zoPPIzaFphaVAmAQqR0trfeWFy
         C8J7Fjaa5Qcg0FX571YJl3/3jlwWjjZNWcvTpk9msj94FfNrvta3/H/M4X9ZdT5lusZe
         f5vNVJ+LHIbDe32AkhfPTAuSMVa9kg1MmPnMEvcv5vqI3oUTS8vC/dfvTN15Pz+oCYph
         Srr+lXAOz95mjOeEMlVcq+u4ZxbpdWAjDcoLYkyMVMb28668KuWRCDQ01AyFtGFyrvqu
         scGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=41xJ44vcs8gj6dHPKKtH9oxeNNPnqZeNo7PLWeO72wE=;
        b=k/c/mpAyJ/+oxpBiouectRkh/AunYyOVm2z5nE3wO2f5Gv/2hY2CCOslTu4Kt5e1MD
         ZkccsW08lAZdGnGW5wiU7l20H+/pvdki4z7WjL18lcNm65TajzXKHkQ++q+W+GZEjFrR
         0vbxOIuYplenFBPdUGI3hugTaYskPoHEuybW2RtyvjSRuHDk4BZ39E+FJ9MiWZbLM8e1
         1gq417mqMVfj1C/NlKo9QlwPqEeig9fjSECOuJbmw2TS+gYr54iF+bwnnOSvujLmr1Vf
         6aDcboA0ny42UM7aUAOxnzCb9eoNJPoRyImuxRPql/Dv49gIvV2rFJN1d4WzHJgHkyIP
         IFpw==
X-Gm-Message-State: AOAM532u8R8Ch7snKqIM1r0q3ZQ6sUXUV+Jlt2VGInHDPFYwFvbFXBeE
	tPBioradMU8fBNlO7fl2s7dr+zg2G5M=
X-Google-Smtp-Source: ABdhPJzLFXhrwtIuhklgMIQfNqLN+owBoAsLkopGpgsOIIDC6n3NksIkKo6FcyP9o2OM/C0K/HJiqg==
X-Received: by 2002:a17:906:a845:: with SMTP id dx5mr4159ejb.543.1599081253195;
        Wed, 02 Sep 2020 14:14:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/23] libva-utils: fix upstream version check
Date: Wed,  2 Sep 2020 23:13:26 +0200
Message-Id: <20200902211330.4853-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libva/libva-utils_2.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.8.0.bb b/meta/recipes-graphics/libva/libva-utils_2.8.0.bb
index fbc5a0583e..78e3805339 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.8.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.8.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.8-branch"
 SRCREV = "af101a46d24c3f71a12b9f1ddb0c63626b19b3d8"
 S = "${WORKDIR}/git"
 
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
 
 DEPENDS = "libva"
 
-- 
2.28.0

