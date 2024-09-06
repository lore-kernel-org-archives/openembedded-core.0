Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889FBE6FE43
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 18:02:57 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.5452.1725645772249953243
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 11:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=STDeLm6m;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4568571de47so13627971cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725645771; x=1726250571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSNbaFRjUtoadU3W6szDeIbIDf6VT/8fZ/KLbsEGfGk=;
        b=STDeLm6mtd7tvh5rwDHXDi1TxmYXjYK8tHetKCTtuRTd9FMW3pD4s8nzfQk3a057ov
         Vb8VUVzxLJsNV7eHzaQCotHkYBKngf4bsvoXY0cC0DielgJnXB4Z/GfR0NKbjozdnlCR
         UaldkGTs739MNYyYYYGrTgvq9/TllaaUApB6Qoos2esGFt7sbabNrn3uZAMhmla/xltE
         gyPnMRMu/AetGrsTlL0dr68MKzFYSsnIulfp0oVlAJoJJ8RxQ1U1nLfR3NI3UH3Ug6UM
         KCUba8qyv51il1zBgNiXXvnlFmhIOuXlgBUkHmM9hPu/zcn3ZwdNED6/eWvjPU10HP+h
         SVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725645771; x=1726250571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSNbaFRjUtoadU3W6szDeIbIDf6VT/8fZ/KLbsEGfGk=;
        b=CmT5VTb3YPy8mJ7F2yzjcGHGFUOvdSaaAIfncmKQuUinsUbYOdbQ77yJFmZNerUeBk
         CpmTkUeHTtSlmU6+aOhD3UlrPuQ1U1bLQdnJjKzKT1TH4iMxV1S9v+2+jrJzE8vpGYSw
         pdXYzm5GV0qphP/4JZUC/dOX8Wut6JLKUIwtUeWL6zz2Tn1Z03qrP2FI4o8ddFRzKs06
         rklqrk3CnASsoyZpElikLEKFMRFyfCW8Lbd3YSFTU0715Cgi4aoBQ/Sgn2P2e6U8VKxl
         8KmCh/bsdoAH7FoWLYoP9t40ClL9X5dHR3VU+udZKk0JSGhHemi3R/JdKA8ydfZZtvcy
         QQ5g==
X-Gm-Message-State: AOJu0YwdICyki4odMN7YVHmoRkO6hlpYQlecpB3dQgx3LbRtGw66oRGm
	Axzyrmdgo0JbxpHezRs6C2x2y3Ud9Av48VAnhVjCdal+Tyu7AhoBtzZWDg==
X-Google-Smtp-Source: AGHT+IHrlGntADbQZPoPAdWSiuEfD7wPIMkAgK2ov1zogFJZD6cdaRrMDTNtQ2oBNc8ITuknslSeSQ==
X-Received: by 2002:ac8:5d46:0:b0:457:c9f4:2717 with SMTP id d75a77b69052e-4580c6703f2mr43845651cf.9.1725645771176;
        Fri, 06 Sep 2024 11:02:51 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45801a15393sm18136871cf.3.2024.09.06.11.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:02:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/5] linux-yocto/5.10: remove obsolete options
Date: Fri,  6 Sep 2024 14:02:44 -0400
Message-Id: <20240906180247.376758-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906180247.376758-1-bruce.ashfield@gmail.com>
References: <20240906180247.376758-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 18:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204289

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Wenlin Kang
    Email: wenlin.kang@windriver.com
    Subject: net_sched: remove NET_SCH_CBQ and NET_SCH_DSMARK
    Date: Tue, 18 Jun 2024 18:41:49 +0800

    The two configs have been removed from kernel source in commit 56a6720d9bc3
    and 3fa31e7a9d3a, so here also remove them to fix warning.

    WARNING: linux-yocto-5.10.216+gitAUTOINC+c658f078fe_bcf06546f5-r0 do_kernel_configcheck: [kernel config]: This BSP contains fragments with warnings:

    [INFO]: the following symbols were not found in the active configuration:
         - CONFIG_NET_SCH_CBQ
         - CONFIG_NET_SCH_DSMARK

    Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 9c37ea8a15..bc4e49ca08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6ed671f36a091fc09ca9ee804ff959bc7d6eb4c1"
-SRCREV_meta ?= "c658f078fe16bd2689f39a713bf17be1874bae53"
+SRCREV_machine ?= "421ad32504cf202dafd09394bae1ad6521539a49"
+SRCREV_meta ?= "19c510890b99cfc450db69a97cf585593deb1d95"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2cf94cc9f6..d2e540847a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "a897f5860a61c0bd5eac9780b292dba2f158a33b"
-SRCREV_machine ?= "5506a25c2de1ff6956b79138000301f344a6e869"
-SRCREV_meta ?= "c658f078fe16bd2689f39a713bf17be1874bae53"
+SRCREV_machine:qemuarm ?= "cf393a05f2ba24f3bc5f3727a5fe9dc63ec247bd"
+SRCREV_machine ?= "9f2e7d21741259c175f6186577bd82f82cb1f96a"
+SRCREV_meta ?= "19c510890b99cfc450db69a97cf585593deb1d95"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 97772390b2..cb03649545 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,17 +14,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "590d7093102d1def24e8034ee0be799797b62a5f"
-SRCREV_machine:qemuarm64 ?= "b1dc4c88ed9dd6e6abe2886bf765ebb741070c7e"
-SRCREV_machine:qemumips ?= "c09fe97a7469eb7a20cc60e9fb759ad433a78b91"
-SRCREV_machine:qemuppc ?= "9f1cff9c0409729a3aa098e411e4b20cf1d94001"
-SRCREV_machine:qemuriscv64 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
-SRCREV_machine:qemuriscv32 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
-SRCREV_machine:qemux86 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
-SRCREV_machine:qemux86-64 ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
-SRCREV_machine:qemumips64 ?= "9fc7eb5bd92e22ec62caa3a1896b967109095916"
-SRCREV_machine ?= "a035e16d75c1cd721091559a771bf967d5fa03f7"
-SRCREV_meta ?= "c658f078fe16bd2689f39a713bf17be1874bae53"
+SRCREV_machine:qemuarm ?= "ebf8b0d0c68aeca12d7f7a2fa35c2991e23f5ae4"
+SRCREV_machine:qemuarm64 ?= "9837e97ae4ced4fdb9250acd275ad1decfde6e5e"
+SRCREV_machine:qemumips ?= "18f0ddf9859784df80af64e4d6f9a41c49b8b1f4"
+SRCREV_machine:qemuppc ?= "c0adf44845851025b1a18c50927af16a7d049ab8"
+SRCREV_machine:qemuriscv64 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
+SRCREV_machine:qemuriscv32 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
+SRCREV_machine:qemux86 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
+SRCREV_machine:qemux86-64 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
+SRCREV_machine:qemumips64 ?= "5341a9dbcda59f3c95aed519a6b86e96cd6fdf65"
+SRCREV_machine ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
+SRCREV_meta ?= "19c510890b99cfc450db69a97cf585593deb1d95"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-- 
2.39.2


