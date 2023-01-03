Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DE3C54EBE
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 13:47:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.63876.1672753627567367768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 05:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22AB5152B;
	Tue,  3 Jan 2023 05:47:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0739D3F587;
	Tue,  3 Jan 2023 05:47:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/5] pango: upgrade 1.50.11 -> 1.50.12
Date: Tue,  3 Jan 2023 13:46:57 +0000
Message-Id: <20230103134700.2649683-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103134700.2649683-1-ross.burton@arm.com>
References: <20230103134700.2649683-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 13:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175348

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...d-install-nofonts-fonts.conf-as-it-i.patch | 35 -------------------
 .../{pango_1.50.11.bb =3D> pango_1.50.12.bb}    |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/0001-tests-meson.bu=
ild-install-nofonts-fonts.conf-as-it-i.patch
 rename meta/recipes-graphics/pango/{pango_1.50.11.bb =3D> pango_1.50.12.=
bb} (90%)

diff --git a/meta/recipes-graphics/pango/pango/0001-tests-meson.build-ins=
tall-nofonts-fonts.conf-as-it-i.patch b/meta/recipes-graphics/pango/pango=
/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch
deleted file mode 100644
index 8dacd621387..00000000000
--- a/meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-no=
fonts-fonts.conf-as-it-i.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 13f8ba5d5b699df1f88eeea859406daba6d6941f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 8 Nov 2022 18:08:51 +0100
-Subject: [PATCH] tests/meson.build: install nofonts/fonts.conf as it is
- required by tests
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/pango/-/merge=
_requests/654]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- tests/meson.build | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 8b4bfa38..6c1c461b 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -250,6 +250,10 @@ foreach d: test_items_data
-   installed_test_items_data +=3D d + '.expected'
- endforeach
-=20
-+installed_test_nofonts_data =3D [
-+  'nofonts/fonts.conf',
-+]
-+
- installed_test_datadir =3D join_paths(pango_datadir, 'installed-tests',=
 'pango')
- installed_test_bindir =3D join_paths(pango_libexecdir, 'installed-tests=
', 'pango')
-=20
-@@ -261,6 +265,7 @@ if get_option('install-tests')
-   install_data(installed_test_breaks_data, install_dir: join_paths(inst=
alled_test_bindir, 'breaks'))
-   install_data(installed_test_items_data, install_dir: join_paths(insta=
lled_test_bindir, 'itemize'))
-   install_data(installed_test_fontsets_data, install_dir: join_paths(in=
stalled_test_bindir, 'fontsets'))
-+  install_data(installed_test_nofonts_data, install_dir: join_paths(ins=
talled_test_bindir, 'nofonts'))
- endif
-=20
- gen_installed_test =3D files([ 'gen-installed-test.py' ])
diff --git a/meta/recipes-graphics/pango/pango_1.50.11.bb b/meta/recipes-=
graphics/pango/pango_1.50.12.bb
similarity index 90%
rename from meta/recipes-graphics/pango/pango_1.50.11.bb
rename to meta/recipes-graphics/pango/pango_1.50.12.bb
index 6f599f5b781..6779f39c4f3 100644
--- a/meta/recipes-graphics/pango/pango_1.50.11.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.12.bb
@@ -22,10 +22,9 @@ GIR_MESON_DISABLE_FLAG =3D "disabled"
=20
 SRC_URI +=3D "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
-           file://0001-tests-meson.build-install-nofonts-fonts.conf-as-i=
t-i.patch \
            "
=20
-SRC_URI[archive.sha256sum] =3D "8800f812d89ee61388188703203f3a7878963c22=
f8695aaf1fa0a1a1428d17ae"
+SRC_URI[archive.sha256sum] =3D "caef96d27bbe792a6be92727c73468d832b13da5=
7c8071ef79b9df69ee058fe3"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype virtual/libico=
nv cairo harfbuzz fribidi"
=20
--=20
2.34.1


