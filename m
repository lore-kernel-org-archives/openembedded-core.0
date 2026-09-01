Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AA3C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 17:50:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.753.1788285023948135830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 10:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=kzYVj1tm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83B021756
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 10:50:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD7893F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 10:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788285023; bh=jwVnyRXeuxtjDZtBS9jqC8YGECPHw6iS7Go0FhEr41U=;
	h=From:To:Subject:Date:From;
	b=kzYVj1tmYbsuWNntSSDSCnyGgM46Bxad6WJeunv6SJkQPhiWOJZ22veNSX4xAGBzr
	 vyc402clBlldDtirmqA4YRvzireBc9VNKI5ZYayynb8AsfQomFUFlOX4SXdDgEBry3
	 wB6V3fRtkiufsJEDFBum4Pv4PteI6Bi6v9m9enhg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] pango: upgrade 1.58.0 -> 1.58.2
Date: Tue,  1 Sep 2026 18:50:18 +0100
Message-ID: <20260901175020.2705859-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 17:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244846

Overview of changes in 1.58.2, 05-08-2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Test case fixes

Overview of changes in 1.58.1, 03-08-2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Require harfbuzz 11
* Require glib 2.88
* CoreText: Support variations
* CoreText: Support font features from descriptions
* Renderer: Keep over/under/through lines in sync
* Fixes for undefined behavior

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-graphics/pango/{pango_1.58.0.bb =3D> pango_1.58.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.58.0.bb =3D> pango_1.58.2.bb=
} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.58.0.bb b/meta/recipes-g=
raphics/pango/pango_1.58.2.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.58.0.bb
rename to meta/recipes-graphics/pango/pango_1.58.2.bb
index 6e1aebad1df..9eafc9636cf 100644
--- a/meta/recipes-graphics/pango/pango_1.58.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.58.2.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX =3D "pango-(?P<pver>\d+\.(?!9\d+)\=
d+\.\d+)"
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
=20
-SRC_URI[archive.sha256sum] =3D "bc5bad6213ad4886a47d1e80292fd850b64159b5=
0db67917a43d9ea80ee2298a"
+SRC_URI[archive.sha256sum] =3D "342385b6ca3b7c73455d7c80a13b7dbe4489e00b=
c3bd4c5bd6ed4dce421e374a"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype virtual/libico=
nv cairo harfbuzz fribidi"
 DEPENDS +=3D "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLE=
D') =3D=3D 'True' else ''}"
--=20
2.43.0


