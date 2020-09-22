Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.8170.1600780296426221644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 06:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CVF+CVpy;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id z18so9444945qvp.6
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=koF/+wyTocpeFw7cdpCcO4Z1z/RveLeLYjWPgCoOnl4=;
        b=CVF+CVpyNRTWpFf6qQL4MADiq2Y59EPheqDVqp9ssXVsekBrd4csukOaPhV48RzMHk
         U50EOlseVj46i1e0cD9jCGqzDwkMcTL0BlUNoJgHNsE0c8BKc3Si2n13CrEdvVuhMiB7
         7AlyEnMuUGLFNCY7JwlfnfZd277NL3SZcKfqUPaoMt1qVlL1k39yBf7gylihsVJ1owPV
         elICNWxJvgcRuLX0TWj2YbJdUhvpqieUZgkH98QqCwaS7Fhi64VufbG20f6djLvbmSiZ
         25nKniddeX8Ciw8ZsPiTaVXBxCylSyozuEQ2EMxsUS3dP1E/P916jOPt7gIhR4+Wcn1O
         sBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=koF/+wyTocpeFw7cdpCcO4Z1z/RveLeLYjWPgCoOnl4=;
        b=H/Xfg2V+e/1H8Sc3k6UayIKaV9ruDI9Fxu+DMC0p225322pNwZB1qLr6SrCQ0c3Jo3
         sYO+tKVAsxKJBGJupixjtuPpgQXymFE6mbgI2olQ6lmfiBNiZcpW1+354aRuw8/Zl8n+
         XQvA9OCWKOJ8AEpTpSr1Lu6d0z1Bj2ZyJSEW0MqBUAtwrLWLuqwUe1eU2Nl0HBxcwA6k
         nuLYw6WKHfnbYpuOg4/mKk5KzFFHzko8jcE5SsCHf1uK29fatoy8lQZQLDKqhlCQdkSo
         P7tMhTQS7JBfsUSqqwcmwUfW4ZFfExe2bwWvpv6hxVKWgcg1yf7jMXPKnRu+DIVBCb+V
         hOrA==
X-Gm-Message-State: AOAM531l/QhN/daKhCFJzbQqEXg3PMDteLWdbiEikWk0JDswf7S2X6dw
	SomluQv3+gMsK1fohg+y1Ko=
X-Google-Smtp-Source: ABdhPJwPS3Ofe4F3CdlN+i7yi/JVNsK1axyE8CZXX7zHhJl5ehfXoBByPsNltovARTzQSeeX3Mv1bQ==
X-Received: by 2002:a0c:e2c9:: with SMTP id t9mr5958748qvl.48.1600780295501;
        Tue, 22 Sep 2020 06:11:35 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id z7sm2595269qtc.10.2020.09.22.06.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 06:11:34 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/beaglebone: Switch to sdhci-omap driver
Date: Tue, 22 Sep 2020 09:11:33 -0400
Message-Id: <20200922131133.50990-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    541066c5b1e beaglebone: Switch to sdhci-omap driver

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index d29c5985cd..bc9040a3d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_meta ?= "a933cb2f91915dceb138775c3878212e228d3eff"
+SRCREV_meta ?= "ffbfe61a194537689c782b20da185e7e4daa9ef9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index d32e5d372b..76b61222a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "830cb9af40e856615b7a435a4fac57b748ba56d6"
 SRCREV_machine ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_meta ?= "a933cb2f91915dceb138775c3878212e228d3eff"
+SRCREV_meta ?= "ffbfe61a194537689c782b20da185e7e4daa9ef9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 9ff1d5da80..8a0b142c00 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
 SRCREV_machine_qemux86-64 ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
 SRCREV_machine_qemumips64 ?= "4faa049b6b7b51c5d12d20c5e9fcf8e0a3ba8d42"
 SRCREV_machine ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_meta ?= "a933cb2f91915dceb138775c3878212e228d3eff"
+SRCREV_meta ?= "ffbfe61a194537689c782b20da185e7e4daa9ef9"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

