Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BA1CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 14:15:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22161.1779200114021773616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 07:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cPLXri8l;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE921D31
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:15:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EFCBB3F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779200113; bh=nF+OxIjJ/SyHMCYmxNGjGEXl3crK62j0JzyNH80ePbg=;
	h=From:To:Subject:Date:From;
	b=cPLXri8l2QL6sMrhwNsiZk0oSJt/Os/K2QHAzL7/+O/sLF+gUVxBswmEgdMlvh3VB
	 9iPYB3pVcfwDnoqF0u4IaqqkU9yHM7yc5Z5bzuUNu5Ozve+2qrmfekFZgSH/1MiO/j
	 tcnNyycgyGbzFMUTOc3n0GQd1CQcscU/Vicz1kAw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] groff: fix whitespace
Date: Tue, 19 May 2026 15:15:07 +0100
Message-ID: <20260519141508.563089-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 14:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237328

Fix bad indentation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/groff/groff_1.24.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/groff/groff_1.24.1.bb b/meta/recipes-e=
xtended/groff/groff_1.24.1.bb
index 24b8146a72..256dcfd8c3 100644
--- a/meta/recipes-extended/groff/groff_1.24.1.bb
+++ b/meta/recipes-extended/groff/groff_1.24.1.bb
@@ -65,8 +65,10 @@ do_install:append() {
 	rm -rf ${D}${bindir}/grap2graph
 	rm -rf ${D}${mandir}/man1/grap2graph*
=20
-        # strip hosttool path out of generated files
-        sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${docdir}/${BP}/examples/=
hdtbl/*.roff
+	# strip hosttool path out of generated files
+	if [ -d ${D}${docdir}/${BP}/examples/hdtbl/ ]; then
+		sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${docdir}/${BP}/examples/hdtbl/=
*.roff
+	fi
 }
=20
 do_install:append:class-native() {
--=20
2.43.0


