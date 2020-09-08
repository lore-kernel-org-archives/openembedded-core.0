Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20658.1599573444073461490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 06:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E66A1682
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2020 06:57:23 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5CE83F73C
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2020 06:57:22 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] harfbuzz: update patch status
Date: Tue,  8 Sep 2020 14:57:16 +0100
Message-Id: <20200908135717.3781613-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...1-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-=
enums.cc.tmpl-write-out-only-the-file.patch b/meta/recipes-graphics/harfb=
uzz/harfbuzz/0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.pa=
tch
index 4ba4f8b28e..d9fccfac0e 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-enums.c=
c.tmpl-write-out-only-the-file.patch
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-enums.c=
c.tmpl-write-out-only-the-file.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] src/hb-gobject-enums.cc.tmpl: write out =
only the filename,
 This is beneficial for reproducible builds, as build paths can vary
 between builds.
=20
-Upstream-Status: Pending
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/e=
876886d1e877ad90b6f02badefd6ebee1bc0b09]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  src/hb-gobject-enums.cc.tmpl | 2 +-
--=20
2.28.0

