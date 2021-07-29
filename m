Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.5461.1627534210196079911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 21:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y9TxbRaQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id a12so3108763qtb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 21:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5X6S/TfxOaPoREQVv8qlV7uEsqgE3ijrM3LCuh2pIdY=;
        b=Y9TxbRaQRVQgFN9AZ6WrkYfYZ8LDTWUcgnFDR2pWBKxWGquPPSUvOu1cTulMN48ocf
         P3rJT+Xmt58gfiRMajwe5UeYqX9CA0bfFK43Y0bzMk4MhtstMGe6z3LCZEU1z4Cb3ODw
         cICNSpU3j/akCmO/L/gKqXnjpxXBjQ7BH0RYUP++Bhx9W9JqvWV7XLFtaepv29YBnE6s
         UK8rCLZXWfk4kGKrOvWkNnDIDUHrriuTVbZ/mdALZ6GjCirrOmvt2jXtL8NxVYLHIFcu
         Q1lajw9xItIGqThiShT46x3UMbJX4Bz1qtcIZx37mJ4yavPQ1VsNAMZjyrHVO+z9YKw0
         9y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5X6S/TfxOaPoREQVv8qlV7uEsqgE3ijrM3LCuh2pIdY=;
        b=BRATBZRkgBcgFh5NJGLKXKSCJtK51kSryWjsVRQTKVbTdkmo3845FOZEE5Pfh6jINI
         CFRJNS6WA8qSjVYCsUq+4kZH7BzI0GttU4+zGmNrLgNkRolAqXG8tMlbRzlZQJlXep2b
         xCWw7sYvpr8d+nvvOjKoSbrsmfQn9yesYbbSvmob4HrO0eWaHXEqst4JDqwyeZi5iaZ+
         utjyWciYM/+dWp9hq86nt4ypaknyUUKCzskhqeCe+FswobUcx3RFFsrSffKK3LCc0VEK
         gtuGQ9XvIwY/9BNkVRo52WHyZVCCILiBaL57Vl5MdH6EBakzvsJ6XrBrdmnF8gHpqSDQ
         AMkw==
X-Gm-Message-State: AOAM532xqHewoBkpkqMyCuaGOyhA+im9avywsJKhgoiqxTkzkp7HGKau
	84rY8RaGbPDyvJdVI0cFrbw=
X-Google-Smtp-Source: ABdhPJy0iev5hG5zzhnKRvwGBSoEpmghiNKf5BIa9o7H+XNHXG7jdhN+j+vFWJXjlQjd1UILAauxzg==
X-Received: by 2002:a05:622a:549:: with SMTP id m9mr2774021qtx.248.1627534209397;
        Wed, 28 Jul 2021 21:50:09 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id t26sm826147qtc.44.2021.07.28.21.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 21:50:09 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/5.10: enable TYPEC_TCPCI in usbc fragment
Date: Thu, 29 Jul 2021 00:50:02 -0400
Message-Id: <adf1e8d5ecc4bbfc83563da2b53cfb45bdac27ea.1627533955.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1627533955.git.bruce.ashfield@gmail.com>
References: <cover.1627533955.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To make the usbc fragment more generally usable, we enable
the Type-C Port Controller driver for TCPCI-compliant controller.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 944d171928..d365d91ce3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "969fef49cbbc8639e9622e6a0655337fbfcc7627"
-SRCREV_meta ?= "26a2a3cf764dde593325b8c08024f5990a5f6f02"
+SRCREV_meta ?= "3f38ad49cf38519dc4492a3f802b743fde7b467e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 073dff1a5b..580d71d2ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "d5a79da206965b27043f558739b28a434efca75c"
 SRCREV_machine ?= "f44b5bb716fdb6f804383fa087c9fdb54584cd5b"
-SRCREV_meta ?= "26a2a3cf764dde593325b8c08024f5990a5f6f02"
+SRCREV_meta ?= "3f38ad49cf38519dc4492a3f802b743fde7b467e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 1c072b3e22..362b3ac2cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
 SRCREV_machine_qemux86-64 ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
 SRCREV_machine_qemumips64 ?= "643c332e487cfa1557d14050d6e1148d1c5d75da"
 SRCREV_machine ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
-SRCREV_meta ?= "26a2a3cf764dde593325b8c08024f5990a5f6f02"
+SRCREV_meta ?= "3f38ad49cf38519dc4492a3f802b743fde7b467e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

