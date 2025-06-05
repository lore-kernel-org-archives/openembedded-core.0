Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40846C678DA
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:35:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10726.1749137714457153641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64AAF1688
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:34:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8859B3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/16] libmodulemd: add manpages
Date: Thu,  5 Jun 2025 16:34:55 +0100
Message-ID: <20250605153508.961682-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605153508.961682-1-ross.burton@arm.com>
References: <20250605153508.961682-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218039

Inherit manpages and optionally enable the manpages. They're in the
repository so don't need more tools to build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb b/me=
ta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
index aef8892109c..fc73a0bfd56 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
@@ -10,9 +10,9 @@ SRCREV =3D "e7f179eeeb6eee1403f090fc43a3c80bb08b5bfd"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit meson gobject-introspection pkgconfig
+inherit meson gobject-introspection pkgconfig manpages
=20
-EXTRA_OEMESON =3D "-Dwith_py3=3Dfalse -Dwith_docs=3Dfalse -Drpmio=3Ddisa=
bled -Dwith_manpages=3Ddisabled -Dgobject_overrides_dir_py3=3D${PYTHON_SI=
TEPACKAGES_DIR}/gi/overrides"
+EXTRA_OEMESON =3D "-Dwith_py3=3Dfalse -Dwith_docs=3Dfalse -Drpmio=3Ddisa=
bled -Dgobject_overrides_dir_py3=3D${PYTHON_SITEPACKAGES_DIR}/gi/override=
s"
=20
 DEPENDS +=3D "glib-2.0 libyaml glib-2.0-native"
=20
@@ -21,3 +21,6 @@ BBCLASSEXTEND =3D "native nativesdk"
 GIR_MESON_OPTION =3D 'skip_introspection'
 GIR_MESON_ENABLE_FLAG =3D 'false'
 GIR_MESON_DISABLE_FLAG =3D 'true'
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[manpages] =3D "-Dwith_manpages=3Denabled,-Dwith_manpages=3D=
disabled"
--=20
2.43.0


