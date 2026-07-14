Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0496AC44508
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 17:16:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1568.1784049383502071201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 10:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DOaHADES;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CD6B339
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 10:16:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BF433F915
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784049382; bh=UOPRqdTx+bzMGTU5ab613WVCpyNs+Rhhe79digKbXzA=;
	h=From:To:Subject:Date:From;
	b=DOaHADESz3fIS0h0ZCP0F8MtcMCC7E1BcOgIaKosoqedEpEtwrgTfidc2MpL/T65D
	 a6jblZMkCNwLHrbCwHWDV4Ay8DzffD7K3mukrMiw5UXChVG+1tPhFsPz71usreoavn
	 OwKz326BbXR6BlKobRL9oFs7DE8v+2d4e4K6+l5Q=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: upgrade 1.11.1 -> 1.11.2
Date: Tue, 14 Jul 2026 18:16:18 +0100
Message-ID: <20260714171618.3067519-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 17:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240904

Upstream changelog, ignoring irrelevant changes:

  8b7d80f2b Update default Qt version to 6.
  03bfacaf6 mconf: fix crash printing list-valued option augments
  aa5f7ae43 codegen: do not use Programs.for_machine
  d1cc24cc2 mtest: allow ignore reasons in rust unittests
  f229c604b envconfig: allow running executables if subsystem is not set
  bb1e84e5e compilers: Don't use -I=3Dpath in TI toolchain
  c35300613 Revert "compilers: Deduplicate OpenMP linker arguments"
  690107f50 automatically tag files installed under sbindir
  b8fe4f73f introspect: do not print umask as octal in JSON
  69673e5fc cargo: add docsrs to unconditionally added --check-cfg cfg's
  427947b00 mtest: fix handling of empty lines in TAP YAML block
  c928e14fa interpreter: fix typos in typed_kwargs
  cb20fed97 cargo: allow git dependencies with slash in branch name
  af3d7b29d interpreter: fix typed_kwargs name of add_project_link_argume=
nts
  4d0e8635a interpreter: do not apply CARGO_SUBDIR if subproject has a me=
son.build
  1b1ac2154 AstInterpreter: Slight Performance Improvement
  27f1c15eb build: fix install name when using link_whole
  a892c705c build: fix install name when linking with static library

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/meson/{meson_1.11.1.bb =3D> meson_1.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.11.1.bb =3D> meson_1.11.2.bb=
} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.11.1.bb b/meta/recipes-d=
evtools/meson/meson_1.11.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.11.1.bb
rename to meta/recipes-devtools/meson/meson_1.11.2.bb
index 26d9af6c199..5ac4d789b8a 100644
--- a/meta/recipes-devtools/meson/meson_1.11.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.11.2.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] =3D "6788ae299979643f8d841bcaf64352558436cae45a035514=
8a3aeeccf7913866"
+SRC_URI[sha256sum] =3D "698feae069cef3ecd4d7aaf281d7df359bdfcf555a9a1564=
383d3b913fa8a736"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
=20
 inherit python_setuptools_build_meta github-releases
--=20
2.43.0


