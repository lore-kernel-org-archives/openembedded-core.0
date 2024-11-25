Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021A9D58D50
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:32:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19825.1732545127269339542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 06:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2BD41756
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 06:32:36 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 688513F66E
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 06:32:06 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libnsl2: embed version in filename
Date: Mon, 25 Nov 2024 14:32:01 +0000
Message-Id: <20241125143201.822306-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125143201.822306-1-ross.burton@arm.com>
References: <20241125143201.822306-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 14:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207789

This recipe fetches a tagged commit, so embed the PV in the filename.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libnsl/{libnsl2_git.bb =3D> libnsl2_2.0.1.bb}             | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta/recipes-extended/libnsl/{libnsl2_git.bb =3D> libnsl2_2.0.1.b=
b} (95%)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-e=
xtended/libnsl/libnsl2_2.0.1.bb
similarity index 95%
rename from meta/recipes-extended/libnsl/libnsl2_git.bb
rename to meta/recipes-extended/libnsl/libnsl2_2.0.1.bb
index 082c888be21..1b9be620c07 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb
@@ -12,13 +12,9 @@ DEPENDS =3D "libtirpc"
=20
 CVE_PRODUCT =3D "libnsl_project:libnsl"
=20
-PV =3D "2.0.1"
-
+SRC_URI =3D "git://github.com/thkukuk/libnsl;branch=3Dmaster;protocol=3D=
https"
 SRCREV =3D "d4b22e54b5e6637a69b26eab5faad2a326c9b182"
=20
-SRC_URI =3D "git://github.com/thkukuk/libnsl;branch=3Dmaster;protocol=3D=
https \
-          "
-
 S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig gettext
--=20
2.34.1


