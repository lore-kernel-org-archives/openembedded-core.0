Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4A8D6E2D2
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 17:42:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2571.1766079775847351343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 09:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55233FEC
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:42:48 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 120F53F73F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:42:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] libseccomp: remove redundant FILES
Date: Thu, 18 Dec 2025 17:42:46 +0000
Message-ID: <20251218174248.2580279-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218174248.2580279-1-ross.burton@arm.com>
References: <20251218174248.2580279-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 17:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228131

Remove FILES entries that are already either in the default, or now
redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libseccomp/libseccomp_2.6.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb b/meta/r=
ecipes-support/libseccomp/libseccomp_2.6.0.bb
index 2c06824a799..9bbdc6b833b 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
@@ -58,8 +58,7 @@ do_install_ptest() {
     sed -i -e 's@^#!/usr/bin/env python$@#!/usr/bin/env python3@' ${D}/$=
{PTEST_PATH}/tests/*.py
 }
=20
-FILES:${PN} =3D "${bindir} ${libdir}/${BPN}.so* ${PYTHON_SITEPACKAGES_DI=
R}/"
-FILES:${PN}-dbg +=3D "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/too=
ls/.debug"
+FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}/"
=20
 RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'python', 'py=
thon3', '', d)}"
 RDEPENDS:${PN}-ptest =3D "coreutils bash"
--=20
2.43.0


