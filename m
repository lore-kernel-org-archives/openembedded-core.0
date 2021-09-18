Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.1827.1631988974104994060
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Sep 2021 11:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Du9x7ssa;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so12310463pjr.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Sep 2021 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BA8ne+tzVnewvVFeeBPsFnEPQYG1NJSCgMg7Ahh69bo=;
        b=Du9x7ssaKRbtPrf0QMh0olSlPtQh3BMWjtk2SvJgWFpbN7k6NLH4pBMEi9fI+WcWzQ
         JRdfPjeyJa6dvhzVemvGwEAr1D0sInOoIqdGkT6g3TJJncDd5fwVPJzmOkGU+5/47+qG
         BGkCYLzRmVD+4wf8Wg9DL+VWkYhb06BW16jqKM0J7JSkg5ZpwGP+60jwLL1wo9t5OLaY
         8pKaZ7hscwYMIEGVivfgI08f1nRzShFcDLmvHMxfy74U+saock2Dfp3kmf2FMWFQ7TOL
         ag0gLxm6W31BPithWsuIbjCDGxcaNAco6hXCzeSdUlvS8SwvYjOJsq9ByDe78t/4js8u
         LFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BA8ne+tzVnewvVFeeBPsFnEPQYG1NJSCgMg7Ahh69bo=;
        b=VU8+zSa03LM9v0Wkhr0N4UFXLHNVtBHHBfYJ0YLZU8tZPIMkcACO142/4K5IG6bvco
         V/o/Vh+k4ci3/bduj5CScDA9bAuNsOzip2OMCjHyde/E7oFZSNa6u80j6OAHhvq9IgK6
         7+YtLIx76PvMLYmQHDLWLUlPnJ6jC6OBV0/+3yVEGZsykeVtc54JK9HwYujJg8oW6Swp
         8E8r+rsd6rW8A7UUjU66pLPLnxNyV7r0GwsxO8Tg/dMXP8mvM/DKtSfIRBV0Q/otPGhD
         1JhNaS3iXbmb+Tg3EdAnC2tqwWIbr3hyQ5YmVLYREpCiMTkoKjVoQSjWeNZYol7EqmXf
         l5lA==
X-Gm-Message-State: AOAM5301xGePkNYXh/hB1b11wNxFtSxONSA4GSiUf5Rbc6Llb3PpOXBR
	fZhTew+Y62CTds17e8jpa4eT0JIBWAoUFQ==
X-Google-Smtp-Source: ABdhPJwjC8bb60Jj9zLIIMny9s4tLaouf60/rGHf79RkcJtUfC/l28JTw25+FaLmhMc9571TrYwTCA==
X-Received: by 2002:a17:902:bf07:b0:138:e32d:9f2e with SMTP id bi7-20020a170902bf0700b00138e32d9f2emr14831180plb.59.1631988973261;
        Sat, 18 Sep 2021 11:16:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id k3sm13815591pjg.43.2021.09.18.11.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:16:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] pkgconfig: Update to latest
Date: Sat, 18 Sep 2021 11:16:09 -0700
Message-Id: <20210918181609.3695676-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918181609.3695676-1-raj.khem@gmail.com>
References: <20210918181609.3695676-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Brings following change

  * d97db4f Update URL for bug reporting
  * eb866ad Spelling and grammar in pkg.m4
  * 1f81c80 Fix spelling of rra's name
  * 350515e Use https for developer.gnome.org URL
  * 834ecc2 Update bug reporting URL to point to gitlab
  * 38936b2 Call setlocale in main function
  * 2ad16fa pkg: Make ordering of output from print_package_list() deterministic
  * 2dd2b19 parse: Don't emit unknown keyword warning for Libs.private

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index aa2692b922..39b87ec829 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -8,7 +8,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "edf8e6f0ea77ede073f07bff0d2ae1fc7a38103b"
+SRCREV = "d97db4fae4c1cd099b506970b285dc2afd818ea2"
 PV = "0.29.2+git${SRCPV}"
 
 SRC_URI = "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=master;protocol=https \
-- 
2.33.0

