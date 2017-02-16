Return-Path: <slemieux.tyco@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4F6D6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 20:46:49 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id e137so6071389itc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Btlpqc1H2t4w8HEL07Ex3OoOTICYGjSZyAaN8VGsiYA=;
	b=DjK4zpPVzIiTV3RVKbqIVOXEbU9AhSaBRpdtYQtPGR3LQ6fRBrVXXL9jWaAZpptMRG
	ZRaUuzCoZNRqM/ByQMkRTclHky6WDFd+8Ssi2DWtTElWoY4c6MExGO5sDubtb+kO5MxP
	L5V1HFqaMufiJG8eO1N8TzAZWkx9k319lpdVXHIjiU+ydPYq/S/TarPx2jfc5B1qi2P3
	NcBE/cm76LpfdahsdSUgVOjYHuLhPenDwoCoDBJ4AAaYNx8LeS09StfoaZW62Loai4Ii
	e/MtQOGJB5u4P0i0zvZbXK92dQOIFKU0ZhT/sn/MrwvBysYh2PYn2zFh7RL2Z8KqK30n
	cF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Btlpqc1H2t4w8HEL07Ex3OoOTICYGjSZyAaN8VGsiYA=;
	b=NqLiSfrbESULYHOj0ZRzAAXVXrtpx0FrK814ECHlSGGAvPwHE3N2I7SbMUUdj0Sl34
	tPyL5fAG5QhxRBBwHfITZvqvaedAdGqTrs42OPfi44zH0Rq+FjMY6XNaQalK1q0DGiaf
	Pdmn2u2oTJk+vCXPJJsDOmbMlVRdNU1Xvpk9NSasxM5iu0VvObNF8hZkc4KRjfjQGsGe
	U9KGFGZ6k3QkYvG9oBLUmXRDJb83IUL2YMYtwnK0sIMbIHj3yxPEMGT9t6nPoYz61eLh
	WLpihLmU+Hk6gD3OIrrqphShCK4t1OjnKX7Y8gutO8puKhhbtMkZlDmKMQBlVmWTHU2b
	Nc2Q==
X-Gm-Message-State: AMke39ni7Zxr16Y1rEFuBtPymFQk9M8cKBHy96XLbUooO38gZiS1yiacljUdbX+aUM8Ggg==
X-Received: by 10.36.160.131 with SMTP id o125mr15752895ite.13.1487278009730; 
	Thu, 16 Feb 2017 12:46:49 -0800 (PST)
Received: from CABRO3AP00510.localdomain ([74.51.240.241])
	by smtp.gmail.com with ESMTPSA id
	a22sm3715965itb.29.2017.02.16.12.46.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 12:46:49 -0800 (PST)
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 15:46:02 -0500
Message-Id: <20170216204602.21326-1-slemieux.tyco@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] busybox: setup "cron" sub-package
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
X-List-Received-Date: Thu, 16 Feb 2017 20:46:52 -0000

From: Sylvain Lemieux <slemieux@tycoint.com>

Setup "cron" as a sub-package in "busybox" and
add the support to install "cron" as a startup script.

Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 meta/recipes-core/busybox/busybox.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 39c2eef082..3bede6307c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -21,7 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
 # We don't want '-e MAKEFLAGS=' in EXTRA_OEMAKE
 EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
+PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock ${PN}-cron"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
@@ -29,8 +29,9 @@ FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfd
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
 FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
+FILES_${PN}-cron = "${sysconfdir}/init.d/busybox-cron"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock ${PN}-cron"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
@@ -38,6 +39,7 @@ INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
+INITSCRIPT_NAME_${PN}-cron = "busybox-cron"
 
 SYSTEMD_PACKAGES = "${PN}-syslog"
 SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
@@ -45,7 +47,7 @@ SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
-RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
+RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc ${PN}-cron"
 
 inherit cml1 systemd update-rc.d ptest
 
-- 
2.11.0


