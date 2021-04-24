Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.1030.1619283419677480089
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 09:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R1i/64n5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id h4so42438046wrt.12
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e+tqOqWJRsfjtSFOsiipnNLGoHLIvHMlzdmifrAAjeA=;
        b=R1i/64n5Xl6nS8fOv+5WsI2W/cUOPk008JHkpBAlnyY3VPOT7jVXSkPqur7cHGXz/H
         55s4uFzYCH6RdmKQx/Jc0/+pWdCuiV0zw3CQOShGHDmCu+SbARyyqrd4d8JzIXCxjVw4
         qwuqw4wi7Eo68qZmevXDicPTGS0a4hWriv/8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e+tqOqWJRsfjtSFOsiipnNLGoHLIvHMlzdmifrAAjeA=;
        b=nZBrKS2VQflKlF3TDoQJueNKgXi/sfdDQdG4L1aevyk94APNHwM6mZ4lv3lnU9Kx09
         C1OQN92fqAcM6Te5/6qA1rb5V4fn4XJjTcGf16V4hvdvj0yPDnkCM8kKERDBtXEh6ZGo
         RfT/eEYxpXMER2zUh1PgksVsUBYWKXAqcRZnNWz6lJlq3KSeRq0Ho0AiLu2554pxaydv
         9WgIGnA7keQ8+18AbGRfmdSPdcGBYK8f05reCFa8cjQxF9ImxSMNFdbGpZbEvASp5HWN
         fSNSFN77bKKR6qZWVM5ZLH9q0mehN0Cbflk8kk0sthbeqUBeYzftnL0eUGbsYr06gPKB
         i86g==
X-Gm-Message-State: AOAM531iTzNhceAP9/8F+6bpTjQZ5dZ1s7b5pOOY4n0hI+Tzn3+ewWU0
	MrnZezo9pi6qGSxI/5Ym1wFHj74NMw4KzQ==
X-Google-Smtp-Source: ABdhPJycfQXNyxTf/0SDyY5g2bG3lU84sqt/pcbksXXJsatDR0WE4H7PM5cwFGBMjrrt1AW/ACiDfw==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr11877707wrt.207.1619283418099;
        Sat, 24 Apr 2021 09:56:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5c62:6d9d:139d:d68c])
        by smtp.gmail.com with ESMTPSA id e18sm14006059wrc.85.2021.04.24.09.56.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 09:56:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libseccomp: Add MAINTAINERS entry and HOMEPAGE
Date: Sat, 24 Apr 2021 17:56:57 +0100
Message-Id: <20210424165657.1650447-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries for the migrated recipe to passify the various checks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc            | 1 +
 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index abf1d451045..4eb1dcb0d53 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -378,6 +378,7 @@ RECIPE_MAINTAINER_pn-librepo = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER_pn-librsvg = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-libsdl2 = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-libseccomp = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libsecret = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libsm = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libsndfile1 = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
index 667d5da8242..98b2639742b 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "interface to seccomp filtering mechanism"
 DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
+HOMEPAGE = "https://github.com/seccomp/libseccomp"
 SECTION = "security"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
-- 
2.30.2

