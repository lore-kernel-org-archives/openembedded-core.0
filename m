Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12204.1604491941545352723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 04:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D406147A
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2020 04:12:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE05C3F719
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2020 04:12:20 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] json-glib: update patch status
Date: Wed,  4 Nov 2020 12:12:16 +0000
Message-Id: <20201104121217.4013924-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104121217.4013924-1-ross.burton@arm.com>
References: <20201104121217.4013924-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...1-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-e=
num-types.c.in-fix-build-reproducibi.patch b/meta/recipes-gnome/json-glib=
/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patc=
h
index e5bfdcd4b72..0eb72441868 100644
--- a/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-typ=
es.c.in-fix-build-reproducibi.patch
+++ b/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-typ=
es.c.in-fix-build-reproducibi.patch
@@ -7,7 +7,7 @@ Changes the comment and include to reference the file bas=
ename
 instead of the full path. This ensures that the generated file is
 reproducible when it is included in source packages meant for debugging.
=20
-Upstream-Status: Pending
+Upstream-Status: Backport [6f3842abd5dff68b6ee5f2ef48a4ebf1cbebf434]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  json-glib/json-enum-types.c.in | 4 ++--
--=20
2.25.1

