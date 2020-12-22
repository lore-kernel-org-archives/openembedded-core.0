Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web08.11773.1608647317365720087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 06:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VLYFcKtW;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id l14so6044740qvh.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AKQkQTvyHPsm5niu1sinwhoOYyUQeEIyg4wfJEi6enA=;
        b=VLYFcKtWpWBpe22QoffVp0kdGrjxsx/yEBO2UoeKzVQf4dSJeBovnxmu7XLnkjpSgz
         3sXpPkUR7E1vkT39dbwCIx4tTvMX3ImbU9dgb995zlEaAh1c+rVlvp8afsWzcziOSsqc
         tfWc4UttCTcxYKNDGnFux8pS5I2avBySLp1PMRFvNKETRVyghiCfzDncRaDh5zAnWiaQ
         ftPRtxWMYNaWrtWCOYhNcvxh2EstzArIDM/yc5cbfOl/JMhFNr4B5U+In7avr6akIMw3
         WFl9FsgtZ+eEIAgULe6Akaacz6oxjoQSnkvrdqB6JyUquQIoJz079BXtkPat+aBx5HQK
         Pauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AKQkQTvyHPsm5niu1sinwhoOYyUQeEIyg4wfJEi6enA=;
        b=h5gAiyXfs6vsfi/71sbaDE43L+maz8ZtT8kQqPXBhdnvd582DA/T1vXaJFZ47mvYpT
         CH8MYT2ruGhnGW4+NM74zrT32tmHi7XbEqlQUl7cbBrOqIWNX8Ne4UdgDBNQaiK2XuUC
         9bdJG0eV19lK3HgKghoW00zUHAa81TOoRfQNKRTR7knjIOi/QfKCPZdiHKX+bsCVkMPo
         6tN4iFxetn1Ua8xpi3njzey6UERU8woEVf2d5CWcGhyUxyIGXg1pWsR9YJwUrw6pA7CV
         JbUudoP59OPc9jATW2Ouygu5WjGFmG1fOi16e5L2a9fGn4Q5+reK+mRB39BlE92avhFv
         vmYw==
X-Gm-Message-State: AOAM530UZblGK2WWVBQcdVzYzzpzZmWhHWhMqq+JNHpGjkc+8t6hlU+g
	+KzVcAwqGRe05wvqwVRP4w4=
X-Google-Smtp-Source: ABdhPJyLnxiOjEMR4cKv9wZn9N/vh2QQeltjhTFejdViF6e3m6qQvZNsOFAqdjM4ZDCDHKZZO2uvWQ==
X-Received: by 2002:a0c:b4d1:: with SMTP id h17mr14522266qvf.53.1608647316478;
        Tue, 22 Dec 2020 06:28:36 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u65sm13169866qkb.58.2020.12.22.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 06:28:35 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto/5.4/cfg: fix -tiny warnings
Date: Tue, 22 Dec 2020 09:28:24 -0500
Message-Id: <362fd97b9696f73678401707220581fe1bdc1eae.1608646697.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1608646697.git.bruce.ashfield@gmail.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to fixup warnings when -tiny is
build with the latest kern-tools:

    b721178c41a drm: change CONFIG_DRM_KMS_HELPER to =m
    d9ac6174eaf tiny: enable CONFIG_FW_LOADER on a per-BSP basis
    a135c720bc7 i915: adust helper to 'm'

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 3754abbc66..f35de787e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "7bc8ae3fc04fdc06192d39d725cb18d4c0b78d9f"
-SRCREV_meta ?= "cd9826707f887241a661ea886cfa19f8d282438c"
+SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index b06db10f9f..2c7ce3621f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "2b6db4fbe53a1986c0249bc663d8ce7d99cbf19c"
 SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_meta ?= "cd9826707f887241a661ea886cfa19f8d282438c"
+SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 21935ac171..475efbfc93 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
 SRCREV_machine_qemux86-64 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
 SRCREV_machine_qemumips64 ?= "75c7340de480587c3a6650b46be7b1a2f71501a9"
 SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_meta ?= "cd9826707f887241a661ea886cfa19f8d282438c"
+SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

