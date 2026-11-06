Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1571.1793986642539718478
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xv2fvMgZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a9f9473029so685797b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986642; x=1794591442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZNQ45cy9koHmUHFy3nTsMrUfajTB3My/mUTDzFVG0tE=;
        b=xv2fvMgZ74d6sp3KlGNQu9hck3puvQ3Sy0ae3l0DK8hF+HRC9ZvdU4ZmOp86ceU1nV
         bSkf4ddSIEC0etuQQlUXIgkpgNCNWJ8fl8od1MBDRGmJmlSbC4b8R5TWW9U/eHacFywR
         Txt3ZNolDF9Il5TX8V2qeMp/icwre6dPHPk2c5zwe3ItpZS7O+ljHTOoIfD4Q7BGu4cu
         25Ljx/k4nZLR4FvKhJyyV3CxljPbQdshlX98Cxmm8wwB6miEdrCVvlgMgaYmOhuiZzU5
         rHQgl5k+EKLKWUjrC3vl+HgDkc1ToV2WqNlebv8DunpaI+jIMHtPILsdZz9nESAXVFKX
         Wv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986642; x=1794591442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNQ45cy9koHmUHFy3nTsMrUfajTB3My/mUTDzFVG0tE=;
        b=RoTSq1Yqlw/PhBWal9v1S+Z4S7tRSTl9HM1qjtnp1rDR15o8mB9L1dv0CWN+ksyq6J
         C17UM1vvdsnvLpr2fk7kwieo1/6YlP0rSL8jg4No0+T+B/YWk3zmNMWrpwb3K7qa+MDD
         ywQl8KSTOuJ51w5YJEAyNKupm0DIQlFyiRpKFhHAY8S07rvn0NWhSGhXlLpVc1lGBLrO
         VuqxGLu7c6CFe4+pgtb/uNmebulPT0rS90dSCAi3V4tdZXgSbZdnIS/TdtyBqGjlp4Mk
         Ts60mj++84ZfAclFCuxHHifTWr6PWYmXDOCNvl9jwIpgYDH5ALHPxX2QKgRrC/mKa7KB
         ETSg==
X-Gm-Message-State: APuU4Z+I3yElSLXvdGtL18jjVhRr17pLY2olQMnHVUo/C9aFJT4oemkC
	4LhA5cUjqJoJlXMhiZhPN0nEHnBKUkIGBPPh0PSvehu6DBdR2uw23K1blPImckpC5oc=
X-Gm-Gg: AYBFou1qYqgn/QiGO9G3f5ec+yj0yHGB86lLUGt72R/hRk/BBE+rS5f/iNzVltM5xb0
	Z3LE51zNvWmOh+KBULjpobbz4zNZpboLNjCThpPJF0CBwh0aoxKHnM8/ksQv4ALRChnr/xBtMRN
	Ls2OdL7RIZDkgrcOC1EV0VPG+mt5LoZTL6AMrnBmxKg8Wso8DNMRsZKQpJdA925HF4HziCqkhts
	z2mqqdIcaK8YTXW4vuwR32udvRJ1+3yTHqGFLxr7MKAUWKmf9zLIpR7ANd3wwnHZGJxaO+VrdaO
	Jg4Llzd7SDqMg0fbMzWgX4uCGQ8B+E36T23FlI47gKd58Un/5KqloAK+iGlOqrPWSQzJBFWQm0v
	6Cz46n7nPxHpnaXMO6p9cXIegYOu2bC9Q1Tr0GnxVmBS3CAhap7knst6EaEfhCC6q3Jq8+8QmB3
	B3yas1GSmRfpjgxcPXN1QY7jlreK/V9bsDjKGlM2BeAlkyLPpJWXcVqU8YWXnWlPI8En77R6KUL
	BTmZKXYvt4755HzZwcVCnJZGpfj+kyeRJT8wVlcehimaAeYRpN+uh8o3P8/N6WCcPd5ES2fQIHi
	PGtqOBkBDlyeSpZmAooK04HNlpMUnUkr1HxhEqqmWqAahZvXSyZjqWS028q9n+DzDrk7ta40Nlg
	LdXG4gBtXDYTV4bKZNnII4ne+nzP1vdj1y9rSOAaLhwbaNLPxqj9slV2zWsLYnR2llKQbGmCpd0
	fv3Ip/mnC+29Oe0RpzNGNUI15RqOM9i2Soax0EVgO9lpXtRla9r1hh0xLKzU8NxVBTwbiouXo88
	TiMYvSdFVH2kpbJuhpdAQwBZLaOZ0RhESHOrWOrnrJoxyLtDl77E0UhMvxJPzHRL7XDlzK4vzGP
	DW5P
X-Received: by 2002:a05:6a21:7017:b0:3e1:885f:b49d with SMTP id adf61e73a8af0-3ebb2aaedb9mr4021425637.52.1793986641593;
        Fri, 06 Nov 2026 09:37:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b356c2d918sm814411b3a.6.2026.11.06.09.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dbus: Let the ptest package install alongside dbus-broker
Date: Fri,  6 Nov 2026 09:37:16 -0800
Message-ID: <20261106173717.1054294-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249709
Content-Type: text/plain; charset="utf-8"

dbus-ptest RDEPENDS on dbus, both explicitly and through ptest.bbclass,
and dbus-broker RCONFLICTS dbus. With VIRTUAL-RUNTIME_dbus = "dbus-broker"
(systemd pulls it in) core-image-ptest-dbus fails in do_rootfs:

  package dbus-broker-37-r0.6.cortexa57 conflicts with dbus provided by dbus-1-1.16.2-r0.45.cortexa57
  package dbus-ptest-1.16.2-r0.45.cortexa57 requires dbus, but none of the providers can be installed

The installed tests don't use the system bus. They start private buses
with dbus-daemon (DBUS_TEST_DAEMON) and use dbus-send, so depend on the
dbus-daemon and dbus-tools packages instead and drop the dbus dependency,
like avahi does.

With this the images using dbus-broker as the system bus also pass all 60 dbus
ptests.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Do not use remove operation

 meta/recipes-core/dbus/dbus_1.16.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
index e602c67727..2928e4953f 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -108,7 +108,11 @@ RRECOMMENDS:${PN}-lib = "${PN}"
 RRECOMMENDS:${PN}-lib:class-target = "${VIRTUAL-RUNTIME_dbus}"
 FILES:${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool ${datadir}/xml/dbus-1"

-RDEPENDS:${PN}-ptest += "bash make dbus"
+# Not using += or append here is to avoid adding PN as dependency.
+# The tests start their own buses with dbus-daemon and talk to them with
+# dbus-send; they don't need the system bus (dbus), which would conflict with
+# other system bus implementations such as dbus-broker.
+RDEPENDS:${PN}-ptest = "bash make ${@bb.utils.contains('PACKAGECONFIG', 'message-bus', '${PN}-daemon', '', d)} ${PN}-tools"

 pkg_postinst:${PN}() {
 	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
