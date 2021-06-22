Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.7539.1624360894516976779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vMpQ+rvh;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id h17so13201379edw.11
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rqc1T8ALwfvrMT6Pn+T0Pfa+mJoCg3HAMt+lw0MGcpI=;
        b=vMpQ+rvhXLvVhdCKkmimLco27WyptGQAGW7Mo/u9hMahGrXObzwEhezsw+2JxsR3mw
         b7fpZT9TiFWTb2dFoOyXkAuDxnb1Z+CyLjxBSOrpeTzswruV2fV4NLEiVhQO6/TgXKyj
         9PE6DcVDSZjhJoyE9x+HgULdh9CWctRJRBizdMo8cHaBVRKOr8pDF/cC1D7gM/eyLgZ8
         RXHSj1FDyy3WYS++c0UE/Mvb+dewLuphS3BCjqpncV1SbVkb03OFixwPA7up9bx15azo
         GtgMftPQPXvv2vG4FaMVtBXXxhPxltPnkwma8P5WiaM4KWbEy/c8kp5qaN/Pa7g0F832
         Nm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rqc1T8ALwfvrMT6Pn+T0Pfa+mJoCg3HAMt+lw0MGcpI=;
        b=hVfMJTxluij5BjS2IQVq3iZ7ip1EDVLNROhPx+SWbeYNA42TCEALjJnjvmjVbd78QC
         XoQZE2PhqHnKfD/BgAWB2cSuEKsBbVFHr3X12zevVzRA1ysYMtMh/N+oZcN/pfQXhf1C
         sUKHN2+CIitLA+FytIGUuwmUhLMjfyRWczmTqgbZf+RBTVCutMA9ORjbU1SuP3ckO5cL
         P8HIdUg/eQvZQ5YLdVoQycxIYdQHOcxuYig3Q0ZSm/ST4GSrOe1Nh6bnUYOBMr2uHu8t
         43yahv/IpE8l+kZ+Ao48r5WF/lS+ARPEKgicj72Iet3EH94nlegH8zayhAjwYC+Ohv/E
         VomA==
X-Gm-Message-State: AOAM531ElU4xWvnusd3o1OaROImDTODmR/iPsK6Kp9Dnftu9y8um4CIJ
	SHgHlG219Ir35/XcIxImARCHK3jlazHLsA==
X-Google-Smtp-Source: ABdhPJwjgxbX7mOZVq+LT2ibRIw/wmy8WO4ewMJJuqr9sMxMkkLJsc3dadcYU2xksuhRdBsGa3F5MQ==
X-Received: by 2002:a05:6402:2918:: with SMTP id ee24mr4226030edb.158.1624360893173;
        Tue, 22 Jun 2021 04:21:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/19] bash: update 5.1 -> 5.1.8
Date: Tue, 22 Jun 2021 13:21:11 +0200
Message-Id: <20210622112126.2026646-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/bash/bash_5.1.8.bb | 24 ++++++++++++++++++
 meta/recipes-extended/bash/bash_5.1.bb   | 32 ------------------------
 2 files changed, 24 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-extended/bash/bash_5.1.8.bb
 delete mode 100644 meta/recipes-extended/bash/bash_5.1.bb

diff --git a/meta/recipes-extended/bash/bash_5.1.8.bb b/meta/recipes-extended/bash/bash_5.1.8.bb
new file mode 100644
index 0000000000..55d3d0b16e
--- /dev/null
+++ b/meta/recipes-extended/bash/bash_5.1.8.bb
@@ -0,0 +1,24 @@
+require bash.inc
+
+# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
+           file://execute_cmd.patch \
+           file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://run-ptest \
+           file://run-bash-ptests \
+           file://fix-run-builtins.patch \
+           file://use_aclocal.patch \
+           file://makerace.patch \
+           "
+
+SRC_URI[tarball.sha256sum] = "0cfb5c9bb1a29f800a97bd242d19511c997a1013815b805e0fdd32214113d6be"
+
+DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-extended/bash/bash_5.1.bb b/meta/recipes-extended/bash/bash_5.1.bb
deleted file mode 100644
index e5e013b734..0000000000
--- a/meta/recipes-extended/bash/bash_5.1.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-require bash.inc
-
-# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash51-001;apply=yes;striplevel=0;name=patch001 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash51-002;apply=yes;striplevel=0;name=patch002 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash51-003;apply=yes;striplevel=0;name=patch003 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash51-004;apply=yes;striplevel=0;name=patch004 \
-           file://execute_cmd.patch \
-           file://mkbuiltins_have_stringize.patch \
-           file://build-tests.patch \
-           file://test-output.patch \
-           file://run-ptest \
-           file://run-bash-ptests \
-           file://fix-run-builtins.patch \
-           file://use_aclocal.patch \
-           file://makerace.patch \
-           "
-
-SRC_URI[tarball.sha256sum] = "cc012bc860406dcf42f64431bcd3d2fa7560c02915a601aba9cd597a39329baa"
-SRC_URI[patch001.sha256sum] = "ebb07b3dbadd98598f078125d0ae0d699295978a5cdaef6282fe19adef45b5fa"
-SRC_URI[patch002.sha256sum] = "15ea6121a801e48e658ceee712ea9b88d4ded022046a6147550790caf04f5dbe"
-SRC_URI[patch003.sha256sum] = "22f2cc262f056b22966281babf4b0a2f84cb7dd2223422e5dcd013c3dcbab6b1"
-SRC_URI[patch004.sha256sum] = "9aaeb65664ef0d28c0067e47ba5652b518298b3b92d33327d84b98b28d873c86"
-
-DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-
-BBCLASSEXTEND = "nativesdk"
-- 
2.31.1

