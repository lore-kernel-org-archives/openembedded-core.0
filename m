Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03035D58D55
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:32:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20001.1732545126992106315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 06:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ECF01692
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 06:32:36 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B77073F66E
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 06:32:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libnsl2: set CVE_PRODUCT
Date: Mon, 25 Nov 2024 14:32:00 +0000
Message-Id: <20241125143201.822306-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 14:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207788

Our libnsl2 recipe is just libnsl version 2.x, so set the CVE vendor and
product pair appropriately as per:

https://www.cvedetails.com/version/1177013/Libnsl-Project-Libnsl-2.0.0.ht=
ml

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-e=
xtended/libnsl/libnsl2_git.bb
index 8cc1f7cec31..082c888be21 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c"
 SECTION =3D "libs"
 DEPENDS =3D "libtirpc"
=20
+CVE_PRODUCT =3D "libnsl_project:libnsl"
+
 PV =3D "2.0.1"
=20
 SRCREV =3D "d4b22e54b5e6637a69b26eab5faad2a326c9b182"
--=20
2.34.1


