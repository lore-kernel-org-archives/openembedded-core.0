Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FE5C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 20:08:23 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.98033.1738613293956639672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 12:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=OPqMqijv;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 38D81240101
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Feb 2025 21:08:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1738613292; bh=a92l+Xlz2ZNq5rOhS7LMgg+CDn1RLAJVl58RR9lcZdc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=OPqMqijvJV+6kYFnu7Tjscjj+qtG4ixnjSMyXpKFWq4Y+XgH82LrYFzLhz0rUwwRg
	 UbHMPd8dET7ez4Whue04nHES4bP2fkaIZh0qPSvYyWOFtS8krbs9RCrwBEkA9mmNgW
	 MZMc8r/pw0l+cTf/QRdgwaU84m3sHzXn7891eeRx6Wm2M4jPlJFJ3cC8pDiPJVxtXe
	 owd9VBc8ZchZxUXw/SEjoWuI8MVmFad8cTZbtB2j1B6O8bB2kSoYg1GGZQ7rFUN/6t
	 /AJ/ntJ3yxIHOx0l955Ib/QvhIUlFnU3mQpD4yQantXFFxwpq/fI08jfTUTuxk9ElF
	 9XFTd+XSmB3Ng==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YmyGz5xsdz9rxB;
	Mon,  3 Feb 2025 21:08:11 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] libsecret: upgrade 0.21.4 -> 0.21.6
Date: Mon,  3 Feb 2025 20:00:59 +0000
Message-Id: <20250203200059.161883-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 20:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210734

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Upgrade per AUH failed as with 0.21.6 libsecret now also comes with
bash-completions. Put those to an additional package, as systems might
come without bash, so not everyone might want them.

Changelog
---------
0.21.6
 * meson: Make dbus-run-session optional [!157]
 * meson: Actually include bash-completion subdir [!158]

0.21.5
 * session: Tolerate non-approved DH parameter usage in FIPS mode [!145]
 * Add some missing GIR annotations [!140]
 * meson: Create default test setup with D-Bus [!115]
 * meson: Use env.prepend() for test environment setup [!141]
 * meson: Fix license field [!139]
 * build: Remove self-inclusion from secret-item.h [!149]
 * build: Fix compiler warnings in Vala tests [!153]
 * tests: Fix "\|" used in test-secret-tool.sh not portable [!150]
 * Fix typo in D-Bus XML [!152]
 * docs: Fix minor gi-docgen reference [!142]
 * docs: Fix Python example [!144]
 * docs: Mention file backend [!146]
 * docs: Fix link in README [!147]
 * Several CI-related updates
 * Updated translations

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../0001-meson-add-option-to-disable-pam-tests.patch       | 7 ++-----
 .../libsecret/{libsecret_0.21.4.bb =3D> libsecret_0.21.6.bb} | 5 ++++-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.4.bb =3D> libsecret_=
0.21.6.bb} (84%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option=
-to-disable-pam-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001=
-meson-add-option-to-disable-pam-tests.patch
index 1bd49bbc38..da5ed1fd32 100644
--- a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-dis=
able-pam-tests.patch
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-dis=
able-pam-tests.patch
@@ -1,4 +1,4 @@
-From b90ecbdb4b91961a77a7cbb3a9b6a57128e2194b Mon Sep 17 00:00:00 2001
+From a9fd7dcddf8bc64646f2945ab564357c23111541 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Tue, 3 Dec 2024 15:58:17 +0100
 Subject: [PATCH] meson: add option to disable pam tests
@@ -12,7 +12,7 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  2 files changed, 24 insertions(+), 21 deletions(-)
=20
 diff --git a/meson_options.txt b/meson_options.txt
-index 936eff8..8fa2a4e 100644
+index 936eff8..2ae14f2 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -8,3 +8,4 @@ option('bashcompdir', type: 'string', value: '', descrip=
tion: 'Override default
@@ -75,6 +75,3 @@ index 8413b58..5155329 100644
 +    },
 +  )
 +endif
---=20
-2.47.0
-
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb b/meta/reci=
pes-gnome/libsecret/libsecret_0.21.6.bb
similarity index 84%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
index d356681252..e99201228a 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
@@ -14,7 +14,7 @@ inherit gnomebase gi-docgen vala gobject-introspection =
manpages
 DEPENDS +=3D "glib-2.0 libgcrypt gettext-native"
=20
 SRC_URI +=3D "file://0001-meson-add-option-to-disable-pam-tests.patch"
-SRC_URI[archive.sha256sum] =3D "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d=
3c34168c581301cd53912b20"
+SRC_URI[archive.sha256sum] =3D "747b8c175be108c880d3adfb9c3537ea66e520e4=
ad2dccf5dce58003aeeca090"
=20
 EXTRA_OEMESON +=3D "-Dpam-tests=3Dfalse"
=20
@@ -24,6 +24,9 @@ PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES=
', 'pam', d)}"
 PACKAGECONFIG[manpages] =3D "-Dmanpage=3Dtrue,-Dmanpage=3Dfalse,libxslt-=
native xmlto-native"
 PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam"
=20
+PACKAGES +=3D " ${PN}-bash-completion"
+FILES:${PN}-bash-completion +=3D " ${datadir}/bash-completion/completion=
s/secret-tool"
+
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
 ARM_INSTRUCTION_SET:armv5 =3D "arm"
--=20
2.39.5


