Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A98CCA486
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:32 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.28142.1658155766982835225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NV+VTPUm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id fz10so11970672pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r1ZbsFAfHGdQp7lIohVoZQv8htuiic41RY/U+QDiKD0=;
        b=NV+VTPUm95CqATCJ6w6yPI3qy8nO7XKl9JOEz0tV0kGGaTgu+kmtaqO5BX1kX29nW7
         PKfDtGpO8GTh8+i/v5yPs5K2YhU2ezSQ7WbAFaDc5mUBd33vo7sz9fnUG3UQiHyx3EJy
         1e2JYXGUsxgWqw87ZuI9Ma8uSHaEOvBQQGFQHynhvSqxUZ053hqqm6mHdTke3VH7IErS
         LL/VdDWLgJb6DGhJdLNV81rKnOmZArdsGGI/7DyeetMTkIXSyHin+8WNO+uVluRFaYm9
         +j4OoAOPzSgE8HJdRYs0gYhefVXEPvycLWJ2/tJgxTkGFXna0z2zjzjA+2oKrXGFRndj
         w4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r1ZbsFAfHGdQp7lIohVoZQv8htuiic41RY/U+QDiKD0=;
        b=TZw1qKkronvPKqKp6YAylzsI53jBhW+v1AuV9fWVuUJnLf2/HBe7Es6IPN/iQb3ph1
         NXMhPgor3OsGg9Xrbbkflzgq1bK9xNqURJ4+dHVBOCbHCfHnZGQCXaG2O/3s8Ibhjpi0
         EmgVG0SWQ2N9D4vuQMETveKrf3S5zpczTdabUl3J3F4GZIE8BwIxBDoqkBAcYAIy8Azt
         dfkgRPhoJz14Jpi8L+Wjq6TE9sVJkBnKxMBcV0LygahpnGmxnhX60pP4fWbgVhBxKwNc
         sO9W+NrNdViEYZpuWSbAxAN4RjlrVBfNEuFRFegkkphzkHs+T4NqtVxt5tqSjWhcTSwA
         qh3Q==
X-Gm-Message-State: AJIora/R8QppdKUuorG6VdD862Nq6KQC7+MUHrcBdYNB4ixxCNX7xbWO
	v3L7h11cXpXtuql4BRUXHsv/q5rR561kqlyQ
X-Google-Smtp-Source: 
 AGRyM1sUw46TwujPNVw8IMc2wv3GEgn5jgoDA5wlgokoPuA5bjFj5KL/goCfTiExsSgcDNoIXzkXYQ==
X-Received: by 2002:a17:902:7209:b0:16b:fa09:5d6 with SMTP id
 ba9-20020a170902720900b0016bfa0905d6mr28676450plb.120.1658155765846;
        Mon, 18 Jul 2022 07:49:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/35] udev-extraconf/initrdscripts/parted:
 Rename mount.blacklist -> mount.ignorelist
Date: Mon, 18 Jul 2022 04:48:28 -1000
Message-Id: 
 <99d9dc7c6b5149f19a315bce78784aa1753ea7be.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168203

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69e486ddb3059f80ba538e1f59c2ca8a8df0faf9)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 1fcd29e54c..4bd6ace7b3 100644
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
index f667518b89..ffd3870199 100644
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
index 7b49001659..8ab74ddc5d 100644
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
index e71579631b..df33791ec7 100644
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
index b23731870e..5ba66e98e2 100644
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
index 2ba35b0df6..7da04379c0 100644
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
index c3d6fca339..096078967f 100644
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
2.25.1


