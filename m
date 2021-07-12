Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11347.1626097924875232946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BECE331B
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 698E53F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:03 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] tcl: EXTRA_OECONF already passes --libdir, don't do it again
Date: Mon, 12 Jul 2021 14:51:52 +0100
Message-Id: <20210712135159.2131269-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712135159.2131269-1-ross.burton@arm.com>
References: <20210712135159.2131269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-dev=
tools/tcltk/tcl_8.6.11.bb
index f5bb6b1a18..b2863f9a1f 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -36,7 +36,7 @@ VER =3D "${PV}"
=20
 inherit autotools ptest binconfig
=20
-EXTRA_OECONF =3D "--enable-threads --disable-rpath --libdir=3D${libdir} =
--enable-man-suffix"
+EXTRA_OECONF =3D "--enable-threads --disable-rpath --enable-man-suffix"
=20
 do_compile_prepend() {
 	echo > ${S}/../compat/fixstrtod.c
--=20
2.25.1

