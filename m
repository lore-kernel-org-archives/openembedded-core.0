Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F8CD63954
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:58:04 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.13874.1732111082076024334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G7xk7khP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cdb889222so52940515ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111081; x=1732715881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zaN/Yzylp6P9P7K9tZ0wt8u7JVehowjRpt2dPX8B0o=;
        b=G7xk7khP6cjErQyFdnuW65PFU7eWv7Gc8VHZ8kE9guadHCWXyGbK4tlaWkdMKDxh3K
         5Ckf0dgqy+PjY+X6gbmcgmQtYv7tYmi4RausZW15J7WJrNMGob6Mpg5DYXg9MznKRKYe
         v216gHzUPvykiLwl7zIjb07J/hTQmP5ny7KLbr0E6qpXxJcsr2Raz5nw3uTjU4ttFz4y
         8Rm8PdiVEF6Z11OMeVhbZN6UWpiRV6plvMhv+xJmbE2xKX4ygcUgO4vokI75QbmAzlKU
         n/T6kYbAl1cwZieoPL3xcWch7JOEj6TnLWfcatBmLzptTdlPfDj/CF0R/AQREVi+ysyY
         bYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111081; x=1732715881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zaN/Yzylp6P9P7K9tZ0wt8u7JVehowjRpt2dPX8B0o=;
        b=hXzEaCJZ2vrWwXcSgSGFrHF576oHetuXj3nuI1gJl9bc8kCjbVAZPjA2MQLMuLi0X8
         ZAVxCP8vgwNTuwbVDGNDg+oSDJ2W3vQ62gObF3eIbCAsRazu7sNTHOWebx5fBbQPKWhg
         4nGf9czLp3n8vK6eb1+V1nROnn1xef8yp7+roGP2Ju4rye5FQEKyFQ0obGzHW97rNZ0w
         tdDi5cU7YSYASWc22NireF1CVUO9YnR5I1150BWb+ptKH/hrWH5DTFa/0wHLCWJCEGMj
         2MkBXgTgd5nEBtP0Y+zq4aTpk4IAnOs2sSOC1Z/4+uJZtFQfaXrYuVfW852jmK057XxH
         fbhg==
X-Gm-Message-State: AOJu0YzZZYcQjD7ooYLHNV4Zsds7cVp9CpIZM0z2d+SOPw4nwsB0iycI
	m2fkHqnpe+s6TnVaM1vGI1NlnnLpQvblvfwsY76iEFP7zUwrNiFA76A8ZPMITrpT2blSKDiyYR6
	d
X-Google-Smtp-Source: AGHT+IHyvqh+qqglnesDTO0ElVjkaNe6Zf+6yG9kwpHx4WlD0X3mIGvu5FSOTnv1DdXkWymgnZqIeg==
X-Received: by 2002:a17:902:f690:b0:212:5132:9699 with SMTP id d9443c01a7336-2126a389a7dmr39769315ad.24.1732111081281;
        Wed, 20 Nov 2024 05:58:01 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.58.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:58:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 29/31] weston: Add missing runtime dependency on freerdp
Date: Wed, 20 Nov 2024 05:57:01 -0800
Message-Id: <c7434957da71c6816f2ca864a2414c842e9a0a7c.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207453

From: Tom Hochstein <tom.hochstein@oss.nxp.com>

With rdp enabled, nothing from freerdp is installed in the rootfs, and
rdp is not usable. It seems there is no actual build time dependency
other than the meson check itself, so add an explicit runtime
dependency.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23271a1f908a223b4eb56d6034cbb1ac23da14fe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston_13.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_13.0.3.bb b/meta/recipes-graphics/wayland/weston_13.0.3.bb
index 19b242d01b..471dc52bb3 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.3.bb
@@ -62,7 +62,7 @@ PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libx
 # Headless Weston
 PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
 # Weston on RDP
-PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp"
+PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp,freerdp"
 # VA-API desktop recorder
 PACKAGECONFIG[vaapi] = "-Dbackend-drm-screencast-vaapi=true,-Dbackend-drm-screencast-vaapi=false,libva"
 # Weston with EGL support
-- 
2.34.1


