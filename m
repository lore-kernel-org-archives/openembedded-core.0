Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1E5CCD194
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 16:04:54 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.21648.1760544292763249891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 09:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=It2R3yFl;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-93ba2eb817aso622223339f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760544291; x=1761149091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MGmwqk38lbIfBoRjljkYq16i2nu39VYVDTIz3rc3Tnc=;
        b=It2R3yFlaeajuMQ6rCv9hIpiQXwIa4ej25/+P+/0vrd3msF0El711iQQbGkME8KrsN
         s8h6zMBwLMliFerG7j8yhxCJyK2wEFM6W2Dc/BPEzodgieDR7x2uFvDrm2xq8u0Bp+CM
         t6YzSlJwmm0n5sG1GgdgNnyBsvTbBQ++2zniicTMAO5r3Nszn/E0bA89RekwsRjbXFMz
         PToQu+y8Qsd594m3QesK45BAAxyfay01YOMcqxLxsWWJcwvqgDj3CtJSNWPqneEktxXz
         eigxwNa5SoxwjdX7QbqjRQn1hZMK3mcmV4EvNzH6ImHcNpOQmpqyOnPsIZIU8eSy3Asf
         jq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760544291; x=1761149091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGmwqk38lbIfBoRjljkYq16i2nu39VYVDTIz3rc3Tnc=;
        b=lwi8cRaAXZUcz/qw+ShHh3KIFm33I0SyRwtnwS2gsc+hFYcbmCE/V5aPrCf0WnIL/e
         flQTpiqTHAb9LL4nvtpq1U8pJ5y64UQyNDPYFgv390THl+HyPyvJGbx7gFRSQ8FsB0Hh
         7H6D3RThEAFnpJHzBwEYwQKmjE6Z7iP145WrePGKRWYXgbQZuqJ+Wb8DZtePvZf3ZNiw
         scp4RCOlARO50xDhxhiw2EPbtrJFspV9KTMX8k3BRQeuQYpjoKVt9HT6wx2/GgAnCr9j
         0AUlObjIKdYwD8UVlQI/BK9NgDAkSwRzAoZH84+cSO//dedQkE5lmFXJL6Kc2g35Jqd6
         vzyg==
X-Gm-Message-State: AOJu0YyW/vW8SpEI5wSihB9aBalEjhGbWzDM/L8jrmjHBerCg2BspkzD
	ckGmd2z7XlVRQCqqX6mAyzNhCS8oXW6/y+RKhLy2yL2Whz1jy/u9mEndna0oUQ==
X-Gm-Gg: ASbGnctS0XOtviUq4ZEWwMxS4YWnDAR2nWeQBSpSbaGr7oxvGMk9s5XGVqLHIMyiwAV
	PK8VboD0RLaVnau9G2GKE3H7Bxg0jv0b53wAkHPuCo40BS+wDkCtpRJBeE+TDjF2DIkmchPXPZn
	ih+Hbl42zSxSwmBmAW6fpvt+OXjyeCG5AOZFCy/QY2tmxVomyEiAJaassNhhYqAqlHq9zIv0JfV
	ijArcnfVwYZdkYr3rvnpXwfuw5UTfh/G4x5wl7+obL0i8vHeLp3UxSIIf7fOmWsFVKp0C22UKaP
	+fi2PTCKUdqv2ZioT2kICthsckXz+l8/EtN01Gpr9PuS+cPwcO+TbqsFbOHxXefQQzivZ47t9NM
	DpuCnTWF4DZrqW7aIc5s1WbsTpYvNilsvH5iMiU8uWapU9D+KyA==
X-Google-Smtp-Source: AGHT+IH2a4BSwrg2ssZxTTZVVwxhbizoxkA5saBQsxypZYXD1LGWp84dfd2vhL4gau7SQCDmAQcYYw==
X-Received: by 2002:a05:6602:26c8:b0:887:131c:dada with SMTP id ca18e2360f4ac-93bd18a1eafmr3903892139f.5.1760544291254;
        Wed, 15 Oct 2025 09:04:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4979])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e2594a558sm632287139f.7.2025.10.15.09.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 09:04:48 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: sandeep.gundlupet-raju@amd.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] weston-init: Allow weston user to be specified
Date: Wed, 15 Oct 2025 10:04:38 -0600
Message-ID: <20251015160438.1310918-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 16:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224899

Adds variables to set the name of the weston user (defaulting to
"weston") and the home directory (defaulting to "/home/weston"). This
allows users to easily change which user the compositor runs as.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init.bb  | 21 ++++++++++++-------
 .../wayland/weston-init/weston-socket.sh      |  2 +-
 .../wayland/weston-init/weston.service        | 10 ++++-----
 .../wayland/weston-init/weston.socket         |  6 +++---
 4 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index fc817d113f..e236bdb253 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -25,6 +25,8 @@ PACKAGECONFIG[use-pixman] = ",,"
 
 DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
+WESTON_USER ??= "weston"
+WESTON_USER_HOME ??= "/home/${WESTON_USER}"
 
 do_install() {
 	# Install weston-start script
@@ -41,10 +43,15 @@ do_install() {
 		install -D -p -m0644 ${S}/weston.service ${D}${systemd_system_unitdir}/weston.service
 		install -D -p -m0644 ${S}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
 		install -D -p -m0644 ${S}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
-		sed -i -e s:/etc:${sysconfdir}:g \
-			-e s:/usr/bin:${bindir}:g \
-			-e s:/var:${localstatedir}:g \
-			${D}${systemd_system_unitdir}/weston.service
+		sed -i -e s:@sysconfdir@:${sysconfdir}:g \
+			-e s:@bindir@:${bindir}:g \
+			-e s:@localstatedir@:${localstatedir}:g \
+			-e s:@runtimedir@:${runtimedir}:g \
+			-e s:@WESTON_USER@:${WESTON_USER}:g \
+			-e s:@WESTON_USER_HOME@:${WESTON_USER_HOME}:g \
+			${D}${systemd_system_unitdir}/weston.service \
+			${D}${systemd_system_unitdir}/weston.socket \
+			${D}${sysconfdir}/profile.d/weston-socket.sh
 	fi
 
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
@@ -70,7 +77,7 @@ do_install() {
 		sed -i -e "/^\[core\]/a use-pixman=true" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 
-	install -dm 755 -o weston -g weston ${D}/home/weston
+	install -dm 755 -o ${WESTON_USER} -g ${WESTON_USER} ${D}/${WESTON_USER_HOME}
 }
 
 INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
@@ -95,11 +102,11 @@ FILES:${PN} += "\
     ${systemd_system_unitdir}/weston.socket \
     ${sysconfdir}/default/weston \
     ${sysconfdir}/pam.d/ \
-    /home/weston \
+    ${WESTON_USER_HOME} \
     "
 
 CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
-USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,seat,wayland weston"
+USERADD_PARAM:${PN} = "--home ${WESTON_USER_HOME} --shell /bin/sh --user-group -G video,input,render,seat,wayland ${WESTON_USER}"
 GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r seat"
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh b/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
index 86389d63a3..8f652862da 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
+++ b/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 # set weston variables for use with global weston socket
-global_socket="/run/wayland-0"
+global_socket="@runtimedir@/wayland-0"
 if [ -e "$global_socket" ]; then
 	weston_group=$(stat -c "%G" "$global_socket")
 	if [ "$(id -u)" = "0" ]; then
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index 80745998ed..b7e845e88d 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -33,19 +33,19 @@ ConditionPathExists=/dev/tty0
 [Service]
 # Requires systemd-notify.so Weston plugin.
 Type=notify
-EnvironmentFile=/etc/default/weston
-ExecStart=/usr/bin/weston --modules=systemd-notify.so
+EnvironmentFile=@sysconfdir@/default/weston
+ExecStart=@bindir@/weston --modules=systemd-notify.so
 
 # Optional watchdog setup
 #TimeoutStartSec=60
 #WatchdogSec=20
 
 # The user to run Weston as.
-User=weston
-Group=weston
+User=@WESTON_USER@
+Group=@WESTON_USER@
 
 # Make sure the working directory is the users home directory
-WorkingDirectory=/home/weston
+WorkingDirectory=@WESTON_USER_HOME@
 
 # Set up a full user session for the user, required by Weston.
 PAMName=weston-autologin
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.socket b/meta/recipes-graphics/wayland/weston-init/weston.socket
index c1bdc83c05..a7d461ee30 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.socket
+++ b/meta/recipes-graphics/wayland/weston-init/weston.socket
@@ -1,11 +1,11 @@
 [Unit]
 Description=Weston socket
-RequiresMountsFor=/run
+RequiresMountsFor=@runtimedir@
 
 [Socket]
-ListenStream=/run/wayland-0
+ListenStream=@runtimedir@/wayland-0
 SocketMode=0775
-SocketUser=weston
+SocketUser=@WESTON_USER@
 SocketGroup=wayland
 RemoveOnStop=yes
 
-- 
2.51.0


