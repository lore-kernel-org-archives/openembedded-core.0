Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C72C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 04:17:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12761.1789359457049338020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 21:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@rootcommit.com header.s=dkim header.b=cnUcdmQV;
 spf=pass (domain: rootcommit.com, ip: 185.171.202.116, mailfrom: michael.opdenacker@rootcommit.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8D00BC62205
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 04:18:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C2C960323
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 04:17:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 866F811C7AFD7;
	Mon, 14 Sep 2026 06:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1789359453; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=78JDQrPhzlTAwekHx0/F1oD6YpVZEpDEvpo+uYqa1QM=;
	b=cnUcdmQVkyamRUBuHx+OqAaL9TaamLSYXV+fdeSNNni3okKetYGfR5OiEYcouQHwyRfp4N
	w9XhcSsKgIhg4ayZD6HSzHDePHiLJYKCPPqgkUsTCNmIeMLhQp141Vhg4bj3Tzy0gKS7YM
	km0dJ5wM+ExR3GuDPnnOY1adHav1mKRqv1ABlrJk16wHh+VVdRglONkJHNFv6apHpQM4HB
	41Q013j0Kb0hYKfOGjf40bvQEK8XY1VG7tLzOHUc+5MHPmqvKci2kg4pF3IAZ4d7bUSFot
	a6vOV2AjNfD6NwiioHonKyYex4tvHizet0T5jm8zSL4Ppv8XytxmMjxSP9TZoQ==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH] conf: machine: remove ext3 from MACHINE_FEATURES
Date: Mon, 14 Sep 2026 06:16:24 +0200
Message-ID: <20260914041624.2978273-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 04:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245745

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

ext3 no longer exists as a machine feature.
Only "ext2" does (used in meta/recipes-core/packagegroups/packagegroup-ba=
se.bb)

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 meta/conf/machine/include/loongarch/qemuloongarch.inc | 2 +-
 meta/conf/machine/include/riscv/qemuriscv.inc         | 2 +-
 meta/conf/machine/include/x86/x86-base.inc            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/loongarch/qemuloongarch.inc b/meta=
/conf/machine/include/loongarch/qemuloongarch.inc
index e1bcfabc43..bde228f034 100644
--- a/meta/conf/machine/include/loongarch/qemuloongarch.inc
+++ b/meta/conf/machine/include/loongarch/qemuloongarch.inc
@@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
 require conf/machine/include/qemu.inc
 require conf/machine/include/loongarch/tune-loongarch.inc
=20
-MACHINE_FEATURES =3D "screen keyboard ext2 ext3 serial"
+MACHINE_FEATURES =3D "screen keyboard ext2 serial"
=20
 KERNEL_IMAGETYPE =3D "vmlinuz"
 KERNEL_IMAGETYPES +=3D "vmlinuz"
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
index bac376ce5a..860e0f93f1 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
 require conf/machine/include/qemu.inc
 require conf/machine/include/riscv/tune-riscv.inc
=20
-MACHINE_FEATURES +=3D "keyboard ext2 ext3 serial"
+MACHINE_FEATURES +=3D "keyboard ext2 serial"
=20
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_IMAGETYPES +=3D "uImage"
diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machi=
ne/include/x86/x86-base.inc
index fc8200d8f0..43acd1b17c 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -5,7 +5,7 @@
 #
 # common settings for X86 machines
 #
-MACHINE_FEATURES +=3D "screen keyboard pci usbhost ext2 ext3 x86 \
+MACHINE_FEATURES +=3D "screen keyboard pci usbhost ext2 x86 \
                      acpi serial usbgadget alsa"
=20
 IMAGE_FSTYPES ?=3D "wic.zst"

