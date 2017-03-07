Return-Path: <slemieux.tyco@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 01E9077858
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 20:55:33 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id f203so1898720itf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 12:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yu3NajKnAEYdBk7zl3gZ1wC7uH/lO8FKzNHoaHbKfCg=;
	b=LXP0NS5w7I0yc920mPb3+sNzZ84pOVvMfS2JMIyTpdTiDBzJStpdJlAE2Q6hZY3A3e
	ARQ90HjCPAaUYAjZ3YYoLJLbQNztmS7HwFCy+NqP24pMJz6DTR1G2+0u5oMs7l21WftZ
	K6VsvAAE19mMwgk2u0JujqTTQe8aYshr/tO4uWibrtVgf2MggephaYH1qB1TLZNQHtTN
	zZjdvxD2eQqqzq/u/35sFhEqMGje1BM4d/3K7ALnwyKmAWYkuio2M8sHXl9MEgG5/A1B
	XD79aD5dI+eaZH0JSymuagdI139UbeggLTHBzTJnRNmYfr44CuQDW/jHLkUJjwjqLYkd
	o70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yu3NajKnAEYdBk7zl3gZ1wC7uH/lO8FKzNHoaHbKfCg=;
	b=VbzGAZ6xgTpAMKJOsWxqIZO9mPMPEqGSlZXXFEaV8iYLPUJZIxUvIZzz8lnMj1j07t
	g0hbTfDVpbB/IgUPaLx5hP/CDB7xpdcfkPNd0FIdtorH6NCBCHNGNyXzFAXsWgHEnikM
	NyOJxEr5TR+KjT1DqqGbss5mUj0aQQX9hr4xRXQO8NpDnVhlaylS72ALxAm2UxCDegwx
	EGEScuvBMgq0sVdynYagWZVAvVlHi+gcs10zGWvhvhHMzxWmFxffHGQNgkaTiWK9GZWo
	o/PxO3JIdoVrW5F/imRXar8XTN9R2xfaobmWdz2TE0caHN0rviW+7P1FISLFi3c2PqEn
	BYgg==
X-Gm-Message-State: AMke39nF2Gj+6Il68XJ5fNVJe4bUKnzL+NzmVqYb6Hxkz0HTB3NB/ES87a0IYVes08Yhpg==
X-Received: by 10.36.6.72 with SMTP id 69mr16838656itv.75.1488920135186;
	Tue, 07 Mar 2017 12:55:35 -0800 (PST)
Received: from CABRO3AP00510.localdomain ([74.51.240.241])
	by smtp.gmail.com with ESMTPSA id 202sm6742079ith.7.2017.03.07.12.55.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Mar 2017 12:55:34 -0800 (PST)
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Mar 2017 15:55:01 -0500
Message-Id: <20170307205502.14261-2-slemieux.tyco@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170307205502.14261-1-slemieux.tyco@gmail.com>
References: <20170307205502.14261-1-slemieux.tyco@gmail.com>
Cc: gary@mlbassoc.com
Subject: [PATCH v2 1/2] recipes-core: busybox: setup "cron" sub-package
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
X-List-Received-Date: Tue, 07 Mar 2017 20:55:34 -0000

From: Sylvain Lemieux <slemieux@tycoint.com>

Setup "cron" as a sub-package in "busybox" and
add the support to install "cron" as a startup script.

Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
---
Changes from v1 to v2:
* Rebased on latest master.

 meta/recipes-core/busybox/busybox.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 39c2eef082..3bede6307c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -21,7 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
 # We don't want '-e MAKEFLAGS=' in EXTRA_OEMAKE
 EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
 
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


