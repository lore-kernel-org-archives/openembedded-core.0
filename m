Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web11.7723.1609214167469834056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 19:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from misaki.hotel.hz.sumomo.pri (unknown [192.168.10.3])
	by kozue.soulik.info (Postfix) with ESMTPA id C7D8B1007A5;
	Tue, 29 Dec 2020 12:55:49 +0900 (JST)
From: "Randy Li" <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Cc: Randy Li <ayaka@soulik.info>
Subject: [PATCH v2 2/2] meson: add sysroot property
Date: Tue, 29 Dec 2020 11:55:50 +0800
Message-Id: <20201229035550.226617-3-ayaka@soulik.info>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201229035550.226617-1-ayaka@soulik.info>
References: <20201229035550.226617-1-ayaka@soulik.info>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I know the environment setup script would set PKG_CONFIG_PATH,
but the meson won't take that env when translate the includedir
property from the pkg-config.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 meta/recipes-devtools/meson/nativesdk-meson_0.56.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.56.0.bb b/meta=
/recipes-devtools/meson/nativesdk-meson_0.56.0.bb
index 67add2c25e..7fdc4c86d9 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.56.0.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.56.0.bb
@@ -40,6 +40,7 @@ c_args =3D @CFLAGS
 c_link_args =3D @LDFLAGS
 cpp_args =3D @CPPFLAGS
 cpp_link_args =3D @LDFLAGS
+sys_root =3D @OECORE_TARGET_SYSROOT
=20
 [host_machine]
 system =3D '${SDK_OS}'
--=20
2.29.2

