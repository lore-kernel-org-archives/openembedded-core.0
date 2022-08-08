Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72698C28B2B
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.22446.1659940965724579115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RwpLntHa;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id qn6so2991249ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hp2czlIM7ix8/l8Ha5UTIjhvvNhJj6WlQRNikvz60Hc=;
        b=RwpLntHaH4Pla19KUsaO4OxlDWWaK+z00bZaltSEhRZzlk2KDcLonK1zHn0H4gkpOZ
         hMIlSjyiKydHnBfpq3uWEqOol6l7UfYVOEsSH5Dr/cWdW6HwiwmJk7QCMr3iLUP2dC4K
         LqXe7+7qrGPFSHg12aG1HEseMPMWYrDBQO5fWRmoYsmgo48vXJ05FvKGVAn1SFpYlj+d
         Tyzl82QgcA5s/xKb0rPvc54YJIcYrDC8EIF9i+UqtwJMHQ5EVAgo/9vz1CLkjct6u79i
         Ya1r8U4yyspueKnZ1i5XwO36I0Fpoz0NrS0nlzw0CsijQw8aLLbv3OFJOwN1H75wyuHD
         PVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hp2czlIM7ix8/l8Ha5UTIjhvvNhJj6WlQRNikvz60Hc=;
        b=jr3W+4PQ+ReU35B+xLE3tFTrzuxE4QG4Vm7LqI6jOOts7kDf4/RAX4oLxp1vTERGyv
         LAt2XbQeoIb1AwsbT1oLz6mXi9APHXKOXp2WvbVXYy71yRC2mCM71JUZLVvTQS/aIkax
         iPo+zHgUlCCqky6sk2eRlsgMWsKU5eGly4+uSdpGZ4zaHilP/WsOkaMCGegaHO7vcufE
         Q0Hdcx7ctQlRySreJJmlZRoElpYzHHGKaoHCoWwRCKpo55tsdAdMaqZv8XHSd/d9bkJc
         KUo5q1ok2x/TU0rrSJKw2oJZgeftDcE2x0Q7+QD9JWP1SrsA/J4ib47b5AzPB+yc9E2K
         wG1Q==
X-Gm-Message-State: ACgBeo0ZYfd068MytzQGmsuOwkHug4DAJHfJ42scTc3HWrmLYVwexAYL
	HFvQwwXdpge0HyVmpm4o6NG6nVbCJ5g=
X-Google-Smtp-Source: 
 AA6agR5XV1rdslMQmzCiKrxCHzi1uf/DWRFhsfA5Yxrh4yKtcFapTlVrEHBuvz28QxRnJ3pV8Nbw8w==
X-Received: by 2002:a17:906:8475:b0:730:d374:de79 with SMTP id
 hx21-20020a170906847500b00730d374de79mr13153904ejc.69.1659940968058;
        Sun, 07 Aug 2022 23:42:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 07/44] bluez5: update 5.64 -> 5.65
Date: Mon,  8 Aug 2022 08:42:00 +0200
Message-Id: <20220808064237.3975347-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169030

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


