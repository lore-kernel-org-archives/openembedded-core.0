Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC95EC4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 01:41:46 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.107294.1669599701216745232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 17:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=SOZyQe5O;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669599701;
  x=1701135701;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9QO6+zLST7pdlRYAvz0qMqLorxRNy1O3myilJ/mRtdk=;
  b=SOZyQe5OUEFo88LYhjDzpJXidFpngZkoCDcATkaAl45fz8I/sIXjEqyD
   qgHysrWXdlZ03bGWLGf3FGouW1OVcjQZllE03T9sXW914GcoKJMuiT/Aa
   AoZ7ZkfyDgw6KWzJrA69gS9laVjnJlb6pFiYAJ5jjsvk05RFklP2C2O6T
   3wp32zZs5aaMarXIZ/tOnSGkPgetqBZI9OccSA822u6MYmDgycCubmGhH
   v8I338K7giEH9nx/S9qYHpz5wIYZ0L3/oztRUE+vLuMFyblv9dOxmA50X
   RkU7KiP+MaGLHQqe5vWV/3TVU34v6DIdzxvSS8pKDxLvnV5swkoU+uCQT
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-Core][kirkstone][PATCH] dbus: upgrade 1.14.0 -> 1.14.4
Thread-Topic: [OE-Core][kirkstone][PATCH] dbus: upgrade 1.14.0 -> 1.14.4
Thread-Index: AQHZAsTDRr6tZZJrFkSJOsuBbYH6XK5Tjdng
Date: Mon, 28 Nov 2022 01:41:38 +0000
Message-ID: <618cd15d402d41388c95cc5657d43a6e@axis.com>
References: <20221128005938.146187-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20221128005938.146187-1-xiangyu.chen@eng.windriver.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 01:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173893

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Xiangyu Chen
> Sent: den 28 november 2022 02:00
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-Core][kirkstone][PATCH] dbus: upgrade 1.14.0 -> 1.14.4
>=20
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>=20
> Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
> ---
>  ...eswap-Byte-swap-Unix-fd-indexes-if-n.patch |  76 -----------
>  ...idate-Check-brackets-in-signature-ne.patch | 119 ------------------
>  ...idate-Validate-length-of-arrays-of-f.patch |  61 ---------
>  .../dbus/{dbus_1.14.0.bb =3D> dbus_1.14.4.bb}   |  10 +-
>  4 files changed, 4 insertions(+), 262 deletions(-)
>  delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswa=
p-Byte-swap-Unix-fd-indexes-if-n.patch
>  delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validat=
e-Check-brackets-in-signature-ne.patch
>  delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validat=
e-Validate-length-of-arrays-of-f.patch
>  rename meta/recipes-core/dbus/{dbus_1.14.0.bb =3D> dbus_1.14.4.bb} (93%)
>=20

[cut]

> diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/db=
us/dbus_1.14.4.bb
> similarity index 93%
> rename from meta/recipes-core/dbus/dbus_1.14.0.bb
> rename to meta/recipes-core/dbus/dbus_1.14.4.bb
> index 484629e987..9684f0c6e2 100644
> --- a/meta/recipes-core/dbus/dbus_1.14.0.bb
> +++ b/meta/recipes-core/dbus/dbus_1.14.4.bb
> @@ -6,19 +6,17 @@ SECTION =3D "base"
>  inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
>=20
>  LICENSE =3D "AFL-2.1 | GPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D10dded3b58148f3f1fd804b26354a=
f3e \
> -                    file://dbus/dbus.h;beginline=3D6;endline=3D20;md5=3D=
866739837ccd835350af94dccd6457d8"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6423dcd74d7be9715b0db247fd889=
da3 \
> +                    file://dbus/dbus.h;beginline=3D6;endline=3D20;md5=3D=
866739837ccd835350af94dccd6457d8 \
> +                    "

License changes must have an explanation. Add a License-Update line=20
to the commit message.

>=20
>  SRC_URI =3D "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.x=
z \
>             file://run-ptest \
>             file://tmpdir.patch \
>             file://dbus-1.init \
> -           file://0001-dbus-marshal-validate-Check-brackets-in-signature=
-ne.patch \
> -           file://0001-dbus-marshal-validate-Validate-length-of-arrays-o=
f-f.patch \
> -           file://0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-i=
f-n.patch \

The removed patches could also do with an explanation in the commit=20
message.

>  "
>=20
> -SRC_URI[sha256sum] =3D "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635a=
ea8fd0bad58aebd4"
> +SRC_URI[sha256sum] =3D "7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f=
659b81b30d4e353e"
>=20
>  EXTRA_OECONF =3D "--disable-xml-docs \
>                  --disable-doxygen-docs \
> --
> 2.34.1

//Peter


