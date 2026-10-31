Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4410.1793479867357576113
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 13:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=F3i50BK2;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso2999480eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793479867; x=1794084667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k0+tq+iQLQj6mfZ680mAmHvzMstnHHsiXE+KQnDxeE0=;
        b=F3i50BK2dGqz2tVXC81DwlQr7WD06XtPc+Ni32g1ixPwFGvsasayeGM4k3X9m2gwVA
         c1lASgha4nnvwLfYStcYVmzHPu+71w2cesvrogqUDpTxOSRs75nineRD4qdxGhXTjT3P
         BcbnZLGxyAHvbXmjo/z5acRlUmpEPmgHzVBZHyKCXy4H6bp80gSIh+m8DtMP8xc1+6hs
         BAj7JEPGv96ub/JMmZbWyA6uI/Qgk4ko6ZWee9g2oo9eRdQ+ZMxELzEodZ9TLJuenhh3
         UMyx2Wd6zy1vmK8R9kos1/955O1gfpuvlYz653CHmOoX0D2V1n/1rsewxUPMeDrGMbfL
         YN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479867; x=1794084667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0+tq+iQLQj6mfZ680mAmHvzMstnHHsiXE+KQnDxeE0=;
        b=TtvF0atp3WITxrQ+sp84MyckHNno/FrkXIradADJ9/SEh/tkBb6A9aPY30hIjN/SvI
         WkONLSnA/N4g+1ASKKZySQB9Wcqn6CtqsMPIydFnLEq9zUjTZMqDHlkaLGcbantvsSP5
         uBAetDjklnyfUl8poriy/9FmZ8MhpP2Yn6aV9w9DjSFD2uxek7MQU/loEgysj2tRWR38
         fZOCckzsT7ipoVoP7W27yBA5D3fGtOb3Ui6Yclp+aD9L7u4UOndeXoXNVzgLKInoQzFQ
         ZEYWEttxLXHxhKRNZj+BFGUh8VFn+Ha7wwctx77PjVNJE6RvEac0C8VxkzTeEnr9eCso
         a3eA==
X-Gm-Message-State: AFq9FYLG7u4fMHod+FRLxkGricIo30MXRWsOB75vsJsK3bEfdLatx8Wj
	tdvKP8CYu8WTwDob40tuKBCJX3d/Tl0zbViP5wqKb4GNg/dfIxCacpzYywpKg4+BMVQ=
X-Gm-Gg: AYBFou2mTmN8SjEDhHuzxZYZpj7ERCoAam7tYnn7d58q0v7x0zLMClD9fBpF7zftzQg
	uuooVMk9t6QvhiIM0sd25MSBli3lI86Ipe3YVs16veUBUQgROemqfk7gq2P8RZE5irDiWAO2LUQ
	H010r8K8dEWFJuepIRQzJ42C+s24yiiz1zWTXU1WrCCfKQL3zqnW5u14HlY72YcbQ72lSx9yQgS
	VXPlVu9i3jkjW6izm7K5AR3GbUY/0MJJsU5NMg6CgoEIRFDb4GKy3V0ybvdLpL0BlvGkQ+/Nwkg
	ws4RySAoZEdyQlW5EOPx1sMj1ISWOMCTxkcz3e3K0NJeqWnlZ86Ynod314da+5v0rKqj6okhFXW
	blF4fsIpVjp3AEuF4MqFBqi2ZrTvTJPCspi4/fRz1g4MDdZkDg4V9CtvHKJRJ1FmClk3uvkEtye
	FTypIyn8JZ2MA+MikXObs6C5HRdVzOArha2/fkrjP6i1fHsSmhtgmXgEOZKbVNmh1AsnKQPePpY
	A+b7uqLAjKDc9aGPPkRQV9nXAIe6kzvh6XgxgsfQqktRTWczTvlfiPi/cFVYZVNS3S4GNBLAXXs
	mvs2UQCTKVTOlu5NBxef4meUGdAOW1QEQx+G07ED92ztsxjX8p04fFjG0PRLMd5+RoCDPaMn+Zh
	GxxBoCMJT1oRoiVSmv3sYgci6luBOCAMfr2h0OL3E5lS2+NDz+ApZJnz4wjoZyuwPTywf3wo0is
	5d4cZhmCR2LQqD4/01BzCmJHTUgRc2MN9/HGxjmYijr5rXEsftjZ9jVAik4I6BTy3mDAie9MJbd
	M7PCRo7sA8qVHVpGih4tgugNthW7Fn6HR4PLDYt2gPhEoec4GV0xfQo+pEni+J0LSKYRwkm8kHo
	PBg7
X-Received: by 2002:a05:701b:4283:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1ac5cb186d7mr8579341c88.28.1793479866380;
        Sat, 31 Oct 2026 13:51:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm21018489c88.16.2026.10.31.13.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:51:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] dbus: Let the ptest package install alongside dbus-broker
Date: Sat, 31 Oct 2026 13:51:03 -0700
Message-ID: <20261031205103.458712-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 20:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249147
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
 meta/recipes-core/dbus/dbus_1.16.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
index e602c67727..3038d0c5f4 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -108,7 +108,11 @@ RRECOMMENDS:${PN}-lib = "${PN}"
 RRECOMMENDS:${PN}-lib:class-target = "${VIRTUAL-RUNTIME_dbus}"
 FILES:${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool ${datadir}/xml/dbus-1"
 
-RDEPENDS:${PN}-ptest += "bash make dbus"
+# The tests start their own buses with dbus-daemon and talk to them with
+# dbus-send; they don't need the system bus (dbus), which would conflict with
+# other system bus implementations such as dbus-broker.
+RDEPENDS:${PN}-ptest += "bash make ${PN}-daemon ${PN}-tools"
+RDEPENDS:${PN}-ptest:remove = "${PN}"
 
 pkg_postinst:${PN}() {
 	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
