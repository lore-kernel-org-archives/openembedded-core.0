Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADDDC54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 16:44:06 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.1597.1662655444882516604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 09:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=TdiAeVRD;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662655445;
  x=1694191445;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7cqYRibRAoSi7FBbbQWH3+Rmb1Kz13f5hAyiGkKe08Q=;
  b=TdiAeVRDFtaOcUrdzLzcJ9yUSc1fxsxkxg5BB56EUxEfzdnmmLkfX3GC
   W38UsaVl+I0tmpm/GFBXzABnOal69akdCj3X5eWYwpzS4wO/nW9dF+dn5
   LIWZupDj0rT97AoVOxbItaS5HUlicNPpWrTM1jBjsiKocAECsUkOcD/zT
   3Cq3bapCAv2Tb0C+wCfSBQMXalQj1TwzxsblnJDttsLVB9hVjGR/k9Keu
   4IavIhyMhxFl9ySi4iwrUL0DNfg189AZGIRzHTKliF/2tR+9D7kkm/O+X
   9D0wGqtCcoikmfC6e0MftcapB4TX7lnCQo/AHxlVpWwMzO4n8GshapnHK
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] cairo: Adapt the license information based on
 what is being built
Thread-Topic: [OE-core] [PATCH] cairo: Adapt the license information based on
 what is being built
Thread-Index: AQHYwfVWThoVgQxf8E27W5aW35r8Qa3Vv8qQ
Date: Thu, 8 Sep 2022 16:44:02 +0000
Message-ID: <5780cdfd47d24795ac023cdf6fa56185@axis.com>
References: <171248C99AA15227.20375@lists.openembedded.org>
In-Reply-To: <171248C99AA15227.20375@lists.openembedded.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 16:44:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170465

Please cherry-pick this to Kirkstone.

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 6 september 2022 15:34
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] cairo: Adapt the license information based on =
what is being built
>=20
> If the "trace" PACKAGECONFIG is removed to disable cairo-trace (the
> only part of the code licensed as GPL-3.0), we can adapt the licenses
> for cairo-dbg and cairo-src so that they do not include
> "GPL-3.0-or-later" and thus they can be used also when, e.g., GPL-3.0
> is blacklisted in INCOMPATIBLE_LICENSE. Also drop the GPL-3.0 license
> text from LIC_FILES_CHKSUM in this case.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> This applies the suggestion from commit f763b906 (cairo: Add missing
> GPLv3 license checksum entry). I have verified that when disabling the
> trace PACKAGECONFIG, then there is no trace (no pun intended) of the
> GPL-3.0 code in the -dbg and -src packages.
>=20
>  meta/recipes-graphics/cairo/cairo_1.16.0.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-g=
raphics/cairo/cairo_1.16.0.bb
> index 67081bb8cb..ffb813d290 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -17,9 +17,13 @@ LICENSE:${PN}-doc =3D "MPL-1.1 | LGPL-2.1-only"
>  LICENSE:${PN}-gobject =3D "MPL-1.1 | LGPL-2.1-only"
>  LICENSE:${PN}-script-interpreter =3D "MPL-1.1 | LGPL-2.1-only"
>  LICENSE:${PN}-perf-utils =3D "GPL-3.0-or-later"
> +# Adapt the licenses for cairo-dbg and cairo-src depending on whether
> +# cairo-trace is being built.
> +LICENSE:${PN}-dbg =3D "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PA=
CKAGECONFIG', 'trace', ' & GPL-3.0-or-later', '', d)}"
> +LICENSE:${PN}-src =3D "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PA=
CKAGECONFIG', 'trace', ' & GPL-3.0-or-later', '', d)}"
>=20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De73e999e0c72b5ac9012424fa157a=
d77 \
> -                    file://util/cairo-trace/COPYING-GPL-3;md5=3Dd32239bc=
b673463ab874e80d47fae504"
> +                    ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'file=
://util/cairo-trace/COPYING-GPL-3;md5=3Dd32239bcb673463ab874e80d47fae504', =
'', d)}"
>=20
>=20
>  DEPENDS =3D "fontconfig glib-2.0 libpng pixman zlib"

