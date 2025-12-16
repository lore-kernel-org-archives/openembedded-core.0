Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2F6D5E36C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:36:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22569.1765892172285114623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 05:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCE11FEC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:04 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8ADAE3F73B
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] freetype: upgrade 2.13.3 -> 2.14.1
Date: Tue, 16 Dec 2025 13:35:59 +0000
Message-ID: <20251216133603.1003572-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133603.1003572-1-ross.burton@arm.com>
References: <20251216133603.1003572-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 13:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227952

Important upstream changes:

- A new  configuration macro `FT_CONFIG_OPTION_USE_HARFBUZZ_DYNAMIC`
  is available to load the HarfBuzz library dynamically.
- The auto-hinter got new abilities.
- Bitmap-only TrueType fonts now ignore the `FT_LOAD_NO_BITMAP` flag.

Update the home page and bug tracker links.

License-Update: wording, nothing relevant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{freetype_2.13.3.bb =3D> freetype_2.14.1.bb}         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.13.3.bb =3D> freetype_=
2.14.1.bb} (82%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.13.3.bb b/meta/rec=
ipes-graphics/freetype/freetype_2.14.1.bb
similarity index 82%
rename from meta/recipes-graphics/freetype/freetype_2.13.3.bb
rename to meta/recipes-graphics/freetype/freetype_2.14.1.bb
index dbfffdb65fc..97344c4c5ee 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.14.1.bb
@@ -3,18 +3,18 @@ DESCRIPTION =3D "FreeType is a software font engine tha=
t is designed to be small,
 highly customizable, and portable while capable of producing high-qualit=
y output (glyph \
 images). It can be used in graphics libraries, display servers, font con=
version tools, text \
 image generation tools, and many other products as well."
-HOMEPAGE =3D "http://www.freetype.org/"
-BUGTRACKER =3D "https://savannah.nongnu.org/bugs/?group=3Dfreetype"
+HOMEPAGE =3D "https://freetype.org/"
+BUGTRACKER =3D "https://gitlab.freedesktop.org/groups/freetype/-/issues"
 SECTION =3D "libs"
=20
 LICENSE =3D "(FTL | GPL-2.0-or-later) & MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D843b6efc16f6b1652ec97f89d=
5a516c0 \
-                    file://docs/FTL.TXT;md5=3D9f37b4e6afa3fef9dba8932b16=
bd3f97 \
+LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Deeb073d5fb86d23c52bb9b84a=
a256307 \
+                    file://docs/FTL.TXT;md5=3D72d844cd2f3bcaf6a85244b508=
032be7 \
                     file://docs/GPLv2.TXT;md5=3D8ef380476f642c20ebf40fec=
b0add2ec \
                     "
=20
 SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "0550350666d427c74daeb85d5ac7bb353acba5f769563959=
95311a9c6f063289"
+SRC_URI[sha256sum] =3D "32427e8c471ac095853212a37aef816c60b42052d4d9e482=
30bab3bdf2936ccc"
=20
 UPSTREAM_CHECK_REGEX =3D "freetype-(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.43.0


