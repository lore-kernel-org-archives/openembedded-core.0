Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.13803.1629891507737576876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R9zn0BFf;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id o39-20020a05600c512700b002e74638b567so4357672wms.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T6GgyynrJvccencz2pGguy0MjL8Of9vYpKHLiEri8x8=;
        b=R9zn0BFfn7Ncm7dVLA+KdGeKrqnEI8w9LPk/tlKem2G/MgQ7ETIruztrRM1gbRdB6N
         gqYsixFpbNQPIfHtEYPfqMuMb1XJDotc8mVHPp27l+SCcvTuQAus4ydmAJAWnlIMwn6I
         ZH5F/YMXkHQWuwoklkUXp08W7i+PrJ1MH4PJzDIpMHkFLfO3qL3MgBjR0lzxYdzsefGv
         /+p6kfX9xto8Nd3elvl2AEjiL7FQJDA6E6+AVjEV/+nzzFpL3yTSHfyEYSLzzFyuMnTJ
         TiS6paQjrKs0+vKlX3tEUQhok9VYQUR9ADuN3rbjOVd+hUPF75RQBfEMs/yxIS3q5XEA
         nRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T6GgyynrJvccencz2pGguy0MjL8Of9vYpKHLiEri8x8=;
        b=cNXhX0ekBocQuZtv118f+rbPTA/DvVJl2ImblF0U4HorA/qgnohf+owBGkySt/OQt4
         sx2UkxZyk7rncGyJnFIMsQNz4e9OznMwqY01sS4cbzRiOvwHalmRk0c+UERo5a5WHFic
         m2GPlSjPgQz00dhW9RxP0V8XqlTKFt5Rys82TQTR+cKVVtIN5FkZxpzrIpONpiVN+VHh
         WLjNf7DJOje7JeRU4bSA0K4VPsCjkI09RdHBamu2y9FGS22g4fehLLUyizuQJuq1UFY3
         RV45uHWDTA0MYzHu2fPk5KHGaE8uKXRbHc42BhgP1du+EP0zdNxuW9w6huK8b5YwrOCH
         rZwA==
X-Gm-Message-State: AOAM530fE/jEFqQc3M3YTISPfg5pgw18ICPU1xrt1Q4gfdfk7j+rPymX
	7GZbexznL6SxrCWm13RZR3vG7id4DBw1CQ==
X-Google-Smtp-Source: ABdhPJxx9tMRaCUmiOMb3LZhdd5JIS8X2YfnxGZYrrX6Ipwnqs9GtHt7g7CuahUyqTIxPNXXq0izFQ==
X-Received: by 2002:a7b:c396:: with SMTP id s22mr8646778wmj.131.1629891506399;
        Wed, 25 Aug 2021 04:38:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/16] util-linux: upgrade 2.37.1 -> 2.37.2
Date: Wed, 25 Aug 2021 13:37:52 +0200
Message-Id: <20210825113804.779395-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...2.37.1.bb => util-linux-libuuid_2.37.2.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  3 +-
 .../util-linux/CVE-2021-37600.patch           | 33 -------------------
 ...l-linux_2.37.1.bb => util-linux_2.37.2.bb} |  0
 4 files changed, 1 insertion(+), 35 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.37.1.bb => util-linux-libuuid_2.37.2.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
 rename meta/recipes-core/util-linux/{util-linux_2.37.1.bb => util-linux_2.37.2.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.37.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.37.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.37.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.37.2.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0f17c73e86..1e3cd28801 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,7 +35,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://CVE-2021-37600.patch \
            "
 
-SRC_URI[sha256sum] = "8e4bd42053b726cf86eb4d13a73bc1d9225a2c2e1a2e0d2a891f1020f83e6b76"
+SRC_URI[sha256sum] = "6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch b/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
deleted file mode 100644
index 2b306c435b..0000000000
--- a/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 27 Jul 2021 11:58:31 +0200
-Subject: [PATCH] sys-utils/ipcutils: be careful when call calloc() for uint64
- nmembs
-
-Fix: https://github.com/karelzak/util-linux/issues/1395
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-CVE: CVE-2021-37600
-Upstream-Status: Backport [1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c]
-
-Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
----
- sys-utils/ipcutils.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sys-utils/ipcutils.c b/sys-utils/ipcutils.c
-index e784c4dcb..18868cfd3 100644
---- a/sys-utils/ipcutils.c
-+++ b/sys-utils/ipcutils.c
-@@ -218,7 +218,7 @@ static void get_sem_elements(struct sem_data *p)
- {
- 	size_t i;
- 
--	if (!p || !p->sem_nsems || p->sem_perm.id < 0)
-+	if (!p || !p->sem_nsems || p->sem_nsems > SIZE_MAX || p->sem_perm.id < 0)
- 		return;
- 
- 	p->elements = xcalloc(p->sem_nsems, sizeof(struct sem_elem));
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.1.bb b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.37.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.37.2.bb
-- 
2.31.1

