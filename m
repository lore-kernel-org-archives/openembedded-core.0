Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05EFC44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:24:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43376.1784708683931115900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=af6diO8K;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B4C1C1A10F2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:24:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A55E60388
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:24:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3588D11BD03C7;
	Wed, 22 Jul 2026 10:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784708680; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=2pbdaUGwoCKNf5GTqfWs+/+TNujK/mAOU6IvgJgW68I=;
	b=af6diO8KtCt5kbd8LdfquI5gVlxwkTzSkQCEAdmot7rmJhG/GfIz8KZ6XXVFENt1ohjsPk
	x0hpI/J1P4mJpjF9u2Cu2tSQd7u4yKcp+Y2JPsH/R+uLaLs3MJMZveK7Ycjmh+OmlrxRB4
	nOYefPRb9mN3HrHN+1/mf5AWVF+jJtBITXWgwbzO12eEBu5vKs9T9RLH5Sgh5/uQXcVDOF
	ubC7lLAZvliW6XNxF6GNvXMAo/lu8+uggZY4VsLjuDFCM/9ONw1yva90ACKkF94/89Ele/
	YcJMJZQb7J1RBmwBDnGh1czCjShruh15g5zTcfsgaLHZ+imWWqQy2zlpmNL8zQ==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: bump to 1.9
Date: Wed, 22 Jul 2026 10:24:14 +0200
Message-ID: <20260722082414.1933118-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241624

From: Thomas Perrot <thomas.perrot@bootlin.com>

This release has the following changes.

General:

    Initialize stack guard using Zkr extension
    Improved irqchip framework to handle wired interrupts and MSIs
    Added unit test for string operations
    Added NMI support using Smrnmi extension
    Added timer events support
    Added Vector context save/restore in domain switch
    Added Floating-point context save/restore in domain switch
    Added Common PMP encoding/decoding helper functions
    Added UBSan support
    Improved misaligned vector load/store emulation

Platforms:

    Added SiFive development platform support
    Removed kendryte/k210 platform
    Added Tenstorrent Atlantis platform support

Drivers:

    Added Andes last level cache controller driver
    Added Andes ATCSMU suspend driver
    Added Altera JTAG UART driver
    Added MPXY client driver for RPMI MM service group
    Added minimal SpacemiT I2C driver
    Added SpacemiT P1 PMIC reset driver
    Added Litex SoC reset driver

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-bsp/opensbi/{opensbi_1.8.1.bb =3D> opensbi_1.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.8.1.bb =3D> opensbi_1.9.bb} (=
97%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp=
/opensbi/opensbi_1.9.bb
similarity index 97%
rename from meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.9.bb
index 255bab2b58fe..0142ef678730 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
@@ -8,7 +8,7 @@ require opensbi-payloads.inc
=20
 inherit deploy
=20
-SRCREV =3D "74434f255873d74e56cc50aa762d1caf24c099f8"
+SRCREV =3D "cbf9f6734dd85a982c63e3cb5db7ffe09da839ca"
 SRC_URI =3D "git://github.com/riscv/opensbi.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV}"
=20
 TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/"
--=20
2.55.0


