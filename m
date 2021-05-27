Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.5160.1622112874578118712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 03:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GaQnNQnE;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id lg14so7305937ejb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 03:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hVZIJ2xeHrKrpU6ICEE/Hsr3AvU68NMcPEdM+9EvdOg=;
        b=GaQnNQnEzi4Ia7QBO3Ez/2TumgwdPSdlPS/RKFZKk2jO2lLMiTUmc96lPHewjlg8T9
         vL8fkSiC9vuwcbwk4MyaX/f05Vrzc6TY5lTlRXhGReA3F/DCalkXEzoE4MeOU/dW9i7j
         xvqp2jKR9GBbogZ0FxPcbJB4yCN3XqzqE6pqwL4X/3AgOhRQF5yQ7wQ8YlVmvx3oeBm/
         WTgcKsCvPD9V/8KhfdbJLdqSeeAP4d0g6id90pHJfqBVa55nPId9Lxh99gNY0vdBGnhS
         H5nMP3+u/vCfOJnkRrXdi50lR9ldEr6hTsSXbQf+TlM0jTug76q5TMO8zyVnnJ6kCkqZ
         d/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hVZIJ2xeHrKrpU6ICEE/Hsr3AvU68NMcPEdM+9EvdOg=;
        b=jwM9SwQQaHaeMMMnka1nBAddxMaROGG1BHyjCOrQ17oHgJiMcgJwWj4il0kDFZtWca
         T1t2jkmbN/U69zOblmFb3V/SQYvzYtmTA16ItJ2fHtAg66LbOqabLgN+pYKaUm9h5NoB
         L3gwLWvSUnX0Rf3I75lvpXsHG7DS83tZUHfNS0oeSh09O4wvyCLmh4YTt7lyPHtb7hpk
         m+HycbM2fRpwrCpOjK5oonuKnB8SGVMe31yvvEymc/u4AWYbeS/aTRh8zbogQKTgnq4e
         VKW0WExV+A6OS3RYscXWkgytGcercHWWjri2xij8zQ9A2wdFGNguXE2vDrBg4szJk4mJ
         XnNQ==
X-Gm-Message-State: AOAM531ho9Uu76QfYy559t2msCnoa4agWJoLrT/tqNVP4xt0riXziszY
	Pq5/GWM+oCRUgBroFu903OoQlz3I5uM=
X-Google-Smtp-Source: ABdhPJzZ75L5eEGWIjA4TK2fUuLCPRW3ZM6XlfLmlq2N+/N3/RCf3QLK7SklTcSy3fTdv5vspiGAFQ==
X-Received: by 2002:a17:906:3a8e:: with SMTP id y14mr3131741ejd.153.1622112873133;
        Thu, 27 May 2021 03:54:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n13sm803037ejk.97.2021.05.27.03.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 03:54:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/4] images: remove sato/weston ptest images
Date: Thu, 27 May 2021 12:54:26 +0200
Message-Id: <20210527105426.515519-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527105426.515519-1-alex.kanavin@gmail.com>
References: <20210527105426.515519-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They have been replaced by core-image-minimal-ptest-fast/all

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../images/core-image-weston-ptest-all.bb     | 21 ---------------
 .../images/core-image-weston-ptest-fast.bb    | 20 --------------
 .../images/core-image-sato-ptest-fast.bb      | 23 ----------------
 .../images/core-image-sato-sdk-ptest.bb       | 27 -------------------
 4 files changed, 91 deletions(-)
 delete mode 100644 meta/recipes-graphics/images/core-image-weston-ptest-all.bb
 delete mode 100644 meta/recipes-graphics/images/core-image-weston-ptest-fast.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-ptest-fast.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb

diff --git a/meta/recipes-graphics/images/core-image-weston-ptest-all.bb b/meta/recipes-graphics/images/core-image-weston-ptest-all.bb
deleted file mode 100644
index a622779e6a..0000000000
--- a/meta/recipes-graphics/images/core-image-weston-ptest-all.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require core-image-weston-sdk.bb
-require conf/distro/include/ptest-packagelists.inc
-
-DESCRIPTION += "Also includes ptest packages."
-
-# Include the full set of ptests
-IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
-
-# This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
-# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 1100MB.
-# strace-ptest in particular needs more than 500MB
-IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
-
-# ptests need more memory than standard to avoid the OOM killer
-# also lttng-tools needs /tmp that has at least 1G
-QB_MEM = "-m 2048"
-
-# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
-PTEST_EXPECT_FAILURE = "1"
diff --git a/meta/recipes-graphics/images/core-image-weston-ptest-fast.bb b/meta/recipes-graphics/images/core-image-weston-ptest-fast.bb
deleted file mode 100644
index df02befb66..0000000000
--- a/meta/recipes-graphics/images/core-image-weston-ptest-fast.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require core-image-weston-sdk.bb
-require conf/distro/include/ptest-packagelists.inc
-
-# Include only fast (< 30 sec) ptests
-IMAGE_INSTALL += "${PTESTS_FAST}"
-
-DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
-
-# This image is sufficiently large (~1.8GB) that it can't actually fit in a live
-# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 1500MB.
-# strace-ptest in particular needs more than 500MB
-IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
-
-# ptests need more memory than standard to avoid the OOM killer
-QB_MEM = "-m 1024"
-
-# Sadly at the moment the fast set of ptests is not robust enough and sporadically fails in a couple of places
-PTEST_EXPECT_FAILURE = "1"
diff --git a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
deleted file mode 100644
index d37ad00cf8..0000000000
--- a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-inherit features_check
-REQUIRED_DISTRO_FEATURES = "ptest"
-
-require core-image-sato-sdk.bb
-require conf/distro/include/ptest-packagelists.inc
-
-IMAGE_INSTALL += "${PTESTS_FAST}"
-
-DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
-HOMEPAGE = "https://www.yoctoproject.org/"
-
-# This image is sufficiently large (~1.8GB) that it can't actually fit in a live
-# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 1500MB.
-# strace-ptest in particular needs more than 500MB
-IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
-
-# ptests need more memory than standard to avoid the OOM killer
-QB_MEM = "-m 1024"
-
-# Sadly at the moment the fast set of ptests is not robust enough and sporadically fails in a couple of places
-PTEST_EXPECT_FAILURE = "1"
diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
deleted file mode 100644
index eea89a5d6c..0000000000
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-inherit features_check
-REQUIRED_DISTRO_FEATURES = "ptest"
-
-require core-image-sato-sdk.bb
-require conf/distro/include/ptest-packagelists.inc
-
-DESCRIPTION += "Also includes ptest packages."
-HOMEPAGE = "https://www.yoctoproject.org/"
-
-PROVIDES += "core-image-sato-ptest"
-
-# Also include ptests which may not otherwise be included in a sato image
-IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
-
-# This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
-# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 1100MB.
-# strace-ptest in particular needs more than 500MB
-IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
-
-# ptests need more memory than standard to avoid the OOM killer
-# also lttng-tools needs /tmp that has at least 1G
-QB_MEM = "-m 2048"
-
-# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
-PTEST_EXPECT_FAILURE = "1"
-- 
2.31.1

