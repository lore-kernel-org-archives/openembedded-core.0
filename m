Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.1398.1614705081033579949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 09:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lH8YJ-0004Xa-Eh; Tue, 02 Mar 2021 18:11:19 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lH8YJ-0004Ej-1G; Tue, 02 Mar 2021 18:11:19 +0100
From: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] gstreamer1.0: add support for coretracers
Date: Tue,  2 Mar 2021 18:11:17 +0100
Message-Id: <20210302171117.16241-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As can be seen in [1] a requirement for enabling 'coretracers' is to have
'tracer-hooks' enabled, as well.

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/1.18.3/plugins/tracers/meson.build#L1

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
index 9cb07726edc3..b6e064e79d5a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
@@ -30,6 +30,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
 
 PACKAGECONFIG[debug] = "-Dgst_debug=true,-Dgst_debug=false"
 PACKAGECONFIG[tracer-hooks] = "-Dtracer_hooks=true,-Dtracer_hooks=false"
+PACKAGECONFIG[coretracers] = "-Dcoretracers=enabled,-Dcoretracers=disabled"
 PACKAGECONFIG[check] = "-Dcheck=enabled,-Dcheck=disabled"
 PACKAGECONFIG[tests] = "-Dtests=enabled -Dinstalled-tests=true,-Dtests=disabled -Dinstalled-tests=false"
 PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
-- 
2.29.2

