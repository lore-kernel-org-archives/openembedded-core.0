Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.35006.1629779265157916357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 21:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CmdVPgOw;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id h1so7538102pjs.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 21:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JjULH1xL7X6hW9dFRzs/oenv+CC29jUDK9o1iYehCl0=;
        b=CmdVPgOwuZiv+17uTU3brezQxUfm4rFPJuR4hZqxdbZg9cECGV4J+9/bPVxqfgvcdu
         T9+jc9xD3josQ6J6lTIoa1ndA488gJHcTIAOVzOIZiIXXeyj3VAA+WSgg4TPSX1LNn7P
         clqRrJDalEHEXk9PjLlgTbDrUv1dRpejj7ypDTmRGpwEEEMjW3q9REQVw37mO27PecL9
         5SJs5CmtyvV5yrhBfGpFaRqJPhWB+hnUfebKkJ8SktecvEZZI4r7p15SDe+wVmF6IX7H
         RkzTBc0c9ZGVS+Ey7174eOTB6Lu3g6Yr50dpR4dB4GEhPdBIdExJ/2Jn4qLeK1zGdZMi
         gvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JjULH1xL7X6hW9dFRzs/oenv+CC29jUDK9o1iYehCl0=;
        b=XMscNf9uEME9haWB3Q4qJa+r5OM9iM70H0yzFMhk/62pjlYPXDGOT8Ns913qfgpUVg
         5wQv94mu8PII5K6zIofuVH9zeCrEuE2oW1poGTwDOUtaxWG83rDEuVlCyNcaLLJvVy3g
         ptDqdHNBmFyfl0gCSCsFVu+0mcu/WDZXp5wCNNmZVCF7RpeJbZbo5R+0nW+Dwhrmom5b
         kbOnKSw0w779litA7qS8lwjdmTvPVlZw06wn2C3thOTrPqDBvR+tCOfRdBbxvvLRM9pB
         yVhd5t9rpThntxP2j38Q7NBQg4tps8rmqyQtyNQr1nHcukFkUWTPVM8VnE850aEmNCNv
         DfJw==
X-Gm-Message-State: AOAM531gzOQlClWE9L2v6/DYfVR0npNEtDlC2Uyc+VR1TG7turRWckZr
	UF6QaOjtXYD4wOFK34hqggh1WWrFcUk=
X-Google-Smtp-Source: ABdhPJwBcXveZlU+Q844JkjNlooNtspob6FXZ7/e5P1YGcNIIp0FatmYBq2TOusNvwUzF8bCjX50EA==
X-Received: by 2002:a17:902:ce8e:b0:12d:9f52:9a2b with SMTP id f14-20020a170902ce8e00b0012d9f529a2bmr31520125plg.67.1629779264446;
        Mon, 23 Aug 2021 21:27:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:c532:fdfb:1418:61fa])
        by smtp.gmail.com with ESMTPSA id a26sm904857pgm.87.2021.08.23.21.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 21:27:44 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sakib Sajal <sakib.sajal@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 1/3] qemu: fix CVE-2021-20257
Date: Mon, 23 Aug 2021 21:27:40 -0700
Message-Id: <20210824042742.833379-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: https://git.yoctoproject.org/git/poky
MR: 110290
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?h=hardknott&id=5c1a29e6deec8f92ac43363bd72439aec7e27721
ChangeID: 7f301e939cf9d1fdb826ac47d1fc96430086a68e
Description:

(From OE-Core rev: 5b66ff7972951db973d12f3dae6ccecf3bc29e56)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 547ac986a74cfcae39b691ebb92aadc8436443ea)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c1a29e6deec8f92ac43363bd72439aec7e27721)
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20257.patch            | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e64a6b2cb2..1ddb373115 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -71,6 +71,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3416_8.patch \
            file://CVE-2021-3416_9.patch \
            file://CVE-2021-3416_10.patch \
+           file://CVE-2021-20257.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
new file mode 100644
index 0000000000..7175b24e99
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
@@ -0,0 +1,55 @@
+From affdf476543405045c281a7c67d1eaedbcea8135 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 13:45:28 +0800
+Subject: [PATCH] e1000: fail early for evil descriptor
+
+During procss_tx_desc(), driver can try to chain data descriptor with
+legacy descriptor, when will lead underflow for the following
+calculation in process_tx_desc() for bytes:
+
+            if (tp->size + bytes > msh)
+                bytes = msh - tp->size;
+
+This will lead a infinite loop. So check and fail early if tp->size if
+greater or equal to msh.
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
+Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [3de46e6fc489c52c9431a8a832ad8170a7569bd8]
+CVE: CVE-2021-20257
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/e1000.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/hw/net/e1000.c b/hw/net/e1000.c
+index cf22c4f07..c3564c7ce 100644
+--- a/hw/net/e1000.c
++++ b/hw/net/e1000.c
+@@ -670,6 +670,9 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
+         msh = tp->tso_props.hdr_len + tp->tso_props.mss;
+         do {
+             bytes = split_size;
++            if (tp->size >= msh) {
++                goto eop;
++            }
+             if (tp->size + bytes > msh)
+                 bytes = msh - tp->size;
+ 
+@@ -695,6 +698,7 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
+         tp->size += split_size;
+     }
+ 
++eop:
+     if (!(txd_lower & E1000_TXD_CMD_EOP))
+         return;
+     if (!(tp->cptse && tp->size < tp->tso_props.hdr_len)) {
+-- 
+2.29.2
+
-- 
2.25.1

