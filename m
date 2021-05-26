Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.3089.1622061642031542325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 13:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UU5eBU37;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id b17so3161832ede.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 13:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hVZIJ2xeHrKrpU6ICEE/Hsr3AvU68NMcPEdM+9EvdOg=;
        b=UU5eBU37HCOZ7TlG10BCByCk5y6134IiPvj8zqtgngfDTu0y3543uE0ufi9XBNm5Qz
         H4KbuZkFjs+XRt/MhBfD4V9S8J73ogZJO2ClmArMddrVauzEL6Pq9GZ3aM5wwninnutf
         hU4Q/+Q9Fw5Xf1LaPZyeUtr6JhX77/tjBKSt0QW7jvHdlVeL2gyouHi+nJlZBhArbyAs
         VJ2OfZTs2Ixit7brsTCtVhywgGgZ696Qj22LdZ6J/Od14lMTOgvGbbOfQ+ASBl1MMCKI
         JcwgAyZUHgOi/c6sAIeGNMPQlAijqEFGGEL6bsUEv8bja6AFTA2hfofDXu1YxaOqMhw5
         ovTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hVZIJ2xeHrKrpU6ICEE/Hsr3AvU68NMcPEdM+9EvdOg=;
        b=SJY8PbAfo2y8bj2FPB295wlAcuLu4J2cDu3Ps1scgUhvN1R8KakNrSQTPS3CLyLkv8
         iXlDkvJiezxmVtVTC94pc5s39ZHWca8paEbl17q+IZ4Nmi9dgFnnOR20LHtltQfAMQWt
         pXl6xgq89GpiIwLznueXye/Vk/bznYGfFSk187zQZC5Ewk5e2oVwlos8k5qmXhUl9Fx8
         MA3qOqjs9gzXE9WX3IfpBwie3i9MdluGFszQhtAsYwqiu4Hml9/Y2uvvZ6kULR14Io5A
         ulSTmsBMIWT4xlaizfO4dqVIqL02fx8sDr8JpSXfcbHIW/8YqIZvvDnqB6NPqC1uty6G
         ZkkQ==
X-Gm-Message-State: AOAM532PJWLc3cDVgv1MERsK85w47a3eddYF6Bd0ent7ZkECPi+KPn3G
	rJtP2omTNZUan65bZd7XdddnEjlMnq8=
X-Google-Smtp-Source: ABdhPJxYhwurRRNQpFwkJeg2u6lfdAieOlgBRsaPyDXnH5wOPjecbCSb5T+k9Pbz/PVOaNnOPtxWmw==
X-Received: by 2002:a05:6402:176b:: with SMTP id da11mr108610edb.234.1622061640431;
        Wed, 26 May 2021 13:40:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id hb14sm70184ejb.118.2021.05.26.13.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 13:40:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/4] images: remove sato/weston ptest images
Date: Wed, 26 May 2021 22:40:18 +0200
Message-Id: <20210526204018.496352-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526204018.496352-1-alex.kanavin@gmail.com>
References: <20210526204018.496352-1-alex.kanavin@gmail.com>
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

