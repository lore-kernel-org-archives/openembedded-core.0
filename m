Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2978E73172
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p65so11584517wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=yGl1mrySwyFN5YvWeuo8jNRPDmcvEr3akdTMxW9sGks=;
	b=PpunyAlNSkQfAsfdvXzQJ8NuGx+Zxn2gTTyWFdSFQrq8HUxWkAqHuD07O7yjMKFBIv
	AubK2HoT/C1xdkHPhpEzgEnCrYwLOigxDgazaS6BsupfwEmohXL4sGJhLqDhsEcgIK64
	NGZ5a5DjCtdcf5ACVTo7mLPp79Ob6cbXzAd0PG09aKDl6XuP6aqMCbUP/UHmkLzK0NkP
	ZJmh+WsZ+UOyDHQA4BYfRytKCzaTUBAW53RuERNCWEQLzgITLM7Djnf2TE10fJZ1V5pf
	FK9sAqYqJafodVnSybXNYML/4ckK32cCNtWLUJ6zD3uaRhAPxP8WW0chPTxSY/hDbQC/
	Z6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=yGl1mrySwyFN5YvWeuo8jNRPDmcvEr3akdTMxW9sGks=;
	b=ZZZFPfLBBoymyQ0XNaqQ/DkwS69+yA2UOv+wslvTiopQP7ksxtmgqepwg8LTsF7Jxb
	9xZ7sT4qG3HH/UrfkyTtw0OUptovInE3HONkDGd+pxomYmaeMaJNbkyk6HWjNfgAqaXT
	m0QVdDFz++nu/NqfVrBRPt8cheddUHgzaJa9LcPaXa4dPz0Nj5u6WUAFKPJEYa69QkKJ
	Re0D/KWEnELKL1iGynnwedOYNuYU97hBPxw/vSX+tNTJ/BJ9UfpFW1cv6D0VRRKeamNJ
	U+ZPqY77Ler7ahG9aQzJErb8shHkYtWR/uU+pP9njH0px79t5aIfy6d5o5GAsd5p1wdy
	Loyw==
X-Gm-Message-State: AD7BkJKhdePnKF97LiyETYEiWrcVSRAi8P0z/FhHmy5+CqQtwyBVn5eXoxF77WyMOrNVgw==
X-Received: by 10.194.188.20 with SMTP id fw20mr23244963wjc.80.1457896481755; 
	Sun, 13 Mar 2016 12:14:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:40 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:04 +0100
Message-Id: <b8013c315d600fe8c7afa78630d1a2ab030ea62d.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 06/42] connman: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:42 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/connman/connman.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index c375251..539df7e 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -43,7 +43,7 @@ PACKAGECONFIG ??= "wispr \
 # local.conf or distro config
 # PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
 
-PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/ --with-tmpfilesdir=${sysconfdir}/tmpfiles.d/,--with-systemdunitdir='' --with-tmpfilesdir=''"
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_system_unitdir}/ --with-tmpfilesdir=${sysconfdir}/tmpfiles.d/,--with-systemdunitdir='' --with-tmpfilesdir=''"
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant, wpa-supplicant"
 PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}, ${BLUEZ}"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono, ofono"
@@ -169,13 +169,13 @@ VPN technogies are implemented using plug-ins."
 FILES_${PN}-vpn += "${sbindir}/connman-vpnd \
                     ${sysconfdir}/dbus-1/system.d/connman-vpn-dbus.conf \
                     ${datadir}/dbus-1/system-services/net.connman.vpn.service \
-                    ${systemd_unitdir}/system/connman-vpn.service"
+                    ${systemd_system_unitdir}/connman-vpn.service"
 
 SUMMARY_${PN}-wait-online = "A program that will return once ConnMan has connected to a network"
 DESCRIPTION_${PN}-wait-online = "A service that can be enabled so that \
 the system waits until a network connection is established."
 FILES_${PN}-wait-online += "${sbindir}/connmand-wait-online \
-                            ${systemd_unitdir}/system/connman-wait-online.service"
+                            ${systemd_system_unitdir}/connman-wait-online.service"
 
 SUMMARY_${PN}-plugin-vpn-openvpn = "An OpenVPN plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-openvpn = "The ConnMan OpenVPN plugin uses openvpn client \
-- 
2.7.1


