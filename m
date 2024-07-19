Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192CEC3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 13:25:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18508.1721395531689227071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 06:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8EF31042
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:25:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00F9A3F762
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:25:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] glib-networking: upgrade 2.78.1 -> 2.80.0
Date: Fri, 19 Jul 2024 14:25:23 +0100
Message-Id: <20240719132523.976790-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719132523.976790-1-ross.burton@arm.com>
References: <20240719132523.976790-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 13:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202264

2.80.0 - March 14, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Mark plugin functions as exports on Windows (!250, Amyspark)
- Updated translations

2.80.rc - February 29, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

- GnuTLS: fix improper use of IP address in SNI extension (!247, MARTINSO=
NS Frederic)
- GnuTLS: major performance improvement: reduce unnecessary trust list cr=
eation (!249)
- OpenSSL: properly handle BIO_CTRL_EOF (!248)
- Updated translations

2.80.alpha - January 5, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

- GnuTLS: Add warning when system has no trusted certificates (!243)
- OpenSSL: Fix bug when populating trust store (!244, Alessandro Bono)
- Fix license on dtls-connection.c test (!245, David King)
- Updated translations

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch  | 2 +-
 .../{glib-networking_2.78.1.bb =3D> glib-networking_2.80.0.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.78.1.bb =3D>=
 glib-networking_2.80.0.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.pat=
ch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index 98ff4760716..98974aa4e77 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -1,4 +1,4 @@
-From 5604707bed4b4a4bc4658c7158a18c1774775775 Mon Sep 17 00:00:00 2001
+From f917ef5579257007bc02850e79769fe5ec48b2b7 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 6 May 2023 12:18:50 +0100
 Subject: [PATCH] In autobuilder testing we regularly see glib-networking=
 ptest
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
index 5060d9fd7a1..c8a13555486 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c \
 SECTION =3D "libs"
 DEPENDS =3D "glib-2.0-native glib-2.0"
=20
-SRC_URI[archive.sha256sum] =3D "e48f2ddbb049832cbb09230529c5e45daca9f0df=
0eda325f832f7379859bf09f"
+SRC_URI[archive.sha256sum] =3D "d8f4f1aab213179ae3351617b59dab5de6bcc9e7=
85021eee178998ebd4bb3acf"
=20
 # Upstream note that for the openssl backend, half the tests where this =
backend don't return
 # the expected error code or don't work as expected so default to gnutls
--=20
2.34.1


