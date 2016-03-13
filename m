Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6A67318D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:51 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n186so11590423wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=9/aJ/ShXu4UP9zEePog8OdeDIc7d6L873RWFpK4cSVo=;
	b=YH2R8uxn+Lnf2Edt6XApgrTCL+A7pjEh5InDhyG1l9NwyEJjbJTVdzBZ15ECyazbS/
	Cma/DwKWEzaz/Gvv22fKCvBEkxUBjhLZcJa8UT0ojtfzw28UUn4e1m7+uVYMO1zl+Vy4
	s98gR1q0HMTi9O9wvtyRrdlGpb+f05SYO0W5mqkxjCKgqmKrZ7aZNiMNasdW02wUfMB6
	pf63KnDFAM9S9m2Fq8Dpcqe/VEf/2tUbvxNTexb+eEf0GZebIQjfpdtDwFzNqFUjrJJp
	Opdh0/Z7pvOsDGWS7Jh78Afom84PexkzKqi1AxzxvzE0oS8ZqFQZ4ge/nSoNG1AiOQnL
	8w+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=9/aJ/ShXu4UP9zEePog8OdeDIc7d6L873RWFpK4cSVo=;
	b=cEVN7oy8v25rvqI5XnQ4aeA5fi2DtQ6JcjKhkxE6HQdH8Ypj/d7Yf83r0JS90xz2FK
	Dj7+h+ug6DyHuUJ1fcvs/t8ZLy32pIMCYY7XlxCwOFtYSHLn3nvR4NJ1vEsOTwTFK9Gw
	FrEe28EqWKepJu8//w2UNjwJQi4XqGvNljdl95Sf807i7DzXu+RQ1oiS4lXcRj36qZ6t
	KpxlmuiCPWSJZ+KQUX8xLXGB6E/BxdQCuTj6uuGmZ3fq35bNz+TMR4N9hFy6h34hGiEn
	JFDQv0qzW8M7MzGC16pqfPKYopseFGMOZRVSN4Qh3OMzi//7ay+eH0rFRy3IfDi7KoIa
	d8bQ==
X-Gm-Message-State: AD7BkJL9pFoIuCg2fCmrY6m/e0fpW8HCufYTh2vrQXuX3zGUz8UGZgQykySHBpV5jUGnFg==
X-Received: by 10.28.54.89 with SMTP id d86mr13389082wma.21.1457896492244;
	Sun, 13 Mar 2016 12:14:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:51 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:12 +0100
Message-Id: <8b0f8561f5242fa2a0400dc6c5d8919b98742b55.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 14/42] busybox: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:52 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 5e91a26..bd8c6aa 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -24,7 +24,7 @@ EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
+FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_system_unitdir}/syslog.service ${sysconfdir}/default/busybox-syslog"
 FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfdir}/mdev/*"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
@@ -294,19 +294,19 @@ do_install () {
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
-            install -d ${D}${systemd_unitdir}/system
+            install -d ${D}${systemd_system_unitdir}
             sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
-		> ${D}${systemd_unitdir}/system/busybox-syslog.service
+		> ${D}${systemd_system_unitdir}/busybox-syslog.service
             if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
 		install -d ${D}${sysconfdir}/default
 		install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
             fi
-            ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
+            ln -sf /dev/null ${D}${systemd_system_unitdir}/syslog.service
         fi
         if grep -q "CONFIG_KLOGD=y" ${B}/.config; then
-            install -d ${D}${systemd_unitdir}/system
+            install -d ${D}${systemd_system_unitdir}
             sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
-		> ${D}${systemd_unitdir}/system/busybox-klogd.service
+		> ${D}${systemd_system_unitdir}/busybox-klogd.service
         fi
     fi
 
-- 
2.7.1


