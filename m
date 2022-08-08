Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDFEC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:39:06 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.22423.1659940731701245897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d3yW/owG;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id z22so10062086edd.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hp2czlIM7ix8/l8Ha5UTIjhvvNhJj6WlQRNikvz60Hc=;
        b=d3yW/owGxsBB8mxFK5caI/vD5HrGB0w/pQbVR3V6T8PNV53NA9JKp7JclfWdo7qlyr
         0oKW+Zm6EJpJoKHAwrSlGJvRCwxJ/lJKIKn2UsGF57dORBZ0Vb+h38je9XABSpu+hJuF
         NcOCoJ+iYLrSgO4zdJ/5683mm+GJPblprhILE0R7VjTCfCp8pt1DsdVoMlpnYrBNqj95
         /0qcctA6v3x0ufgbqfeuRacor39G68Bs7iY9gabNsOlkaJZdZZcaQQwcc27jTWlrzZec
         Oy3fQuHu2iFCT4zpSVkHsRhfV8XUY5+JkTbSR3wHh8eKpBeR2HPq1iSkkr4A27VY85WB
         8lQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hp2czlIM7ix8/l8Ha5UTIjhvvNhJj6WlQRNikvz60Hc=;
        b=lGHUTgZ6VdL/HiVKcZs6qtw7V/gH44cRFqBfMOZng00mPPoZJiSvoT7BPzZoeruvlt
         91Mg7qR80XD1SSCcCbcmmsWJCvtNWLxSosOaK8RTOkfvS0MaxD3qaaQ5T/ScR3/9VbgT
         PGJ0Z6Nh9ICFcKzNK8LBqMGW3lI2UesI0UeNFAq5yshwje2O+ExA+3aS8xOWTreaAkG/
         v9v1UOiFOp4Be389IjNCLs3RoB75i58VaAggaVe9My3gmIm/A0XzX8zsGS9NdWczUBt8
         tBFv63+cf7i79ncavHYy/m2ocQ5bGXaOv1i1pBCmPomzj4Dhg3J09C50KzA8EntrNSN6
         1buQ==
X-Gm-Message-State: ACgBeo2Zb11XVTPiD7IHQOamnQDo5Ts3x94JYZ5HytoMC0FVA64Gn0DF
	tc/wdXEPZFxNlSdqWUcqNx6hOayDB2o=
X-Google-Smtp-Source: 
 AA6agR7wkuWdoP3ovY36iT4EW0ZOp/5spD6vjIs3MgkjbyyEh1JPLqZB/dFodGg5htz+0yJH8uYJ8w==
X-Received: by 2002:a05:6402:5216:b0:43e:81c5:82dd with SMTP id
 s22-20020a056402521600b0043e81c582ddmr17026368edd.345.1659940735462;
        Sun, 07 Aug 2022 23:38:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 k22-20020aa7c056000000b0043ce5d4d2c3sm4092644edo.14.2022.08.07.23.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:38:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/45] bluez5: update 5.64 -> 5.65
Date: Mon,  8 Aug 2022 08:38:06 +0200
Message-Id: <20220808063843.3975130-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808063843.3975130-1-alex@linutronix.de>
References: <20220808063843.3975130-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:39:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169022

Drop fix_service.patch as it is merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 .../bluez5/bluez5/fix_service.patch           | 30 -------------------
 .../bluez5/{bluez5_5.64.bb => bluez5_5.65.bb} |  2 +-
 3 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/fix_service.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.64.bb => bluez5_5.65.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 22dd07b348..79d4645ca8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -53,7 +53,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
-           file://fix_service.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/fix_service.patch b/meta/recipes-connectivity/bluez5/bluez5/fix_service.patch
deleted file mode 100644
index 96fdf6b299..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/fix_service.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-The systemd bluetooth service failed to start because the /var/lib/bluetooth
-path of ReadWritePaths= is created by the bluetooth daemon itself.
-
-The commit systemd: Add more filesystem lockdown (442d211) add ReadWritePaths=/etc/bluetooth
-and ReadOnlyPaths=/var/lib/bluetooth options to the bluetooth systemd service.
-The existing ProtectSystem=full option mounts the /usr, the boot loader
-directories and /etc read-only. This means the two option are useless and could be removed.
-
-Upstream-Status: Submitted [https://github.com/bluez/bluez/issues/329]
-
-Index: bluez-5.64/src/bluetooth.service.in
-===================================================================
---- bluez-5.64.orig/src/bluetooth.service.in
-+++ bluez-5.64/src/bluetooth.service.in
-@@ -15,12 +15,12 @@ LimitNPROC=1
- 
- # Filesystem lockdown
- ProtectHome=true
--ProtectSystem=full
-+ProtectSystem=strict
- PrivateTmp=true
- ProtectKernelTunables=true
- ProtectControlGroups=true
--ReadWritePaths=@statedir@
--ReadOnlyPaths=@confdir@
-+ConfigurationDirectory=bluetooth
-+StateDirectory=bluetooth
- 
- # Execute Mappings
- MemoryDenyWriteExecute=true
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.64.bb b/meta/recipes-connectivity/bluez5/bluez5_5.65.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.64.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.65.bb
index 4319f9aae8..4c15aeb46d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.64.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.65.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "ae437e65b6b3070c198bc5b0109fe9cdeb9eaa387380e2072f9de65fe8a1de34"
+SRC_URI[sha256sum] = "2565a4d48354b576e6ad92e25b54ed66808296581c8abb80587051f9993d96d4"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_IGNORE += "CVE-2020-12352 CVE-2020-24490"
-- 
2.30.2


