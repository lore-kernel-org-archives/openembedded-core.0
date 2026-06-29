Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8831BC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:55:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35019.1782730510244996828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=uB7k5CVw;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CC8E176C
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 03:55:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5308E3F836
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782730509; bh=H6qTw8/YNU5RKletI/Nu3FgBA7+WA9zzlte7OZkRH+4=;
	h=From:To:Subject:Date:From;
	b=uB7k5CVwDtpARFMUuszYDdoDotNX/gBUcc/4B1fGPoBlRIV4h2iJlBnQv2neLTrl+
	 PRwWVvQNyV21fClTlSeCIizTp5WsDKI/gFvIN8/mERclzCGfdi747WUP/H9xyQxEKf
	 g1ZCxzUtnxC/bD9PNmIGL1ZSYHROPIxjXh5Npoko=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] pango: upgrade 1.57.1 -> 1.58.0
Date: Mon, 29 Jun 2026 11:55:04 +0100
Message-ID: <20260629105506.2156617-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239753

Upstream changes:

* PangoFontDescription has a new width attribute, which is like stretch,
  but allows intermediate values

* PangoRenderer has gained the ability to render only certain components
  of a layout (such overlines, underlines, text,...)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-graphics/pango/{pango_1.57.1.bb =3D> pango_1.58.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.57.1.bb =3D> pango_1.58.0.bb=
} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.57.1.bb b/meta/recipes-g=
raphics/pango/pango_1.58.0.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.57.1.bb
rename to meta/recipes-graphics/pango/pango_1.58.0.bb
index a9129dad4ca..6e1aebad1df 100644
--- a/meta/recipes-graphics/pango/pango_1.57.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.58.0.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX =3D "pango-(?P<pver>\d+\.(?!9\d+)\=
d+\.\d+)"
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
=20
-SRC_URI[archive.sha256sum] =3D "e65d6d117080dc3aeeb7d8b4b3b518f7383aa2e6=
cfce23117c623cd624764c2f"
+SRC_URI[archive.sha256sum] =3D "bc5bad6213ad4886a47d1e80292fd850b64159b5=
0db67917a43d9ea80ee2298a"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype virtual/libico=
nv cairo harfbuzz fribidi"
 DEPENDS +=3D "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLE=
D') =3D=3D 'True' else ''}"
--=20
2.43.0


