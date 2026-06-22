Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8665CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 14:28:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44562.1782138520966227806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 07:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ttOkOkOz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A966C175D
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 07:28:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0DE03F632
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 07:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782138520; bh=QggLIOs78YWIbxk8h1lJh5ZO9fKaum27W5mayW87Es8=;
	h=From:To:Subject:Date:From;
	b=ttOkOkOz0BNzulzQwvC9WXNDjjXrQwmghY81l4eP1gFQzzkQxeiFJPJSUmEUG1oBc
	 MLUYfCgI6alTVf6P/tjdosgvNPahHtUMvErqdhrLh+WdSeJYsN1+T2iAjXFKRKy+b0
	 PVPZ6P1fwJKnLjGpcnK9p/RRFSZ39YB8He62FPCM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libjitterentropy: fix license statement
Date: Mon, 22 Jun 2026 15:28:35 +0100
Message-ID: <20260622142835.2483679-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 14:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239301

LICENSE clearly states the alternative to BSD is GPL-2.0-only:

  ALTERNATIVELY, this product may be distributed under the terms of the
  GNU General Public License, in which case the provisions of the GPL2
  are required INSTEAD OF the above restrictions.

Use GPL-2.0-only, and reorder to match.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3=
.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
index 7890dfa5c70..36721d201c4 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
@@ -4,7 +4,7 @@ It does not depend on any system resource other than a hi=
gh-resolution time \
 stamp. It is a small-scale, yet fast entropy source that is viable in al=
most \
 all environments and on a lot of CPU architectures."
 HOMEPAGE =3D "http://www.chronox.de/jent.html"
-LICENSE =3D "GPL-2.0-or-later | BSD-3-Clause"
+LICENSE =3D "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De01027c4ad1fe5a4768f8488c945d=
491 \
                     file://LICENSE.gplv2;md5=3Deb723b61539feef013de476e6=
8b5c50a \
                     file://LICENSE.bsd;md5=3D66a5cedaf62c4b2637025f049f9=
b826f \
@@ -23,4 +23,3 @@ do_install () {
                        LIBDIR=3D"${baselib}" \
                        INSTALL_STRIP=3D"install"
 }
-
--=20
2.43.0


