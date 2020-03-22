Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.21839.1584839896014184519
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 18:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kf7ugVvH;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b62so2180761qkf.6
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2020 18:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QCaggCGaN7CxcdMy5ACqPjRWwkId0XtnRqZdhOcU/sg=;
        b=Kf7ugVvH1L4DdOA0A7YA15EM7J+vhjOY8al6nO0qd3mi5VcbeUrFPUxn9xWek6q32X
         oPJaaSNlAu73Ywb4lofZLWz7ynssA6X1wXtxcXKsN7z9D9uX6rHAMqldt2uXOLAuXNs8
         M2rYHNbTagaH0o/TFsTfIXHWoOydabmHA9zEEjhplOVapoA+CAGF3R2s0ONO9Xf1LFZ0
         6PkdQ4Oa0CDCaqCmVa82z5Um0ajMH+rKB5O+yFK/Vn06/kRQy2We8/S8pwqpfhwzn0fz
         FLXcjF6GYj88G87/ok6dcxexmHCjDD5mAvdeHh9ra6+KNHX1XrmWagX26fFRPnz3gZxR
         oJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QCaggCGaN7CxcdMy5ACqPjRWwkId0XtnRqZdhOcU/sg=;
        b=s0oWmDEyyEwzIruguIQGtLMCVk2wuhw2q6YLq1yt5PgQQT5ZvXbeWhDsZuqdcIm24+
         IPQ7+JbzKPAP5prvBj5Bpon5fduk6DKSJSspDql46sj8HcreUCrMAkMI196DSWJXXhmL
         l8YyaQ+JfDKLLHbfGlOGyuZWhkRBeBspJ7VCyG3f52hFTrdlbtj7hSPQt/mKiMIUX1VO
         A4g6t8ANTAq4yD9/jDkbjjJYEbkK0rGBsAGYIBAejcQpAJhgGUJbnnMkz+8joTdv2O04
         +1CdEp/j/qaN+B0E47nAm3Ffc84qEeFjeeocFLv5Np5COkghq4CznvzVAmn5BodiqzOP
         3Wdg==
X-Gm-Message-State: ANhLgQ0JqfDgvmP59O+JbDj7QOtiOlLFIWkEYXyzj+G1C4VoverYeS/K
	aGyRT0amGJ1eoJMekdvlUAc=
X-Google-Smtp-Source: ADFU+vtND3/dOlOk/Dc2QGMZpTbgoCcjSszBQsxOdS1T+6qfautuxTEt1PXh1Jo/0+Z8Ad1l3J+UZQ==
X-Received: by 2002:a37:4885:: with SMTP id v127mr3303351qka.253.1584839895129;
        Sat, 21 Mar 2020 18:18:15 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q44sm4536614qtq.11.2020.03.21.18.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 18:18:14 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto-dev: update to v5.6+
Date: Sat, 21 Mar 2020 21:18:09 -0400
Message-Id: <95684465ec912ce92d20338098d5253c7a6a896e.1584839764.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1584839764.git.bruce.ashfield@gmail.com>
References: <cover.1584839764.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the revision on linux-yocto-dev to reflect the updated state
of -dev.

The aufs/yaffs2 features are in place, but -rt is not yet available,
so the branches are placeholders for future updates.

This has been tested across all supported architectures and reference
qemu platforms, as well as with closely coupled userspace packages.

We tweak the LICENSE_CHECKSUM as well, since upstream has added an
informational note to the file, but the license is otherwise unchanged.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index c364a97cba..06a9108fab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,11 +30,11 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.5-rc+"
+LINUX_VERSION ?= "5.6-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

