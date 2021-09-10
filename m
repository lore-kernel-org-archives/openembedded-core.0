Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web08.9699.1631282896216993430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qWbpE2FS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso2346146otr.13
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5nWbX7VQ8IUFlWHQB/SxnO876EqMuL4a3j7rNauBZcQ=;
        b=qWbpE2FSwTJ/QDk4ea7oDU4jeS1iyBgaKVFPUNPXY+NWaqLQ8DYKSEc/x5UI4eocTK
         bgbqDX/KRd5LFlRH+iP8lRLXUVWhl0ygpksBgee4G7SNnsZ4utgIeK2iNLlItLyO1h0m
         5xKMTnMJ5PLQk5t585+r2AJPhTrbQqyh4xKqWJvvSffrcMEEdK8rHxHDOHuApY/Fut53
         wHthdIFHR9hmXKJN4CJjlJRPxmX/HorxMhq/lHlbwbO5Fv3CKP6ENB4kKsI3Izia7ZOK
         0X4PktLXXBldzRCmywX5dDOVFcZs8FvR9ZLEt8hEAsbuxMbOf8EFznT3H58JZTB73+83
         WQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5nWbX7VQ8IUFlWHQB/SxnO876EqMuL4a3j7rNauBZcQ=;
        b=jjT46h0Ra1K4j1kOeb4ZandEIxstepFxv33FtGuJBHAgKjUt21o0VcdEaUAuGMtZkA
         TCtdMxbkGB2WVyJVyD7Z/5zxaMXPY8jMs3PkYvU1BkElQqTq2gym2diURJqQt27FGhEE
         aJcRh0tTkkWDqsdbXaIip3wUG/EcmlQiE+qgoxZA8xxG4m7KFmudc5VRsgUiaEWsZbL5
         cPqUH77SkXPd6mI4yQCaxawfrFKAr2yWJGmP7WWI6JG5cu6R5ozg13ZEsfk+Wom8GnN+
         Dtk0oENWqRcez6zs2AcvmQk1Yppk7VIZc9cpvkPtnPuAbKkecBPtZHDhBOs8ZHUBcHIa
         Y0DA==
X-Gm-Message-State: AOAM532ZlgqXolZvqdAhXPyVpGMHco4cxFVbVOITzQmy/iPNG+Ggxp7U
	vSne0zMv4E4b2suLb3SUq1DaF8OCWtgc7HzC
X-Google-Smtp-Source: ABdhPJzgTuWRFrKtgTtIPn1rtH0vMSxPIc8NCgwuAYfc95Yzw5m1R+jyFDVgGplYAnzLwGqAUEtebQ==
X-Received: by 2002:a05:6830:2428:: with SMTP id k8mr4889143ots.57.1631282894760;
        Fri, 10 Sep 2021 07:08:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s198sm1248831oie.47.2021.09.10.07.08.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/9] flex: Add CVE-2019-6293 to exclusions for checks
Date: Fri, 10 Sep 2021 04:07:17 -1000
Message-Id: <425e9b5d5d605dc69f6a4def45cf24c4bab65c94.1631282682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631282682.git.steve@sakoman.com>
References: <cover.1631282682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

CVE is effectively disputed - yes there is stack exhaustion but no bug and it
is building the parser, not running it, effectively similar to a compiler ICE.
Upstream no plans to address and there is no security issue.

https://github.com/westes/flex/issues/414

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0cae5d7a24bedf6784781b62cbb3795a44bab4d1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 4 ----
 meta/recipes-devtools/flex/flex_2.6.4.bb          | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index cf07acce1d..a6f52b5de7 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -61,10 +61,6 @@ CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
 # There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html
 # however qemu maintainers are sure the patch is incorrect and should not be applied.
 
-# flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293
-# Upstream bug, still open: https://github.com/westes/flex/issues/414
-# Causes memory exhaustion so potential DoS but no buffer overflow, low priority
-
 # wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879
 # https://mail.gnu.org/archive/html/bug-wget/2021-02/msg00002.html
 # No response upstream as of 2021/5/12
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 1d43d2228a..50d3bf8de1 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -26,6 +26,11 @@ SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c4
 UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
 UPSTREAM_CHECK_REGEX = "flex-(?P<pver>\d+(\.\d+)+)\.tar"
 
+# Disputed - yes there is stack exhaustion but no bug and it is building the
+# parser, not running it, effectively similar to a compiler ICE. Upstream no plans to address
+# https://github.com/westes/flex/issues/414
+CVE_CHECK_WHITELIST += "CVE-2019-6293"
+
 inherit autotools gettext texinfo ptest
 
 M4 = "${bindir}/m4"
-- 
2.25.1

