Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.180998.1598214074793457257
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lh/q9nPQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id md23so8528394ejb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JQwJtlhDGHxHwwqSmeT///kR2CT0F5A4t3NeCJHAwS4=;
        b=lh/q9nPQOByTzdUop/mJktLDM0NHN/gwZrxcayHTYr9P9f+49o8uXPr+lCsWXx/laC
         aMmXYn+XeZ50D6LsxDLSjEuWGE7fWh8dMj58lywvcTkMb7Snjw+uY4qgubmwi93aq/Xc
         XYBO8zvhMXbIiB1QZjHFcrEKLiDEpQtTILzRoxu2gYBl2XQf/KJ8cgwYl6CjPYb3unSJ
         ArnPoobE5vNyNKAODJw9cY2+G4hG0I7VvDKfWoDpXGRflq0ZMC3k/hXgLl4pAjlrveKa
         O/hxEm2mpiAsIdZVE0H/x4+90ESn4kSCHn/+FmAFQ2MFdlRxhhGyUNLjTOsEgpaLabtJ
         HLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JQwJtlhDGHxHwwqSmeT///kR2CT0F5A4t3NeCJHAwS4=;
        b=MHsC3S5wGqiies/POFDEqi+Zp4L5uVPUW0Ye3uuipmwPZ3VejImAu2IVVs5uiiSTMI
         s+9q4XI2uEjSmN9YG2RvcQFY4m/mRKa7+Met1juF3cWe7dGiCJzPaaUIv8SFnZxqWNV/
         hn19VE+yyGTpZ+SAI2Eg91/uUoGALMY7ANT4pnDZjtRyB8cI5BauRKiEzSJvJTkzf6PV
         VKOIHgzxuszhpHWnrLI7LASsdNP/Z1c62TUQ4l1Vetyi8L3yG3bWft2GHqk8Vzc3KblC
         HOy29DfhJojFXwgn/0uEpu/ub6jf8GzKIqwZeOK8N0lcRNwlyuWwM/dc9slFal+MYtJs
         xHsw==
X-Gm-Message-State: AOAM533ui+omLSgV+rqKRBCrGhupq+1MvZ98kJrx5gbfgxlvIMtOKb8V
	i0+vup4Jn2GVQtLKK8l9ui/2GtYKiv4=
X-Google-Smtp-Source: ABdhPJyoPtfOQA4PgtoLn1aKmp1kxL4V8m66XpRZTpHMwnt4lyE2232OAJM+wh1oGM2lyWXZBz2DpA==
X-Received: by 2002:a17:906:4b0d:: with SMTP id y13mr2672828eju.39.1598214072935;
        Sun, 23 Aug 2020 13:21:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/37] cryptodev: upgrade 1.10 -> 1.11
Date: Sun, 23 Aug 2020 22:20:03 +0200
Message-Id: <20200823202031.24686-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-linux_1.10.bb => cryptodev-linux_1.11.bb} |  0
 ...odule_1.10.bb => cryptodev-module_1.11.bb} |  6 +--
 ...-tests_1.10.bb => cryptodev-tests_1.11.bb} |  0
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  2 +-
 .../0001-Fix-build-for-Linux-5.8-rc1.patch    | 49 -------------------
 5 files changed, 3 insertions(+), 54 deletions(-)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.10.bb => cryptodev-linux_1.11.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.10.bb => cryptodev-module_1.11.bb} (68%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.10.bb => cryptodev-tests_1.11.bb} (100%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.10.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.11.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-linux_1.10.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.11.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.11.bb
similarity index 68%
rename from meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-module_1.11.bb
index 6474599c45..b3b554c7d3 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.11.bb
@@ -7,10 +7,8 @@ inherit module
 # Header file provided by a separate package
 DEPENDS += "cryptodev-linux"
 
-SRC_URI += " \
-file://0001-Disable-installing-header-file-provided-by-another-p.patch \
-file://0001-Fix-build-for-Linux-5.8-rc1.patch \
-"
+SRC_URI += "file://0001-Disable-installing-header-file-provided-by-another-p.patch \
+           "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
 
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.10.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.11.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-tests_1.10.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-tests_1.11.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index f99f8bc9f0..906f4fc181 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
            "
-SRCREV = "a87053bee5680878c295b7d23cf0d7065576ac2b"
+SRCREV = "2299d39475e91392abd050ea09f2d20feecb4adf"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch
deleted file mode 100644
index 02c721a4f3..0000000000
--- a/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 9e765068582aae3696520346a7500322ca6cc2de Mon Sep 17 00:00:00 2001
-From: Joan Bruguera <joanbrugueram@gmail.com>
-Date: Sat, 13 Jun 2020 19:46:44 +0200
-Subject: [PATCH] Fix build for Linux 5.8-rc1
-
-See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9740ca4e95b43b91a4a848694a20d01ba6818f7b
-          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=da1c55f1b272f4bd54671d459b39ea7b54944ef9
-          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d8ed45c5dcd455fc5848d47f86883a1b872ac0d0
-
-Signed-off-by: Joan Bruguera <joanbrugueram@gmail.com>
-
-Upstream-Status: Backport [9e765068582aae3696520346a7500322ca6cc2de]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- zc.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/zc.c b/zc.c
-index ae464ff..2c286bb 100644
---- a/zc.c
-+++ b/zc.c
-@@ -58,7 +58,11 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
- 		return 0;
- 	}
- 
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0))
- 	down_read(&mm->mmap_sem);
-+#else
-+	mmap_read_lock(mm);
-+#endif
- #if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 6, 0))
- 	ret = get_user_pages(task, mm,
- 			(unsigned long)addr, pgcount, write, 0, pg, NULL);
-@@ -74,7 +78,11 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
- 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
- 			pg, NULL, NULL);
- #endif
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0))
- 	up_read(&mm->mmap_sem);
-+#else
-+	mmap_read_unlock(mm);
-+#endif
- 	if (ret != pgcount)
- 		return -EINVAL;
- 
--- 
-2.17.1
-
-- 
2.28.0

