Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AAEC3ABBC
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 01:49:54 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web10.23.1746826779563905339
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 14:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h3oTlK2y;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: rogerio.borin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-527a2b89a11so1056861e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 14:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746826778; x=1747431578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g96EYHi/hFMBeqYctHgo0J7/m0oZzjGHx32ljvBUDuM=;
        b=h3oTlK2yt/g/Is6dEYjvSJ2YhtUWcM4EeH4xS8OIVbPS3W+X70duiLhQ2W6zUf+1Pq
         Ie1/BnUdV5AWWMJV9cXHC8LuhGBOynLRNfyPinbNY1XrL7E17vfaCONX7CTKA0yUqQ+P
         MP4j+u9uoigV7AaaXMPsmvP2GJmWdIMM7rHAcCE18oceSLC/MGknNjqumVo1oDXqA7eX
         weay+U5oD89VlmIx/Uqd99QuLD80WRJmCBls6xfgXHG1+DdLjdj6gR+UcoY5cle5ZE3p
         jk1D3RFgYZZGoe1MHvVIAZX8OUeU5cBByku3wkRcvj3mYi2+yCz0AeGwpi4vp7IjAmYa
         YtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746826778; x=1747431578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g96EYHi/hFMBeqYctHgo0J7/m0oZzjGHx32ljvBUDuM=;
        b=nVzStRphEkvIKexxgLIGbm0g94SZKh+/Y4nR/elZ9EtcRw1ZbP4RRaPIqdMLqSmeoO
         4TCPBG0T5AvCVfrCHB0AeLLZRXyNzwnzaoUcfmCyO6fve36Z8bPcRRpzSkfGRTxUr8oT
         iI3XnRUlVQ6Q1QmChCjRpn39/DVrnHdW/HJKQVQ48oE61qnnFmb58urhVvlRqdMC2Wq3
         RXAQ5oYj+DTgqqdrhQGiPTQyUXyQeKL7BN1tOqRs9E9WwnXk+KL5rYyXG0WvKlUw51AW
         W/8ERVqoGINmcbj2apkwuehkcegp4fbQiDaTiI41L+odK1JAvvUf1po7wXJ4b06z6FZB
         /Uvw==
X-Gm-Message-State: AOJu0YzrDqdbXkJHCJFA1B+Qj1QSQSB1b7X49qXNbvvUTTZaB0slE+/5
	3XH66DfyGt/gf9yVMZjuFtzWhFkrs3Alpzu81pdrMJqUHYDb21OzjMwZV6Bk
X-Gm-Gg: ASbGncsQaus33GU2h3E4vWpy5513Pat1MvdVubFD+nW/tUenWWlbKJYpF17MW1KW0Fj
	zpwRokgxOekWBwipum6+RM33EIy57IiCzJ3Nx22EMgCCdaIkVIuclXHd2RRJVIAxaIsJ2Fiv3WJ
	ruoHQ3vaTqE3AyjRPVr7A4qeBLWFcjQdod35nSANj8uq8qJbyojaUq0AqJYZfqrzCleEcj14hg+
	JoP0+o4kb2pmbxcZVmqW1yJpwP6cuHUlLpGAWvD18Vm95pcl1dwfliz6SSAubYPDxeBWH8BoEx2
	+MP2oSMap/rsITfCK6cN+K9Z487jZ5PdKf2CZwjQd39kjoqzy+ECbOGFpBat+GyYxGi++3Q=
X-Google-Smtp-Source: AGHT+IGHGNeZp4cqnqoASi+nWo0tXWh46cntVMOFVcZG6DYa4X4bNZdn5jCDgfwZlaZaIOOqBlDaxw==
X-Received: by 2002:a05:6122:1e0e:b0:52a:791f:7e20 with SMTP id 71dfb90a1353d-52c53bc92cemr5157779e0c.4.1746826777667;
        Fri, 09 May 2025 14:39:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:211:8d94:b225:aaff:fe3c:dc92])
        by smtp.googlemail.com with ESMTPSA id 71dfb90a1353d-52c565cc6d9sm1733657e0c.5.2025.05.09.14.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 14:39:37 -0700 (PDT)
From: rogerio.borin@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Rogerio Guerra Borin <rogerio.borin@toradex.com>,
	Marek Vasut <marex@denx.de>,
	Sean Anderson <sean.anderson@seco.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] u-boot: ensure keys are generated before assembling U-Boot FIT image
Date: Fri,  9 May 2025 18:37:36 -0300
Message-Id: <20250509213736.3950997-1-rogerio.borin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216247

From: Rogerio Guerra Borin <rogerio.borin@toradex.com>

Add the task dependency:

do_uboot_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys

to ensure the kernel FIT image signing keys are available when creating
the U-Boot DTB. This is done only if the signing of the kernel FIT image
is enabled (UBOOT_SIGN_ENABLE="1").

The lack of the dependency causes build errors when executing a build
with no kernel FIT keys initially present in the keys directory. In such
cases one would see an output like this in the Bitbake logs:

Log data follows:
| DEBUG: Executing shell function do_uboot_assemble_fitimage
| Couldn't open RSA private key: '/workdir/build/keys/fit/dev.key': No such file or directory
| Failed to sign 'signature' signature node in 'conf-1' conf node
| FIT description: Kernel Image image with one or more FDT blobs
| ...

This issue was introduced by commit 259bfa86f384 where the dependency
between U-Boot and the kernel was removed (for good reasons). Before
that commit the dependency was set via DEPENDS so that, in terms of
tasks, one had:

u-boot:do_configure -> virtual/kernel:do_populate_sysroot

and the chain leading to the key generation was:

virtual/kernel:do_populate_sysroot -> virtual/kernel:do_install
virtual/kernel:do_install -> virtual/kernel:do_assemble_fitimage
virtual/kernel:do_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys

With the removal of the first dependency, no more guarantees exist that
the keys would be present when assembling the U-Boot FIT image. That's
the situation we are solving with the present commit.

Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
Signed-off-by: Rogerio Guerra Borin <rogerio.borin@toradex.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Sean Anderson <sean.anderson@seco.com>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 76a81546e34..7744e0c5ab5 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -113,6 +113,8 @@ python() {
     sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
     if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
+    if sign:
+        d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' virtual/kernel:do_kernel_generate_rsa_keys')
 }
 
 concat_dtb() {
-- 
2.34.1


