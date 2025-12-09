Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7D6D3B98C
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 17:42:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13890.1765302146091180533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 09:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65CBA175D
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Dec 2025 09:42:18 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 33C383F762
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Dec 2025 09:42:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: upgrade to 1.9.2
Date: Tue,  9 Dec 2025 17:42:19 +0000
Message-ID: <20251209174220.2972106-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 17:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227445

Release notes:
- Array `.flatten()` method
- clang-tidy's auto-generated targets correctly select source files
- Added Qualcomm's embedded linker, eld
- Added suffix function to the FS module
- Support response files for custom targets
- meson format now has a --source-file-path argument when reading from st=
din
- Added license keyword to pkgconfig.generate
- New experimental option `rust_dynamic_std`
- Rust and non-Rust sources in the same target
- Swift/C++ interoperability is now supported
- Explicitly setting Swift module name is now supported
- Top-level statement handling in Swift libraries
- Swift compiler receives select C family compiler options
- Support for MASM in Visual Studio backends
- Limited support for WrapDB v1

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/{meson_1.9.1.bb =3D> meson_1.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.9.1.bb =3D> meson_1.9.2.bb} =
(98%)

diff --git a/meta/recipes-devtools/meson/meson_1.9.1.bb b/meta/recipes-de=
vtools/meson/meson_1.9.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.9.1.bb
rename to meta/recipes-devtools/meson/meson_1.9.2.bb
index 4738484bbbf..eaea492f281 100644
--- a/meta/recipes-devtools/meson/meson_1.9.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.9.2.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] =3D "4e076606f2afff7881d195574bddcd8d89286f35a17b4977=
a216f535dc0c74ac"
+SRC_URI[sha256sum] =3D "3499b59bb23982496e01e57b4103ac2f826f9c3a3f59e507=
a0a832487fe55e3d"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
=20
 inherit python_setuptools_build_meta github-releases
--=20
2.43.0


