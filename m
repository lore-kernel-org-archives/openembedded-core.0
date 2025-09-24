Return-Path: <jeroen@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFFACAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:36:10 +0000 (UTC)
Received: from outbound4.mail.transip.nl (outbound4.mail.transip.nl [136.144.136.2])
 by mx.groups.io with SMTP id smtpd.web10.23277.1758742568184874213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=TvbPaL/j;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.2, mailfrom: jeroen@myspectrum.nl)
Received: from submission8.mail.transip.nl (unknown [10.103.8.159])
	by outbound4.mail.transip.nl (Postfix) with ESMTP id 4cX6XP58wWzwPN6;
	Wed, 24 Sep 2025 21:36:05 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission8.mail.transip.nl (Postfix) with ESMTPSA id 4cX6XJ6Hl5z2npc7y;
	Wed, 24 Sep 2025 21:36:00 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id D4E0F2007B;
	Wed, 24 Sep 2025 19:35:58 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Wed, 24 Sep 2025 21:35:57 +0200
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Markus Kurz <m.kurz92@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [walnascar][PATCH] libpcre2: upgrade 10.45 -> 10.46
Date: Wed, 24 Sep 2025 21:35:17 +0200
Message-ID: <20250924193517.1753094-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission8.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1758742560; h=from:subject:to:cc:date:
 mime-version; bh=4IP4UqK3+B9AonJZJ/FIP6RZ5wZ45Tvkct0dWUkwfnI=;
 b=TvbPaL/jmxyBZOCg33UalEcoba2emuBENvKKtoBH05wTfyPfIXGmW3NFYfQc3ycD4jCpqO
 rNUfNVEacjwhINHCmL+ts+5mmwssCZfkS4ewkUFsrUs33hTEBWcYoyHryiY/ym3Bx411F2
 Imec2m1a7ZQq3cjdzKTMFX23Hs8BdMG8To1kLp6F6DTVqhGPM3e+6fc2MaL+PLdX8i3dr+
 C4tigZLkx9orkBrObHdWTiiMsN9ok0iKEXc6YRNlJRc4xjRknHgznC6GcQOdW84R4DrJu3
 jpsAivWPg3cDPmfQrjODAjJTOGXuwHmPyS9DR1mOdfmBQ+6hjRSH1IM3MQBE2w==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 19:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223980

From: Markus Kurz <m.kurz92@gmail.com>

For the changelog see:
https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.46

This is a security-only release, to address CVE-2025-58050:
https://nvd.nist.gov/vuln/detail/CVE-2025-58050

Signed-off-by: Markus Kurz <m.kurz92@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5b45d0db9ed40b3eef2e6a076c94da3ecc48acf)
Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 .../libpcre/{libpcre2_10.45.bb =3D> libpcre2_10.46.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.45.bb =3D> libpcre2_10.=
46.bb} (95%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.45.bb b/meta/recipe=
s-support/libpcre/libpcre2_10.46.bb
similarity index 95%
rename from meta/recipes-support/libpcre/libpcre2_10.45.bb
rename to meta/recipes-support/libpcre/libpcre2_10.46.bb
index e82de0fa5b..023ae4041b 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.45.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.46.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/pcre2-${PV}/pc=
re2-${PV}.tar.bz2"
 GITHUB_BASE_URI =3D "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
=20
-SRC_URI[sha256sum] =3D "21547f3516120c75597e5b30a992e27a592a31950b5140e7=
b8bfde3f192033c4"
+SRC_URI[sha256sum] =3D "15fbc5aba6beee0b17aecb04602ae39432393aba1ebd8e39=
b7cabf7db883299f"
=20
 CVE_PRODUCT =3D "pcre2"
=20
--=20
2.43.0


