Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DABFC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:45:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5996.1784576719962629415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DaAl/HBU;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31107143D
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:45:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1CAC53F99C
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784576719; bh=YTnwBWPOL6moaLY9TJjEsIzAFTslY9B/nUaLDzZnPsc=;
	h=From:To:Subject:Date:From;
	b=DaAl/HBU4WYUY0R7d2Wn6mWR5oobVEfYkdUH+KzMoa7TcoSh5L2EXnLpmq92WqpqP
	 gGiI5uSDMg99DsBi2k5GC1t6n8ESs+OEdj8OZiCUTLCLFekPnooXf2d06CqGF5H18X
	 IQFFN4bTPEmvAim7f44kWx51phVVHRmZFZ5T3ATo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] classes/cargo: fix indentation
Date: Mon, 20 Jul 2026 20:45:09 +0100
Message-ID: <20260720194510.3193319-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241488

Fix mismatching indentation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
index 2dd28e95d33..8e05a820af4 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -61,7 +61,7 @@ cargo_do_install () {
 	for tgt in "${B}/target/${CARGO_TARGET_SUBDIR}/"*; do
 		case $tgt in
 		*.so|*.rlib)
-                        if [ -n "${CARGO_INSTALL_LIBRARIES}" ]; then
+			if [ -n "${CARGO_INSTALL_LIBRARIES}" ]; then
 				install -d "${D}${rustlibdir}"
 				install -m755 "$tgt" "${D}${rustlibdir}"
 				have_installed=3Dtrue
--=20
2.43.0


