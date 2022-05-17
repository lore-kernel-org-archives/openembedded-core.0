Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F90C4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 11:50:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.6166.1652788216292027771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 04:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GfJq7XMo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id n6so2559326wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 04:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6MenPl9lO6NfdG+TO8KgBszHz3jBexsC6Y+ZeT7tmPA=;
        b=GfJq7XMojyEVFRQ2e/ziUxuIJFaW9OiYdD0pDUMSLHIKMJJfigwbr3peDEvCb+j1tm
         GheaxEeAecTy6w1XbMNKmnmqC2S2f/28X77nIC14IuhgY5iYoPyQfKqxlUllsIxEBsa6
         Br818groZxuhI2/ocp+78iXOk4abjuN3OjN2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6MenPl9lO6NfdG+TO8KgBszHz3jBexsC6Y+ZeT7tmPA=;
        b=ea8AKlFkOuByVOSB9VSj4TWzk7PtRr2oISXvxeFRi7qyJiR+cd9KslqqskbJ4co9IR
         o5w5Bg2hX+cQ3tesNxRLO5utnthztPhxB1Yy6uoR5/fpbctDMpiMkw4shiX7P3jBx/Nw
         PS73CcZp7j+H4YfRSnT5nIubEWXSs/zrUMk+ixJoWdAQoFIY3OF/jNPg5CtD0nQfuMWW
         n3bnMeiriDqRJfxGv/egyABccj55UZLXl/AEYeoJk+EIydm8wepZqUJYPbUmwB0gkzYl
         apTJUkrz8wHVAzLVVmc+09N6QETYD88xHWWaOJvHSnGjXAf/s2rcyZw+kqhxjGH1Qsaj
         RCkQ==
X-Gm-Message-State: AOAM531LDSpQ3QS+BIneE0K47w9pJQ+533rkqtzjuVXQsHZv9cQ/Gv6n
	STE3Ea/3KS5xV3bSeGed3eMl7tHq35p/iCpq
X-Google-Smtp-Source: 
 ABdhPJzojrZwWYhmHrKlaNmuxfTJW1RZkUPFErHuG23JTvHSGVemXTWXQloAjyr3d/ectBWMAzgJDg==
X-Received: by 2002:a05:600c:4f06:b0:394:836b:1552 with SMTP id
 l6-20020a05600c4f0600b00394836b1552mr31362585wmq.145.1652788214131;
        Tue, 17 May 2022 04:50:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3c0b:65b:e679:a594])
        by smtp.gmail.com with ESMTPSA id
 h22-20020adfaa96000000b0020d0c37b350sm5402501wrc.27.2022.05.17.04.50.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 04:50:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] udev-extraconf/initrdscripts/parted: Rename mount.blacklist
 -> mount.ignorelist
Date: Tue, 17 May 2022 12:50:12 +0100
Message-Id: <20220517115012.487036-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 11:50:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165730

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../initrdscripts/files/init-install-efi-testfs.sh     |  2 +-
 .../initrdscripts/files/init-install-efi.sh            |  2 +-
 .../initrdscripts/files/init-install-testfs.sh         |  2 +-
 meta/recipes-core/initrdscripts/files/init-install.sh  |  2 +-
 .../{mount.blacklist => mount.ignorelist}              |  0
 meta/recipes-core/udev/udev-extraconf/mount.sh         |  4 ++--
 meta/recipes-core/udev/udev-extraconf_1.1.bb           | 10 +++++-----
 meta/recipes-extended/parted/files/run-ptest           |  6 +++---
 8 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-core/udev/udev-extraconf/{mount.blacklist => mount.ignorelist} (100%)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index 1fcd29e54ce9..4bd6ace7b349 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -138,7 +138,7 @@ touch /ssd/etc/controllerimage
 if [ -d /ssd/etc/ ] ; then
     # We dont want udev to mount our root device while we're booting...
     if [ -d /ssd/etc/udev/ ] ; then
-        echo "/dev/${device}" >> /ssd/etc/udev/mount.blacklist
+        echo "/dev/${device}" >> /ssd/etc/udev/mount.ignorelist
     fi
 fi
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f667518b8953..ffd3870199cc 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -229,7 +229,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "UUID=$boot_uuid              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-        echo "${device}" >> /tgt_root/etc/udev/mount.blacklist
+        echo "${device}" >> /tgt_root/etc/udev/mount.ignorelist
     fi
 fi
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index 7b49001659d0..8ab74ddc5d44 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -164,7 +164,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
+	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.ignorelist
     fi
 fi
 umount /tgt_root
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index e71579631b5e..df33791ec7a8 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -261,7 +261,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "$bootdev              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-        echo "${device}" >> /tgt_root/etc/udev/mount.blacklist
+        echo "${device}" >> /tgt_root/etc/udev/mount.ignorelist
     fi
 fi
 umount /tgt_root
diff --git a/meta/recipes-core/udev/udev-extraconf/mount.blacklist b/meta/recipes-core/udev/udev-extraconf/mount.ignorelist
similarity index 100%
rename from meta/recipes-core/udev/udev-extraconf/mount.blacklist
rename to meta/recipes-core/udev/udev-extraconf/mount.ignorelist
diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index b23731870ea2..5ba66e98e2f4 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -26,11 +26,11 @@ fi
 
 PMOUNT="/usr/bin/pmount"
 
-for line in `grep -h -v ^# /etc/udev/mount.blacklist /etc/udev/mount.blacklist.d/*`
+for line in `grep -h -v ^# /etc/udev/mount.ignorelist /etc/udev/mount.ignorelist.d/*`
 do
 	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
 	then
-		logger "udev/mount.sh" "[$DEVNAME] is blacklisted, ignoring"
+		logger "udev/mount.sh" "[$DEVNAME] is marked to ignore"
 		exit 0
 	fi
 done
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 2ba35b0df698..7da04379c063 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Extra machine specific configuration files"
 HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
-DESCRIPTION = "Extra machine specific configuration files for udev, specifically blacklist information."
+DESCRIPTION = "Extra machine specific configuration files for udev, specifically information on devices to ignore."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = " \
        file://automount.rules \
        file://mount.sh \
-       file://mount.blacklist \
+       file://mount.ignorelist \
        file://autonet.rules \
        file://network.sh \
        file://localextra.rules \
@@ -23,8 +23,8 @@ do_install() {
     install -m 0644 ${WORKDIR}/autonet.rules       ${D}${sysconfdir}/udev/rules.d/autonet.rules
     install -m 0644 ${WORKDIR}/localextra.rules    ${D}${sysconfdir}/udev/rules.d/localextra.rules
 
-    install -d ${D}${sysconfdir}/udev/mount.blacklist.d
-    install -m 0644 ${WORKDIR}/mount.blacklist     ${D}${sysconfdir}/udev/
+    install -d ${D}${sysconfdir}/udev/mount.ignorelist.d
+    install -m 0644 ${WORKDIR}/mount.ignorelist     ${D}${sysconfdir}/udev/
 
     install -d ${D}${sysconfdir}/udev/scripts/
 
@@ -37,7 +37,7 @@ do_install() {
 
 FILES:${PN} = "${sysconfdir}/udev"
 RDEPENDS:${PN} = "udev"
-CONFFILES:${PN} = "${sysconfdir}/udev/mount.blacklist"
+CONFFILES:${PN} = "${sysconfdir}/udev/mount.ignorelist"
 
 # to replace udev-extra-rules from meta-oe
 RPROVIDES:${PN} = "udev-extra-rules"
diff --git a/meta/recipes-extended/parted/files/run-ptest b/meta/recipes-extended/parted/files/run-ptest
index c3d6fca33916..096078967f40 100644
--- a/meta/recipes-extended/parted/files/run-ptest
+++ b/meta/recipes-extended/parted/files/run-ptest
@@ -1,7 +1,7 @@
 #!/bin/sh
 
-mkdir -p /etc/udev/mount.blacklist.d
-echo /dev/sda1 >> /etc/udev/mount.blacklist.d/parted-tmp
+mkdir -p /etc/udev/mount.ignorelist.d
+echo /dev/sda1 >> /etc/udev/mount.ignorelist.d/parted-tmp
 rm -f tests/*.log
 make -C tests test-suite.log
-rm /etc/udev/mount.blacklist.d/parted-tmp
+rm /etc/udev/mount.ignorelist.d/parted-tmp
-- 
2.34.1


