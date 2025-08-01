Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A29C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 15:42:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.91334.1754062950114296890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 08:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 592CB1516
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 08:42:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01CA43F66E
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 08:42:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-unittest-automake-output: upgrade to 0.3
Date: Fri,  1 Aug 2025 16:42:25 +0100
Message-ID: <20250801154225.3823025-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 15:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221365

The patch is merged in this upgrade, so remove.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...__version__-to-match-the-tag-version.patch | 30 -------------------
 ...> python3-unittest-automake-output_0.3.bb} |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-unittest-automak=
e-output/0001-Update-__version__-to-match-the-tag-version.patch
 rename meta/recipes-devtools/python/{python3-unittest-automake-output_0.=
2.bb =3D> python3-unittest-automake-output_0.3.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-unittest-automake-outpu=
t/0001-Update-__version__-to-match-the-tag-version.patch b/meta/recipes-d=
evtools/python/python3-unittest-automake-output/0001-Update-__version__-t=
o-match-the-tag-version.patch
deleted file mode 100644
index c2e519a12ae..00000000000
--- a/meta/recipes-devtools/python/python3-unittest-automake-output/0001-=
Update-__version__-to-match-the-tag-version.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 8da931c5e9e32a15091d517b28cdf2e2b5395f77 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Tue, 8 Apr 2025 15:55:42 +0800
-Subject: [PATCH] Update __version__ to match the tag version
-
-Update __version__ to 0.2 to match the current tag.
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
-Upstream-Status: Backport
-[https://gitlab.com/rossburton/python-unittest-automake-output/-/commit/=
8da931c5e9e32a15091d517b28cdf2e2b5395f77]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/putao/__init__.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/putao/__init__.py b/src/putao/__init__.py
-index e8758de..00265e2 100644
---- a/src/putao/__init__.py
-+++ b/src/putao/__init__.py
-@@ -5,4 +5,4 @@
- Tools to write automake-style test reports.
- """
-=20
--__version__ =3D "0.1"
-+__version__ =3D "0.2"
---=20
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-unittest-automake-outpu=
t_0.2.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_=
0.3.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-unittest-automake-output=
_0.2.bb
rename to meta/recipes-devtools/python/python3-unittest-automake-output_0=
.3.bb
index 216fea2b935..66c1abee347 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.b=
b
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.b=
b
@@ -3,10 +3,9 @@ HOMEPAGE =3D "https://gitlab.com/rossburton/python-unitt=
est-automake-output"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6f16008d9fb7349f06609329f1ab=
93b"
=20
-SRC_URI =3D "git://gitlab.com/rossburton/python-unittest-automake-output=
;protocol=3Dhttps;branch=3Dmain \
-           file://0001-Update-__version__-to-match-the-tag-version.patch=
"
+SRC_URI =3D "git://gitlab.com/rossburton/python-unittest-automake-output=
;protocol=3Dhttps;branch=3Dmain;tag=3D${PV}"
=20
-SRCREV =3D "aebdfb188e368c690ea55cf6c9c9ffa1a52def65"
+SRCREV =3D "3376ff9bc319f8338849b7b9f63b9325d7b7663a"
=20
 inherit python_flit_core
=20
--=20
2.43.0


