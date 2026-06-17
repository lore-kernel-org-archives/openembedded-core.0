Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4615DCD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 09:32:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11469.1781688750150126326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 02:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=S0UoWryX;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8E024794
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 02:32:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BD943F915
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 02:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781688749; bh=GgB9ZO8dBkfoUHcnb8pfU37tlNBzgZpXvERJ/wudPHg=;
	h=From:To:Subject:Date:From;
	b=S0UoWryXwHYGDrSSrziVJ9X145VrnLrOjdm04IsAZKs57DR0PeO3CWycU/LHBcSdk
	 dpb40Nv+fhh1PtXLmzUbvojs2NTeewYecAK2xD3Ih5KGxymS2vCYV0wCcdLkcfa28U
	 RlunKynKCTTqUYURbuQTY/zemq83z4LXtecKXEPo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libaio: update SRC_URI
Date: Wed, 17 Jun 2026 10:32:23 +0100
Message-ID: <20260617093224.56557-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 09:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239025

libaio has moved to Codeberg as pagure.io will be closed down shortly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/libaio/libaio_0.3.113.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libaio/libaio_0.3.113.bb b/meta/recipe=
s-extended/libaio/libaio_0.3.113.bb
index 2392fd5db23..5f4c5547a11 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.113.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
@@ -5,7 +5,7 @@ HOMEPAGE =3D "http://lse.sourceforge.net/io/aio.html"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499"
=20
-SRC_URI =3D "git://pagure.io/libaio.git;protocol=3Dhttps;branch=3Dmaster=
 \
+SRC_URI =3D "git://codeberg.org/jmoyer/libaio.git;protocol=3Dhttps;branc=
h=3Dmaster;tag=3D${BP} \
            file://00_arches.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \
--=20
2.43.0


