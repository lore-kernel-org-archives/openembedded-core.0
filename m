Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web08.14332.1605813477792264634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 11:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lp92KpC+;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id k4so6471197qko.13
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 11:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TiOZRTejmzwPtCpqnBZq8RQtGLkXgdc7a8hsL/LVI5g=;
        b=Lp92KpC+wwWNrtBAP2Llw9HJvOLOaJQtZZ90mP5cxDBe03t9GNq/EOIOSdiraGBV1p
         Q8pbiDK8Kexp7sUVRvuxmtJmoadFr2bgLEwfO5uZOM53+4tZvZ2zPjn9LWfT8mG1kFpx
         OJ5RyRj6PPdUW73/D1PsvE5vpzSwirFWMjpsDsqo9CRmmX9pPFnZ0AeT1CIBzkpcLrFd
         flTWNKf/70TaQFCfPkmooFMt72IV9uLo2FyzL+h4bYLep2CObXMkVR1S3GeDAOF6m0Yy
         8B2T88w4//obikj/1cSNQzM1EDbkyIlKwm4vngiBPPtnrFWx5Xf8xNcrSvXT5bwTQIlU
         iKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TiOZRTejmzwPtCpqnBZq8RQtGLkXgdc7a8hsL/LVI5g=;
        b=A4Hln009ZuSMezaoX96YAAIOYHdbV0qVBMlOMiMHChWSCu/oagdSPx5KIkqF3D0MGG
         xw60GThYvaGZkyjSlh1yPnmSTjOr20nR98drlL9XaR59HIkOJ9ns+PM9JgLHGvMohgdp
         j2fYyKrGM4v6AWOqyyPcgYLNEV1ipl8/PizOQmWXVOXzom0/CROwCRQYtPgce88WRoEW
         SX+p8kOtPS5aNxgNHE5nGFltm9FeHVY86HZBz+laRtxygRUpyfMJxEWPLCxBxYXnVAnG
         kt20vQk/sLcSOxwSiyWVDTHo7FIllcHWhkTCweMmniF1W/Jk+W8s3GL4HB+WRhSLScEj
         2Abg==
X-Gm-Message-State: AOAM530XuFYnbt1IDK7ubblzJoLdoL6v9LujfF+lXycDX51V6Ift9gFn
	LXbkNZSeTUqsEDTn4zRHx6M=
X-Google-Smtp-Source: ABdhPJwiYvUEUqXx9kChjCERtwWXF8aJX1+KwkhZUzGwc3aBs9To/FY3W6uATus7O4s3fgH0NzFE1g==
X-Received: by 2002:ae9:ea14:: with SMTP id f20mr12412047qkg.239.1605813476916;
        Thu, 19 Nov 2020 11:17:56 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id l22sm478684qke.118.2020.11.19.11.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 11:17:56 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/5.4: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t
Date: Thu, 19 Nov 2020 14:17:49 -0500
Message-Id: <3dbed0de30332c9916f15e9023790b3626d9c06c.1605813340.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605813340.git.bruce.ashfield@gmail.com>
References: <cover.1605813340.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    356914747645 perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 183acce226..4db2b33aef 100644
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
index 23fc5ea819..0330a9d159 100644
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
2.19.1

