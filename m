Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.197058.1598282135016509132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=AVBvOIwQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d22so4986225pfn.5
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bwpvuDuN1O3TGREYV4U2GIM5zj7wZ/B2XTT3ERSPRK0=;
        b=AVBvOIwQx/L1tb9mA8Xw9A2Z13EaATHydbRYRU9okU28JFFMcWHRxoBs+L2DNYX1+Y
         qoSajzgz3i68XlkjqgTUOdKEqIei3iBx+S+ELI18msTa6gYbB7bTry3NAftxFC/7xFBW
         veva4qzgQc3RwnxVK+n951UtRXH70VU0L4D7tE+bC3OI1B10EH+LMd8+O5wzay+QRM+K
         A1Q+ijhLtweljMyTl+5YtAGkAwO2sfmSZrC34VpCVpb8/AWp/o7o5eWPhLaU9/bWKL3R
         UCLRn6JKV5BYglDlaVD3Ir+p8SU02rMDZZ9QidLPqNZF9hWmu+4pX3/GaCS/ymmTKQcD
         2n/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bwpvuDuN1O3TGREYV4U2GIM5zj7wZ/B2XTT3ERSPRK0=;
        b=SE8eXwc/rJoPp49ng9tz/INm8swtX1gUXNn0QMt2s0Sv+jRAeq22uo8i8wH/d1WPFH
         jllEpYBegicyDrt62XLT7+hN/gBGYxZlk/djGBtB7Eysr241O4dYc1kZqyt03FmNklZh
         e68f6DRgs3IKDAl/XceQZMC6oitBQaM1nhNGA6ZLUiuUckzSUh3gHxCWS5mDW8tQhckH
         Cq4FMk8Z0mG3ixibTfvOklYAd4TMU9TMinxSQjL88gK6/8RDUB2MKmllXcJUFzEyqWzc
         Gpm2R6PD8ObAY0dwxYJqRlLVzAfwkRX8Y3SQqhoxSVam1Xnbi+GZLTCq7FmdB6CPWRCX
         Xhug==
X-Gm-Message-State: AOAM533CAIbpEt4M2ioMPyAWAL0EB1R5loxbkZEUEyOxapXJ+vycG6Vm
	W0HuwwP4hn1zXSXdk0EBOlMrVJ6ArApwRShFd8E=
X-Google-Smtp-Source: ABdhPJw+V0SQ6T2i5CWx5YmCCpWhh7RjIsUvNw2UHapK7qZmZBlduQPiJzX7jzr4Qz0z4fX97njY7g==
X-Received: by 2002:a63:3d8c:: with SMTP id k134mr3589517pga.279.1598282134056;
        Mon, 24 Aug 2020 08:15:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] linux-yocto/5.4: perf cs-etm: Move definition of 'traceid_list' global variable from header file
Date: Mon, 24 Aug 2020 05:14:54 -1000
Message-Id: <033e4bdb9f80aed3ba009e105acd5b61a8899626.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    706efec4c1e2 perf cs-etm: Move definition of 'traceid_list' global variable from header file

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8e1d8c2099f29b45f1e96d4349731db036fb7548)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 2857dea130..cfe3277e83 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "550d18f9ff5749c779261b01d61a86c7e79b06b6"
+SRCREV_machine ?= "22664d170488313b5c2713b6d9c8df6563387728"
 SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 78d57e1841..b90b1259a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "919fb1aeb12bceab82f32139bec283c1bb5ebc1c"
-SRCREV_machine ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_machine_qemuarm ?= "d192ae0b9995a7be2a33b12005a95348ec6aae94"
+SRCREV_machine ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
 SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index bfba14f455..88b6251bd0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1f11670a455ce50f55597415afedfc5eaa3981bf"
-SRCREV_machine_qemuarm64 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
-SRCREV_machine_qemumips ?= "50557f1a2b606139ef5d6ba4a2f46ad7b7b2e96d"
-SRCREV_machine_qemuppc ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
-SRCREV_machine_qemuriscv64 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
-SRCREV_machine_qemux86 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
-SRCREV_machine_qemux86-64 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
-SRCREV_machine_qemumips64 ?= "52e277a90804bb7ccef6e51bcf739d88788b4a69"
-SRCREV_machine ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_machine_qemuarm ?= "7bbd138602fda3d69d74674460e73bffdec73cd2"
+SRCREV_machine_qemuarm64 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
+SRCREV_machine_qemumips ?= "e43ed1586cd85a007b0fae3c63d6980d4f5cb336"
+SRCREV_machine_qemuppc ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
+SRCREV_machine_qemuriscv64 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
+SRCREV_machine_qemux86 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
+SRCREV_machine_qemux86-64 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
+SRCREV_machine_qemumips64 ?= "d1ff96887c64f70de00add62eb91d4c36f1b181a"
+SRCREV_machine ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
 SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
-- 
2.17.1

