Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.26006.1594156179419577767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 14:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Xy9O+c+7;
 spf=pass (domain: linaro.org, ip: 209.85.210.194, mailfrom: arthur.she@linaro.org)
Received: by mail-pf1-f194.google.com with SMTP id i14so2473475pfu.13
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mQUkfHasj1a89Xpdy9wVk6jz0oQYWwaqbjs0ioGWYLE=;
        b=Xy9O+c+7xqqQ3y45h0oug2Th8Zd/hZjSNYpmnn8zZXX4abm/7kh9Tc4DC8d6TPUMHq
         DMPjzd0JODJdPQIwAHK3M+fxQMQFwXuG5yDP/fWa/IoUoDdMmTXeJOcfyPG+nl68gZ6q
         Or2Qo7bXYuThkXDRuhtW8eZJnjHus1vFGFdFRquM3Jihvgf11a1llFX901deP0vvdXYZ
         fWx9e1FaxgAK/ZUc+4cUBKlk+Aib57niZwm152mltkUfiUyKzHsDZtUjmRCENXCm9RQN
         t3PtEuEVm1Y6X+5xF6S2HQ6+y02z/2AvvwIsTmhjnwiNE6jrorBNK9FtEDwBPMWb5fG4
         ycbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mQUkfHasj1a89Xpdy9wVk6jz0oQYWwaqbjs0ioGWYLE=;
        b=UWBwwQ+tTGacVE05IXdE6xqfbMXQcydL5Z6QxZKe9rJs1oOrpxeSdaT+eNZsBQEc1S
         xTmgFKqWikGIeXqmZgjZBpnm/l1z2QWddK9FNlr0jur2vRr0AWOwTYXw/wE8hx99Ymqh
         zw/l/Y+7u7hNBzF9i9Y9inoCf08S75wEQ72o5XFWLPA9CpYRHgCIx5Ni7HwP/lXWXf7u
         D17fzDjs1uMQbKoaFChtCNf6BP+4752eux0SDet6EBW7683eD/PwkOf8EsyQZlwoRqSp
         ceyQkv8fcDbMIKqrNU9dnu34su+PwlNAFbIKh16DXILY1PyznAW9fj5mT3KtfVng0uB/
         e4aQ==
X-Gm-Message-State: AOAM531rDzPXGY9Y8K5J1FoqxwQvQJFNBYnF81aq0MeGHoBW/talhZ14
	IopfMereiUUKWu9Hh0inmazThqFAeTBgqg==
X-Google-Smtp-Source: ABdhPJycUyIHQ7eiHL1xT/WuEml+NEXrwPoUqnzI1ciUr2DQkkh5t2H/VR9yGNLcf+y00Rmca9lZtg==
X-Received: by 2002:a62:3587:: with SMTP id c129mr11056224pfa.212.1594156178668;
        Tue, 07 Jul 2020 14:09:38 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id w9sm24025840pfq.178.2020.07.07.14.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:09:37 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [OE-core][PATCH] igt-gpu-tools: Add PACKAGECONFIG for Chamelium support
Date: Tue,  7 Jul 2020 14:09:17 -0700
Message-Id: <20200707210917.231615-1-arthur.she@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chamelium is a hardware device that can be used for external display
test automation [1].
It is disabled by default and can be turned on through PACKAGECONFIG.

[1] https://www.chromium.org/chromium-os/testing/chamelium

Signed-off-by: Arthur She <arthur.she@linaro.org>
---
 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index f60880c292..29031e64dc 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -20,7 +20,9 @@ RDEPENDS_${PN}-tests += "bash"
 
 PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
 
-EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled"
+PACKAGECONFIG[chamelium] = "-Dchamelium=enabled,-Dchamelium=disabled,gsl xmlrpc-c"
+
+EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=disabled"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
-- 
2.25.1

