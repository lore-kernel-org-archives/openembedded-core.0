Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.6508.1607350382446777732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 06:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0JNwwIst;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id p4so4212911pfg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 06:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=R7/fsjZLO31EJzooai7VbfNv+F6uzp1H3HIyfd9UVmw=;
        b=0JNwwIstUt5MMNvf6qjUo9n6qsfS6zn2cUc/iDG1fimV14hza+smIWg9/vwxI2qxSq
         WozwXyqopDqZkqTZU+R/INVDBieluK27DQzodjUnxx8m9YxqHsp6NR66OaNFx1K6vh6B
         sqSN2pHWZ3KJJyBmAGfVIq+Sz+pUiwo7J+gm+mwSVi2U7F68hbgpdzUdFQVZZwDAYCIu
         RVmMFCWJd1HHdgGeJKJblwaUyPPfS/XyhAI3inC0OJIhG213O/2sCAqyIISlt1rlDJ7x
         tEIX7pkGCRNkpu/AsQGad3NuchtWc/TCYKp5VLGfzsnzFC0bimquJRp/HXqja84rNL+v
         P/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=R7/fsjZLO31EJzooai7VbfNv+F6uzp1H3HIyfd9UVmw=;
        b=EnLag0FJBTVknPCrNZafJ0uMe6Pt9fVldcIcNZN+pgsvEozjZqogoXcjTZDH9cgkzb
         1ZXYmoxVPWr1n+G2lPxu+6vhxW65jy+qbHbxbLoMy9T53Go16yiTaSxwG+ILSodipYwI
         4NZKZTJmwfjW2drccCELws1ah40UmKV2O3zq55TNpKGQPpuiUPSrncHMWJlADuX0I9XS
         zAnSsQzU3Z9CVzY7fwkZRUOVBEA4LBLnwGRS5MRWpf5ocdXVed3KjWwQ5KHRdozwUlFt
         dkQhlTYC+98+RjPo7sgHcQJViRDZwPnpi4h2lZ4Rs357QYt78LrAYzh9HAF4voDOglZC
         3dnQ==
X-Gm-Message-State: AOAM531FBUGpIj05hwchyxZz4eetL8BmvLVmsF/3VG7QT0u5d+w+hY9U
	ZdNL8J48ZBPjtU993xTKXmeyLBKkO5dJxzCS
X-Google-Smtp-Source: ABdhPJzy7URzLLSd59tQ3F7AxRshA1iTpYBoHr8SSiG6mxT8Z0WV/E/8DZoOqXx+ehx4nujL4npJCw==
X-Received: by 2002:a63:4623:: with SMTP id t35mr18254006pga.270.1607350381640;
        Mon, 07 Dec 2020 06:13:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u3sm14848093pfu.47.2020.12.07.06.12.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 06:13:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/9] linux-yocto/5.4: config cleanup / warnings
Date: Mon,  7 Dec 2020 04:12:21 -1000
Message-Id: <bffc59b566368b5435381c460f692a07c36db567.1607350153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607350153.git.steve@sakoman.com>
References: <cover.1607350153.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    eadca496e9f bsp/mti-malta64: fix warning of CONFIG_SCSI_VIRTIO on qemumips64
    203911bc035 net/l2tp.cfg: fix CONFIG_PPPOL2TP mismatched warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8df0a1f9607417f3f308b9ff852e287837b6cdf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 4d84a3ad09..4abde1265e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "689799c6846313eb19566dd4afb69d30353dd351"
-SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
+SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9f17d56b6a..44646ebd84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "f37a22c3ddab9db618ad302cce77825dae2cda87"
 SRCREV_machine ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
+SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 5c908e9d88..7722ef0747 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
 SRCREV_machine_qemux86-64 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
 SRCREV_machine_qemumips64 ?= "536bda19159206ac7f60165f71bbf892cb8ad3fd"
 SRCREV_machine ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
+SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.17.1

