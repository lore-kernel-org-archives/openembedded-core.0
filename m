Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FCEC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:34:45 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.511.1645108483577887506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kifoxeru;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645108484;
  x=1676644484;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=VL2C8jW4xpp5g19DE7VrBxR+r2Afk4kuXnrXuh8e/f8=;
  b=kifoxeruVoWtWysHJipBZyD0rEW0IFD7dxK5VrUAdbgLCnpJggZlcOg0
   /pNJlwsGT87wkwakj/mY4hjUHNYHXC3S3eAN0sH68HoDa0TK6h6PwK/k9
   wZX7JjtJki86WH6OW5rXrjh8t2BEjgcZFrHDcu4qOWbSHOUjwC6nwXeIh
   F68gbYp2R+KKyguYQDm0gW6BCgPUQ2McGV2fQRQnC4KlNvXDt0hiC3QlN
   r7cEextCMpJVckMVRo8NwsCgDodXiYyMq5wTPTElhEQiqJ1aErRR1FMqA
   IcfpXQ0RD+krYhracHIlRVw7xmaOyhXI8xITxmdJd3o430bEXtfMJlZji
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] gstreamer1.0: update licences of all modules
Thread-Topic: [PATCH] gstreamer1.0: update licences of all modules
Thread-Index: AQHYI4zwEnW7XZ+QCUWAL/97J0/p8ayXyIWQ
Date: Thu, 17 Feb 2022 14:34:41 +0000
Message-ID: <705135fb77074d9c9ac87d0d060592e1@axis.com>
References: <20220216232803.1868265-1-quaresma.jose@gmail.com>
In-Reply-To: <20220216232803.1868265-1-quaresma.jose@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:34:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161815

> -----Original Message-----
> From: Jose Quaresma <quaresma.jose@gmail.com>
> Sent: den 17 februari 2022 00:28
> To: openembedded-core@lists.openembedded.org
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Jose Quaresma <quar=
esma.jose@gmail.com>
> Subject: [PATCH] gstreamer1.0: update licences of all modules
>=20
> Since all gstreamer modules uses LGPLv2.1 with exceptions
> for some plugins in bad and ugly modules that has GPLv2+.
>=20
> For the GPLv2+ this patch set the licence only for each plugin
> that is affected by this licence. The commercial LICENSE_FLAGS
> is enabled if any of the previous plugins is builded.
>=20
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../gstreamer/gst-devtools_1.20.0.bb                   |  2 +-
>  .../gstreamer/gstreamer1.0-libav_1.20.0.bb             |  2 +-
>  .../gstreamer/gstreamer1.0-omx_1.20.0.bb               |  2 +-
>  .../gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb       |  7 ++++++-
>  .../gstreamer/gstreamer1.0-plugins-base_1.20.0.bb      |  2 +-
>  .../gstreamer/gstreamer1.0-plugins-good_1.20.0.bb      |  2 +-
>  .../gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb      | 10 ++++++++--
>  .../gstreamer/gstreamer1.0-python_1.20.0.bb            |  2 +-
>  .../gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb       |  2 +-
>  .../gstreamer/gstreamer1.0-vaapi_1.20.0.bb             |  2 +-
>  .../gstreamer/gstreamer1.0_1.20.0.bb                   |  2 +-
>  11 files changed, 23 insertions(+), 12 deletions(-)

[cut]

> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.=
0.bb
> index 915d4ec744..22288373ac 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.b=
b
> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D
> "015b8d4d9a395ebf444d40876867a2034dd3304b3ad48bc3a0dd0c1ee7
>=20
>  S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
>=20
> -LICENSE =3D "GPLv2+ & LGPLv2+ & LGPLv2.1+"
> +LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
>=20
>  DEPENDS +=3D "gstreamer1.0-plugins-base"
> @@ -98,6 +98,11 @@ PACKAGECONFIG[faad]            =3D "-Dfaad=3Denabled,-=
Dfaad=3Ddisabled,faad2"
>  PACKAGECONFIG[resindvd]        =3D "-Dresindvd=3Denabled,- Dresindvd=3Dd=
isabled,libdvdread libdvdnav"
>  PACKAGECONFIG[x265]            =3D "-Dx265=3Denabled,-Dx265=3Ddisabled,x=
265"
>=20
> +LICENSE_FLAGS =3D "${@bb.utils.contains("PACKAGECONFIG", "gpl", "commerc=
ial", "", d)}"

There shouldn't be any commercial limitations in these plugins. If there=20
were, then they would be in -ugly instead.

> +LICENSE:${PN}-faad =3D "GPL-2.0-or-later"
> +LICENSE:${PN}-resindvd =3D "GPL-2.0-or-later"
> +LICENSE:${PN}-x265 =3D "GPL-2.0-or-later"

This is unfortunately not enough. It is actually more the opposite of=20
what is needed. You need to set the license for all the other plugins=20
that are only affected by LGPL-2.1-or-later since the default for a=20
package is ${LICENSE} if no ${LICENSE:<package>} is defined.

It is likely that you can do something creative in=20
split_gstreamer10_packages() and set the default license there for the=20
plugin packages to "LGPL-2.1-or-later" and then the overrides above=20
would be enough. You probably want to do something like this to avoid=20
having to update the lists of plugin packages every time the recipes=20
are updated to new versions as plugins have a tendency to come and go.

> +
>  EXTRA_OEMESON +=3D " \
>      -Ddoc=3Ddisabled \
>      -Daes=3Denabled \

[cut]

> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_=
1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2=
0.0.bb
> index 8128104319..6442fd4504 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.=
bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.=
bb
> @@ -7,8 +7,7 @@ BUGTRACKER =3D "https://gitlab.freedesktop.org/gstreamer/=
gst-plugins-ugly/-/issues
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343 \
>=20
> file://tests/check/elements/xingmux.c;beginline=3D1;endline=3D21;md5=3D4c=
771b8af188724855cb99cadd390068"
>=20
> -LICENSE =3D "GPLv2+ & LGPLv2.1+ & LGPLv2+"
> -LICENSE_FLAGS =3D "commercial"
> +LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
>=20
>  SRC_URI =3D " \
>              https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-p=
lugins-ugly-${PV}.tar.xz \
> @@ -37,6 +36,13 @@ PACKAGECONFIG[dvdread]  =3D "-Ddvdread=3Denabled,-Ddvd=
read=3Ddisabled,libdvdread"
>  PACKAGECONFIG[mpeg2dec] =3D "-Dmpeg2dec=3Denabled,-Dmpeg2dec=3Ddisabled,=
mpeg2dec"
>  PACKAGECONFIG[x264]     =3D "-Dx264=3Denabled,-Dx264=3Ddisabled,x264"
>=20
> +LICENSE_FLAGS =3D "${@bb.utils.contains("PACKAGECONFIG", "gpl", "commerc=
ial", "", d)}"

I do not think making this conditional is correct. AFAIK the commercial=20
flag is used in this recipe due to, e.g., patent limitations and not=20
necessarily the actual code and its license. It affects all plugins in=20
-ugly (it is the reason they are there in the first place and not in,=20
e.g., -good or -bad).

> +LICENSE:${PN}-cdio =3D "GPL-2.0-or-later"
> +LICENSE:${PN}-a52dec =3D "GPL-2.0-or-later"
> +LICENSE:${PN}-dvdread =3D "GPL-2.0-or-later"
> +LICENSE:${PN}-mpeg2dec =3D "GPL-2.0-or-later"
> +LICENSE:${PN}-x264 =3D "GPL-2.0-or-later"

The same applies here as in -bad.

> +
>  EXTRA_OEMESON +=3D " \
>      -Ddoc=3Ddisabled \
>      -Dsidplay=3Ddisabled \

//Peter

