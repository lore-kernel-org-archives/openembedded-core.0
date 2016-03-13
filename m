Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFFC7316D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l68so11565328wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=xKeLNq1xT1QLaS+B5ngn1OBa2jjPABEq9y5nPWzr/Vk=;
	b=scyPjRGFONLfMeVAJCd5kQKOrZaB9jGXw1cenEvztzo6Q2aU8iDSgadb5nanMQtRn/
	PNsv9TLaxc+p/97Y3VYFZ0VuQw9Kck8a/FIKCnySstzcCDK6d6dQTy3YZOgsgz8Mrs3m
	N8IH3bhhL4TxA1NTWdkPh52RKlmbOO2iPBwLH9j1PN3djMiwBogeWOyzllzk25VxRLxz
	7dzUHatVRUsKXkyYYZz7Y/FMeEOrTYkQ6eSLyJvYKChg6umNqSKflQnwttNcoRSxJEOG
	6NzzzTjrGb5iLy5ZfjthWvfYWopBslljLBIRjnFol2DUaOobzfeicDYK57n1Kpng95QR
	185A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=xKeLNq1xT1QLaS+B5ngn1OBa2jjPABEq9y5nPWzr/Vk=;
	b=Cn2UIWWbZbjMfLzdOdpJ88zHmkvt8UBuzn5rmOn0YcN7Fh7RKWlahotXa1JR2HERl9
	lDpNo8/SgljynUYNoH9RrfX9Cf69rINHO+KuhkILDZRVo2Z+0gk+Oq5c8nr8QiTvgDxF
	w7oI7lbub1nQDdBz8pll02XQdrLC2UEEWjTiynRmy0cIbAP4hsIHMh5GbGIMb11MztyH
	bZc1OqVGeIY87sDG9gFIVKCjFLayaboYX/bazvWOWmEEzUQql1TejijqocgzBFPeiinV
	s039Lw8usDLXUG8JJdSK7Y0m37yqmoxKRBuEVC3yac/iLNFSZPB3blkdkjA6SOpC70xT
	0JYw==
X-Gm-Message-State: AD7BkJLskmcJkxZeHrFmJjrHa9r46fQlYGIkEaZrhgsDOztbYNby98qRCQJ11jycaH9vWw==
X-Received: by 10.194.188.20 with SMTP id fw20mr23245927wjc.80.1457896499015; 
	Sun, 13 Mar 2016 12:14:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:58 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:17 +0100
Message-Id: <9ffeab9468917642dabb73255c67de7d9c3994cf.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 19/42] systemd: Fix usage of systemd unitdir vars
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Mar 2016 19:14:58 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-core/systemd/systemd_229.bb | 68 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index ae88c89..fcb22a3 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -203,7 +203,7 @@ do_install() {
 	autotools_do_install
 	install -d ${D}/${base_sbindir}
 	# Provided by a separate recipe
-	rm ${D}${systemd_unitdir}/system/serial-getty* -f
+	rm ${D}${systemd_system_unitdir}/serial-getty* -f
 
 	# Provide support for initramfs
 	[ ! -e ${D}/init ] && ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
@@ -231,19 +231,19 @@ do_install() {
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 
-	install -d ${D}${systemd_unitdir}/system/graphical.target.wants
-	install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
-	install -d ${D}${systemd_unitdir}/system/poweroff.target.wants
-	install -d ${D}${systemd_unitdir}/system/reboot.target.wants
-	install -d ${D}${systemd_unitdir}/system/rescue.target.wants
+	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
+	install -d ${D}${systemd_system_unitdir}/multi-user.target.wants
+	install -d ${D}${systemd_system_unitdir}/poweroff.target.wants
+	install -d ${D}${systemd_system_unitdir}/reboot.target.wants
+	install -d ${D}${systemd_system_unitdir}/rescue.target.wants
 
 	# Create symlinks for systemd-update-utmp-runlevel.service
 	if ${@bb.utils.contains('PACKAGECONFIG', 'utmp', 'true', 'false', d)}; then
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/graphical.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/multi-user.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/poweroff.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/reboot.target.wants/systemd-update-utmp-runlevel.service
-		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/rescue.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/graphical.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/multi-user.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/poweroff.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/reboot.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_system_unitdir}/rescue.target.wants/systemd-update-utmp-runlevel.service
 	fi
 
 	# Enable journal to forward message to syslog daemon
@@ -318,8 +318,8 @@ FILES_${PN}-ptest += "${libdir}/udev/rules.d"
 FILES_${PN}-gui = "${bindir}/systemadm"
 
 FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
-                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
-                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
+                              ${systemd_system_unitdir}/systemd-vconsole-setup.service \
+                              ${systemd_system_unitdir}/sysinit.target.wants/systemd-vconsole-setup.service"
 
 RDEPENDS_${PN}-kernel-install += "bash"
 FILES_${PN}-kernel-install = "${bindir}/kernel-install \
@@ -336,8 +336,8 @@ FILES_${PN}-zsh-completion = "${datadir}/zsh/site-functions"
 FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
                       ${exec_prefix}/lib/binfmt.d \
                       ${rootlibexecdir}/systemd/systemd-binfmt \
-                      ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
-                      ${systemd_unitdir}/system/systemd-binfmt.service"
+                      ${systemd_system_unitdir}/proc-sys-fs-binfmt_misc.* \
+                      ${systemd_system_unitdir}/systemd-binfmt.service"
 RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
 
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
@@ -355,34 +355,34 @@ FILES_${PN}-extra-utils = "\
                         ${bindir}/systemd-stdio-bridge \
                         ${base_bindir}/systemd-ask-password \
                         ${base_bindir}/systemd-tty-ask-password-agent \
-                        ${systemd_unitdir}/system/systemd-ask-password-console.path \
-                        ${systemd_unitdir}/system/systemd-ask-password-console.service \
-                        ${systemd_unitdir}/system/systemd-ask-password-wall.path \
-                        ${systemd_unitdir}/system/systemd-ask-password-wall.service \
-                        ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-console.path \
-                        ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-wall.path \
-                        ${systemd_unitdir}/system/multi-user.target.wants/systemd-ask-password-wall.path \
+                        ${systemd_system_unitdir}/systemd-ask-password-console.path \
+                        ${systemd_system_unitdir}/systemd-ask-password-console.service \
+                        ${systemd_system_unitdir}/systemd-ask-password-wall.path \
+                        ${systemd_system_unitdir}/systemd-ask-password-wall.service \
+                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-console.path \
+                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-wall.path \
+                        ${systemd_system_unitdir}/multi-user.target.wants/systemd-ask-password-wall.path \
                         ${rootlibexecdir}/systemd/systemd-resolve-host \
                         ${rootlibexecdir}/systemd/systemd-ac-power \
                         ${rootlibexecdir}/systemd/systemd-activate \
                         ${bindir}/systemd-nspawn \
                         ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
-                        ${systemd_unitdir}/system/systemd-nspawn@.service \
+                        ${systemd_system_unitdir}/systemd-nspawn@.service \
                         ${rootlibexecdir}/systemd/systemd-bus-proxyd \
-                        ${systemd_unitdir}/system/systemd-bus-proxyd.service \
-                        ${systemd_unitdir}/system/systemd-bus-proxyd.socket \
+                        ${systemd_system_unitdir}/systemd-bus-proxyd.service \
+                        ${systemd_system_unitdir}/systemd-bus-proxyd.socket \
                         ${rootlibexecdir}/systemd/systemd-socket-proxyd \
                         ${rootlibexecdir}/systemd/systemd-reply-password \
                         ${rootlibexecdir}/systemd/systemd-sleep \
                         ${rootlibexecdir}/systemd/system-sleep \
-                        ${systemd_unitdir}/system/systemd-hibernate.service \
-                        ${systemd_unitdir}/system/systemd-hybrid-sleep.service \
-                        ${systemd_unitdir}/system/systemd-suspend.service \
-                        ${systemd_unitdir}/system/sleep.target \
+                        ${systemd_system_unitdir}/systemd-hibernate.service \
+                        ${systemd_system_unitdir}/systemd-hybrid-sleep.service \
+                        ${systemd_system_unitdir}/systemd-suspend.service \
+                        ${systemd_system_unitdir}/sleep.target \
                         ${rootlibexecdir}/systemd/systemd-initctl \
-                        ${systemd_unitdir}/system/systemd-initctl.service \
-                        ${systemd_unitdir}/system/systemd-initctl.socket \
-                        ${systemd_unitdir}/system/sockets.target.wants/systemd-initctl.socket \
+                        ${systemd_system_unitdir}/systemd-initctl.service \
+                        ${systemd_system_unitdir}/systemd-initctl.socket \
+                        ${systemd_system_unitdir}/sockets.target.wants/systemd-initctl.socket \
                         ${rootlibexecdir}/systemd/system-generators/systemd-gpt-auto-generator \
                         ${rootlibexecdir}/systemd/systemd-cgroups-agent \
 "
@@ -472,8 +472,8 @@ FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/rules.d/*.rules \
                ${sysconfdir}/udev \
                ${sysconfdir}/init.d/systemd-udevd \
-               ${systemd_unitdir}/system/*udev* \
-               ${systemd_unitdir}/system/*.wants/*udev* \
+               ${systemd_system_unitdir}/*udev* \
+               ${systemd_system_unitdir}/*.wants/*udev* \
                ${base_bindir}/udevadm \
                ${datadir}/bash-completion/completions/udevadm \
               "
-- 
2.7.1


