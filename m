Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4045.1794028699852583225
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 21:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=R/hdh9tn;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37000e7234bso1873899eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 21:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028699; x=1794633499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mn2Q5C2iZREn5u1C3tAK4aS2ntfYft+l6NhZNWL3Hk0=;
        b=R/hdh9tns39AFnspsSyhBkCAfuk4piAhslIvd3Pgcwi4ou2hdsWS/Qw3GYhYh9qHd2
         mKH9kj4SFh822DCjAfW/GPHISmunUA8zVL1Ku8cvHxqL2PTUM4/3BKCvoxJ2iJ01YEOA
         ZGuUE/MTz8fFlmUpsjJWtVB6UcDsyifrwJhTlOn4Cx+02GzEAOdPAfe/IQS2CELnl2N/
         /Lf/5YIhrBBVHSlqKpXkY4SUaviL5EqC1DTR4KoQVgN3r311T5RSsHZahQGZrhIWxlCg
         aeFPrgIJ5q7zhnOAfpPQ7c18xD5HcOqad6cvDL7e6mHS34gs62+BuvU2/cnGohApsESc
         n3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028699; x=1794633499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mn2Q5C2iZREn5u1C3tAK4aS2ntfYft+l6NhZNWL3Hk0=;
        b=q01oTJkGimNGibFKZg/xP6umAQ8f1ikFxCnUc/3VVUabygTVh9eGt5ZwbG68m4Wn2Y
         yP4T6I43jvupndmCTp99oQHLopYUh7Zk6dWwB8D2aGls8+JvpXymq4wpaJkBA6x+TzjA
         OSTqsVH5BFt03xhrPisU3zFvlWumqVXBo9h9EM3plqJhp6IaOuwSk0VEACprswO7KywI
         lDKZhfiu3GBkeWBEbxIMoZ1W5fhmrSO1F1NwQTCTflpWZtqHizJ9j+mL9ozVy2qRy0/8
         3xmhaow18Nu97oxM7+qdoHqehG96DSOT84yVhySUuLTFGiFS0SWC9tCWtqLGiRJywYtF
         zsqA==
X-Gm-Message-State: APuU4Z8sbAJJ2AVEdpDM4stmONYsAVoKizB989IG0f5LnokoLzXgiJ2V
	zDLlfLgOmny5ElWuJ6WYBPIz6RyA0XiRcQV2i+lWTRXQ5dR13Fxn7rRz0DivNyjt4Xc=
X-Gm-Gg: AYBFou2WSkcNuMw9hhHAGU7RpP14rqpsYgXRDkq1SZtHyfxV8I7+7cdNCtpKS8gK0b0
	cmfaqzMoMbV6xbcKfHg7ck2SCU3Ygh+AqFZodCV/rmNieiMfofP1U3Ai86Zc/bFXPqIUsb3gVLQ
	+23RrE0uUH6IHVZxRAIol4Cr2AfWHFfdg2eHSjbnVOmipvaHI3Md7Wl9voJmXa5kPS5WzqFU6JH
	uXe7P/7WJ+7XjN89d0vVn5jSyQP8+Qr1z3Jbcqef5lyS8teCwAS7wZxgL6nZFsbOVHDvpDjgPC9
	S+IRyv4oI22oA2YHRF0E2g1zn4hFHn6c5T3zB0sXWaVbdaw7hO22+EBX+Gvcm8syLHuOtwHCA2d
	q1QjEPcUNv80DiRPMVqQ05D7q5FIiD6RQjXkEG7eTQmPcvDTfdqgFuSLUlQv9KdmSW8hXgVD3bY
	MqYosqcFu00kUbptdYafzFibjkL6bWkgtU4nG91ZawHbmrwsFX4i431rJhWzwxEawiQrZBsUyIS
	F+igc29R2hGX2PhywJ5ceoOl4IohhnqQNS470u5gffEbPcasMlUgzJA2fD7xIHd0vEPOLMSSkOl
	Cc73PLt6RAL7KpXp37fLylxvxllDm1fSc1HxLiEL0j+EaHliF1Qbv77sVUokARnImFHmpMSl+7x
	gTXhIaLy2GRpmtYyDDP3enfEgYRmhElrRoakkt1PsFM6tWBATtFMhBGjPVSDOnzLZanzluzxLMM
	CtBE3ATzPAmQw0EOafPQZDUASpVzqFA9D9uC3vx6jkhlib3dDYZCLWNlyuK/0eodGlfQ7HvhCbs
	JQO9pxUphKiOBcI9gEiQDh4cxh3diVKxPNeqimxfMn6x2VzidvhIunhftPuX/RrpszBKkO2EIWM
	nyLp
X-Received: by 2002:a05:701b:4553:10b0:143:868a:20c1 with SMTP id a92af1059eb24-1b25d38e494mr5790919c88.46.1794028698391;
        Fri, 06 Nov 2026 21:18:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4fd2d6sm10831241c88.23.2026.11.06.21.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:18:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3] dbus: Let the ptest package install alongside dbus-broker
Date: Fri,  6 Nov 2026 21:18:14 -0800
Message-ID: <20261107051814.1554087-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 05:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249720
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

Setting the ptest dependencies with a hard = so that ptest.bbclass
wouldn't add dbus. That also threw away gnome-desktop-testing
which ptest-gnome.bbclass adds the same way. run-ptest calls
gnome-desktop-testing-runner, so the test exited with status 127 before
running anything.

With this the images using dbus-broker as the system bus also pass all 60 dbus
ptests.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Do not use remove operation
v3: Add gnome-desktop-testing explicitly as well

 meta/recipes-core/dbus/dbus_1.16.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
index e602c67727..4fdff64a7d 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -108,7 +108,14 @@ RRECOMMENDS:${PN}-lib = "${PN}"
 RRECOMMENDS:${PN}-lib:class-target = "${VIRTUAL-RUNTIME_dbus}"
 FILES:${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool ${datadir}/xml/dbus-1"

-RDEPENDS:${PN}-ptest += "bash make dbus"
+# Not using += or append here is to avoid adding PN as dependency.
+# The tests start their own buses with dbus-daemon and talk to them with
+# dbus-send; they don't need the system bus (dbus), which would conflict with
+# other system bus implementations such as dbus-broker.
+# using hard = also threw away gnome-desktop-testing, which ptest-gnome.bbclass adds the same way
+# needs adding explicitly as well
+RDEPENDS:${PN}-ptest = "bash gnome-desktop-testing \
+                        make ${@bb.utils.contains('PACKAGECONFIG', 'message-bus', '${PN}-daemon', '', d)} ${PN}-tools"

 pkg_postinst:${PN}() {
 	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
