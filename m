Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE03C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 12:57:40 +0000 (UTC)
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
 by mx.groups.io with SMTP id smtpd.web10.10334.1745991573043449446
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 22:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=SXErRVeC;
 spf=pass (domain: linux.dev, ip: 95.215.58.188, mailfrom: wen.yang@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745991570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=19+2nb1+OjEcnpIT/fHEpdN8JkSw0YFOT+4J2dhNs/U=;
	b=SXErRVeCnTyr76FiZZ6cO4Mc4bN13NcQd1lbT7icU/n8uamp2LDIKrgvja3RANdcdYdtI6
	Z2wPz0aPEfMacaEjUH/ULM01aPRGSAypbdKxBhOrGYcuNA5WzDWnp6A6bzBF+EwuXztP+L
	TDnAEx3UKD6Q37mRG4f+cyInVxMj8yI=
From: Wen Yang <wen.yang@linux.dev>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Cc: Yang Wen <wen.yang@linux.dev>
Subject: [meta-oe][PATCH v2] testdisk: add recipe
Date: Wed, 30 Apr 2025 13:38:25 +0800
Message-Id: <20250430053825.9782-1-wen.yang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 12:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215746

From: Yang Wen <wen.yang@linux.dev>

testdisk is a free data recovery software primarily designed to help
recover lost partitions and/or make non-booting disks bootable again
when these symptoms are caused by faulty software.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 .../recipes-support/testdisk/testdisk_7.2.bb   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/testdisk/testdisk_7.2.bb

diff --git a/meta-oe/recipes-support/testdisk/testdisk_7.2.bb b/meta-oe/r=
ecipes-support/testdisk/testdisk_7.2.bb
new file mode 100644
index 0000000000..3edc97f607
--- /dev/null
+++ b/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION =3D "TestDisk is a free data recovery software primarily des=
igned to help recover lost partitions and/or make non-booting disks boota=
ble again when these symptoms are caused by faulty software, certain type=
s of viruses or human error (such as accidentally deleting your Partition=
 Table)."
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+DEPENDS =3D "jpeg ncurses e2fsprogs"
+
+SRC_URI =3D "https://www.cgsecurity.org/testdisk-7.2.tar.bz2"
+S =3D "${WORKDIR}/testdisk-7.2"
+
+inherit autotools pkgconfig
+
+PACKAGES =3D+ "${PN}-photorec"
+
+DESCRIPTION:${PN}-photorec =3D "Photorec is file data recovery software =
designed to recover lost files including video, documents and archives fr=
om Hard Disks and CDRom and lost pictures (Photo Recovery) from digital c=
amera memory."
+FILES:${PN}-photorec =3D "${sbindir}/photorec"
+
+SRC_URI[md5sum] =3D "c6809b6fd06b5022467c8faa32d49a27"
+SRC_URI[sha256sum] =3D "f8343be20cb4001c5d91a2e3bcd918398f00ae6d8310894a=
5a9f2feb813c283f"
--
2.25.1


