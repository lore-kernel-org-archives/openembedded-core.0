Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1945C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 12:57:40 +0000 (UTC)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
 by mx.groups.io with SMTP id smtpd.web11.28393.1745767691181360677
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 08:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=qW4bOemY;
 spf=pass (domain: linux.dev, ip: 95.215.58.173, mailfrom: wen.yang@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745767679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PaPLhVQj9ZZYzT40udRzxllnfk8uEYBKQkuFXdtyL/g=;
	b=qW4bOemYTehMRRJf9gT6kdeTyEdRVo3xyzfXXbNA3zvkTl6HnM3VWmXzgVbXykkllAY48o
	RzmuVzQQ7du1HlgVlda31adzbtWBf3hW4pELTu8tC4aOCNLC2VvKYDl/1kweMO9/y73lpB
	1xFQ+bCcE0TH4TQ35qXB4Vj5g7P1d28=
From: Wen Yang <wen.yang@linux.dev>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Cc: Wen Yang <wen.yang@linux.dev>
Subject: [meta-oe][PATCH] testdisk: add recipe
Date: Sun, 27 Apr 2025 23:27:46 +0800
Message-Id: <20250427152746.8099-1-wen.yang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 12:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215745

testdisk is a free data recovery software primarily designed to help
recover lost partitions and/or make non-booting disks bootable again
when these symptoms are caused by faulty software.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 .../recipes-support/testdisk/testdisk_7.2.bb  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/testdisk/testdisk_7.2.bb

diff --git a/meta-oe/recipes-support/testdisk/testdisk_7.2.bb b/meta-oe/r=
ecipes-support/testdisk/testdisk_7.2.bb
new file mode 100644
index 0000000000..64e3d612c1
--- /dev/null
+++ b/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "TestDisk is a free data recovery software primarily des=
igned to help recover lost partitions and/or make non-booting disks boota=
ble again when these symptoms are caused by faulty software, certain type=
s of viruses or human error (such as accidentally deleting your Partition=
 Table)."
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
+PR =3D "r1"
+
+DEPENDS =3D "jpeg ncurses e2fsprogs"
+
+SRC_URI =3D "https://github.com/cgsecurity/testdisk/archive/refs/tags/v7=
.2.tar.gz"
+S =3D "${WORKDIR}/testdisk-7.2"
+
+inherit autotools pkgconfig
+
+PACKAGES =3D+ "photorec"
+
+DESCRIPTION_photorec =3D "Photorec is file data recovery software design=
ed to recover lost files including video, documents and archives from Har=
d Disks and CDRom and lost pictures (Photo Recovery) from digital camera =
memory."
+FILES_photorec =3D "${sbindir}/photorec"
+
+SRC_URI[md5sum] =3D "c47d69e2c950b6b2f0dadb2a2921d6c6"
+SRC_URI[sha256sum] =3D "f3fe7ec02cafcbe792a4c783976de3a6312963b0ce8a613d=
38adbcd8bdca0517"
--=20
2.25.1


