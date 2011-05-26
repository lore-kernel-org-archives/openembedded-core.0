Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPWde-0003dA-Tk
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 11:13:54 +0200
Received: by wwb17 with SMTP id 17so409786wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 02:10:48 -0700 (PDT)
Received: by 10.227.197.201 with SMTP id el9mr592756wbb.22.1306401040935;
	Thu, 26 May 2011 02:10:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id et5sm322679wbb.67.2011.05.26.02.10.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 02:10:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306400953-10868-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 26 May 2011 11:10:38 +0200
Message-Id: <3867CD45-C190-41B4-8B4F-B48842347F96@dominion.thruhere.net>
References: <1306400953-10868-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] dbus 1.4.1: enable systemd support, but package systemd files seperately
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
X-List-Received-Date: Thu, 26 May 2011 09:13:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This one depends on the dbus-x11 change patchset sent earlier

Op 26 mei 2011, om 11:09 heeft Koen Kooi het volgende geschreven:

> Systemd support in dbus only affects 'make install', so no changes for =
sysvinit based systems
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-core/dbus/dbus.inc      |    5 ++++-
> meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
> 2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/dbus/dbus.inc =
b/meta/recipes-core/dbus/dbus.inc
> index acf43d5..8275a1b 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -21,10 +21,12 @@ CONFFILES_${PN} =3D =
"${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
>=20
> DEBIANNAME_${PN} =3D "dbus-1"
>=20
> -PACKAGES =3D+ "${PN}-lib ${PN}-x11"
> +PACKAGES =3D+ "${PN}-lib ${PN}-x11 ${PN}-systemd"
>=20
> FILES_${PN}-x11 =3D "${bindir}/dbus-launch"
>=20
> +FILES_${PN}-systemd =3D "${base_libdir}/systemd/system/"
> +
> FILES_${PN} =3D "${bindir}/dbus-daemon* \
>                ${bindir}/dbus-uuidgen \
>                ${bindir}/dbus-launch \
> @@ -73,6 +75,7 @@ EXTRA_OECONF =3D "--disable-tests \
>                 --disable-doxygen-docs \
>                 --disable-libaudit \
>                 --with-xml=3Dexpat \
> +                =
--with-systemdsystemunitdir=3D${base_libdir}/systemd/system/ \
>                 ${EXTRA_OECONF_X}"
>=20
> do_install() {
> diff --git a/meta/recipes-core/dbus/dbus_1.4.1.bb =
b/meta/recipes-core/dbus/dbus_1.4.1.bb
> index d1c59dc..00720fd 100644
> --- a/meta/recipes-core/dbus/dbus_1.4.1.bb
> +++ b/meta/recipes-core/dbus/dbus_1.4.1.bb
> @@ -1,6 +1,6 @@
> include dbus.inc
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>=20
> SRC_URI[md5sum] =3D "99cb057700c0455fb68f8d57902f77ac"
> SRC_URI[sha256sum] =3D =
"caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd"
> --=20
> 1.6.6.1
>=20



