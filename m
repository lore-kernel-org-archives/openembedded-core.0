Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TEDQR-0006Yn-JS
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 08:06:20 +0200
Received: by wibhn17 with SMTP id hn17so590261wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=xEuRWdvQL/A0+YMXKTuBx6UY0/B6NyvNYDjZvDymkZc=;
	b=BXCNF5/etddW/Mon040uM76fJfTx9AtoF4/36EMwsYB5vEU4E0UtFqZFuumAMSCDCG
	PzYJIbt5QSTBg1vYt6TupiJPsRSFld3zqprEQ6T9nTWghchul8M3MfKu0CjxEOcrIYCd
	M9zbrj9L7sMgdJtrIxMgLDc6Z3SYjfExwzYbV8Y92gMShT34Av4tOKCnlgcZ2rIJxgOs
	/UDoVfuiTR7ymAtESk3EPuaWdaCn4g6AOspG7rtQwpqP93SNdJw8Ibyezsng8fj1SI3h
	Jh0kceSzmys1cacPqNAAtEXG0WEdDua5beURg3AN4wTzfPw6f3cq6Pc09mmjpPEIu3wU
	3TCQ==
Received: by 10.180.82.39 with SMTP id f7mr4340901wiy.2.1348034018295;
	Tue, 18 Sep 2012 22:53:38 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id do5sm3238038wib.10.2012.09.18.22.53.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 22:53:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 19 Sep 2012 07:53:36 +0200
Message-Id: <2F9BDF1A-77D9-4E3B-B754-48431837A1A6@dominion.thruhere.net>
References: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlqwjJzSFlPVWYfWbU92RlYgH0svMSwVDxn3S8B+J3lKklVM0vr+qVw0jzhG2aq50AuL6qW
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [for-denzil][bluez-updates 1/5] bluez4: make alsa support conditional upon DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 06:06:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

So Scott asked me to explain why these bluez updates are needed in =
denzil, and it's mainly because of udev. The old bluez is using =
deprecated udev API that went away in newer releases and I'm trying to =
get a more recent udev into meta-oe to fix bugs people have reported. =
But apart from the minor version bump having the alsa and FILES_${PN} =
fix would be very good.

regards,

Koen

Op 17 sep. 2012, om 12:30 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

> From: Jonas Danielsson <jonas.danielsson@lundinova.se>
>=20
> Do not enable alsa in bluez4 unless it's included in DISTRO_FEATURES.
>=20
> Signed-off-by: Jonas Danielsson <jonas.danielsson@lundinova.se>
> ---
> meta/recipes-connectivity/bluez/bluez4.inc     |    6 ++++--
> meta/recipes-connectivity/bluez/bluez4_4.99.bb |    3 ++-
> 2 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc =
b/meta/recipes-connectivity/bluez/bluez4.inc
> index fbbe0bf..6dc06f4 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -7,9 +7,12 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                     =
file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90fb0e09 \
>                     =
file://src/main.c;beginline=3D1;endline=3D24;md5=3D9bc54b93cd7e17bf03f5251=
3f39f926e \
>                     =
file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a40781ed30d50d8639323a1=
84aeb191"
> -DEPENDS =3D "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
> +DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck"
> RDEPENDS_${PN}-dev =3D "bluez-hcidump"
>=20
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'alsa', =
'alsa', '', d)}"
> +PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> +
> ASNEEDED =3D ""
>=20
> SRC_URI =3D "\
> @@ -21,7 +24,6 @@ inherit autotools
>=20
> EXTRA_OECONF =3D "\
>   --disable-gstreamer \
> -  --enable-alsa \
>   --enable-usb \
>   --enable-tools \
>   --enable-bccmd \
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb =
b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
> index 5033d34..32831e7 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
> @@ -1,6 +1,6 @@
> require bluez4.inc
>=20
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> SRC_URI +=3D "file://bluetooth.conf \
>             file://sbc_mmx.patch \
> @@ -19,6 +19,7 @@ do_install_append() {
>=20
> RDEPENDS_${PN}-dev =3D "bluez-hcidump"
>=20
> +ALLOW_EMPTY_libasound-module-bluez =3D "1"
> PACKAGES =3D+ "libasound-module-bluez"
>=20
> FILES_libasound-module-bluez =3D "${libdir}/alsa-lib/lib*.so =
${datadir}/alsa"
> --=20
> 1.7.7.6
>=20



