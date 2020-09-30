Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web12.17722.1601478395484974522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 08:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from misaki.hotel.hz.sumomo.pri (unknown [112.10.158.45])
	by kozue.soulik.info (Postfix) with ESMTPA id D7776100C32;
	Thu,  1 Oct 2020 00:05:19 +0900 (JST)
From: "Randy Li" <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	ayaka <ayaka@soulik.info>
Subject: [PATCH] meson: add sysroot property
Date: Wed, 30 Sep 2020 23:05:45 +0800
Message-Id: <20200930150545.3882859-1-ayaka@soulik.info>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I know the environment setup script would set PKG_CONFIG_PATH,
but the meson won't take that env when translate the includedir
property from the pkg-config.

Signed-off-by: ayaka <ayaka@soulik.info>
---
 meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb b/meta=
/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
index 67add2c25e..7fdc4c86d9 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
@@ -40,6 +40,7 @@ c_args =3D @CFLAGS
 c_link_args =3D @LDFLAGS
 cpp_args =3D @CPPFLAGS
 cpp_link_args =3D @LDFLAGS
+sys_root =3D @OECORE_TARGET_SYSROOT
=20
 [host_machine]
 system =3D '${SDK_OS}'
--=20
2.25.4

