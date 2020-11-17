Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web09.9387.1605626693019607299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BeLzt1Z3;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id q7so10726402qvt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 07:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/rDZlEMukMJf1/pbE771JZyRJs+yUB/7Hm11WEHfy4Q=;
        b=BeLzt1Z3kluNTQxNjg9t/19EY1p/yqxOS4HEu9re6xURnm2vGTt174xGCAPCrcJgak
         7SntsZNmCy1xbNn2JReqV6r5PiNj6YYvcqAMRSlnzrQU+5b2SaXfNk2hJ3KWPiKTTtsR
         KTNOJgOEbxQkQJpYvkR/LRtJCloj+2mIZXd/xFYwlMZu8F0gbhepKhRiNEowIH0Pl4us
         5eIiPBLXp6epd5zY5buLJt+5nzXnSjkEV0ubZp91fgKYNc4Agi6KXNfESM55t5yyU94B
         /nQ72Ma5GIrk03SknCE8ikIzrE4wSKYoY/P2cZQE8z0F6XhVrrEAtY7kx6gdThKW0zB+
         V16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/rDZlEMukMJf1/pbE771JZyRJs+yUB/7Hm11WEHfy4Q=;
        b=gFF3m/dIMuu5A93QyqQfzXHwjiFR6sZx1Zw1yRKYc6ITtnBkO42FRRsXFzWPSwpvIK
         1NoCrhaD7PbQ/y4ka6FBtp3SvJ4aagjuzoMJM6tb7GFURJyG5a3JfTgC1QiSZrZX7fat
         +PtD2N0SS3Op0wKXxT8XqMwItl9cmczgr+ZRh5RVeL8/x9pebpu0+p4E3F+9KblzgvVp
         75k6SKKBnlTdOXBkf+23UZIS6clFPTSm/YXw8YHcUC+NAFwrPMizrCyLkGRhQelM1q65
         GSw3qI5ziqHd4hAtGP5R0eauPycNCfamHAkejL0XnSEA3iP9wCLQRpiFMJ+G971zCFJB
         Ndug==
X-Gm-Message-State: AOAM532ybifVhvptoBQcApvclP3Shlhc/IBC063TU54XE4Ld5D6h8S75
	9U26oSKJwGcn8OL9aiPVIs8=
X-Google-Smtp-Source: ABdhPJx5Sk7e5wD+NByhCCWAOdz3cWxtSZkl0i42tGyFq5TM+/xRUjAHzA9H+PuINAJwKcbVCuaWaw==
X-Received: by 2002:a0c:ffd1:: with SMTP id h17mr21404949qvv.20.1605626692005;
        Tue, 17 Nov 2020 07:24:52 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u24sm14537923qtb.33.2020.11.17.07.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 07:24:51 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/11] linux-yocto/5.4: config cleanup / warnings
Date: Tue, 17 Nov 2020 10:24:34 -0500
Message-Id: <e930dbf41eb8da645028fb89c6b6472245d9a49f.1605626488.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605626488.git.bruce.ashfield@gmail.com>
References: <cover.1605626488.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    eadca496e9f bsp/mti-malta64: fix warning of CONFIG_SCSI_VIRTIO on qemumips64
    203911bc035 net/l2tp.cfg: fix CONFIG_PPPOL2TP mismatched warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 563f2d5b76..d7e0072a30 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "689799c6846313eb19566dd4afb69d30353dd351"
-SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
+SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9f17d56b6a..44646ebd84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "f37a22c3ddab9db618ad302cce77825dae2cda87"
 SRCREV_machine ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
+SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index eb2793c9a2..dea2d515e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
 SRCREV_machine_qemux86-64 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
 SRCREV_machine_qemumips64 ?= "536bda19159206ac7f60165f71bbf892cb8ad3fd"
 SRCREV_machine ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
+SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

