Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6SPF-00034D-4P
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:24:29 +0200
Received: by fxi1 with SMTP id 1so1998085fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 12:19:10 -0700 (PDT)
Received: by 10.223.35.211 with SMTP id q19mr1529257fad.120.1316632750614;
	Wed, 21 Sep 2011 12:19:10 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o22sm5114133fab.11.2011.09.21.12.19.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 12:19:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316630404-10336-5-git-send-email-dbaryshkov@gmail.com>
Date: Wed, 21 Sep 2011 21:19:04 +0200
Message-Id: <4C9504A6-7E17-4BB7-9F5C-5EB32D32FF50@dominion.thruhere.net>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
	<1316630404-10336-5-git-send-email-dbaryshkov@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 05/17] gst-plugins-base: add support for non-X11-enabled distros
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2011 19:24:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 sep. 2011, om 20:39 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:

> Separate dependencies on X11 and them to DEPENDS only if =
DISTRO_FEATURES
> contain x11
>=20
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> .../gstreamer/gst-plugins-base_0.10.32.bb          |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git =
a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb =
b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> index 82d9afc..9a658fa 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
>                     =
file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9abc605 \
>                     =
file://gst/ffmpegcolorspace/utils.c;beginline=3D1;endline=3D20;md5=3D9c83a=
200b8e597b26ca29df20fc6ecd0"
>=20
> -DEPENDS +=3D "virtual/libx11 alsa-lib freetype liboil libogg =
libvorbis libxv libtheora avahi util-linux tremor"
> +X11DEPENDS =3D "virtual/libx11 libxv"
> +DEPENDS +=3D "alsa-lib freetype liboil libogg libvorbis libtheora =
avahi util-linux tremor ${@base_contains('DISTRO_FEATURES', 'x11', =
'${X11DEPENDS}', '', d)}"
>=20
> SRC_URI +=3D " file://gst-plugins-base-tremor.patch"

MIssing PR bump=


