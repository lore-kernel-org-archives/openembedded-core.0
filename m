Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.8926.1614344480660032875
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wo0r3bNw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id p3so7385829wmc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=a16cZXFUJCdEGthtdYpFDaEoiGTn2Ql2Tu0mH+QSkis=;
        b=Wo0r3bNwTu83WOs6NNLMPe+GA6ASVpNLU80GRcyvmC6s6+4pAXeKXO3Xj+XXQuI/0L
         tA9VlylMT/J7+90zjVJKZPWpFmsKxcSWOgokksBSBBlQkOYxw/RTXTKqXaJ1NYsj9ULy
         vjiPbjYqriraYN6uRny8eQcIVMpDlFu8++F4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a16cZXFUJCdEGthtdYpFDaEoiGTn2Ql2Tu0mH+QSkis=;
        b=MmVH3HW45R3x5kadJ32J5qSPLDgbSZS3hPiSmftpdgq/X9UYSpjnWN+ekRWu8NRZY6
         uu1Mw053VbkkYyuN52tgqVs/70fCg/jHYXNuOU3j2G5bzCd9a945zvuQnGYHFYg7vFqF
         gD5BRYJ93BQZUvZ8MrgoNM8NtngDT2X6viKFleENr0Fkk4QwOdzp1gt9lConF9GNRf8H
         QhdV5Lz9XuZHjWbviO3BX6wS4BRoTaUhqc/Jg8MjwdsMzzhAV/zH8jR6SkEoyaoOaIiZ
         odUbvkBCp6lk5ODw/EijhCgeoB3TE+aNVOkZFxkHNwQwJKso0mEozBwd7sNXYs/kVF45
         AIEA==
X-Gm-Message-State: AOAM531ejEngvqMm2n/n/Z8DEe+kLhtNgPx96RD026+61r9Q4EIrgFhp
	84IakWVJCPIa0HqLy++jdmhJ0Sz88eAr5w==
X-Google-Smtp-Source: ABdhPJyCcyqtZ5tuU8TBq2SboBCZFlGr/ecu8D1/kbL/SjCBnQKCQImKs814ZY46gE2mHb6SnaefoA==
X-Received: by 2002:a1c:4903:: with SMTP id w3mr2767885wma.143.1614344476374;
        Fri, 26 Feb 2021 05:01:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:15 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/13] bitbake.conf: Split PSEUDO_IGNORE_PATHS to be more readable
Date: Fri, 26 Feb 2021 13:01:06 +0000
Message-Id: <20210226130106.3925837-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've had a lot of concern about the readability of diffs of this
path setting, refactor to avoid long line length.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 48af17fbf76..ecd4d1638ea 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -683,7 +683,10 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR}"
+PSEUDO_IGNORE_PATHS .= ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
+PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.27.0

