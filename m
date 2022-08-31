Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A4FC3DA6B
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:31 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.26455.1661956827373645622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=tZFULgiQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id l65so4253634pfl.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=V6AAW5ROFzyPboVdWbypU/QYwFUYrPS8I0gw5dewtXQ=;
        b=tZFULgiQuA6dYFKHeQiJpZWMb9cDIa3tbysIdiiiFgXMPFGBYkLDr0mXLLo8wZhH1G
         S27C6OIe42YtsXxOcJ5QZs0ZNs+pemA85PG2EWQGl+fMMVGDgBBUdkcWHe2QSVszwy5b
         y/SvB60UMZDKoB8G0eVKZYhOFpTIEC+1UWeJw2UKwfqY7xh4VuzZ6rtZBc6Hkumf4846
         q3nqrQ158qkvJIlxeYfCSmkh7RcFYzdaDppt4RPz6RAfQERg5e10VI3dEQxmvBzdQ2hI
         4pTDOy27D5EPOeBnM224HDmaSFkNlpK8pY8t4gb9oeRLnqHUG8Yq4ckifw9PSJ6OUi3L
         nmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=V6AAW5ROFzyPboVdWbypU/QYwFUYrPS8I0gw5dewtXQ=;
        b=4Zf2SPyKveuaVNipo6USx8eFUnnP/45yvSLt+jR8pvEJ4ZDvr1v+9N0R7svT5A+34w
         0I17ZNtZStxa+3toYEpv1Ws6Ja9YTvJjVQaL0/6YTO01xKqaWhhBGFEeziCa85yGLrtq
         hcdZxPdjfMusnqDXCqOOiN+6zs11sNC9sdmpprJLH9DjwP3ttyUI6vEAiJQBBxmbwOjH
         b6geXi+CQcWthlD3qtshrGczntUQc5fvZg9F4tmDM1oujgJY8hF+x5BRakJJ+lf0xlXg
         klQniDMeFpDGM9KJTGvD7i/m+ScECeKMT4uhSblPwLWdVzex0ymxK1IZVIJPxW5JuChH
         bPvw==
X-Gm-Message-State: ACgBeo2VWG3Ddfox/ZFv53PpjBHzSTmG208jGh1D94a3o5kPZg5MrHTY
	9NRHDdaR5ABKebv9aiFej65hRn53NlQrK9Mt
X-Google-Smtp-Source: 
 AA6agR6f2k52LGJPYj1t/B2+9Pb1qt84xwt8awtOD90T9yyKuqtupRPCI2jV852oPrupqOiCTRX4OA==
X-Received: by 2002:a65:5883:0:b0:42c:5f0:92f7 with SMTP id
 d3-20020a655883000000b0042c05f092f7mr13450050pgu.93.1661956826476;
        Wed, 31 Aug 2022 07:40:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/19] watchdog: Include needed system header for
 function decls
Date: Wed, 31 Aug 2022 04:39:36 -1000
Message-Id: 
 <0e0f98ca39df9448f87720bb24ff15d1f2864f72.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170127

From: Khem Raj <raj.khem@gmail.com>

These headers are needed on musl too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a53722b962e79e0831c0fba24ef7c1cfda24971a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...guard-sys-quota.h-sys-swap.h-and-sys.patch | 37 +++++++++++++++++++
 .../watchdog/watchdog_5.16.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch

diff --git a/meta/recipes-extended/watchdog/watchdog/0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch b/meta/recipes-extended/watchdog/watchdog/0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch
new file mode 100644
index 0000000000..8c419e1d11
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch
@@ -0,0 +1,37 @@
+From ca1d379fa13c4055d42d2ff3a647b4397768efcd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Aug 2022 19:23:26 -0700
+Subject: [PATCH] shutdown: Do not guard sys/quota.h sys/swap.h and
+ sys/reboot.h with __GLIBC__
+
+These headers are provided by uclibc/musl/glibc and bionic so we can
+assume they are not needed to be glibc specific includes. This also
+ensures that we get proper declaration of reboot() API
+
+Upstream-Status: Submitted [https://sourceforge.net/p/watchdog/patches/12/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shutdown.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/shutdown.c b/src/shutdown.c
+index 1d9a857..6aea0d0 100644
+--- a/src/shutdown.c
++++ b/src/shutdown.c
+@@ -29,13 +29,9 @@
+ #include "extern.h"
+ #include "ext2_mnt.h"
+ 
+-#if defined __GLIBC__
+ #include <sys/quota.h>
+ #include <sys/swap.h>
+ #include <sys/reboot.h>
+-#else				/* __GLIBC__ */
+-#include <linux/quota.h>
+-#endif				/* __GLIBC__ */
+ 
+ #include <unistd.h>
+ 
+-- 
+2.37.2
+
diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 1163846ed8..26fcc10487 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://watchdog.init \
            file://wd_keepalive.init \
            file://0001-wd_keepalive.service-use-run-instead-of-var-run.patch \
+           file://0001-shutdown-Do-not-guard-sys-quota.h-sys-swap.h-and-sys.patch \
 "
 
 SRC_URI[md5sum] = "1b4f51cabc64d1bee2fce7cdd626831f"
-- 
2.25.1


