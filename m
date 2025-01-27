Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35DFC0218A
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 13:58:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51958.1737986297254902979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 05:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92E92497
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 05:58:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5FB8D3F694
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 05:58:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: upgrade to 1.7.0
Date: Mon, 27 Jan 2025 13:58:12 +0000
Message-ID: <20250127135812.1447233-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 13:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210300

Summary of changes:
- New custom dependency for atomic
- --cap-lints allow used for Cargo subprojects
- Cargo features are resolved globally
- Meson can run "clippy" on Rust projects
- Devenv support in external project module
- Fixed sizeof and find_library methods for Fortran compilers
- format command now accept stdin argument
- "machine" entry in target introspection data
- Add new language Linear Asm
- Control the number of child processes with an environment variable
- Support for Rust 2024
- Support TASKING VX-Toolset
- Test targets no longer built by default
- Install vcs_tag() output

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/{meson_1.6.1.bb =3D> meson_1.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.6.1.bb =3D> meson_1.7.0.bb} =
(98%)

diff --git a/meta/recipes-devtools/meson/meson_1.6.1.bb b/meta/recipes-de=
vtools/meson/meson_1.7.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.6.1.bb
rename to meta/recipes-devtools/meson/meson_1.7.0.bb
index 249a07c2909..44872a5f7ba 100644
--- a/meta/recipes-devtools/meson/meson_1.6.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.7.0.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-dependencies-dev-prepend-sysroot-when-searching-f=
or-.patch \
            "
-SRC_URI[sha256sum] =3D "1eca49eb6c26d58bbee67fd3337d8ef557c0804e30a6d16b=
fdf269db997464de"
+SRC_URI[sha256sum] =3D "08efbe84803eed07f863b05092d653a9d348f7038761d900=
412fddf56deb0284"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
=20
 inherit python_setuptools_build_meta github-releases
--=20
2.43.0


