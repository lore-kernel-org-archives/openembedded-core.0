Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14791.1793632691893166111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 07:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mNhoe61q;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36661f953e4so4947950eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 07:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632691; x=1794237491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lppffl+AK6IAJekrS05oF2XWkx16QcBcrJFXoqs8jq0=;
        b=mNhoe61qt8n1hgVm2oAWB/jLulFJAaMjwcKnc/yjfGLLzEApKy6LjLutyzlCD0Q0/O
         29sZ1KTR0Q52mdTywhubLhEV06D4z/aAnRtGXF5AjuOghsbWC/uTjBiHdlDBK/BCmAKS
         Wb4WFLdgTVLNcJay2l9TsDKHvvTgOhSrTf83FR1hrMcws53L5vCau4wSo40OmINIAqIP
         M7xU6ihZnYiZC10zelXIS2MbrbJLeP/u8Xm1+GQmhQkw3xRsw1doygsIsNx0kVOS9zSi
         yt+Uqp8lincwORi+giPOxRGgRu3WGDVHV3sUCvIwLf7rW1+V5pIm9gneckDECw6LNqem
         iZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632691; x=1794237491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lppffl+AK6IAJekrS05oF2XWkx16QcBcrJFXoqs8jq0=;
        b=pSICG2NX4bYE0nPckD6JlfW/MWy8yvQ7l9SqkzzEZ6Uc0YeWtVq9+itAqfHE0SNJq3
         zEvBDxKeSaoE62Z0d+235HscrjF/nOP3fruUHKnJYI1oB9kyHIRMEgsOpyMSrZCKFekP
         O+wKguCGHt3MNz6ltL7IuIOCNlZtpYtC9k8Gvil3fuuMMRVqb5XA/wHZaXsKbGz/mJ2U
         EHTcrWnKHO3SNLX/r89y7Pu2d3Mha5oW608g96La7OH3kzKJJIv1BpMwU/s5P3E7aqwt
         KP9UXoF4qBLs0Tn4LaPAZ/YDvaYNThTYbeHbF8SGJavkUkm2FH++nH11R1JvMO6peX5u
         DDqw==
X-Gm-Message-State: APuU4Z+krOSgJD+BbtXiuvaY+zOram7xNjtIgilkrARYPWN/Ce7C8tr3
	WWnSNHjjHzsq1+B8LlTyP19i7hlnP/pwaLHyAnliTo6GLZN/uQKsbXwNssL7epzqg90=
X-Gm-Gg: AYBFou3/bEPRTZBB58sU5153XCOEyrgK/rdkgmJW9KCLaMDlKL7TMU96syXjYWFr3pX
	D6zl6o18K9m2lxdBCg4QNqiANsb0gFfVi1Z05aOOZtVsHCQJujv4519DExo28BInhAeGyHoMaB9
	1dMwxbOUN25jVLVejNfHXyaRxPkiqHPiOWCBeVjikZPjrisSogVRvAuBhVVsI5LTCVQf6HWWJLc
	3qm/G2cWMBs3sS1L697GhItohDc6Io7H86WnyfOsdc0uKuHK2tbzDxhSqWOCAE1VruaY2rcS2X6
	sAuGbwrzLXmtQw4khz64yAPE6ADvr7wWonYq/EuEVa+iEAW+CH9J9ZMSFyDXj3vGl5Q7dZ1Ol0v
	voA/Qy6DvEJlmwQaRTXRhBJtpAYalnsfGNIiC7ocPzW2WimCu+JTHwtWqSg7NE++42UXSBhaDlF
	mGzLGxRKZmVJYjP3rGmuVYY+MPA/1j59gSk7YBK/Syn4n2CLmvxMKXBDq2veps/dBy9wO4Qk7nA
	3jFMGZfgWFZq3MqOqTcvc0BUejPVIAMR1Ylc2BgP9TFxVNwjk2Gu+XhSKw8/FBJnxQcs513fgH1
	JUyi6URKKWJkrnO/1RJU35yAJ2ODaMurddHDvjf1dZmPNLa0b88tlfPtEFdUSgWHQOcHBq0SEaL
	h++gcHOP0g2kJQ83g1pgSrDRDkvjnhaOy7isIRIbA7rC0ZaCUxSZwJRAoSwXOEBM+3a5fjIyZL9
	VvgseR65SKFlyewCK5WyUFbkpJvPU9CUM/tjYhZ7VteyKxtk8zpE6l6gdBUW8J0wyTrvm93aBxN
	Cu1+j70KUwUNBITl3g7A8zS9xt5HGOtQpGAmfAnK3EsJ+XerIiaVw2wJs/bjCcRwQFyMuRrixlZ
	4YuHFoVpzJBBhYoN9MpcE6otGw==
X-Received: by 2002:a05:693c:87d5:20b0:35e:7bfd:4613 with SMTP id 5a478bee46e88-36a42425470mr15505986eec.40.1793632691070;
        Mon, 02 Nov 2026 07:18:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm35444348eec.12.2026.11.02.07.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:18:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3 2/2] dbus: Let the ptest package install alongside dbus-broker
Date: Mon,  2 Nov 2026 07:18:05 -0800
Message-ID: <20261102151805.3233815-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102151805.3233815-1-khem.raj@oss.qualcomm.com>
References: <20261102151805.3233815-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 15:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249214
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
v2: Add PN-daemon conditional upon message-bus packageconfig
v3: No change

 meta/recipes-core/dbus/dbus_1.16.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
index e602c67727..ca2e6c7b90 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -108,7 +108,11 @@ RRECOMMENDS:${PN}-lib = "${PN}"
 RRECOMMENDS:${PN}-lib:class-target = "${VIRTUAL-RUNTIME_dbus}"
 FILES:${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool ${datadir}/xml/dbus-1"

-RDEPENDS:${PN}-ptest += "bash make dbus"
+RDEPENDS:${PN}-ptest += "bash make ${@bb.utils.contains('PACKAGECONFIG', 'message-bus', '${PN}-daemon', '', d)} ${PN}-tools"
+# The tests start their own buses with dbus-daemon and talk to them with
+# dbus-send; they don't need the system bus (dbus), which would conflict with
+# other system bus implementations such as dbus-broker.
+RDEPENDS:${PN}-ptest:remove = "${PN}"

 pkg_postinst:${PN}() {
 	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
