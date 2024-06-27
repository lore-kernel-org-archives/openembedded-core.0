Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E5EC3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 17:23:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13777.1719509004911098442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 10:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67CD911FB
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 10:23:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3552A3F766
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 10:23:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] librsvg: upgrade to 2.57.3
Date: Thu, 27 Jun 2024 17:23:22 +0000
Message-Id: <20240627172322.1600152-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627172322.1600152-1-ross.burton@arm.com>
References: <20240627172322.1600152-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 17:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201209

This is the latest point release in the 2.57.3 stable series.

Version 2.57.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- #1062 - Limit numOctaves in feTurbulence to avoid unbounded CPU consump=
tion.
- #1064 - Don't panic when a :lang selector has an argument that is
  not a language-range (Luk=C3=A1=C5=A1 Tyrychtr).

Version 2.57.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- #1059 - Don't panic when rendering feOffset with a too-large offset.
- #1060 - Don't panic when a decoded image has dimensions of zero.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch | 4 ++--
 .../librsvg/{librsvg_2.57.1.bb =3D> librsvg_2.57.3.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.57.1.bb =3D> librsvg_2.57.3=
.bb} (97%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rus=
t-target-to-cargo-also-when-not-.patch b/meta/recipes-gnome/librsvg/librs=
vg/0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch
index c34a610522c..c08ce8205a5 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rust-targe=
t-to-cargo-also-when-not-.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rust-targe=
t-to-cargo-also-when-not-.patch
@@ -1,4 +1,4 @@
-From d0f4f5b3ae900b9d092407e29b5372d93910c18c Mon Sep 17 00:00:00 2001
+From eee6c251bceb235912887a54c58a2fc2d4450216 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 21 Sep 2021 16:27:14 +0200
 Subject: [PATCH] Makefile.am: pass rust target to cargo also when not cr=
oss
@@ -28,7 +28,7 @@ index 2a89954..4e296d3 100644
  CARGO_VERBOSE =3D $(cargo_verbose_$(V))
  cargo_verbose_ =3D $(cargo_verbose_$(AM_DEFAULT_VERBOSITY))
 diff --git a/configure.ac b/configure.ac
-index 42215cf..2499c96 100644
+index 480e27e..587c4db 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -292,9 +292,7 @@ AC_ARG_VAR(RUST_TARGET, [Set rust target (default=3D=
$host)])
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.57.3.bb
similarity index 97%
rename from meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.57.3.bb
index ceaf1dfc003..7e6bdae531a 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb
@@ -24,7 +24,7 @@ SRC_URI +=3D " \
            file://disable-rsvg-loader-test.patch \
            "
=20
-SRC_URI[archive.sha256sum] =3D "074671a3ed6fbcd67cae2a40e539107f4f097ca8=
a4ab1a894c05e2524ff340ef"
+SRC_URI[archive.sha256sum] =3D "1b2267082c0b77ef93b15747a5c754584eb5886b=
af2d5a08011cde0659c2c479"
=20
 UPSTREAM_CHECK_REGEX =3D "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
=20
--=20
2.34.1


