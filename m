Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F41AB60667
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n205so11549354wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=3ptw/RHd8HOmPYAdywmSx7+wRum28/cmHYoTZpYPPsk=;
	b=s8kA70zCXcL071r9lZdD7yx+SHb7qMjJxwy08jsvyHepd3YoWPIZabBsCSzHXPR6ph
	og1V9HRYSn891um1/P2xFVoKeRYQ1PQYCvr9wIg3fRQ/Dh7xjTmOKziC0e7y6L4TmC11
	Swp1eeAGJkim33SNEDRYrZUmVr/WKvJWT9RApfc7PXRp9eAQRMiyk/Ykb2DpBZJcLy8w
	S+xm4Nb6VMYKW76BGK8hxkryuaxMAY6SPTL1Ea9rrLYZ1JDR+Ul+jAOl77k9bbClvLXG
	ztSYzW4JdOtzr7cM9TA92UG/GREcuKyVeygc2HElbCCtLFh7+xlJwTH6/SrqNUfyR5Xn
	V1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=3ptw/RHd8HOmPYAdywmSx7+wRum28/cmHYoTZpYPPsk=;
	b=CK0RsZ7pbSwe2IGD0nAQrjjOz04KGYnX/GrrNCC2aehSthsq4y4eKQTVqlpDINg/f7
	rbSaLHpat4J8g8v9jcuNJqhSTy8WC6PzBwR+A4gn1oSmfbl0FK5Ts4B2Wir1KNUxrNXc
	c/fr66R2xqWurCaxUb4MVCuBaQ/cpN0cZepCFq94bJGfLF3TL3nFF2c87pAgW9kAJ86A
	OklyeDTY7mHIzM3R3zmRzFt6Cn3KJIZIBHwvzotLvuk/OlbKWUpJKBVBpsVBj3srbndZ
	V5V85CtixhcHZQBPdprLWfs8oCox85ZxwpqKHjepgD/tgRdPgy0EHhwqpfax2FoEdUTW
	CMTg==
X-Gm-Message-State: AD7BkJJH8emX/iWj+Lst8yaIJyJh/s8t/n0lklPJa/pSOFz6QgPMdNxoIJ9Uq6JkvNJOPQ==
X-Received: by 10.28.34.67 with SMTP id i64mr13289679wmi.85.1457896487613;
	Sun, 13 Mar 2016 12:14:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:46 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:08 +0100
Message-Id: <17417413a312079e06459556bd7e757f77b7cd45.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 10/42] openssh: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:47 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
index 3b5e28a..103f751 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
@@ -114,14 +114,14 @@ do_install_append () {
 	echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 
-	install -d ${D}${systemd_unitdir}/system
-	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
-	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
-	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
+	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
+	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		-e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@BINDIR@,${bindir},g' \
-		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
+		${D}${systemd_system_unitdir}/sshd.socket ${D}${systemd_system_unitdir}/*.service
 }
 
 do_install_ptest () {
@@ -134,7 +134,7 @@ ALLOW_EMPTY_${PN} = "1"
 PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
 FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
-FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_unitdir}/system"
+FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_system_unitdir}"
 FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
-- 
2.7.1


