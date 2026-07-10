Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7016CC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12944.1783690962310707634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KQK0z/70;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CE8C1EA6
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 06:42:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C4303F66F
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783690961; bh=IBNmi8a+4lHMx6WkqcBh1sSg6GwjYdHJT9aiBuR7kh0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KQK0z/70ZQTS8tGeJr3jbn9VmiyEwF8dlJIZJvUtQag4TYd3GqqtXHu5CoTuP0XWx
	 lURvu0P3vHZ06FYMBiUR8aKZekTJ7DfA6mnN2fUDNqR0wi5EPGlCwxssnZCnLEJ5ZS
	 JRfWurrZ3w3q1r81ie9fkdctG2MvHnzk8JyXLKPo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] python3-build: upgrade 1.5.0 -> 1.5.1
Date: Fri, 10 Jul 2026 14:42:39 +0100
Message-ID: <20260710134239.2098960-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710134239.2098960-1-ross.burton@arm.com>
References: <20260710134239.2098960-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240654

Highlights of the upstream changelog:

- feat(cli): accept sdist tarball as srcdir argument
- feat(deps): show wanted vs found in missing-deps error
- feat(cli): warn on valueless config settings
- feat(cli): add --sdist-extract-dir to reuse compiler caches
- feat(util): deprecate project_wheel_metadata
- feat: report resolved build dependency versions
- feat(env): control the isolated build environment location
- feat(cli): machine-readable build report, and metadata from a wheel
- fix(cli): drain verbose subprocess output without a worker thread
- fix(env): reject a file as --env-dir and drop a mutable default
- feat(cli): surface debug paths when a backend build fails
- fix(cli): fix CLI warnings being written to stdout instead of stderr
- fix: build correct dest path in Windows symlink support probe
- fix: derive dist-info directory from wheel contents, not filename
- fix: use LF instead of os.linesep when writing pip/uv requirements file=
s
- fix: decide color support per output stream, not solely from stdout
- fix: minor robustness fixes from code review

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/{python3-build_1.5.0.bb =3D> python3-build_1.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.5.0.bb =3D> python3=
-build_1.5.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.5.0.bb b/meta/r=
ecipes-devtools/python/python3-build_1.5.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.5.0.bb
rename to meta/recipes-devtools/python/python3-build_1.5.1.bb
index e263e29383..dd741cb862 100644
--- a/meta/recipes-devtools/python/python3-build_1.5.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/pypa/build"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D310439af287b0fb4780b2ad6907c2=
56c"
=20
-SRC_URI[sha256sum] =3D "302c22c3ba2a0fd5f3911918651341ebb3896176cbdec15b=
d421f80b1afc7647"
+SRC_URI[sha256sum] =3D "94e17f1db803ab22f46049376c44c8437c52090f0dfdf1ad=
c43df56542d644fb"
=20
 inherit pypi python_flit_core
=20
--=20
2.43.0


