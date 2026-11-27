Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14251.1795778638181881849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 03:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jK7UYn10;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4D7D152B
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 03:23:54 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3EE383F632
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 03:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795778637; bh=jMY5zsyJwK2XLd9Q851MjGrywdTwzIAzDxxhPvfcZy4=;
	h=From:To:Subject:Date:From;
	b=jK7UYn10fIkYR3L5lwEhxWM/zsdbm2RdZqUCvMpBmxxlnVL1MT3tUEIkcwGsYMd/d
	 afClUo3B99BPPGxQziseyM8bDajkP50/R23i8W8ByKuex1CmkCztstlNsOIMB8JtuU
	 6uiULEJeSi28W5J9QZ8BgUtSxUHUmhluAQO7ZZSI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-wcwidth: switch to setuptools build backend
Date: Fri, 27 Nov 2026 11:23:52 +0000
Message-ID: <20261127112352.2602778-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 11:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251376
Content-Type: text/plain; charset="utf-8"

wcwidth moved to setuptools in 0.9.0[1].

[1] https://github.com/jquast/wcwidth/commit/b7a3098bd087c6d04776c44c00fe=
4298299cd793

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-wcwidth_0.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.9.5.bb b/meta=
/recipes-devtools/python/python3-wcwidth_0.9.5.bb
index 78a20373dff..55d2372a592 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.9.5.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.9.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db15979c39a2543=
892fca8cd86b4b52cb"
=20
 SRC_URI[sha256sum] =3D "713534e2ecb16e0fc39f19e0a5dda997da76d010953e9e8f=
803e7971f8accd80"
=20
-inherit pypi python_hatchling ptest-python-pytest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
 do_install_ptest:append() {
       cp ${S}/pyproject.toml ${S}/setup.py ${D}${PTEST_PATH}/
--=20
2.43.0

