Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17207.1793548198938272340
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 07:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KLy5SHhj;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso3174029eec.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 07:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793548198; x=1794152998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SD3wK1JDEj6O3ojK+33uFrmzYfIR9YS+5f7zocRGMic=;
        b=KLy5SHhj3Pf6zcOt37J1MDMp91O9achZowlvLyfMboWg9revD6FM3l9LKPgmFwXGmU
         zQf9qVeMbjohbziF7eti77LNd93wTuUOqO7K6YpD3cqHFyJQvtlzNaetD+oSbNVU4WzL
         9GPah1+TqEKCIYoihKcMoU7oJnGrN0clyN/5n+t7D1fsBcE7DUTyNKb6TD7v3g4v2czy
         M9HoZR0iVwhWBTUlAGp8IC8OIDm1UmYGqZhQX5obW5StLFuLQ7tXHaEdL9Mk6R2AC6Fo
         p1/Q5xVZMhNze/A0j3wDpXd+gf5pKceKRWcuTOjzAqgwPV4OyH5AjeTNQLdojscOW+yV
         UR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548198; x=1794152998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SD3wK1JDEj6O3ojK+33uFrmzYfIR9YS+5f7zocRGMic=;
        b=qo8P4T+lSfTJKorn9uZYOKxY91Y7WrsjszvzVrq29lXmUVtMKf8QsZP6N1TcHcUm/h
         8WTjK0qucF/nMxTYbqdZ285IqcZVwvQNgNFlxXo1M9bsxwEjK+csywJKotYU9cviaqRa
         cANSHuarbs2tGM9vK5mG5lysKA4ccGdI+xYaGXbZ8U7D6ou0pcTXvZ9qoRadu4gCq2LB
         CNGVlZVmdHsVb9syp8/ZBdbYmr41syjjOHYmU67vRFn4S/JrtNbUIf2D4UwB0s+izicg
         DW56I25MZx7pSUKER/OclGU9R2L8c/hR7O9lxYMicEuWaSEa+cpRW4SgqcilCpwY2o4t
         bmBA==
X-Gm-Message-State: AFq9FYKPn4CPJQq3wjE2zRPNShKCc3SkMusPKAmA3/yjXWLiCl/HHyQv
	xYVMr4mbPbinEwYJjCPuJvskopBFX3SCuMi3UgFPvhVmdhD/vt+1BRqY6rEfUxJC8nk=
X-Gm-Gg: AYBFou319AX9FFnB/a7y2C+kZMKYb/JUq+EQOBGtXGAw1wwJjNaHKze82TQOtS0TjIw
	EntIv4b7oUhmBXZKi5/FZmgYf6hkiPHPfkZqU2KPyp5YzvmCUSwbGv+D4vTvp4otZeJOvRmOqJA
	83LQPIb8KebpawQqFXKkDJMGLC6Vkr0E9p0F6FkeKPbcICxZ4u2MvumXbh3a4NVsfn8feEw1Gy+
	/A103epRosRfGoC7s4slUr5AtcYw1tsIP8eKa3gARGbpf5G7LJzR+b/mNjXeeoQpCrncSRcuzUX
	elBI7Wu/IuA1IOVeSSPoFyyyCIxQEy3RH10stD5lJDvT3vKt8zHNI/B346Z2jmEjvWx//ClCLmG
	DbEcfBYVzSTYvUoogFmvZTzDcAff25709ByCgar+yDksfq8G9OF/Ek492SvERNqIM+X4hQ6QRMA
	nTKhn823KM5r633w3hA/UoYB2KZEymds22hLqlH4pbF1zFqn9VrR1wooSWkaDKThvVvgbe73FLx
	Qjpgfy8eNfgu9NhVp309l6fWyAJOva4kwQmAFRECcZsLX3KMLdodwBJP1VDj2+ALGsUtAPeB0dz
	Kxqf8UYIzuRvU9ENe88PIQ74Gq0F35ly19p/ASUelD8dGf9Jz4Qr/tEP5zqJHcRKfDoymcLrPM+
	ThhHFEEyjf+mhjCtTyrX3cDyC2WVHFCQIkqEOytLcHhfAJceQKe/JFdw4D0gsTKaZy8FCtQXEt0
	sL3LzOXqS2JZeVhI1DP5o71oqklTTA3cUuQI9wgEUYOLjnZ6x1SGQjcDZLg0JchiqC7RcQ+pDsL
	xGfs3kFMSRsWiuWlroO+W4/UhjKuwdSk87ZGaI/yv/QtEwEL86YmDjIrS9LZ8pK2dOFPTJLJM4S
	zBfp8kWp/vXrXIOKryfvDYw7lg==
X-Received: by 2002:a05:693c:8105:b0:35f:2bc:82d3 with SMTP id 5a478bee46e88-36a42378ce4mr11933650eec.15.1793548198192;
        Sun, 01 Nov 2026 07:49:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a96172sm26023712eec.27.2026.11.01.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:49:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2] dbus: Let the ptest package install alongside dbus-broker
Date: Sun,  1 Nov 2026 07:49:55 -0800
Message-ID: <20261101154955.1417945-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 15:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249156
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
