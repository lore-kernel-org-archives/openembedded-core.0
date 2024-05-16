Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622CCC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:06:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10749.1715857600927402481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8416ADA7
	for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:07:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEE213F762
	for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:06:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] python3-hatchling: upgrade 1.24.1 -> 1.24.2
Date: Thu, 16 May 2024 11:06:35 +0000
Message-Id: <20240516110637.2239854-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199461

* Add .venv to the list of directories that cannot be traversed
* Output from the core Application utility now writes to stderr

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...{python3-hatchling_1.24.1.bb =3D> python3-hatchling_1.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.24.1.bb =3D> py=
thon3-hatchling_1.24.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.24.1.bb b/m=
eta/recipes-devtools/python/python3-hatchling_1.24.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
index fc8d9532813..0ad545f448b 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS +=3D "python3-pluggy-native python3-pathspec-native python3-pack=
aging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native =3D "python3-hatchling-native"
=20
-SRC_URI[sha256sum] =3D "51f861891e98c4044eb455163a737e5d2328d7aa74890b18=
2db2d80fee22a497"
+SRC_URI[sha256sum] =3D "41ddc27cdb25db9ef7b68bef075f829c84cb349aa1bff824=
0797d012510547b0"
=20
 do_compile:prepend() {
     export PYTHONPATH=3Dsrc
--=20
2.34.1


