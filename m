Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3D16A6072C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p65so11585578wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=PuP93cD7Ac/PshSq4WoMoikAe6ysoumEs9qXE7wbKQQ=;
	b=iLVuQ7qE3bl/bQH/JpLNp5ElrvtrKkYYYOF6Rgg7O+zyJU4a1JbjF4RsIcmQ8Yzu2d
	oJhYL7qkjrpXc01tT1hNBGHB90bvcwm9jd39hzsUajwnU+RceywYiTrYzXeN72GV3hkg
	2IYfTTQfBv4QQGUpNQyTmkw1NHjuqDthahmukhZQ4qqey3LPDviCBHBy9oFeKj+tKnMl
	TK/ksTKWeuVcRRtScto6//EPDbE0pi0jgaZ4jS28jXoATcaBoG0yTb+TqWlPGM5eU0Zx
	32ne8fKlW+qe2Y8QYkzkRdJLBL6oooBru38ASQfdxshJRLOv7fTpkU5bFFumzjKkM1tW
	HSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PuP93cD7Ac/PshSq4WoMoikAe6ysoumEs9qXE7wbKQQ=;
	b=LaIS6yqQ4vonMcxBqGKzrOl1kDzQdMnj4Vbvcx9xMOp3t7pqvjDmgV2BGbnfPg50K5
	eFiIWjIOEe9RnIINf5bTdGcbSxdSKT7yp4f2frc9UQXr0weIDV/fiJ4pi54vMy564V5b
	ny6mPRTmCDfZlVH9X0tq8Z7lUasSStV0IKmYgh98nBm7Cbfz3FKgYLU1qNaMiQlS3LDf
	IC1z9YZIJxaKT/1Zs4aeJFpKWI1OYUz2lUK+uPO07zUvJaJEMwL5b7QQJVe1EwefRFk9
	O+uLbAjyG+y8KJj2oy0cJCO+79GhOHjQdspNCuqVx8Gw+Xs3iLQewcJs2PtZfQdEmxTT
	4dgg==
X-Gm-Message-State: AD7BkJKBC9jMq86TdvXd37wWcqfzDVZeVMuQMewWgBtwlZrUsxYsXvJbW9eKxR2y3piciw==
X-Received: by 10.194.209.204 with SMTP id mo12mr21997520wjc.69.1457896497846; 
	Sun, 13 Mar 2016 12:14:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:56 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:16 +0100
Message-Id: <f9ff41b92903329e9e471d5a9dc69186539bf02d.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 18/42] systemd-serialgetty: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:57 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 768b130..b57f0f3 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -13,10 +13,10 @@ S = "${WORKDIR}"
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
 		default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
-		install -d ${D}${systemd_unitdir}/system/
+		install -d ${D}${systemd_system_unitdir}/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
-		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
-		sed -i -e s/\@BAUDRATE\@/$default_baudrate/g ${D}${systemd_unitdir}/system/serial-getty@.service
+		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_system_unitdir}/
+		sed -i -e s/\@BAUDRATE\@/$default_baudrate/g ${D}${systemd_system_unitdir}/serial-getty@.service
 
 		tmp="${SERIAL_CONSOLES}"
 		for entry in $tmp ; do
@@ -24,14 +24,14 @@ do_install() {
 			ttydev=`echo $entry | sed -e 's/^[0-9]*\;//' -e 's/\;.*//'`
 			if [ "$baudrate" = "$default_baudrate" ] ; then
 				# enable the service
-				ln -sf ${systemd_unitdir}/system/serial-getty@.service \
+				ln -sf ${systemd_system_unitdir}/serial-getty@.service \
 					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@$ttydev.service
 			else
 				# install custom service file for the non-default baudrate
-				install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/serial-getty$baudrate@.service
-				sed -i -e s/\@BAUDRATE\@/$baudrate/g ${D}${systemd_unitdir}/system/serial-getty$baudrate@.service
+				install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_system_unitdir}/serial-getty$baudrate@.service
+				sed -i -e s/\@BAUDRATE\@/$baudrate/g ${D}${systemd_system_unitdir}/serial-getty$baudrate@.service
 				# enable the service
-				ln -sf ${systemd_unitdir}/system/serial-getty$baudrate@.service \
+				ln -sf ${systemd_system_unitdir}/serial-getty$baudrate@.service \
 					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty$baudrate@$ttydev.service
 			fi
 		done
@@ -41,7 +41,7 @@ do_install() {
 RDEPENDS_${PN} = "systemd"
 
 # This is a machine specific file
-FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
+FILES_${PN} = "${systemd_system_unitdir}/*.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # As this package is tied to systemd, only build it when we're also building systemd.
-- 
2.7.1


