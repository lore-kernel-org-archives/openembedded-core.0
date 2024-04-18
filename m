Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B413C04FF8
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 07:29:31 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web11.7366.1713425366942751811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 00:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=LFfjiooV;
 spf=pass (domain: protonmail.com, ip: 185.70.43.22, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1713425364; x=1713684564;
	bh=10aqRlS4bA4WOjR9fxTAX4O3N5Y7nZPkgFvu3olDh+0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LFfjiooVeYdJribvYVbPDKlxg2H9CQLRRgD4G2z+xMI/dZM7zgiPmTLNhJ8uaUiSR
	 zU2BvxfBjUkC1smrIBZf3uKnuuzQ/nLYuTZPUKwK9ZE9RjvN+Oi6rU39Q64C3+BNsb
	 wbZ81srN2lPW+9IQ4+Fb9Bbb4rhPrs7mmnERLzgKeklza3lp9SI2wKklazyZmHNEKG
	 VpmNsevDsfKJGgVJ19R8PyCC++VdhSy5cuFTtL5DjdXb9m4S9w1/0QEGf2wb5S0ViP
	 ZscEJpsv2WOEuXNK836JN5GDACJohrVbVKtOVtD1YfOundAAm4G5YA6N70/3xYvySC
	 QYM1qAZmlur0w==
Date: Thu, 18 Apr 2024 07:29:20 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk, Emil Kronborg <emil.kronborg@protonmail.com>
Subject: [PATCH v2] at-spi2-core: add at-spi2-atk to CVE_PRODUCT
Message-ID: <20240418072915.11246-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 07:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198502

Commit ad605662f1bc ("at-spi2-core: upgrade 2.44.1 -> 2.46.0") dropped
the at-spi2-atk recipe, because it was merged into at-spi2-core upstream
[1]. The PROVIDES variable was changed to also include at-spi2-atk, but
not CVE_PRODUCT.

[1]: https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
 meta/recipes-support/atk/at-spi2-core_2.52.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.52.0.bb b/meta/recipes=
-support/atk/at-spi2-core_2.52.0.bb
index cf221e038927..2ab42ba13f50 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.52.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.52.0.bb
@@ -7,6 +7,8 @@ BUGTRACKER =3D "http://bugzilla.gnome.org/"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
=20
+CVE_PRODUCT =3D "at-spi2-atk"
+
 MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"

base-commit: 946086abf5ac5172258ddb27af9c1c615258f62f
--=20
2.44.0



