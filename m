Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ED5C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:28:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.34905.1749220107261883025
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C85C1595
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 07:28:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71E983F673
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 07:28:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 02/16] libmodulemd: remove libmagic option
Date: Fri,  6 Jun 2025 15:28:07 +0100
Message-ID: <20250606142822.3387675-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606142822.3387675-1-ross.burton@arm.com>
References: <20250606142822.3387675-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 14:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218143

Meson shows this warning in do_configure:

  WARNING: libmagic option is obsolete. libmodulemd can detect
  compression formats without a magic library now. Please stop using
  this option. It will be removed in the future and will cause a meson
  failure.

Remove the option as it's now redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb b/me=
ta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
index 4bdc587f4f9..79fabfc8683 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
@@ -12,7 +12,7 @@ S =3D "${WORKDIR}/git"
=20
 inherit meson gobject-introspection pkgconfig
=20
-EXTRA_OEMESON =3D "-Dwith_py3=3Dfalse -Dwith_docs=3Dfalse -Drpmio=3Ddisa=
bled -Dlibmagic=3Ddisabled -Dwith_manpages=3Ddisabled -Dgobject_overrides=
_dir_py3=3D${PYTHON_SITEPACKAGES_DIR}/gi/overrides"
+EXTRA_OEMESON =3D "-Dwith_py3=3Dfalse -Dwith_docs=3Dfalse -Drpmio=3Ddisa=
bled -Dwith_manpages=3Ddisabled -Dgobject_overrides_dir_py3=3D${PYTHON_SI=
TEPACKAGES_DIR}/gi/overrides"
=20
 DEPENDS +=3D "glib-2.0 libyaml glib-2.0-native"
=20
--=20
2.43.0


