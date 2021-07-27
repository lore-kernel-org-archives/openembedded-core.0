Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.6974.1627417922075268977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 13:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vWEJHX2d;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id j18-20020a17090aeb12b029017737e6c349so743783pjz.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 13:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYxb3kYoMkFc+9B0/0BKbPJ8u8AMl0CgbBjeYt7Aq4g=;
        b=vWEJHX2dKFHXPKS9dUPizSOMOBqybbVhtOw3vPlpZnAESYv85yQdFkrDQtTKV9Nyt2
         dNqf1sZ1ExslLOP1RIgAHNf7A52gT8Va9LpNzH1nV1/jup3aQD9eFHTVDPAookiP552B
         fXrlVFJzt8NWjaaiWzBjcf2IEmKKUiMmZuN2hHHUPDFWdj3dJNIKfYOXsJj4p7ybC+Q5
         SGLu/a3JdaIS9VsQ4Injs3gGSnkOnkAOOtre63+iIIfB2e0C6EcTqh8zD7I6x+r44omK
         mQeXihwGRp2vXWMrdAp9k2O9WHkclMuNTiwXqdVsEXNyGNqZrjWZz/iBAhsWrAhEY8gn
         6z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYxb3kYoMkFc+9B0/0BKbPJ8u8AMl0CgbBjeYt7Aq4g=;
        b=ZQAxiqD5nBUDYOlT5RxJO49Sts7G/opzB6UeLYBcslUTWNJA/frma4LmV1vwyRjan1
         YY5MYvVL0ynzXAIqktYwxbivlsThWx5w0RBUXCMRI6hNs/VhT2O/EzKjs0IYVY7vXsRz
         1SY3jfWNI9rrJG/iecTGstOvfmx06Efrm4xd/b+/Egk6uMycHukf+0me6gseSBPAmr6c
         RVtS2sqEVWS9iFfO1Bc0pCEomZgDa2nGEeG45EvaOBFR/cprFThO7K2AG/kvMxTA1gZp
         2tvRmaOK0+LBXcNv2oJ1icmgLRxc0xV3MAnN7WMO+pg9/31DMU7YTsEp0zBQCcfzFiRj
         29wg==
X-Gm-Message-State: AOAM531HerTV7akjR1DiZAm/tjifVlhs1otC7GjUyb50Zymr4s3DOfsX
	XOHFdFpCMXhCVNwx1XBSFDpYBUGSreJVsQ==
X-Google-Smtp-Source: ABdhPJw1NwqqAfgBMkrKJzWmxQ50xL8vtphabUkvte1BIOLu6PjQ1YDD+B7/RwTqrQoWRj/ZcbMVlQ==
X-Received: by 2002:a63:4d5e:: with SMTP id n30mr25525055pgl.159.1627417921366;
        Tue, 27 Jul 2021 13:32:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id m21sm4587261pfo.159.2021.07.27.13.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 13:32:00 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] stress-ng: Drop defining daddr_t
Date: Tue, 27 Jul 2021 13:31:56 -0700
Message-Id: <20210727203156.2855973-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is fixed differently upstream [1]

[1] https://github.com/ColinIanKing/stress-ng/commit/7e150ab18b0e8954ca426eb5366000a8f0d01110
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../stress-ng/stress-ng/no_daddr_t.patch      | 32 -------------------
 .../stress-ng/stress-ng_0.12.12.bb            |  2 --
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch b/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch
deleted file mode 100644
index dba4494b91..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 55e11765af2bdc8adfac87dab1fb2682f7e6c236 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Jun 2020 22:10:28 -0700
-Subject: [PATCH] Define daddr_t if __DADDR_T_TYPE is not defined
-
-glibc defined daddr_t but musl does not, ideally it should not be used
-and simple int type is enough. However, its better to leave glibc behavior
-as it is and only define it to int if daddr_t is not provided by libc
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- stress-ng.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/stress-ng.h b/stress-ng.h
-index 1a66293..802dc25 100644
---- a/stress-ng.h
-+++ b/stress-ng.h
-@@ -3763,6 +3763,10 @@ struct shim_statx {
- 	uint64_t __spare2[14];
- };
- 
-+#ifndef __DADDR_T_TYPE
-+typedef int daddr_t;
-+#endif
-+
- /* old ustat struct */
- struct shim_ustat {
- #if defined(HAVE_DADDR_T)
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
index 97eaa75d18..430eac0d87 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
-           file://no_daddr_t.patch \
            "
 SRC_URI[sha256sum] = "f27af50f6f2308e707fef927674bdd209a046b116734281b792aeca35a4e4499"
 
@@ -24,4 +23,3 @@ do_install() {
     oe_runmake DESTDIR=${D} install
     ln -s stress-ng ${D}${bindir}/stress
 }
-
-- 
2.32.0

