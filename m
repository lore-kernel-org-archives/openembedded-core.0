Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA76C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:24:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13557.1789561481517807829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=bzBV1Kvl;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5047D152B
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:24:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 858BD3F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789561480; bh=cMkiDj7sAUB9FUHnaacKq5wrpU6elo8Zz34sXjq025g=;
	h=From:To:Subject:Date:From;
	b=bzBV1Kvl74La4CQssZTF+Cb7uaAh4ecmFbCFMGHFQH68+WffrOmxWLKVRAOBANpWb
	 xUsAe00jtSsBCdzSnw5cFV41Lci6d7HWsHIArxq+1I9GfN1pCBGIvrH8eoSIjgdW9a
	 sieoK0fVbvCwuUh/djCtDfIIaSQqjOayOS/Sgnv8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-pyproject-hooks: upgrade 1.2.0 -> 1.3.0
Date: Wed, 16 Sep 2026 13:24:37 +0100
Message-ID: <20260916122437.2101254-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245967

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
 ...yproject-hooks_1.2.0.bb =3D> python3-pyproject-hooks_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-hooks_1.2.0.bb =3D=
> python3-pyproject-hooks_1.3.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.b=
b b/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-hooks_1.3.0.bb
index cdb9fc78c91..fda19f2f8d7 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/pypa/pyproject-hooks"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daad69c93f605003e3342b174d9b07=
08c"
=20
-SRC_URI[sha256sum] =3D "1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2=
a79a824c970da1f8"
+SRC_URI[sha256sum] =3D "26dfd4229ff1820b7964be33bd3eb64367eb7c841215defe=
11341450c219ce20"
=20
 inherit pypi python_flit_core
=20
--=20
2.43.0


