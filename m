Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14789.1793632690165701934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 07:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KFIq+D9e;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so5881715eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 07:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632689; x=1794237489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhJPL0eLoi2+Tg1FCD+EJIFR4M+ACEpe3NS3dLBaVsI=;
        b=KFIq+D9eHcSYIy9YkQfwWoP3C6y28fBXgWWaflDVbNz3fdYCxRKeMkkuezV8+mV6F9
         B4B2bz9a5k6dPqiGVYbPRhuZ9hLCBOnmeG4LS2kDWXLL30Nr5qJyCf90rlyucabK5kZL
         72GfpaidkMXnugiEPhOfEhTdhj69qNRNZH6OuvydGmpmF/PVXLmEtzYlUfIhIndqpqBd
         6t8GucsWdefRJDUnUBgK0EK0zZHlH5fvIyCzBT470IqsW4g+rZyF1hZRZb5HNQ50sXlc
         O+o5D2mqdOuLAbz7jn36QqNnXt26llvUgIFdzo/RZSVleeIPS+g4xxPbmuCRGu7xhCtI
         eT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632689; x=1794237489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhJPL0eLoi2+Tg1FCD+EJIFR4M+ACEpe3NS3dLBaVsI=;
        b=t4QBuTFotULWQL0dGxKrpSIlwP90Q/SrUJ5rwgAsyfywnI5XQ+p0aDINr7VxOurVnu
         mh9UczsCffQKstcZw1jwn7CALHk99iW0D7Oo6tfrkhmkY/1wAM8HtveiGVAMdvCCAOlo
         8b5oVM1BMF3U0byyXbiHqPX7a82Cmt9XIYHeLs4hDmuugde/K14hT/L2BIkJyFvJrK9G
         6k7XDbuMrSSnNv1FiTWpYk7qPgyNMMWOb3iHDV6437hJBASEEMRB4dgPr8XRkFxD7F8C
         FI8RKhQpSPEPp0OhwoVnn4/16aq8ca1dVSqIVCU2xTcq6ke7fqBW5cZDvvCUUv5+tzbq
         Do6A==
X-Gm-Message-State: AFq9FYJlDd7N9VoaPtIhfJcjfD8yQH6FuS8fAtycitUXNHXvyfBqZRBa
	bHXAHdAEGqqCQ/wEN1Gu6UNhv9SrP3GtvJeQFzwcmNY7vF/g6V/I2A8BOsAhF3igIFQ=
X-Gm-Gg: AYBFou3ez43ougQw9XfHCMceHnOdp1jX3npsK0DlyINVoECPcDk5vMICiSorPzEe92m
	S0pPjaAAGMfoI9oeq9iOT46XuS/AOWGh4NqciEaJ9dBILZ5InhShWVyLPMX+LM119JmOsyE2EGx
	AV18+TXo8LV4kbn2mRKuSIFeWF2WYwdWkXt+tdLmHzReEcgyA5j+set79s1aD+KlyMIdkex6V56
	ZL4eYJr1NMDRp+IfqteVbzqKKt/lPbAzCd0fTuqZZ1aXSfqSjdSTNyhXpJfC19OBVglQNRIMj6E
	EoMBaBLQz/Chc76VNnHdeAGRVEh+8PYRKlnV50tdCFsKfqwaH+h409d/Tn8S7dQkasznjWeH6dm
	yj02YMwaiotQj2uMlysAJtAaZvv/OqmEe3mGOtYf4enLW/S7o9DZBbU1etLejP2sHOsbmdbSRDY
	JxbguXOp7kj/1rdhsc+Pod1LSNFFEFkbiPyqJhmqFkZG1HBDvJsV1J7Z9fOncCS003RtjYghLI0
	+NPwQB0CLUciVUeSgQrbMm5PiW+/paHwxKQ3HJ4YfEBIW+8fHiqiddlzNGeYq1Efdm2udcsyTys
	bP+vSyqUYIntVQ0H1gMphOadZJgA5T5UjSh+X/0ZJjpnWeOk2QqbAkrLHPLI5C/AZpV1kzDIRcM
	1PadUMeU0vYmUVhNt3ajx5vdMg93urARTHHE9ik5GyO1vjzVBs1xFzZA+8tjc18Y2R4JcjAqY5W
	DQzJ/sl6mBgquuZEzaKFupfiro5ZFUd9iNG480PGX1xAf6cAwo1cjLZ0AZNjeTmPw9cEaGygZac
	AvK2oyMKKuKrSkZEB4JohbHKAkrop1Sw09boW69QTCPNGpNSDmEvdAwbEL836zsf6I+GsQm69vb
	knDz
X-Received: by 2002:a05:693c:87ce:10b0:36a:1fa2:fbbe with SMTP id 5a478bee46e88-36a424658edmr16277940eec.41.1793632689258;
        Mon, 02 Nov 2026 07:18:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm35444348eec.12.2026.11.02.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:18:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dbus: Package dbus-daemon separately from the system bus units
Date: Mon,  2 Nov 2026 07:18:04 -0800
Message-ID: <20261102151805.3233815-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 15:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249213
Content-Type: text/plain; charset="utf-8"

dbus-daemon is also used to run private buses, e.g. by GLib's GTestDBus
and python-dbusmock in test suites. It is currently in the dbus package
together with the system bus service units, which conflicts with other
system bus implementations: dbus-broker RCONFLICTS dbus, so with
VIRTUAL-RUNTIME_dbus = "dbus-broker" no dbus-daemon can be installed and
such tests fail with

  Error spawning dbus-daemon: Failed to spawn child process "dbus-daemon" (No such file or directory)

Move dbus-daemon, dbus-run-session and dbus-cleanup-sockets into a new
dbus-daemon package, similar to Debian, which can be installed alongside
dbus-broker.

dbus RDEPENDS on it, so nothing changes for existing users.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
index c7815d78f7..e602c67727 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
 PACKAGECONFIG[tests] = "-Dmodular_tests=enabled -Dinstalled_tests=true,-Dmodular_tests=disabled -Dinstalled_tests=false,glib-2.0"

 DEPENDS = "virtual/libintl"
-RDEPENDS:${PN} += "${PN}-common ${PN}-tools"
+RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'message-bus', '${PN}-daemon', '', d)} ${PN}-common ${PN}-tools"
 RDEPENDS:${PN}:class-native = ""

 inherit systemd useradd update-rc.d
@@ -58,7 +58,7 @@ inherit systemd useradd update-rc.d
 INITSCRIPT_NAME = "dbus-1"
 INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."

-PACKAGES =+ "${PN}-lib ${PN}-common ${PN}-tools"
+PACKAGES =+ "${PN}-lib ${PN}-common ${PN}-daemon ${PN}-tools"

 USERADD_PACKAGES = "dbus-common"
 USERADD_PARAM:dbus-common = "--system --home ${localstatedir}/lib/dbus \
@@ -69,10 +69,7 @@ CONFFILES:${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session

 DEBIANNAME:${PN} = "dbus-1"

-FILES:${PN} = "${bindir}/dbus-daemon* \
-               ${bindir}/dbus-cleanup-sockets \
-               ${bindir}/dbus-launch \
-               ${bindir}/dbus-run-session \
+FILES:${PN} = "${bindir}/dbus-launch \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${localstatedir} \
@@ -93,6 +90,14 @@ FILES:${PN}-common = "${sysconfdir}/dbus-1 \
                       ${systemd_user_unitdir}/sockets.target.wants \
                       ${nonarch_libdir}/sysusers.d/dbus.conf \
 "
+# The message bus executable on its own, without the system bus units, so that
+# it can be installed next to another system bus implementation (dbus-broker)
+# for things like test suites which start private buses.
+FILES:${PN}-daemon = "${bindir}/dbus-daemon* \
+                      ${bindir}/dbus-cleanup-sockets \
+                      ${bindir}/dbus-run-session \
+"
+RDEPENDS:${PN}-daemon = "${PN}-common"
 FILES:${PN}-tools = "${bindir}/dbus-uuidgen \
                      ${bindir}/dbus-send \
                      ${bindir}/dbus-monitor \
