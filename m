Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16672.1793100958459343921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Nrjxx8BP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E569F15A1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:35:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DA9B3F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793100958; bh=AnPTcWB+Sa+kENLKadZjnoUc8Z/xLGTOBf1XB5P6XdI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Nrjxx8BP7ZV0CTXuanI6VwUZBxjDIWVUcqFiPxON3PPgsIgiARvp4W5XuLPFtr1/v
	 ddW3hqBngKw6QoTn2jjE0x7oF5oSzIxTxHeVLojHH2Xx9X2t86x+xOVRNQ6kCHGRqD
	 Irwt/RDyhyY1QwuA8mcf0Mc2x8RHfmifSI/BVHOo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/6] tar: use .tar.xz instead of .tar.bz2 in SRC_URI
Date: Tue, 27 Oct 2026 11:35:51 +0000
Message-ID: <20261027113553.1088639-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027113553.1088639-1-ross.burton@arm.com>
References: <20261027113553.1088639-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248739
Content-Type: text/plain; charset="utf-8"

.xz files are significantly smaller than .bz2, so download that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/tar/tar_1.35.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extende=
d/tar/tar_1.35.bb
index eb71863231a..a826c530869 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -6,7 +6,7 @@ SECTION =3D "base"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
-SRC_URI =3D "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
+SRC_URI =3D "${GNU_MIRROR}/tar/tar-${PV}.tar.xz \
            file://run-ptest \
            file://0001-tests-fix-TESTSUITE_AT.patch \
            file://0002-tests-check-for-recently-fixed-bug.patch \
@@ -18,7 +18,7 @@ SRC_URI =3D "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://0001-Avoid-acl_-prefix-for-functions.patch \
            "
=20
-SRC_URI[sha256sum] =3D "7edb8886a3dc69420a1446e1e2d061922b642f1cf632d2cd=
0f9ee7e690775985"
+SRC_URI[sha256sum] =3D "4d62ff37342ec7aed748535323930c7cf94acf71c3591882=
b26a7ea50f3edc16"
=20
 inherit autotools gettext texinfo
=20
--=20
2.43.0

