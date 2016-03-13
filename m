Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 829D373195
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p65so11587105wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=s9mZPeFZur5LEYRXbhPIYFZhi5kIC4VxpQwn9gdEXmQ=;
	b=d/UzyEkHeHCGSwTcVDlTd1lsxpJV+eYg/GokVa59BgvPVFfDIVcrfJqhgrVpozwXM8
	HW9iRc62UY08OeNnd51qCcgWpwcL3Z+yH97oiS7EteDBY5FVFWVbD97effJBfTzCWeUX
	UEnWsc1ANQRXtq6gdRRul1oxHAQNMUjFhn0hIVXFcrnCn2L+apkf61q1R1q3wAKx6DaU
	m7JNh85Ygskp87Z55ZyJbIlE24m4VoNd1hvmsH2OKwFwJ1QUEk3sMIh+anHZ2HkpaQOx
	D7lkhw4Ij2cXhT1g5ylo6zvUFbOrBwlNm5LepU3YoVOEF1LnQhcVmkj5x2aemVfqOLBk
	jXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=s9mZPeFZur5LEYRXbhPIYFZhi5kIC4VxpQwn9gdEXmQ=;
	b=glaPLwLwfdT0x67+pYuOWf18OxTtxWoluCKHG6Q6IvrNcaFRIJ98lUAPCpvTsaLh0N
	iKuP9bbWZ7rcdZRXcnYzD9w4QZE86q5k8TiwfPZoJ1somnyZrNdKY3pZWaPXdarLjaYU
	HmweMvzbx71xvLVXP9I4KyeEMA3IXIe54q2xo/otLAMZZAEbMQ/fZSykqlx0vSpsADt/
	nQadmpQMeqUdweFfvYs+ZtveKe7+lgTzNaxHHUJWUBEJs4/XdeTe1YUo+SUarnhF2Da0
	gbfkY2sUBdBek8kROvIcC5IT8X0rNP8UFNyDHylI0sjE7THrWIHbILx9lyJSGR9n/xSj
	Y9zQ==
X-Gm-Message-State: AD7BkJJEBtKT1hhqNVCQQH85jH8CtxJs6Xhs77xbkgzPkIigpnj6ekctcL66w8yfzKVuyQ==
X-Received: by 10.28.217.146 with SMTP id q140mr13292801wmg.85.1457896520139; 
	Sun, 13 Mar 2016 12:15:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:18 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:33 +0100
Message-Id: <83af74b0041c734611e34381dc6328443f449b86.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 35/42] ofono: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:19 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/ofono/ofono.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index c415a39..5e40c6c 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -16,7 +16,7 @@ PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     "
-PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_system_unitdir}/,--with-systemdunitdir="
 PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}"
 
 EXTRA_OECONF += "--enable-test"
@@ -32,6 +32,6 @@ PACKAGES =+ "${PN}-tests"
 
 RDEPENDS_${PN} += "dbus"
 
-FILES_${PN} += "${base_libdir}/udev ${systemd_unitdir}"
+FILES_${PN} += "${base_libdir}/udev ${systemd_system_unitdir}"
 FILES_${PN}-tests = "${libdir}/${BPN}/test"
 RDEPENDS_${PN}-tests = "python python-pygobject python-dbus"
-- 
2.7.1


