Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B47C3ABB8
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 12:52:28 +0000 (UTC)
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
 by mx.groups.io with SMTP id smtpd.web11.10593.1746151712073824882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 19:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=VfGih08G;
 spf=pass (domain: linux.dev, ip: 91.218.175.172, mailfrom: wen.yang@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746151700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tsmO5Oh+3o3RumlT3R8dritJdlz3jd93UoT54sa4Nbo=;
	b=VfGih08GjZDsHDh1rzcwWFuE+BgMbn1ZFgs0Dbn9toRdnD3DA6IzUPOq4ozv0rb+vVMt2a
	kGwof/uW7PAOYI+kCk8JQH/YHsBDUmp0hPimMG7DJx9rd5Z8k5/VdI2GI1/Wej57i9t2Yv
	2dPQHlrS8NnvsRwUfcy7Bw0cxpwS368=
From: Wen Yang <wen.yang@linux.dev>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Cc: Wen Yang <wen.yang@blinux.dev>,
	Wen Yang <wen.yang@linux.dev>
Subject: [meta-oe][PATCH v3] testdisk: add recipe
Date: Fri,  2 May 2025 10:08:08 +0800
Message-Id: <20250502020808.1038389-1-wen.yang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 12:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215907

From: Wen Yang <wen.yang@blinux.dev>

testdisk is a free data recovery software primarily designed to help
recover lost partitions and/or make non-booting disks bootable again
when these symptoms are caused by faulty software.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 meta-oe/recipes-support/testdisk/testdisk_7.2.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/testdisk/testdisk_7.2.bb

diff --git a/meta-oe/recipes-support/testdisk/testdisk_7.2.bb b/meta-oe/r=
ecipes-support/testdisk/testdisk_7.2.bb
new file mode 100644
index 0000000000..81d89c8e99
--- /dev/null
+++ b/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
@@ -0,0 +1,16 @@
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
+SRC_URI =3D "https://www.cgsecurity.org/${BP}.tar.bz2"
+SRC_URI[sha256sum] =3D "f8343be20cb4001c5d91a2e3bcd918398f00ae6d8310894a=
5a9f2feb813c283f"
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
--=20
2.25.1


