Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.8177.1599689833639881403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=qT/Dtwyv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id cv8so2387392qvb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GecFEHaeTomUMmg73mFUSb1Df0qL16y0DyD8ShzA1rI=;
        b=qT/Dtwyv4+S0obQZK25PycfEJt+4l8/YO+gVy4r+Qp6Q+rLzEw0MNvNgsxGKbKTM+i
         yTLcvloVohTL4p46gwBOgwR5ahNep/Awt68tk2smHXivvIymZ/wGlO30httTZLxNOjdG
         Qrd7EfaQN19rNGkzRy5lx3xfEN6ecKpXgbTUeHo8O2JKGmf0dH9UtynJivAHohi2LoBi
         82wAzEhCLKf8IrS4KK7aRB6y6msh5gAmcBXEsKFHwqURmNqlIQhX/BFdgnCU924jjFpY
         1VmWSdKUI1G9/JQ5B23tHk7eJIIdZPRkOrEAOkz0WTFNt8LQpgeW77s/cBUOj7RkA5Nv
         oGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GecFEHaeTomUMmg73mFUSb1Df0qL16y0DyD8ShzA1rI=;
        b=Tc6TErE0xbz/D6DnQVsIJh+2/HM5ek3Bi5xz7OtcKo5dTJvrvSvvVXRZvT+EXCf9IV
         Sv5JCyjjQekHq6TVVMPd0M5y+u3ADhrhljsF5sxauAatkRpMWsJotqRdeeHGP4tsbrBP
         G0trcspPLiXoPc1uQwanabUoVs1pO9rjgTkURMTr2QL6CmWqgKYCz8iHlSgJJh8bTS2X
         v9Vzi5dB+vHkH1WZPWlT2hOw7FbzxCZuuhliz1Wl6B7qe8o4xMF1RBD8e4XDykIPFBVj
         oLTlOP6vLy7yTpmTegXg1xkNlZU/CgqwC12SMpL1Wn84OUpE6JXcH3v+6f9Inkj35yt2
         F/cg==
X-Gm-Message-State: AOAM533tlzcQdqna8JLYdggJ3tt61//8toGgfqHG5nhS1UEbpwpFeub/
	nYtsRcxiTRJRoDiFNYfccFZC2DgudBEzhUQM
X-Google-Smtp-Source: ABdhPJx21y/mtUnAD9kw3THrXK4Cv60YumD9Gh+6/U5Ij/GIj3p27UU/6L+r7do2M2Pns1AagnMxkw==
X-Received: by 2002:a0c:c24a:: with SMTP id w10mr5996130qvh.99.1599689832585;
        Wed, 09 Sep 2020 15:17:12 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id f8sm4136220qkb.123.2020.09.09.15.17.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:17:11 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] tune-cortexa55.inc: clean-up ARMv8.2a uses
Date: Wed,  9 Sep 2020 18:16:50 -0400
Message-Id: <20200909221652.6750-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909221652.6750-1-jon.mason@arm.com>
References: <20200909221652.6750-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove 'crc', as that is implied by 8.2 (per GCC
https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html#AArch64-Options).

Also, the PACKAGE_EXTRA_ARCHS should refer to the ARMv8.2a version, not
the more generic ARMv8 version.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/tune-cortexa55.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
index b383eb733b72..66a5d0c437ee 100644
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ b/meta/conf/machine/include/tune-cortexa55.inc
@@ -8,6 +8,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES += "cortexa55"
 ARMPKGARCH_tune-cortexa55             = "cortexa55"
-TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55"
+TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
 BASE_LIB_tune-cortexa55               = "lib64"
-- 
2.20.1

