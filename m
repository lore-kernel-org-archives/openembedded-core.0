Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.45028.1597677139025134704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dZaL3vdI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id g7so6535801plq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nQav603HBP/0rBP4jeLFWzyPPQOEuBrCetIReaHcM6M=;
        b=dZaL3vdIsjBOjVzulgSPPQleUtfOJRT/wC/Z+J+hnajpsuN5eRKuVY8t/G2tCIjakV
         3PzbHYc+TXOMTpnrG5bGyUjY468vdIQ2MnHfWuvQgTLZxfSo5hnMnXD+tLlA4JCMDWkC
         3YG2G8JPOuA99CLeYqGt8r7xP22IY1GKQytrbaclMOHTuY3X39wjcERfi/f0b+i3xOAj
         Rkrd5OKays3Q7DwdAU2H/vZnLEAa32ceDmJoRekt3deqD4SL09fvyXPeXNQZ4IUr3ybc
         3jHWNM+y3wAleFCw1OpxiGby1YmIMrUNVAAskK0b2/aLKKMrk6DB8aYtNKnHoJ5tE8AX
         fIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nQav603HBP/0rBP4jeLFWzyPPQOEuBrCetIReaHcM6M=;
        b=i6cKvgFYuCOiBEueFtsPkK5rExZUCzu0RNSOEUKNxNfuoeZOWw5VTQqX12cr3TWNjd
         t4jJViDwgnP2+u38xb+D4EEwgl9dOkzKOfGMBLfd1sa60VXoYNZQnVpoZJFfgFFjHCSO
         j9ohGdscHISi7Fo+hHVL8M0PXyoDmiCQi04OWDHF2ROS9jMdnuZBvhy+NY3Kd2Ay0HPr
         0WhmruNoOjlXGdw6nXS7wITrXowFBqKz1mgJtI/gvhhecjDU4Or5svTjfLuL6eyDyK8P
         6U0UnEiYjep7bdp86sg5grKe8KH8iVs2qYyHUJc6m8lFmyMPOfQGtV8bwvxm0uZl0/LT
         yHFg==
X-Gm-Message-State: AOAM531LgvF/nrUv6UlnNOvNHHXlt9M1hA2TAhHLRcX63jw5Pv1eNaqY
	W2oKA17RWOt/QBHcdxfx7CVRST3gB8DfpIVSLNc=
X-Google-Smtp-Source: ABdhPJzDItRHoB/sHDnuFB78H5623Ti05XarHd6IS0ODBNmHnkR1SSNIsG/kQZh7RWtIERy79EnBBA==
X-Received: by 2002:a17:90a:fa92:: with SMTP id cu18mr12571372pjb.215.1597677138213;
        Mon, 17 Aug 2020 08:12:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w15sm19547363pjk.13.2020.08.17.08.12.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:12:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] go: Upgrade to 1.14.7
Date: Mon, 17 Aug 2020 05:11:48 -1000
Message-Id: <787c7a2b355a06bc5d6d6fa30ccc37111c78ee00.1597676744.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597676744.git.steve@sakoman.com>
References: <cover.1597676744.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

CVE_CHECK_WHITELIST += "CVE-2020-16845"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91580c9d335e0fbee95f94be6f9b34298d3e9a48)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 64c2768f7e..8f8ed89de8 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ".6"
+GO_MINOR = ".7"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-SRC_URI[main.sha256sum] = "73fc9d781815d411928eccb92bf20d5b4264797be69410eac854babe44c94c09"
+SRC_URI[main.sha256sum] = "064392433563660c73186991c0a315787688e7c38a561e26647686f89b6c30e3"
-- 
2.17.1

