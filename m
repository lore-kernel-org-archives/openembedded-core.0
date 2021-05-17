Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.19513.1621260856712707603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hEQZzbPC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id y32so4717326pga.11
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wgELj2bFyuSxwcJDbQzezcS9geJHC9l45oasrmyXXA4=;
        b=hEQZzbPC4G8AYu3O4kctUpgP+e/6KHsryYIVRAAZzMlFuhObHSXL2HvdTegpnj+PX1
         qDSUgP8EBoPNLGdEYEvnzvsp4qJi707wpv2FUw6BTON3lkx5mtWAVEBomcOOSJlRyYq7
         I0do3gvN338cFdm7b7EinLW6ScaZP4vrk2aUlNVaz94YQ7j0ITBT4FiqzOTYC/V2RztJ
         Wvp4qNnsiAIP+Au5HzpjuoUutIC2Q2U7pYl7jK+2BtUnzL7W23hg+ihdYdlKtxOgE+4t
         8J3ume+jLtd1tYc8zFGWJC+wWZQw0dyuN0hhC+ZoBuEJOYJLna2BgyU09RaZmPSiBy0H
         zgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wgELj2bFyuSxwcJDbQzezcS9geJHC9l45oasrmyXXA4=;
        b=RLMSkVZuejgVFqOhEKaNBPLTVgiE+gSfZDJng7TYXsHNBnhb6QfW6EFtw2/ppf3BUs
         Kub7TFHL0q/K29nBVOFWOYX41w8lVbr1yPDiDXed1tv9Bdw5oj6Se+7GSAUGZOqYpYot
         4eK54ndABCwPBm8HIaxuGNC5y9iaVSZc+oRfty3ecEUiIAWlVh3UUgRipo+gtFrnDKzs
         ccuZUiajGK8vo2gu+LFHN4bqiYKxuGQKwxXvgtwee1/X6ZzD+WdhpM+Xq+gMibofBMWA
         oSwqtoSkixelRqqKNDxWY4v8g6S3xjmigKfO+RXqGUcAIP3p46JaYbIcxdyNWJjaFrfV
         Kqyw==
X-Gm-Message-State: AOAM532rDxVmn5L9HJcbJbk8m6uonKNDEB9YIA0qXicoUJTShoUE7/qh
	KDL4xIWrzNJQuRRnAc6wcx+330QTz5KxGlyXDQg=
X-Google-Smtp-Source: ABdhPJyx0+HFCNcGBNJ93mHpUjy7ijJGIdjQPJvQFnQ/W9tHz8LKkoj4brfB8znqLUv8smVBvGvruQ==
X-Received: by 2002:a05:6a00:16cd:b029:2d0:d876:4707 with SMTP id l13-20020a056a0016cdb02902d0d8764707mr24206210pfc.64.1621260855861;
        Mon, 17 May 2021 07:14:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/35] libnotify: whitelist CVE-2013-7381 (specific to the NodeJS bindings)
Date: Mon, 17 May 2021 04:13:13 -1000
Message-Id: <a6beac63da5294d02605100e6a47768c517280d9.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be04484f99a5b29cc9066e350b526fc4420ad6d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.7.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
index 0f2c3aa131..6b59029255 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
@@ -24,3 +24,6 @@ PROVIDES += "libnotify3"
 RPROVIDES_${PN} += "libnotify3"
 RCONFLICTS_${PN} += "libnotify3"
 RREPLACES_${PN} += "libnotify3"
+
+# -7381 is specific to the NodeJS bindings
+CVE_CHECK_WHITELIST += "CVE-2013-7381"
-- 
2.25.1

