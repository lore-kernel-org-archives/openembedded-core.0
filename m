Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.12819.1626103961672064847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=a8t84Ydb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id o201so11667132pfd.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bXa2/DbHVMX2OvOBccaj+KBLzUdOrafHqgwR7HWfW+Y=;
        b=a8t84Ydby4Yzj5VSOVTkrbGbMRsJBvLfdaGwr7gYfPBBl7GjsJKWuhi8o7tmFf+Rbd
         ePG8g0M6WO7yX6V5sxdo7kQBhZnLEhD3gLKqoe2lHA8LuBYH5/SYfAv04w9K6Uy8Yq5v
         HaUb4A4dIgdOESr6X37H7xUgf9nyWmHgE18gX76OXoVv1uUG1Im33Sas78Jn2rIw7mXW
         e8ybghBtFpa4v3eF3dWM/bJ6JH/wffWFlhHAHolGzeXmeoDF5DppSy8/DlhEu4wfckAK
         OtLzUF5j1vFBkv4QPahG/tppYRURgXu3h/k8/zFluCaGA87xnAEWaM9J+cq2lU2OqLyp
         FpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bXa2/DbHVMX2OvOBccaj+KBLzUdOrafHqgwR7HWfW+Y=;
        b=q660hxgO8PkVVDhEyL4SGG4gIans/E6HVpz/yReVo0KIoFFeP0h/2WHgKWYIAVnC4X
         ECUfi1phlqa1WpS9rCEX9vFJuMX3NBeDoAc9sqewsdIwUfxuSY3EKdQ/zoflYqDx63KB
         1T0tzF0kW4kNBnexJ5uMngbkIvDpkFdgQmSc1iZg70IeV8LVPUiwGlxwAkL57rbHdUnR
         iTFSL5kx370mwxMxrEn4ITrtVIZRy/lnHGDyO1EpoSF1Hw/PwO+7Vlhd48seNfxcqxEh
         k8l2n7L4DnlYke5LA3YxpJ8+uc/P75inXz2I8vxt6PA+3D5X4Xo920Pg3gwX4qTd4gwM
         bnvw==
X-Gm-Message-State: AOAM531J0kf1Ddh8wGKOY1U59rLVq58kAelWu2UufTVwjlkfx1g+cHIR
	KirA6Np5g4CNDwNDtSmyVy16OA2wVW3ldbCb
X-Google-Smtp-Source: ABdhPJxP99gbfTCwtIKdlfBFatBZJEQYyQRFpAZFqTVTAT0STNKHwX1kVbUxOLdDEJljcYxzjYYu/g==
X-Received: by 2002:a63:e046:: with SMTP id n6mr7211784pgj.15.1626103960847;
        Mon, 12 Jul 2021 08:32:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] glibc: update to lastest 2.31 release HEAD
Date: Mon, 12 Jul 2021 05:31:57 -1000
Message-Id: <eb03d3f72472539b10de49a32bdd3c68c34b658e.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Includes the following fixes:

4f0a61f753 wordexp: handle overflow in positional parameter number (bug 28011)
8e88c0d888 Fix SXID_ERASE behavior in setuid programs (BZ #27471)
74a4425fae Enhance setuid-tunables test
bb5bb87959 tst-env-setuid: Use support_capture_subprogram_self_sgid
700264179c support: Add capability to fork an sgid child
7fa6d30eea support: Typo and formatting fixes
0de2b69c31 support: Pass environ to child process
0c92f409a7 S390: Also check vector support in memmove ifunc-selector [BZ #27511]

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 7ae64a190f..aac0d9b3bf 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
 PV = "2.31+git${SRCPV}"
-SRCREV_glibc ?= "f84949f1c4bbf20e6a1d9a5859cf012cde060ede"
+SRCREV_glibc ?= "4f0a61f75385c9a5879cbe7202042e88f692a3c8"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.1

