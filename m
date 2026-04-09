Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E68E98FAF
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 04:36:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.124828.1775709398725604297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 21:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lCQKi99Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so2670975e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 21:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775709397; x=1776314197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NSdTslFuKze3OzY/QeW9XVzme+F2OPOiQQJApbR0Tnw=;
        b=lCQKi99Qrr2ybf0jjWDPw9fTZh8YXbxpJ/yx0FVEc/k9hInPOF1XkwDZ1w5PfR+RND
         HvBC9Wer0jBoxKbMNbUSAhLvcdhcEsoTZxBwwTN/AVWQGbYVRtGyoufczGrvG1Twq5JV
         54QnyTrLGvuQd+tbYpKaAGEF1ZBas6Ee3YZFYxwfzLWeDS5ZE0GNzVDKIsET/5I12rFe
         9L+UQ+PevoZpuXaPMa+ZjZIL7upJU1nc24tkATAZ/hYsMwygk+k5C/DkoPvrENo5TeWp
         DQaEBGOE6rC7Og2zOyHq6833zh4xJGLupuFqQd86Lg3hikNGXyQa/T+5QuyaerF/vaX9
         CeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775709397; x=1776314197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSdTslFuKze3OzY/QeW9XVzme+F2OPOiQQJApbR0Tnw=;
        b=hsJKdy9CL2DZIHgnleD9NQoOSZ/u0r+275SzBv8QAwK8snwD0eRMzJzJ97zQI1A2e4
         vw78kj9+0MA6rVCgRZiGcVAQE+nT9Curl/xrEYFXJQBULODASjv5zs4k8DUrijCazaj5
         6H0PveErHeqFZJALA7mvbcYu9mIfKlfSFxVPTAi4NKVGGcZqO/efBVHrHEZ79Xb6sla2
         X6rU9KmvHp5VrnRkHb1IOLFt45O/AsIvioVdYf0sGmux5cljiKzPiGx0OTPmI8W/FZFq
         VJ2KKkubmiheFnCdBLK6QnZUBWm6qBdF5+2qpW9nbB5ofsbWDavr50B3XdO9e/5XY2oh
         DeMw==
X-Gm-Message-State: AOJu0YyKhOZfg0j/FE6kC4eYVaPgtyLPJeQb3tJ62FVcZmAirb5CtdEG
	3ckvDX5UtUVR7bu1wavrXHwweAM3WIwL4HE1ilykrgIVZNEKU4qqisBOoS++Og==
X-Gm-Gg: AeBDievVMKDXrw19XyFx9e2dGJ4tmZA8397MajaKgKy9XFLqbBTwvdNflb2QdzkxAZm
	Y44DPMFCX1YFFf3DHf0B60caoiwrLGYtBL2w1frUolYM956xDJvgc+LiLhXAHPJfeir+UkmesrK
	j49lip2xvZ792k7e+rMTA5fxHSYgvcKRnMpWaVzVE8nJlYzp2bmmJZs6hyNzgu4Hni0tW6bNW/w
	bzvw+I2Y5onNQA/uTeVnQ3P2xpDv7X98GpUxFlu89Mtcfhc0F0fYj61IdajDjDWO7O4pYgdVyH+
	Qs2fQRU7t5bLU9uqJmb6Gr1iU2QGiNBJzMey+EGKuIpdXugfF5xLZGbJNDzCl5OniM86vc6pSfn
	zWWq6sg6dN5BiiJramLRAuC0dF4JWQgJ8SBNzOK6gJLh5tnc3m+GNAPUugNVT+tN1M8Q3J9/kbh
	ZDvNwa8Gbzby2l
X-Received: by 2002:a05:600c:8105:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-488cd01655bmr26861505e9.28.1775709396740;
        Wed, 08 Apr 2026 21:36:36 -0700 (PDT)
Received: from term011.lan (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cf8612cfsm23449365e9.0.2026.04.08.21.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 21:36:36 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] gn: Disable -Werror
Date: Thu,  9 Apr 2026 06:36:28 +0200
Message-ID: <20260409043628.1529262-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 04:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234874

With GCC 16 and GLIBC 2.43 on the host, this error is thrown:

/usr/include/c++/16/bits/stl_construct.h:88:9: error: array subscript ‘std::mutex[0]’ is partly outside array bounds of ‘unsigned char [24]’ [-Werror=array-bounds=]
   88 |         __location->~_Tp();
      |         ^~~~~~~~~~

Not even the latest version fixes this upstream.

Add --allow-warnings to the python command in do_configure
to disable -Werror during do_compile as a workaround.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/gn/gn_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 0b139ac5f0..852c095861 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -30,7 +30,8 @@ do_configure() {
         --platform=${@gn_platform("TARGET_OS", d)} \
         --out-path=${B} \
         --no-static-libstdc++ \
-        --no-strip
+        --no-strip \
+        --allow-warnings
 }
 
 # Catch build progress from ninja
-- 
2.53.0


