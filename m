Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11383.1626097926422679635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1805431B
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6DE53F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:05 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] tcl: remove redundant file creation
Date: Mon, 12 Jul 2021 14:51:56 +0100
Message-Id: <20210712135159.2131269-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712135159.2131269-1-ross.burton@arm.com>
References: <20210712135159.2131269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The creation of compat/fixstrtod.c was done back in 2005[1] with no
explanation and has persisted since.  I can't seem to break the build
without this, so it is presumably long obsolete.

[1] https://git.openembedded.org/openembedded/commit/?id=3D68d6601e8f9324=
3347b58324ce3d4f02eb3a84a9

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-dev=
tools/tcltk/tcl_8.6.11.bb
index dce0fcd2c0..0d7c2e4ac3 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -37,10 +37,6 @@ inherit autotools ptest binconfig
 AUTOTOOLS_SCRIPT_PATH =3D "${S}/unix"
 EXTRA_OECONF =3D "--enable-threads --disable-rpath --enable-man-suffix"
=20
-do_compile_prepend() {
-	echo > ${S}/compat/fixstrtod.c
-}
-
 do_install() {
 	autotools_do_install
 	oe_runmake 'DESTDIR=3D${D}' install-private-headers
--=20
2.25.1

