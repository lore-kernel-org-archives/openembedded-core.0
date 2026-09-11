Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D0EC88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 11:22:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37353.1789125739458272758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 04:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DwRryDtj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5691F143D
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 04:22:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB3543F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 04:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789125739; bh=TKPNw0h/fWax87cAF2LfQT+7S1plgn7xmHZTlbb0odw=;
	h=From:To:Subject:Date:From;
	b=DwRryDtjl1roCgmjOO+0UeKG2fERge2ooqcktoaU6TwPD7bqsup51SKSET2T6dbBz
	 EFrw5U4sLFGaDTcbsCqANU/CwzVPXvnBSfz2PMazR7o9Y/LXXcyp/P38qoRZbH7P+8
	 DryEcg/viTDdggdQcidmKFQbpbhEQdWgqXQ87Fbc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-build: upgrade 1.6.0 -> 1.6.1
Date: Fri, 11 Sep 2026 12:22:16 +0100
Message-ID: <20260911112216.2675023-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 11:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245635

Abridged release notes:

- Avoid trying to detect symlinks on Windows, regression in 1.6.0
- Add ``--sdist-extract-dir`` to extract the intermediate sdist into a
  persistent directory, enabling compiler cache reuse across rebuilds
- Add ``--env-dir`` to place the isolated build environment at a fixed
  path, enabling compiler cache reuse across builds
- Deprecate :func:`build.util.project_wheel_metadata`; use ``python -m
  build --metadata`` instead
- Warn on config settings without a value (e.g. ``-C--my-flag``); use
  ``-C--my-flag=3D`` instead for compatibility with pip

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/{python3-build_1.6.0.bb =3D> python3-build_1.6.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.6.0.bb =3D> python3=
-build_1.6.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-build_1.6.0.bb b/meta/r=
ecipes-devtools/python/python3-build_1.6.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-build_1.6.0.bb
rename to meta/recipes-devtools/python/python3-build_1.6.1.bb
index acec9cd9efd..e5b673c5447 100644
--- a/meta/recipes-devtools/python/python3-build_1.6.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D310439af287b0f=
b4780b2ad6907c256c"
=20
 SRC_URI +=3D "file://check-valid-dist.patch"
=20
-SRC_URI[sha256sum] =3D "bd2c8afc603e7a2e0ce70e2ea85f0a6d02043bafbd307f5b=
ada0f98669eca5af"
+SRC_URI[sha256sum] =3D "51cc11666391ab6f092070437ac747002ff46f3e4113a362=
2177ee6b488bfc53"
=20
 inherit pypi python_flit_core
=20
--=20
2.43.0


