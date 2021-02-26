Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.9995.1614349648734034630
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fpKssF6N;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.181, mailfrom: steve@sakoman.com)
Received: by mail-il1-f181.google.com with SMTP id z18so8130251ile.9
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vJ9XWYdPo3iDRS+2M8BwdM4yeR8TVOf5Rajt+iT27iI=;
        b=fpKssF6No1o6Mee66oEipwktzVOO8OotjrD+GzHkZSuBdTrnSFmzOiaeJrsAF6q89m
         FMXJEC+Mpb+dbRWZ65/87/22zmOp12sQP6RaUA6vSAM2JG+8dWATyYn0xgLfz+AGazKy
         qMUFW8VyZK8kKeHf85AH2TYEXjMJgc2t+BXRHZfO7Sm/V8uCa+sBNRO1xmkOp7gdiyoP
         jP3Mw6LaDozmy1jobEtmAdWnLoggog8Ymqmq4Bl6pO3CKE0k5gzEHQVMT0eKIAoiCYDj
         gGhiNth5BEqiq9NseOE+S9p7m1N801CWdUnm2dFuWs5YP+uMLpk2/HeXBpMDlbjxgF4+
         dIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vJ9XWYdPo3iDRS+2M8BwdM4yeR8TVOf5Rajt+iT27iI=;
        b=J5KnHon1RQDtJIYhaAE00BPg9Y6Z5pChLWQB2WMdr2Lvq7EaaegNM4cP4zOL4OO9DS
         Z5LCIPwAFKqpikq1j2NzRfSCbnwHOy1sq8bizK+EJUjRWsq9VImnJ4FJ5ngJLnBcWyg/
         lCbpFv82Jp7msMTAJaRYVpekLpYT1bvAjEDEqXFhj5miwhqfZzbZ9n8gG4ffS3pZoMk7
         w0id1+RqezCZ/8YH4hJlGMTytI7eOqLABIrgzaEC7bI83VbhC5F+DXJRqZ4pNdIYTY4N
         8agR6WGrQVPqTZ+0T/RV0gQm5ynoiEDivCNZXu7TkY5wtgbi8Wru1gi0fmCglbayuuhi
         ofzA==
X-Gm-Message-State: AOAM530sDsg+xZXChr2utIycfMPzV0qbrVG3itFJUvk51741ezLT/bDs
	YtjT/b8NhCbCpBIb6jLqKbKwjskS5QYtH1R/
X-Google-Smtp-Source: ABdhPJxjJd7H7XJTAysD8vVv0DY7QQJb2PSqtHvFwH8GTAQU6KCPUDRGIpMEt2T7QWSIetx5awonzA==
X-Received: by 2002:a92:b70c:: with SMTP id k12mr2832612ili.60.1614349647667;
        Fri, 26 Feb 2021 06:27:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:27:27 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/40] local.conf.sample.extended: prefer INIT_MANAGER
Date: Fri, 26 Feb 2021 04:24:12 -1000
Message-Id: <f444106502f504ded852a95adedcbbe0301f7f0e.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivien Didelot <vdidelot@pbsc.com>

Since the INIT_MANAGER variable has been introduced, there is no need
to append the distro features and set the init manager manually.

Replace the busybox/mdev and systemd examples with the 4 values
currently supported for the INIT_MANAGER variable.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 514454651522f97590d1403c50effd9c79df827a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/local.conf.sample.extended | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 6fc618e7e5..3d9cecbc62 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -374,23 +374,12 @@
 #
 
 #
-# Use busybox/mdev for system initialization
-#
-#VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
-#VIRTUAL-RUNTIME_login_manager = "busybox"
-#VIRTUAL-RUNTIME_init_manager = "busybox"
-#VIRTUAL-RUNTIME_initscripts = "initscripts"
-#VIRTUAL-RUNTIME_keymaps = "keymaps"
-#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
-
-#
-# Use systemd for system initialization
+# System initialization
 #
-#DISTRO_FEATURES_append = " systemd"
-#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
-#VIRTUAL-RUNTIME_login_manager = "shadow-base"
-#VIRTUAL-RUNTIME_init_manager = "systemd"
-#VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
+#INIT_MANAGER = "none"
+#INIT_MANAGER = "sysvinit"
+#INIT_MANAGER = "systemd"
+#INIT_MANAGER = "mdev-busybox"
 
 #
 # Use a full set of packages instead of busybox for base utils
-- 
2.25.1

