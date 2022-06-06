Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF7ACCA483
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.31066.1654516904534869132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nQ9vCjRF;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id u8so15222173wrm.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OfVJ1n/sbEkhn1+7IoZ9PDbcqDaoX0keBMu2ehqBk+U=;
        b=nQ9vCjRFrX/D6HqWoMWbWnBErWK5AKpo4gvzwld7TdXZj0uxK2CIK31I4NAdjfw1rO
         00orhNInAYcdQK2fIi+CMx8UwwOXPbfpJdUjjbTkVzDYlvpq9nvG/HpGqONtxL8Dr+RB
         RW2TlPswrmMlbmhpRSiyNs8J6Uo9bHMYbxn29rnUyfLDlfOtWRyZ0lW5bp7YTqhOpca8
         kAbZ/Wb7jtO4rZaYCw6aKQywk1knOuNs27haISQQgQ2eycCo1hwtlX6oxGaDyBMaxCor
         jzqKOD6TYVXBBaqPXQrH+OVBES9k9vbBt4tTX5M4tX9rhyQiecTU+X33eNvIi0ZenZfW
         em4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OfVJ1n/sbEkhn1+7IoZ9PDbcqDaoX0keBMu2ehqBk+U=;
        b=U8vtemqEex/5JG1ZOrYVhnwWsdPsHnv3rfavw5c/CTXoXYtkFb6z+TR2BJ1/LWjFE3
         a013xhou/ahtltuBiR9/q8HGUXCmZ8n5QOtd7V400Xwies3vNB6xfNc0uERa/F0Xvgtv
         FMwmZZGBJjZhtv7vTb6d26GO++Ntxnz7IWwje6PKfZcn7sKAyknE5x1CX8jxq+aBLOvb
         8+9ioZvzovroaUUYZ6Kjt64HJ6zARWjtRWDwDd93DYJc+9mClpNMqCpxjljyMgmHw0hI
         CwkUj11I+z8LCAE1+2PhYlGSsQdI295o9YIOJOdStlcZvgePjKNsmYH75gJ9gr3zqGKD
         9tQw==
X-Gm-Message-State: AOAM533aH/nQA3eHKxaqYfUn4fQCHZsDLjpovqfOyQ7m02PkyPQSYamn
	NM8l78RUKI29eG2j4JwcWl+2VPaAw/Co/Q==
X-Google-Smtp-Source: 
 ABdhPJxaZym1PDeTrWPB/1rhh1eMJcfDEcZGCFbHbJOI4Mq2Fh2wcye/PvvvLcJcgsz2Lm+4QHrQwQ==
X-Received: by 2002:a05:6000:2cf:b0:212:27f2:a6c5 with SMTP id
 o15-20020a05600002cf00b0021227f2a6c5mr21387778wry.530.1654516902983;
        Mon, 06 Jun 2022 05:01:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/21] ovmf: update 202202 -> 202205
Date: Mon,  6 Jun 2022 14:01:20 +0200
Message-Id: <20220606120126.3381438-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166609

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-BaseTools-fix-gcc12-warning-1.patch  | 51 -------------------
 .../0001-BaseTools-fix-gcc12-warning.patch    | 49 ------------------
 meta/recipes-core/ovmf/ovmf_git.bb            |  6 +--
 3 files changed, 2 insertions(+), 104 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-wa=
rning-1.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-wa=
rning.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1=
.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.pat=
ch
deleted file mode 100644
index 23366b4d07..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From b0a0b7b605aeb8106e7b50d1efeb746f401498cc Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Thu, 24 Mar 2022 20:04:35 +0800
-Subject: [PATCH] BaseTools: fix gcc12 warning
-
-Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
-Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?out=
Stream? in ?*p.rc.outStream? [-Werror=3Ddangling-pointer=3D]
- 2828 |   p->rc.outStream =3D &outStream.vt;
-      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
- 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
-      |                            ^~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
-Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?out=
Stream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=3Ddangling-pointer=3D]
- 2828 |   p->rc.outStream =3D &outStream.vt;
-      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
- 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
-      |                            ^~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
-cc1: all warnings being treated as errors
-
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/85021f=
8cf22d1bd4114803c6c610dea5ef0059f1]
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Bob Feng <bob.c.feng@intel.com>
----
- BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/S=
ource/C/LzmaCompress/Sdk/C/LzmaEnc.c
-index 4e9b499f8d..4b9f5fa692 100644
---- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
-+++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
-@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, Bo=
olInt reInit,
- =0D
-   nowPos64 =3D p->nowPos64;=0D
-   RangeEnc_Init(&p->rc);=0D
--  p->rc.outStream =3D &outStream.vt;=0D
- =0D
-   if (desiredPackSize =3D=3D 0)=0D
-     return SZ_ERROR_OUTPUT_EOF;=0D
- =0D
-+  p->rc.outStream =3D &outStream.vt;=0D
-   res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);=0D
-+  p->rc.outStream =3D NULL;=0D
- =0D
-   *unpackSize =3D (UInt32)(p->nowPos64 - nowPos64);=0D
-   *destLen -=3D outStream.rem;=0D
---=20
-2.36.1
-
diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.p=
atch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
deleted file mode 100644
index 91c01647db..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 2435c17e56652479315853cec5b91fb0ea0911a3 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Thu, 24 Mar 2022 20:04:34 +0800
-Subject: [PATCH] BaseTools: fix gcc12 warning
-
-GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose? [-Werror=
=3Duse-after-free]
-  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  =
of %s", InFileHandle);
-      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
-GenFfs.c:544:5: note: call to ?fclose? here
-  544 |     fclose (InFileHandle);
-      |     ^~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/7b005f=
344e533cd913c3ca05b266f9872df886d1]
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Bob Feng <bob.c.feng@intel.com>
----
- BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
- BaseTools/Source/C/GenSec/GenSec.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/GenFf=
s/GenFfs.c
-index 949025c333..d78d62ab36 100644
---- a/BaseTools/Source/C/GenFfs/GenFfs.c
-+++ b/BaseTools/Source/C/GenFfs/GenFfs.c
-@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
-   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
-   if (PeFileBuffer =3D=3D NULL) {=0D
-     fclose (InFileHandle);=0D
--    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
-+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);=0D
-     return EFI_OUT_OF_RESOURCES;=0D
-   }=0D
-   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
-diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/GenSe=
c/GenSec.c
-index d54a4f9e0a..b1d05367ec 100644
---- a/BaseTools/Source/C/GenSec/GenSec.c
-+++ b/BaseTools/Source/C/GenSec/GenSec.c
-@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
-   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
-   if (PeFileBuffer =3D=3D NULL) {=0D
-     fclose (InFileHandle);=0D
--    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
-+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);=0D
-     return EFI_OUT_OF_RESOURCES;=0D
-   }=0D
-   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
---=20
-2.36.1
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 84e3360a3a..aac30ead30 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -25,12 +25,10 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;bran=
ch=3Dmaster;protocol=3Dhttps \
            file://0003-ovmf-Update-to-latest.patch \
            file://0005-debug-prefix-map.patch \
            file://0006-reproducible.patch \
-           file://0001-BaseTools-fix-gcc12-warning.patch \
-           file://0001-BaseTools-fix-gcc12-warning-1.patch \
            "
=20
-PV =3D "edk2-stable202202"
-SRCREV =3D "b24306f15daa2ff8510b06702114724b33895d3c"
+PV =3D "edk2-stable202205"
+SRCREV =3D "16779ede2d366bfc6b702e817356ccf43425bcc8"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 inherit deploy
--=20
2.30.2


