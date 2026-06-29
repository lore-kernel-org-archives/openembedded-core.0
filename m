Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6909DC43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:55:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35020.1782730510992395345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=PUbGivAe;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2C04176C
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 03:55:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 037793F836
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782730510; bh=MJlHsPghmN3ZlcbwiJ0ho0zhcsSDicsR101/rj34Pd4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PUbGivAekTGqD9UzufM26UkkuA6Q9Nsqb9ybW+/liy8W5ElaMbsm7MNUCTtDXRpCN
	 4SOk8w6+jf7fwdtV3jRG3hkeeSc2n14U9zwh8qjQxu47Re0th13HsKKSGEK5OF/mbm
	 HdITv8Y0USKykG2JIachTdfrTnSheaiBecfTyHXg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] gdk-pixbuf: upgrade 2.44.6 -> 2.44.7
Date: Mon, 29 Jun 2026 11:55:05 +0100
Message-ID: <20260629105506.2156617-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629105506.2156617-1-ross.burton@arm.com>
References: <20260629105506.2156617-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239754

Upstream changes:

- xpm: Fix loading the xpm module if built-in
- glycin: Fix the build on 32bit
- glycin: Use fwrite to avoid problems with saving
- glycin: Add signature for webp
- glycin: Make filename tricks work in pid namespaces
- Translation updates

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.44.6.bb =3D> gdk-pixbuf_2.44.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.44.6.bb =3D> gdk-pixb=
uf_2.44.7.bb} (97%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb b/meta/re=
cipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb
similarity index 97%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb
index b2e348ea439..8efc14b59a2 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb
@@ -14,7 +14,7 @@ SECTION =3D "libs"
=20
 DEPENDS =3D "glib-2.0 shared-mime-info"
=20
-SRC_URI[archive.sha256sum] =3D "140c2d0b899fcf853ee92b26373c9dc228dbcde0=
820a4246693f4328a27466fa"
+SRC_URI[archive.sha256sum] =3D "172f80e3626ec31520a970400f1a3694e04718f6=
c2cd2885f75250fb5a6995a4"
=20
 inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-ev=
en gobject-introspection gi-docgen lib_package manpages
=20
--=20
2.43.0


