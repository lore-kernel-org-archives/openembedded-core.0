Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.30313.1620645430848282875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 04:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7230915BE
	for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 04:17:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CFE83F719
	for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 04:17:10 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: update patch status
Date: Mon, 10 May 2021 12:17:08 +0100
Message-Id: <20210510111708.921072-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/meson/gi-target-dep.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson/gi-target-dep.patch b/meta=
/recipes-devtools/meson/meson/gi-target-dep.patch
index 25b30ca27ae..29e164ccc71 100644
--- a/meta/recipes-devtools/meson/meson/gi-target-dep.patch
+++ b/meta/recipes-devtools/meson/meson/gi-target-dep.patch
@@ -3,7 +3,7 @@ to be executed) but *host* gobject-introspection librarie=
s, as otherwise the
 native pkg-config can be used and the build will try to link native and =
host
 binaries together.
=20
-Upstream-Status: Pending
+Upstream-Status: Backport [589236226856f591c9e8daf0cb7aa1aef8862388]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
--=20
2.25.1

