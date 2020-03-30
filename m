Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.49406.1585573210506363658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 06:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 48rXcP1tTCz1rqSN;
	Mon, 30 Mar 2020 15:00:05 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 48rXcP1bqqz1r0bv;
	Mon, 30 Mar 2020 15:00:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id MPr0Q4nl54vh; Mon, 30 Mar 2020 15:00:04 +0200 (CEST)
X-Auth-Info: D7qQ4bPp0XcPgLbI5ZQig3w6UwUOkS6yKT3pB4rqx9c=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 30 Mar 2020 15:00:03 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@intel.com>
Subject: [PATCH][zeus] waffle: no need to depend on target python3
Date: Mon, 30 Mar 2020 14:59:46 +0200
Message-Id: <20200330125946.12803-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
NOTE: This is the same as 8fc255f7d63c53167c771cd6b78895784f37d33f
---
 meta/recipes-graphics/waffle/waffle_1.6.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb b/meta/recipes-=
graphics/waffle/waffle_1.6.0.bb
index 8a1d5748f6..82cead9ad1 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
@@ -35,3 +35,8 @@ PACKAGECONFIG[x11-egl] =3D "-Dx11_egl=3Denabled,-Dx11_e=
gl=3Ddisabled,virtual/${MLPREFI
 PACKAGECONFIG[surfaceless-egl] =3D "-Dsurfaceless_egl=3Denabled,-Dsurfac=
eless_egl=3Ddisabled,virtual/${MLPREFIX}libgl"
=20
 # TODO: optionally build manpages and examples
+
+# Unset these to stop python trying to report the target Python setup
+_PYTHON_SYSCONFIGDATA_NAME[unexport] =3D "1"
+STAGING_INCDIR[unexport] =3D "1"
+STAGING_LIBDIR[unexport] =3D "1"
--=20
2.25.1

