Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.278.1615226527451804866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 10:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BCE11063
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Mar 2021 10:01:57 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAC1F3F71B
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Mar 2021 10:01:56 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] gcc-cross: make use of the system include directories fatal
Date: Mon,  8 Mar 2021 18:01:51 +0000
Message-Id: <20210308180152.3515502-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308180152.3515502-1-ross.burton@arm.com>
References: <20210308180152.3515502-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When building the cross GCC, configure it so that including the host
system include directories is fatal, not just a warning.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
index 6fa8c274cd..e08807afad 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -21,7 +21,7 @@ require gcc-configure-common.inc
 # gnu) will hit a QA failure.
 LINKER_HASH_STYLE ?=3D "sysv"
=20
-EXTRA_OECONF +=3D "--enable-poison-system-directories"
+EXTRA_OECONF +=3D "--enable-poison-system-directories=3Derror"
 EXTRA_OECONF_append_sh4 =3D " \
     --with-multilib-list=3D \
     --enable-incomplete-targets \
--=20
2.25.1

