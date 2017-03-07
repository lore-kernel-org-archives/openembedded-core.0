Return-Path: <slemieux.tyco@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4208B77858
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 20:55:34 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id r141so1898344ita.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 12:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rw9zMDUgL9SR/jfWFtH2loc2iM3nOR6CEubblOcOTPE=;
	b=TjJqa6PRe4PDz80ZzsFTV3amaXPQ1YC2c2oryGS5u+F3Mvhrn9wbr4BpEVFZQudoFY
	JuuxGSvmCiP1GdnojkyrIf44ryeIl+ghy3Kef8rIUPfRflM3YSYxwK502MrOXO24c2H9
	Y4bqdbsnMax7IYvXHMBGgM5v8kcbRfeKllu8pUfD77eQlMkWG17IhJCwcze0gy4yXphN
	uGKBmYDmH73JqWIdhwdh3503xcxp0RcsM/T+AjaOduN77MkNJ5AYd5XV73lb1TDadjnz
	0Y0mJbq15s5VrXFj7cjnECeTboLvQ9cfLpBiQy83Wn6Fm5/dlIqYfPIUCMMwYkZj5/Hi
	LVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Rw9zMDUgL9SR/jfWFtH2loc2iM3nOR6CEubblOcOTPE=;
	b=XcIuQy5ZlplFD0HH2Ns8NLbPKVxxD+JRm81R+lGUSa6nsQe1zWv83NBmOJPir0mDD6
	WBRwYI0Uw2o1Ov4zxFJ5bImJSoIG6FG5sKpnCHNKTYYJSe74eEP2GoEns/sNH35i5HUd
	EYkKlev0pGuAeGTPY5W9bqV8x2RCTFU4CF0H3W1FBBoBUuLt04/PasVTycKYRtW9o4Rv
	+cpF8QTS9S5dCePhTF69e/WhOXaGoGcRroX/c8D64zFcpjKOCYmvNwU1S+uqbPKmI0Zi
	NhNJPG1oOtVuEc4ht3r9yhEKuiTipdBsgCGQ45szeYjVn5W82upY11wd8oLYXSsFlUuZ
	eCeg==
X-Gm-Message-State: AMke39kKsBSi6GiBdKalcPbtIgP7ieRR+PUnFZDLOIprcK4a0PyvATDR5U2zddbkypeM5g==
X-Received: by 10.36.104.198 with SMTP id v189mr3196649itb.72.1488920135828;
	Tue, 07 Mar 2017 12:55:35 -0800 (PST)
Received: from CABRO3AP00510.localdomain ([74.51.240.241])
	by smtp.gmail.com with ESMTPSA id 202sm6742079ith.7.2017.03.07.12.55.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Mar 2017 12:55:35 -0800 (PST)
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Mar 2017 15:55:02 -0500
Message-Id: <20170307205502.14261-3-slemieux.tyco@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170307205502.14261-1-slemieux.tyco@gmail.com>
References: <20170307205502.14261-1-slemieux.tyco@gmail.com>
Cc: gary@mlbassoc.com
Subject: [PATCH v2 2/2] recipes-core: busybox: setup "inetd" sub-package
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

Setup "inetd" as a sub-package in "busybox" and
add the support to install "inetd" as a startup script.

Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
---
Changes from v1 to v2:
* Rebased on latest master.
* Rebased on top of "setup cron sub-package" patch. 

 meta/recipes-core/busybox/busybox.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 3bede6307c..46666f3884 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -21,7 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
 # We don't want '-e MAKEFLAGS=' in EXTRA_OEMAKE
 EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
 
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock ${PN}-cron"
+PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock ${PN}-cron ${PN}-inetd"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
@@ -30,8 +30,9 @@ FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
 FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
 FILES_${PN}-cron = "${sysconfdir}/init.d/busybox-cron"
+FILES_${PN}-inetd = "${sysconfdir}/init.d/inetd.${BPN} ${sysconfdir}/inetd.conf"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock ${PN}-cron"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock ${PN}-cron ${PN}-inetd"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
@@ -40,6 +41,7 @@ INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
 INITSCRIPT_NAME_${PN}-cron = "busybox-cron"
+INITSCRIPT_NAME_${PN}-inetd = "inetd.${BPN}"
 
 SYSTEMD_PACKAGES = "${PN}-syslog"
 SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
@@ -47,7 +49,7 @@ SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
-RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc ${PN}-cron"
+RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc ${PN}-cron ${PN}-inetd"
 
 inherit cml1 systemd update-rc.d ptest
 
-- 
2.11.0


