Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 497EE60616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 08:59:33 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id e64so6566831wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3N2N5Qc+x6LfyboP+xle4OBE5SYqNYXJ0rHgpq29Wxo=;
	b=GEAwy0Ri787/3iFQ1i/u7ORUqRh9ZYzAn5U6p0MNGLqGe4mQQtRctg9ozalq9OaskV
	8nj3ekppG40HoEGvmFC9a6/HmeUmRIiPgXfey3dWGNpvl4cixFVtZfckCyKZo/1iaSqQ
	tEuX0UmhOIIiJRxvuqF9BRPN520tUHHlHILKq6tD6vzJrGFuOFA55GMqh7I2FIr929qD
	5rv0N9Pj8HNzBVXdGqoQaGzfGxj7liKiHSON4Vu0G3j0BzPDzxfTEzdjRqTxwnhSM1DC
	DaqOQbUn2/qCTayoMHkTIjMZAB3SRgbj0fT4+8HgRngnCQ53+UH1HF6G12pFJHrsNtrx
	nXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3N2N5Qc+x6LfyboP+xle4OBE5SYqNYXJ0rHgpq29Wxo=;
	b=CM4RlB8mE1xGJASofFTVLXAO7gBt2oa/kOiEgUe+6sDk9zd0P0Fau8+y9HvEg5rK6W
	ZKmzVfJC4tVRhly5tzp0jjdvFLDQuXFXTRYfP42JT+dsKeMqHFKtLR1BNNkyukajmKQS
	d54MF5r2v7HqXgIkL0WBBiVdVVQu+uv7QE9etbf3w91STkqANqxojYzQSijkqwJHX4Bw
	qsh/P3scwAOKkB2ssgWz1GWkmqECk/Z17Lz0mdyfDCRGx7n/xKMCMycE/jJopAD+or7p
	wzH3BrqYWbpqJO2wiTWSnH6K2Ux22edU0UUWW9L3oaHX9t5mfBVy7IUeaFHVa0M2pYe8
	Xo2w==
X-Gm-Message-State: AHPjjUjUFyehfjo6OgYh+oRqxJiOTI4EX9PEpPYGgfdrBdaOYDdZkaqb
	+PqFJ8h21lkaeJhtIdYjYFaCUA==
X-Google-Smtp-Source: AOwi7QCnxPfV81U9DDAxxWCHMi/C45OTvS3Oca1v41ox7h8HSrfuVgCzxjdlAffZguE0HGSRo9dMDQ==
X-Received: by 10.80.211.18 with SMTP id g18mr13065425edh.85.1506329974669;
	Mon, 25 Sep 2017 01:59:34 -0700 (PDT)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id h2sm3444555edf.39.2017.09.25.01.59.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Sep 2017 01:59:33 -0700 (PDT)
From: andreas.kling@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Sep 2017 10:59:29 +0200
Message-Id: <20170925085929.16112-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] systemd: move pam files to own package
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
X-List-Received-Date: Mon, 25 Sep 2017 08:59:34 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  move pam related files to already existing systemd-pam package.
  add runtime dependencies to pam plugins introduced by file systemd-user.

Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
---
 meta/recipes-core/systemd/systemd_234.bb | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 2695e15ac6..fa16807406 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -100,7 +100,7 @@ PACKAGECONFIG[importd] = "--enable-importd,--disable-importd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PN}-pam"
 # Verify keymaps on locale change
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 # Update NAT firewall rules
@@ -434,6 +434,17 @@ FILES_${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-cgroups-agent \
 "
 
+RDEPENDS_${PN}-pam += " \
+                        pam-plugin-unix \
+                        pam-plugin-loginuid \
+                        pam-plugin-keyinit \
+"
+
+FILES_${PN}-pam = " \
+                    ${sysconfdir}/pam.d/ \
+                    ${base_libdir}/security/*.so \
+"
+
 CONFFILES_${PN} = "${sysconfdir}/machine-id \
                 ${sysconfdir}/systemd/coredump.conf \
                 ${sysconfdir}/systemd/journald.conf \
@@ -450,7 +461,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/dbus-1/ \
                 ${sysconfdir}/machine-id \
                 ${sysconfdir}/modules-load.d/ \
-                ${sysconfdir}/pam.d/ \
                 ${sysconfdir}/sysctl.d/ \
                 ${sysconfdir}/systemd/ \
                 ${sysconfdir}/tmpfiles.d/ \
@@ -459,7 +469,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/resolv-conf.systemd \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
-                ${base_libdir}/security/*.so \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/busctl \
-- 
2.14.1


