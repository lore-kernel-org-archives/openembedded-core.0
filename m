Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web09.36067.1607958575926275278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 07:09:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aEt5C3bT;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id h4so10935777qkk.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 07:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=56fOLIjPzzNyxNCDvW6fvx4hq3xNYHA2vZmKCjf1Xvo=;
        b=aEt5C3bToXEy+U57yY+FGSpK2oRS1QoqrfAXVxHnBEFxW/sB9Ey9/1kPaqVnhjL/jM
         8zcJOWW6eB4lpU15N4cMW76qLCvdfmxRZjGZD66lPiCYRV/h5ihhNPB67hiB1jeCFgjm
         anPKvxHFdXib8gsJNUpsRbPj41FWsjchkIBUdwgVYXYRfcPcY+BdNgEbIq8lTIk78WLT
         MyEuDjc2oWouEYwN3AOKqbdnb1AkYeTU9Ten3ZjnwlbM743OiYgxRZV32td6kmZGPct/
         i7xGEmlds5m0ZtKwQktSj564qZb7EMFyL3fK/pZBbopus6yv4sqPWyZ+VX9Gt9cb65mU
         suDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=56fOLIjPzzNyxNCDvW6fvx4hq3xNYHA2vZmKCjf1Xvo=;
        b=kr2GowB8jU2aa1H2WMNRmOWWZmEjWZywTxcAuIWyLxGBQ7R3OPsMSCiFqsajdaq10D
         coJmmzyeQUH1V6S1FOwL4j6OSGXleTqZ9ebUqXZyiZnM8HhuGD1jgPJfWboU2T3m7RAf
         8qQ3vlK5zxXFEPzMsZEjJzEKhUhtneQw0cVj8ivgBadUPemOFZIxinQZiMwd1rOEJISJ
         ROwTyYmMFnUM7wZ75cBLty9v2UTf0Hb1ZFopJk9f0Vu8G1wPqpIhswFgvWv4KEaIUVEx
         sSdmsCzGcHYxY44pCOwnaDD2T+aM7UM9ILIEGnFoiQrjlosyZ+cCb0lMdia73tEKigs6
         nAKg==
X-Gm-Message-State: AOAM532NzIJ0ocDiPH1SMqxMcKCqfVuleMNHU6KwYpAie2pu7SWHIrkt
	5MtdcnHzbO1bdflNlO4rd/4=
X-Google-Smtp-Source: ABdhPJwKJxJDvfAyRMQ1Ups0fkSTzRcOkPICL2hk2xSnHa0hEuVh1znzVurwtMPZ/56ffb6BJxUg4A==
X-Received: by 2002:a37:6790:: with SMTP id b138mr31582427qkc.465.1607958575066;
        Mon, 14 Dec 2020 07:09:35 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id a194sm13565070qkc.70.2020.12.14.07.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:09:34 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto/cfg: qemuarm64-gfx.cfg: add CONFIG_INPUT_UINPUT
Date: Mon, 14 Dec 2020 10:09:22 -0500
Message-Id: <c4e22cd9a43b67079e398c1bafac0b5995c9556b.1607958349.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1607958349.git.bruce.ashfield@gmail.com>
References: <cover.1607958349.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    qemuarm64-gfx.cfg: add CONFIG_INPUT_UINPUT

    This will address libinput ptest failures:
    https://www.kernel.org/doc/html/latest/input/uinput.html
    https://wayland.freedesktop.org/libinput/doc/latest/test-suite.html

    qemux86_64 already has it enabled.

    Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 2bd41965a6..5162c065ed 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "65a53ac9134b9736ae67afc5fb02049f4908d8e3"
-SRCREV_meta ?= "e872ef155c596e4cc2f68405d85ab6f2b0303c28"
+SRCREV_meta ?= "104cf3e89371ac8971fef69f55a6c788c46ec65a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index f5f7c87a31..fae984cd4e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
+SRCREV_meta ?= "25b672aa4759b6ceb48777eb586033a186091692"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 67157b1685..01de087128 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "0c335c490cfe932664f2e40c791efa387f769df5"
 SRCREV_machine ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_meta ?= "e872ef155c596e4cc2f68405d85ab6f2b0303c28"
+SRCREV_meta ?= "104cf3e89371ac8971fef69f55a6c788c46ec65a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 4afddae092..b98d99a81f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
+SRCREV_meta ?= "25b672aa4759b6ceb48777eb586033a186091692"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 4d60d0a557..ebd25dab3e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
 SRCREV_machine_qemux86-64 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
 SRCREV_machine_qemumips64 ?= "0ba329b53891de44e4ef8d2ca8a948e1c6a5866c"
 SRCREV_machine ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_meta ?= "e872ef155c596e4cc2f68405d85ab6f2b0303c28"
+SRCREV_meta ?= "104cf3e89371ac8971fef69f55a6c788c46ec65a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 3f94d22654..a2dacb2676 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
+SRCREV_meta ?= "25b672aa4759b6ceb48777eb586033a186091692"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

