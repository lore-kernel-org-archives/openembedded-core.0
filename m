Return-Path: <jeff.dagenais@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 933237CCE0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 21:38:30 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z17so75036qtn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 13:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pnpy4jA6+HWPUamLPhHFzuZvZmoxVgUS2Uwh2gilVGA=;
	b=I8NoqyvDbufVZQlqRtKT2YBjLT7GiiXatZo+pQFFJx9cHfTnEUIkg8bCxFQhpNLv7q
	y6W8xoPHhVYvBro86esnh9KBIltWaYjC7cliOSoGsSY54RMCER5rZSb6nVoQJtAxxmp2
	efxWamrywCTr4TOYl8rvUtCetIQnFjLBrEncOamf2g7p95lCtKsq8OLYB7mkaG/bycyS
	TmJIkIWmyP33H8URzVAklHxCoY+2hh7X3vS04bNZFBCgmEynsNptdjy+yz30qopdx2AG
	xtvwPhKeKXJ7sIOSl4nxLOEGLqm426DdhTwk0CYMaCG+u/68z+WxscwUE/cF9qtaanqq
	HIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pnpy4jA6+HWPUamLPhHFzuZvZmoxVgUS2Uwh2gilVGA=;
	b=e6izugiC+6DC3tq5hOMLYlwagkiqbXCuBr/zFeiFPkWJYY14T/5oDr6bTYu0sDK/w5
	Cu9jy/kRhU5SvBTfDnGEnxmIOkHplGFmX8j6CG5CSQ/6J2xirX2G+j5vFVPAX8BZMwx0
	X/Nq0hBN5Yfg+sVi4TjWCsdeiTof3O7+umB9VZG+rzfIbfajUf1f2hm2/Ojj1iiv3Szp
	OQ0ZUeONSSofe7prsTnhjy9fS0Z0KjJfrYYAO8Txe6iKpONlEWd6bdLFWAxfwGLHuz7G
	9emBk2JcghwC77iD2GU1toD+lMAAJ73+QHk5lm6CAtSmB9JyyyyUIIjhCdwq01/eLXwB
	FB/Q==
X-Gm-Message-State: APjAAAUc/ZxN26lI7X2z7UflwJYcZhrEw6EFXmkwe6w/ihHglebGMClq
	6GXt85y/dbETiEvvCgKCxuJANCl0
X-Google-Smtp-Source: APXvYqyzMXIgMkXxYef/vyoxgSWnUGr9kptzqCa4eCAoLrZ1y2+KHipxlQ5c9lNqPeNj1sB1oLUgrw==
X-Received: by 2002:a0c:aeca:: with SMTP id n10mr16911078qvd.84.1552081111229; 
	Fri, 08 Mar 2019 13:38:31 -0800 (PST)
Received: from jfddesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	d21sm4579065qkb.47.2019.03.08.13.38.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 13:38:30 -0800 (PST)
From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2019 16:37:54 -0500
Message-Id: <20190308213754.6341-1-jeff.dagenais@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] connman: rename bluez PACKAGECONFIG to bluetooth
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
X-List-Received-Date: Fri, 08 Mar 2019 21:38:30 -0000

The configure option is "--enable-bluetooth". Plus there is the
RPROVIDES_${PN} assignment below which mistakenly (but instinctively)
looks for "bluetooth" in PACKAGECONFIG.

Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
---
 meta/recipes-connectivity/connman/connman.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 0ba375137d..bc6f484e71 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -31,8 +31,7 @@ EXTRA_OECONF += "\
 "
 
 PACKAGECONFIG ??= "wispr \
-                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd wifi', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd wifi bluetooth', d)} \
                    iptables \
 "
 
@@ -42,7 +41,7 @@ PACKAGECONFIG ??= "wispr \
 
 PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/ --with-tmpfilesdir=${sysconfdir}/tmpfiles.d/,--with-systemdunitdir='' --with-tmpfilesdir=''"
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant, wpa-supplicant"
-PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}, ${BLUEZ}"
+PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, ${BLUEZ}, ${BLUEZ}"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono, ofono"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
-- 
2.11.0


