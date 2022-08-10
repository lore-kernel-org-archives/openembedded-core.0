Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81224C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 05:57:43 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.2651.1660111056405443763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 22:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D8rL9zrn;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id a8so13751713pjg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 22:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ty53ZdUNwgtYECrND+yR1jyBmIxMm1nk15eMROuxDn0=;
        b=D8rL9zrnEElt3N3D3YR41ZKYXYbC5F8t/Tf83kCK58IGhBbz5fiwT8wCCLy6QN3/7F
         QmfTZLWtqNZeg6dcWzMERcIa3X4tg9O+DPVnXBaSsa5M6wVoqXPloZPtm/JAjGb+Wau1
         aN6LWosGePWtvItqlh/EW3MqX0/zxBhW+jf+QIkxlm6+9WB1RBLcilud6XCnrJN5BFne
         hupEFnZ5DVLBgsCPBA0fYbbcx7CznXa5COVrxiCNsRf0tmuUgzy6Z3r+tK7Jy8lWfrnS
         ydMh2nFUuNJofZNdaSUmrlrs/TS193aZwhuPN1ymSBs5nlmfDRpoZjQ4v/O+r2f7V3Ng
         NiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ty53ZdUNwgtYECrND+yR1jyBmIxMm1nk15eMROuxDn0=;
        b=TzWVbDANjWQ972HyBPzXHIu8/+B3fj09oTT37Uho9W7C47S8dOXi8jZ5QHaU2ZCHU5
         PIRC8q7GCAPIWzjPa1eg9FlErCYuqGaSenNaoxJ8MnZGnB6y4zIfklgH9UI8WSfRWKQ+
         InznVMmSyFX63wfTMkoOs7VkN6G9N7uc3GGUO3VW3aubHjEAOdy529r8NEBaaCmKfxYl
         3HU3G6awU8X/elzmaj2Tm5rCyY3TzGzHlo0WGvDHJgOunaQ+bqp3qGGjCANAk0UJpSxx
         d6AI6Xs3usqeXv8BdnoW881jdb3rFlwl2i81tdGcYZk1hg29xfg6U5mmkK2qosj1X/kh
         wFBQ==
X-Gm-Message-State: ACgBeo3WxD5kOqF8gqArWfakpAeLPWsNUTrkD27/ZhXS07hnMK+f2oRF
	nisaB/8yXxkVVuv1xCwepXuOa3m+unY=
X-Google-Smtp-Source: 
 AA6agR7ktYnBDlQWHBDy49SGbJjoqwik3OwU9Q6RIpY2cmFb1FaJc/WdSkKMY3pFFF0ODDNTZS14qA==
X-Received: by 2002:a17:902:d503:b0:16f:1503:4815 with SMTP id
 b3-20020a170902d50300b0016f15034815mr26322007plg.17.1660111054870;
        Tue, 09 Aug 2022 22:57:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 10-20020a17090a174a00b001f22647cb56sm649569pjm.27.2022.08.09.22.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 22:57:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Package up gprofng
Date: Tue,  9 Aug 2022 22:57:31 -0700
Message-Id: <20220810055731.2753960-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 05:57:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169182

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.39.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.39.bb b/meta/recipes-devtools/binutils/binutils_2.39.bb
index 12a6fb55776..8eab78c3301 100644
--- a/meta/recipes-devtools/binutils/binutils_2.39.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.39.bb
@@ -56,14 +56,14 @@ PARALLEL_MAKEINST:class-nativesdk = ""
 
 # Split out libbfd-*.so and libopcodes-*.so so including perf doesn't include
 # extra stuff
-PACKAGE_BEFORE_PN += "libbfd libopcodes"
+PACKAGE_BEFORE_PN += "libbfd libopcodes gprofng"
 FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
-
+FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
+FILES:${PN}-dev += "${libdir}/gprofng/libgprofng.so"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.37.1


