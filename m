Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C5EC3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:18 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.4506.1661294169754569660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4/FkKxD6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id x23so14075767pll.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=aaJvmDvv7Ky6bUI1fSfDY9forOitA+vHSW5BlEZWhLw=;
        b=4/FkKxD6VmJ2/IA+2/JvMFfkVt/K4ka4Jg4fliHkbhWceyXvRnXf/wjyBDxVmnlIuQ
         VxEtvm9oPWMytIVI+8sf/EPttXyk25a4CSdORozqFj0sft0/K7zxLTgEmRebXNXNlx06
         huj7gaMd+04Cucbbt1br+iWflPrgcswZhyeY+HraiBGPpd4vYWpPsEkty+qH+c9K4A/x
         lzuKtj1KyfocGpOY4xhvnHTdP6ELh6NDEy1wUxabNs1Y3VvB1ORIuLORlA8QUiE34iLJ
         EP/afvhXAQaagfiqxPULaCgxJA3jkUEe/wTsDu4+iJ88OfH+mnk7rm9+Sp+QZrl2Qrax
         PjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=aaJvmDvv7Ky6bUI1fSfDY9forOitA+vHSW5BlEZWhLw=;
        b=7IJXRxTOAzfyuZ2VRv8hkbiPT5vAgkO3XwxkSXI12sDyvnLNCUTG4DialswDVCufXk
         AlLdmC/qg2KbIv5MN3Od5QJ2uwr4R7KnnqSLp+Extmps96wqGSEiUWG4a4W+sO0mxrA0
         0u4i4HgnIS++Fb7JezeUvThz5gtT5hpKFIRM/zBN0OvfDh+cBXRPqdULkoIuaiRs9wVE
         Cc9RYgY4JL5qOKRHUeAC704VIOju+xl+sWy/YrgbzoQ4t9/Sy8hWPiMz+y9e8VYig6Ze
         hEf0RDG4FHOOTDjJi8N3atZQrsfDvjPOm6F8LvtpxSzpUwPLwRX/oOPIgCxqE+swoIc8
         zqfg==
X-Gm-Message-State: ACgBeo0cEPfl5Z9qQ4Ic7WxNYIfHIWL8+QlVmRmNJjO4XTbgifNE9cGL
	8JTmm8dozCO6T2scE8v+9wIZuEeNHIQArZ07
X-Google-Smtp-Source: 
 AA6agR6OXpHtF3FkHPulzKlO6A/3NxeNOsJCQW0JMjVvOBd9ZGBSV364dPhUnMPEfQdxE3OTBfQoxQ==
X-Received: by 2002:a17:90b:3b8d:b0:1fb:72f5:2d1e with SMTP id
 pc13-20020a17090b3b8d00b001fb72f52d1emr2814405pjb.135.1661294168791;
        Tue, 23 Aug 2022 15:36:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/28] bluez5: update 5.64 -> 5.65
Date: Tue, 23 Aug 2022 12:35:21 -1000
Message-Id: 
 <4fdb3d4e031e22c03d03c6cc7713ec45d7498555.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169741

From: Alexander Kanavin <alex.kanavin@gmail.com>

ver 5.65 changes:
	Fix issue with A2DP cache invalidation handling.
	Fix issue with A2DP and not initialized SEP codec.
	Fix issue with A2DP and multiple SetConfiguration to same SEP
	Fix issue with AVRCP and not properly initialized volume.
	Fix issue with SDP records when operating in LE only mode.
	Fix issue with HoG and not reading report map of instances.
	Fix issue with GATT server crashing while disconnecting.
	Fix issue with not removing connected devices.
	Fix issue with enabling wake support without RPA Resolution.
	Fix issue with pairing failed due to the error of Already Paired.
	Add support for CONFIGURATION_DIRECTORY environment variable.
	Add support for STATE_DIRECTORY environment variable.
	Add support for "Bonded" property with Device API.
	Add experimental support for ISO socket.

Drop fix_service.patch as it is merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10374b5ed4b5550eadacbcd71ae20b751ce5c038)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


