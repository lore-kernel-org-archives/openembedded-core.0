Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.5899.1626265577155361263
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=orBZjyGB;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id j34so1445112wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UK3OFJuO1CqfTa+0X0Q08Y1G5AUjxHSn5rijwpbiqa0=;
        b=orBZjyGBXzDeQ2ZmvMcvi8fFklDLP+MJJvLeyBEa6kzWbpeUDSZfwAOT2yYz8IAZCy
         qQERLEmaWIkhvLuTaG/9J0UtH8Bv99hPMizO2qBfNj9HD2VUngCwiJpX0d4LRpicsQEa
         ISF0cI5o5jSmdHWPrHd2FLXXRV3FOs2cfRsPuH2nuLjkAJvMnmJL0On5V5uJCmc9qLgK
         Rd/fy5oSV4fhKt3cjeGCbcHaZHBHGYNdE6cAtrAdryN/waLv2zBOedDm9Q3393psGql/
         UlemqrbthpQ+BucEEtqyU6EIyzdq/WMtlQZPt6LB77wlR/wluAnwoaBuyCtXf44BS9b/
         utbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UK3OFJuO1CqfTa+0X0Q08Y1G5AUjxHSn5rijwpbiqa0=;
        b=WSKBC0xi6bwxEyD/N/lubz+iSo02YJPXEE8D/3R3T6tCw4iBZ0b6uHv4dD3stO1j+D
         DpmF3brFydeKeSOmSTBblnoqammxVRPGOSDyx9f/1N86lwKCkx3VX0s6d6e8PePBEiwK
         jSdguVseDSYkMiR5GDaeYEjsnRCMIvq8Bd1PfR4txg2f8Rw7gqSVs49YqRJ97Qaxig3x
         cAlslRipA+E/K6IPoXLB1Aqap21oKpXTQfNnl1slXHGmKATQm6qgTT65r/j2WRtH+ntt
         a+JfV5ZGN2rEXMotjHGGUmOCLhikD317WAu+hCKa1nqLPo+St5mV6iC1rX+t+o82lHbS
         GOzQ==
X-Gm-Message-State: AOAM533uzA5bOyXVlLsN84GCwH/BTk4dW04AnwriYienGInP0u5dg/ye
	8k+N16WQQS10AbwgOTouy0WyUYd0dQU=
X-Google-Smtp-Source: ABdhPJxsffIBmlFbrnDPsbMMbvtgdoQCcn/bukcx2BdicA+vAx9IwcvQ6VjbAdcsHo3zdKhDcqlSNQ==
X-Received: by 2002:a1c:39d5:: with SMTP id g204mr3794373wma.66.1626265575598;
        Wed, 14 Jul 2021 05:26:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/21] llvm: update 12.0.0 -> 12.0.1
Date: Wed, 14 Jul 2021 14:25:49 +0200
Message-Id: <20210714122606.605142-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Other than the tcmode tweak, this was done by devtool \0/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 0571304fdc..19073542ae 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "12.0.0"
+LLVMVERSION ?= "12.0.1"
 
 # Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
 # from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index de79adc410..4554b752eb 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,7 +19,7 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "12.0.0"
+PV = "12.0.1"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
@@ -27,7 +27,7 @@ LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "fa0971b87fb2c9d14d1bba2551e61f02f18f329b"
+SRCREV = "fed41342a82f5a3a9201819a82bf7a48313e296b"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-- 
2.31.1

