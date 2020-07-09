Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.2935.1594260819078109954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 19:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xoz8VjSC;
 spf=pass (domain: linaro.org, ip: 209.85.216.65, mailfrom: arthur.she@linaro.org)
Received: by mail-pj1-f65.google.com with SMTP id ls15so405234pjb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 19:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KvvVhHTBmiPha3EQPr5VjRwWJJFxLrEnFSK8Qapf4lQ=;
        b=xoz8VjSCcHY+j4tkrBcLk2dHShoSyH0swADrb0kRaqYNBLUD6XRCmFuY0Q6xMMtF6X
         yiemxu/yPVvIPe5BLXIkfBvDbl8dkbZMPVfcWQA/7KUVwWfhzbbxqYR+NBGD8ruxBFHu
         YHmaRFKQwl6ZduGJCNZ781/YtOjeI2SR84e/7RfGDtcPluw26SANKqCWhFFCwwJlmvHZ
         bWR6bYN+2gnEMDzPxboC+IH/dfGK1eaofnjKOfVZPuYRrNd2owU0DnocWG3eOiRg76Mc
         Uwktlw0bnP6xcTabXzXoI4Jxq9NyXs+VONwtV/QdSbVw4EQ5Fm46gYiIMcPLCftwxiPu
         V5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KvvVhHTBmiPha3EQPr5VjRwWJJFxLrEnFSK8Qapf4lQ=;
        b=Hx1hdaWIUNJwpu4wThZjRLtNdAYnz/6wtkllc4BTdewFR64Olu8Q2M0MwMmUe3Jk6/
         jz3JQcrjJ9ID3hGod3l2LeivIg6EM+T2seWudPE/1ZbccjwcCzCUOoKDUg2zBq3M4jHV
         XfIvS6Kuj5PkrpePn78UDJN8X4GwUAlmBLwwqk+ppJtfLcgK5+9pN8ZalWMbo778eK6D
         TvdoHppzb4XQP/bZQaHqFUSIS1Po6lPLctW+KIUI26jbzCzNFMkzkPOEIJAisR83xZdZ
         teRh5mZyCMR0QIyUAnaHS5FCBYPKXW52BlvNI0QgMgqFpi1pWNnaqhWqMHmRa8HDRXBX
         NBbQ==
X-Gm-Message-State: AOAM530B0K6gAEeqgmtpKLrqoiCMFecRs5qVmpqpiVIICjdZTG5+Cu5U
	yJHxuMmObW8aHx9SWRHYMS9kWmx9jo2Z9Q==
X-Google-Smtp-Source: ABdhPJyUX6dbbDWJyC0neYaZSCGnN+R4CBzzc/1RxQ+Cgc6gSi5pYu5N3ANfukRmrMJucsDrAF1kTA==
X-Received: by 2002:a17:902:8641:: with SMTP id y1mr22253530plt.336.1594260818265;
        Wed, 08 Jul 2020 19:13:38 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id k71sm713278pje.33.2020.07.08.19.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 19:13:37 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [OE-core][PATCH v2] igt-gpu-tools: Add PACKAGECONFIG for Chamelium support
Date: Wed,  8 Jul 2020 19:13:28 -0700
Message-Id: <20200709021328.2927385-1-arthur.she@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chamelium is a hardware device that can be used for external display
test automation [1].
It is disabled by default and can be turned on through PACKAGECONFIG.

[1] https://www.chromium.org/chromium-os/testing/chamelium

Signed-off-by: Arthur She <arthur.she@linaro.org>
---
 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index f60880c292..89480d79d2 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -20,6 +20,8 @@ RDEPENDS_${PN}-tests += "bash"
 
 PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
 
+PACKAGECONFIG[chamelium] = "-Dchamelium=enabled,-Dchamelium=disabled,gsl xmlrpc-c"
+
 EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
 COMPATIBLE_HOST_libc-musl_class-target = "null"
-- 
2.25.1

