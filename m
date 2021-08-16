Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.31326.1629151308865694526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 15:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=P+3GmwhL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id m21so2931036qkm.13
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 15:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lWjV9jLnez+TuYL7iSJDQGi7d8MrOZV8Jj8Df8Tmw3s=;
        b=P+3GmwhLXMtLo3MiKVuI6oDJ27re7FFZ7y70rvHZJcE5LW6HJV/pE6rR880/GShE6d
         KmxER98EbVAVhrbDLx+uNCxg6zmdcuI5vylY/Hl8IgXOFAXrd5F6/1U3nqg6vylhBmVt
         /1PHUWlJqPLI4dtHE2Z+uoIMAIQ8xxWWytBIBYmzN+m1lwlxzV13O+qCvzYmkbjeFEgz
         1sE6oSg9qXSI0HB19DuJyTLyDg+iJPNhZjNoa/J57fT2JDOOnO04tBwjE+mivcltbtTP
         wugC1YtIRWf+QiayiU42uv03A5lvNjbQSTwGz6GWWPUEl42TCyiINqxJkS2XBB3u4lBX
         P2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lWjV9jLnez+TuYL7iSJDQGi7d8MrOZV8Jj8Df8Tmw3s=;
        b=i0cQlk2jCKmK5AtizF1Rx8cEhvQcNocGJG0SgdYPkYu4a0QPM5OCvEUjdPppn2VB1g
         3DdJfpfdQEzUHBhTaFZFoWGwY+nfj4GjUOSpTk2iM9fiU1mr1/wfJTVL4SYbxlxNHTAh
         IICUF1pGXMifgHniB07EcMM1nU9XHdFg/otif3Ztkxo6AnEQQZQPnxj/C1nG+QGSsvbL
         RM0QwN9/2IVYqYkDzyy+2moEE7og37EkJWrXbO/wf9YNVtTVheFRj2nv/629cHGE62wH
         jXpdZWqO+XS1jIIrwPO3r/Vfze9EvdFkJfL6pnLkBmjkO01ZA/x5+LDJ3nc/DcU8DhgG
         PBJA==
X-Gm-Message-State: AOAM530jlBmn+xohCMVr/J8RKCbHIoJBtp9eD5cxKvZ/NXrCX2u/EqWD
	zgc2Ll9kttPYto4RPFtQnwjZwQS+NkI3Xg==
X-Google-Smtp-Source: ABdhPJzeXS608U5Hpima8fdF0zR49Zukhtgo3nxCQuOvU2HJzefAAwb5P4DKPFHd48YMPsy0uRgaig==
X-Received: by 2002:a37:688f:: with SMTP id d137mr530924qkc.3.1629151307954;
        Mon, 16 Aug 2021 15:01:47 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:f177:a44a:469d:7e14])
        by smtp.gmail.com with ESMTPSA id c7sm16815qtv.9.2021.08.16.15.01.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 15:01:47 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] docs: update docs with new tune locations
Date: Mon, 16 Aug 2021 18:01:44 -0400
Message-Id: <20210816220144.26018-4-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816220144.26018-1-jdmason@kudzu.us>
References: <20210816220144.26018-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 documentation/bsp-guide/bsp.rst           | 4 ++--
 documentation/dev-manual/common-tasks.rst | 2 +-
 documentation/ref-manual/variables.rst    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index b80354a05bb6..37b052427e62 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1266,7 +1266,7 @@ located in the layer ``poky/meta-yocto-bsp/conf/machine`` and is named
    EXTRA_IMAGEDEPENDS += "u-boot"
 
    DEFAULTTUNE ?= "cortexa8hf-neon"
-   include conf/machine/include/tune-cortexa8.inc
+   include conf/machine/include/arm/armv7a/tune-cortexa8.inc
 
    IMAGE_FSTYPES += "tar.bz2 jffs2 wic wic.bmap"
    EXTRA_IMAGECMD:jffs2 = "-lnp "
@@ -1344,7 +1344,7 @@ Project Reference Manual.
    .. note::
 
       The include statement that pulls in the
-      ``conf/machine/include/tune-cortexa8.inc`` file provides many tuning
+      ``conf/machine/include/arm/tune-cortexa8.inc`` file provides many tuning
       possibilities.
 
 -  :term:`IMAGE_FSTYPES`: The
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 7f51674a92a3..4a5011ea749a 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2064,7 +2064,7 @@ Now comes the time to actually build an image and you need a kernel
 recipe, but which one? You can configure your build to call out the
 kernel recipe you want by using the :term:`PREFERRED_PROVIDER` variable. As
 an example, consider the :yocto_git:`x86-base.inc
-</poky/tree/meta/conf/machine/include/x86-base.inc>` include file, which is a
+</poky/tree/meta/conf/machine/include/x86/x86-base.inc>` include file, which is a
 machine (i.e. :term:`MACHINE`) configuration file. This include file is the
 reason all x86-based machines use the ``linux-yocto`` kernel. Here are the
 relevant lines from the include file::
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7aecda017454..d5ac1926b6ee 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8256,7 +8256,7 @@ system and gives an overview of their function and contents.
 
       These tune-specific package architectures are defined in the machine
       include files. Here is an example of the "core2-32" tuning as used in
-      the ``meta/conf/machine/include/tune-core2.inc`` file::
+      the ``meta/conf/machine/include/x86/tune-core2.inc`` file::
 
          TUNE_PKGARCH:tune-core2-32 = "core2-32"
 
-- 
2.20.1

