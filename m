Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.393.1632496220648014091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 08:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cxX5JdtG;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id 138so28015430qko.10
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0OUGgEKISkzG3BGohZY/K++45sY6bPiukbSKyv1P41I=;
        b=cxX5JdtGOcTVcB2Y8a8mU+aVMQWVj7J82T8i8tNjPvCICqJ01BaYTaLNhpmpLtKVbv
         kKkMp8JSjYWtZ0YksoR8r0UE9VmbVSi3vL586FUIL0tJpw+wPcZTKepdak9mxOv39GzZ
         G0XZOh5MdcLvVH5QeNPpe6mKiodipzAGfC7BWo/wY6VzYgUpuFontQ6rSovly0AYTPoM
         YxjDbcvsL71wGUZtDDQx//n9t/iNzkdmD8hqOBPd/rI9Fzq6JBj0NdBZHYzkEUE8JlsG
         BRaZzhjfcrnAdL16GBPP8K//8utpgBEFg9KABcx4kFMFGa25L/0iWCw1CC1v9WP0VLQQ
         uZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0OUGgEKISkzG3BGohZY/K++45sY6bPiukbSKyv1P41I=;
        b=uLbKLcrynQJwQ0gs47moXr6F6FixD4F/gAZh6bUskMpjASdDEtjLwYIfdHG2JjVAVn
         NClTGL2p60k9rk5KCgSYmVIAgxBFJBv2fonnaf0K3qGMkJBDLN8CRpABsgCmeeqKUaIS
         wsBiH2fbNCmVaJniJoVQ0e1uhCIwBrBxNIQLLbmeu+Fop/R2hCvAl9k97FHdBYNSumO2
         uV3vb0JdYsGD5YwFV8YVahlQd3twmSdSA7ECBktHba1Q/gCerSQwjGdG8vfiFdPAJqr8
         lIUkml5r/f2A1wop8IhPU1Gyh/RbLATS+QPgrRs4SgHoT5vAnY+VDSr0sY6Odmpzss/D
         8YRg==
X-Gm-Message-State: AOAM531nd201fbXpadO+mynCyheQjwT04g/n+eqsiAWcpBShFKF9Hv1j
	147z+0efmQI4wInDyGfaNxA=
X-Google-Smtp-Source: ABdhPJzZayQ2pXf124kDaohcBxe4Wkm6pX4KOwiPeKsy86874sNkgKHetldgHOp7KFFl4I7KJJXwKA==
X-Received: by 2002:a05:620a:bd4:: with SMTP id s20mr11176277qki.485.1632496219777;
        Fri, 24 Sep 2021 08:10:19 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id k203sm6439797qke.124.2021.09.24.08.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:10:18 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto-dev: update to v5.15-rcX
Date: Fri, 24 Sep 2021 11:10:12 -0400
Message-Id: <bcd08e16a7aaf8db14f893c52dd9576999136761.1632495931.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1632495931.git.bruce.ashfield@gmail.com>
References: <cover.1632495931.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The main reference kernel has moved to 5.14, so we bump -dev to
5.15 for the release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 0911787009..f58b5ab0b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.14+"
+LINUX_VERSION ?= "5.15+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1

