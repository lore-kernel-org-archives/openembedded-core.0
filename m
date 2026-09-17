Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860B8C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 11:19:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36675.1789643965133113516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 04:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=N/rYn3pQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1AAA1476
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 04:19:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3103A3F7B4
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 04:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789643964; bh=T0MXemJLWWxYYyDk/uGcqbVd31cUh+1kCx4mgJRWlcA=;
	h=From:To:Subject:Date:From;
	b=N/rYn3pQE7PGOpmmSYnT/kvLBJnbwHl5VGOw/QocRlR24DOV1wA1DQfC8IebIbsyo
	 /OSzNh0KNu46ZNeRvJptQWffnuSitGjO9g4ldDzl+QyYUDPDkFAKTlpq9tAbgqOJ4K
	 Tt6Hip9hIX5YX5sZPV0+0j0YElgEqhwmQGjklqyU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3-pyproject-hooks: upgrade 1.2.0 -> 1.3.3
Date: Thu, 17 Sep 2026 12:19:15 +0100
Message-ID: <20260917111915.3708159-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 11:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246055

Upstream release notes:

- Python 3.8 or above is now required.
- UserWarnings from the backend are now captured and re-emitted in the fr=
ontend
  process as a new category BuildBackendWarning, so that frontends can
  control how they are shown to users.
- Show the traceback from the backend on a BackendUnavailable error.
- Fix the return type annotation for prepare_metadata_for_build_wheel.
- Fix removing the internal _in_process directory from sys.path where
  the install location includes a symlink.
- Use os.path.commonpath instead of the deprecated commonprefix to
  validate the location of in-tree backends.
- Fix in-tree backends in locations containing the path separator charact=
er
- Fix finding distribution metadata with importlib.metadata in the backen=
d
  when an in-tree backend is used.
- pyproject_hooks can be built from source using flit_core 4.x.
- Document that the hooks.subprocess_runner context manager API is not
  thread-safein setuptools compatibility in 1.1.
  before imporing the backend.
- Rely on preferred "files" API on Python 3.9 and later.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...yproject-hooks_1.2.0.bb =3D> python3-pyproject-hooks_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-hooks_1.2.0.bb =3D=
> python3-pyproject-hooks_1.3.3.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.b=
b b/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb
index cdb9fc78c91..5f1507a0345 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/pypa/pyproject-hooks"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daad69c93f605003e3342b174d9b07=
08c"
=20
-SRC_URI[sha256sum] =3D "1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2=
a79a824c970da1f8"
+SRC_URI[sha256sum] =3D "defda19b854fa0d3bd4f76ea4ddcba8abd7dcfcdd585a669=
0ade050744fc5f43"
=20
 inherit pypi python_flit_core
=20
--=20
2.43.0


