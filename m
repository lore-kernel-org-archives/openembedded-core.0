Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AEFFF6FFED
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p65so11584635wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Tr26StWvOXtvHuGUbsql2E2/n3KNrP5XifJcEnflCE4=;
	b=c5Co2+Vj8DGBqskYKDL5fSR/QGxVaOUotvDD8B+6LrVmbN4UxW7LTO+c352HSEQCt5
	uMW1h2m2szIXW8NVpz/kKMSlWlEVUBEIZQatKh9MYtXyZNx+ugSigD+eLA//0IS79M0M
	hZPf1ykuL0t0qyFCLhNQzfUWceKrzzDWCZ01rbG3T6p/Onmlm5MyzhbtNCKS8PEwDLZu
	S8fhbrJ7d2s8L5vrV+lF0wtDpCCSx6YewuWMepIwmlX1BeOgwSXXrdhQy5frUYVWw5Cc
	BL7uIBo0uqc6gvZWREFjt/nDdE91Z8wYesFl5HnsNLX081pyeE9YouJo8FNWTc8lZNj1
	ZMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Tr26StWvOXtvHuGUbsql2E2/n3KNrP5XifJcEnflCE4=;
	b=NQ63WIfRA4aKMwT3kmp0jI+z1mQhugfB+EivX1z91zoLJfJa0KVZANlS0QhWoD8hTD
	AUYa/00NdelAjYod5SPdOl7V6jIqA5UX9gDLePfCby9MwymJRimAYoqFCBsqwkkfbLBT
	t6HrlbZAlogiuxWWveXvqK1/0BJfD2iFfON2h8UAY4plMKjuZRyU5vrepDU1N9qYrksB
	XHptzv1CLi9xYEjBRRavYDUdAHSCnbP7qI+jSzECHh/cbjnDb88KT6/TWuE+/h1n0x+7
	dV8egMdIkg2rnBzbMrc7qDc4IRX+FEeIkZ9ceCFu1Qu/xOsRtqV2WHb7ZWkxvRsiIAiQ
	MBXg==
X-Gm-Message-State: AD7BkJIiyLitGbvLAGfTkUrbfQRFm7GbLc9L6IgeZqfhf+gYSe/hHyiSEFHeWeY48HYd7Q==
X-Received: by 10.194.86.202 with SMTP id r10mr9519383wjz.113.1457896483329;
	Sun, 13 Mar 2016 12:14:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:41 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:05 +0100
Message-Id: <d967a35894d0c8c743bf4fce287d22c194cdbd84.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 07/42] dhcp: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:43 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 9c4233b..c57eb03 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -62,14 +62,14 @@ do_install_append () {
 	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
 
 	# Install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dhcpd6.service ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcpd*.service ${D}${systemd_unitdir}/system/dhcrelay.service
-	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
-	sed -i -e 's,@base_bindir@,${base_bindir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
-	sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dhcpd6.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/dhcpd*.service ${D}${systemd_system_unitdir}/dhcrelay.service
+	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_system_unitdir}/dhcpd*.service
+	sed -i -e 's,@base_bindir@,${base_bindir},g' ${D}${systemd_system_unitdir}/dhcpd*.service
+	sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_system_unitdir}/dhcpd*.service
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
-- 
2.7.1


