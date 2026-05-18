Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83008CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 10:33:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5491.1779100377797997825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 03:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=YQDXYVfz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17F0E4617
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:32:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C1C023F85F
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779100377; bh=0ARiaf3w2rbnpKGuZu4TI+3Q1alQRaJmkp1jvFMjOXM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YQDXYVfz46a53lm6rWULyc6G7BSwFoNI6NTizivbDnQgNe0oxt5vuYmNSpR80hg0Q
	 U/P2dJ8ABn4LKFZh33mM9R5fWH4XvbYR2i7vJG/buqJbsIur8Q3npjiI6HPf8N2XXL
	 f9B3SI/K9HU99lMlj0Y8Stfw7h/6m7h/mm6ufGoY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] groff: fix whitespace
Date: Mon, 18 May 2026 11:32:48 +0100
Message-ID: <20260518103249.592747-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518103249.592747-1-ross.burton@arm.com>
References: <20260518103249.592747-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 10:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237215

Fix bad indentation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/groff/groff_1.24.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/groff/groff_1.24.1.bb b/meta/recipes-e=
xtended/groff/groff_1.24.1.bb
index e780603b1e6..74e422c6af4 100644
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


