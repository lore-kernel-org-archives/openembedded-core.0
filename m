Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.6510.1607350388189487834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 06:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=o/QsO+/E;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id p4so4213260pfg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rU7DNFL2a2bVxKbdVW0MnQ77Ovun/fGkT9WYZ3WNxUo=;
        b=o/QsO+/EYsuBb4tYTt8N4IOt92RPbBEU6hIsuNPcEfnVz3RR6wA0aJXoiOXOsGgVxg
         VUfeymkgQHqINu5FpiwvN4yszU84FeCkcjKx1waphZsmke7KatfdLuUYsX1muuzYh2jG
         bxLRz3L8mg/DL9hkMAPsyAFnYJ80gXidEmp8bIdI0821QUFJpgTPl2DFVTyB7CJ/4LLX
         VJaekq1T5Q8yOhZ1VYfpVt45CKXwtWnhfWdf+WFLS8UQ682728K+6L16J90dtD28c1cQ
         aZfeNq6T01SYvjRvPcnBC+Z9G67HZYGDVf4R5aSEywzCo4kZXAVK42LOP4Pk9z8idkwO
         nXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rU7DNFL2a2bVxKbdVW0MnQ77Ovun/fGkT9WYZ3WNxUo=;
        b=H39jZJApgKqFxB8gon8PrYeksAqaRfk33b3qRt1xMKmsYtiK0BoDWxPYxb2Upi2xuV
         eg8mkatkBxnkGZJ3oxXHMqNwRVmy20YG9I/VBQV86COqMJ6h9fWNNXWuKzCyptQXI3nv
         +aA5Lr/SqMTy6riE4Ofsf9pUAL7Br/tGSmS7fmIg7ozzGX0bm7WjfsXgcaprujCEa0Gc
         OTV0nfvvUvM82BGEK0qEG3gjRkLy6ttkY+oylICCJAHs02K5bPfAGmvbZ3TwmiFOA3gI
         sKxdZCf0NgAwAN7SV1CCDr/E13uL1cHJCHjb4/MTZesubSg9TiYKj3XCjq/oezdJOIcq
         ifSw==
X-Gm-Message-State: AOAM53123/2AWHCoRA7wMiKQ2BNvUZQ+eUUMxXrq2KvI8xqubMnIbp77
	HqHMTJvU6lzRBneI1/6h78yxOpUpeFWIFwJ1
X-Google-Smtp-Source: ABdhPJyVpZGvdtAUIDj0L66xo/vo61zOLeKZRbNy/Y7Jjthx0swPSSc2MHjU0zVAZwnjdNbNGcrUNQ==
X-Received: by 2002:a17:902:758c:b029:da:a6e1:e06 with SMTP id j12-20020a170902758cb02900daa6e10e06mr16337623pll.67.1607350387289;
        Mon, 07 Dec 2020 06:13:07 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u3sm14848093pfu.47.2020.12.07.06.13.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 06:13:06 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/9] linux-yocto/5.4: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t
Date: Mon,  7 Dec 2020 04:12:23 -1000
Message-Id: <f1a7e3f166a2d55b2706f53acb4820a1f8ce221f.1607350153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607350153.git.steve@sakoman.com>
References: <cover.1607350153.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    356914747645 perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73ee256e5c1194ec5d0843dee274d29cc0efe993)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 6e6edeefa7..4d59d5c155 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e500e89811e268ab5c420744c41b10d12c9844a0"
+SRCREV_machine ?= "1fe1ef9c7272caf75d92b3e9166a0f29c4f06141"
 SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index f6190be8da..f6ed7f35ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2c7da912c6b5bd36d84f75e0aff4afd0814f1bd3"
-SRCREV_machine ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_machine_qemuarm ?= "83d064534da33ab41108a786d917068f282a9bf2"
+SRCREV_machine ?= "356914747645db5ceba98b22acdfa060ef1764af"
 SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index edd5de6c40..e049d21689 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dbac8d2939bca0a92226cfd55543331715dd642d"
-SRCREV_machine_qemuarm64 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
-SRCREV_machine_qemumips ?= "819cf265755f21768f6bb98312cb568c6db8b1e8"
-SRCREV_machine_qemuppc ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
-SRCREV_machine_qemuriscv64 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
-SRCREV_machine_qemux86 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
-SRCREV_machine_qemux86-64 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
-SRCREV_machine_qemumips64 ?= "bb9110d96ce8a2c56466e5b4314b93175af3d80d"
-SRCREV_machine ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_machine_qemuarm ?= "879db1ae1856cf5a9fe4609fdbcbe2e3c7bade5f"
+SRCREV_machine_qemuarm64 ?= "356914747645db5ceba98b22acdfa060ef1764af"
+SRCREV_machine_qemumips ?= "190c3ce9c2dbc709c3dcf02d8cfa80adc8a063d2"
+SRCREV_machine_qemuppc ?= "356914747645db5ceba98b22acdfa060ef1764af"
+SRCREV_machine_qemuriscv64 ?= "356914747645db5ceba98b22acdfa060ef1764af"
+SRCREV_machine_qemux86 ?= "356914747645db5ceba98b22acdfa060ef1764af"
+SRCREV_machine_qemux86-64 ?= "356914747645db5ceba98b22acdfa060ef1764af"
+SRCREV_machine_qemumips64 ?= "98b1fc2eafc28e5c198e23579e38a76626c66182"
+SRCREV_machine ?= "356914747645db5ceba98b22acdfa060ef1764af"
 SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
-- 
2.17.1

